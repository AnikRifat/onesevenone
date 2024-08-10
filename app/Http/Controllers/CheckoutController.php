<?php

namespace App\Http\Controllers;

use App\Team;
use Illuminate\Http\Request;
use Laravel\Spark\Contracts\Interactions\SubscribeTeam;
use Laravel\Spark\Events\Subscription\SubscriptionUpdated;
use Laravel\Spark\Events\Teams\Subscription\TeamSubscribed;
use Laravel\Spark\Spark;
use Laravel\Spark\TeamSubscription;
use Stripe\StripeClient;

class CheckoutController extends Controller
{
    protected $lastUrl;
    protected $stripe;

    public function __construct(StripeClient $stripe)
    {
        $this->stripe = $stripe;
    }

    public function show(Request $request)
    {
        return view('stripe.checkout');
    }

    public function process(Request $request)
    {

        session()->put('lastUrl', $request->session()->previousUrl());

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'plan_id' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'amount' => 'required|numeric|min:1',
        ]);
        session()->put('plan_id', $validated['plan_id']);

        try {
            $session = $this->stripe->checkout->sessions->create([
                'payment_method_types' => ['card'],
                'line_items' => [[
                    'price' => $validated['plan_id'],
                    'quantity' => 1,
                ]],
                'mode' => 'subscription',
                'success_url' => route('payment.success'),
                'cancel_url' => route('payment.cancel'),
                'customer_email' => $validated['email'],
            ]);
session()->put('stripe_session_id', $session->id);

            return redirect($session->url);
        } catch (\Exception $e) {
            return back()->withErrors(['message' => 'Error creating Stripe Checkout session: ' . $e->getMessage()]);
        }
    }

    public function success(Request $request)
    {
        

        $data = $this->stripe->checkout->sessions->retrieve(session('stripe_session_id'));
        $plan = Spark::teamPlans()->where('id',session('plan_id'))->first();
        $team = Team::find( session('team'));
        $teamSubscription = TeamSubscription::where('id',session('team'))->first();
        $subscription = [
            'team_id' =>$team->id,
            'name' => $team->name,
            'stripe_id' => $data->customer,
            'stripe_plan' => session('plan_id'),
            'quantity' => 1,
            'trial_ends_at' => $data->asdf,
            'ends_at' => $data->expires_at,
        ];

            if($teamSubscription){
                $team->subscription()->swap($subscription);
                event(new SubscriptionUpdated(
                    $team->fresh()
                ));
            }else{
                TeamSubscription::create($subscription);

                event(new TeamSubscribed(
                    $team = $team->fresh(), $plan
                ));
        
            }

         

        
        session()->flash('success', 'Payment successful!');

        return redirect(session('lastUrl'));
    }

    public function cancel()
    {
        session()->flash('success', 'Payment canceled.');
        return redirect(session('lastUrl'));
    }
}
