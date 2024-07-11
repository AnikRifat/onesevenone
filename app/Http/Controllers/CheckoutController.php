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
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'amount' => 'required|numeric|min:1',
        ]);

        return view('stripe.checkout', compact('validated'));
    }

    public function process(Request $request)
    {
        $request->validate([
            'stripeToken' => 'required',
            'amount' => 'required|numeric',
            'email' => 'required|email'
        ]);

        $data = [
            'amount' => $request->amount * 100, // Amount in cents
            'currency' => 'usd',
            'description' => 'Payment from ' . $request->email,
            'source' => $request->stripeToken,
        ];

        try {
            $this->stripe->charges->create($data);
dd('success');
            return redirect()->route('payment.form')->with('success', 'Payment successful!');
        } catch (\Exception $e) {
            dd($e->getMessage());
            return back()->withErrors(['message' => 'Error processing payment: ' . $e->getMessage()]);
        }
    }
}
