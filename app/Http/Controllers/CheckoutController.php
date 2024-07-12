<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
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

            return redirect($session->url);
        } catch (\Exception $e) {
            return back()->withErrors(['message' => 'Error creating Stripe Checkout session: ' . $e->getMessage()]);
        }
    }

    public function success()
    {
        session()->flash('success', 'Payment successful!');

        return redirect(session('lastUrl'));
    }

    public function cancel()
    {
        session()->flash('success', 'Payment canceled.');
        return redirect(session('lastUrl'));
    }
}
