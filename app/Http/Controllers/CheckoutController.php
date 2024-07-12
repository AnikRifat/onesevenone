<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Stripe\StripeClient;

class CheckoutController extends Controller
{
    protected $stripe;

    public function __construct(StripeClient $stripe)
    {
        $this->stripe = $stripe;
    }

    public function show(Request $request)
    {
        // Validate and store the data


        return view('stripe.checkout', compact('validated'));
    }

    public function process(Request $request)
    {

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'plan_id' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'amount' => 'required|numeric|min:1',
        ]);
        // Create Stripe Checkout Session
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
                'customer_email' => $request['email'],
            ]);

            return redirect($session->url);
        } catch (\Exception $e) {
            return back()->withErrors(['message' => 'Error creating Stripe Checkout session: ' . $e->getMessage()]);
        }
    }

    public function success(Request $request)
    {
        return 'Payment Success';
    }

    public function cancel()
    {
        return 'Payment Error';

    }
}
