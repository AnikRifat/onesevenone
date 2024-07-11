<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Stripe\Stripe;
use Stripe\Charge;
use Stripe\Customer;

class StripeController extends Controller
{



    public function checkout()
    {
        return view('stripe.checkout');
    }

    public function processPayment(Request $request)
    {
        Stripe::setApiKey(config('services.stripe.secret'));
dd('success', 'Payment successful!');
        return redirect()->route('checkout')->with('success', 'Payment successful!');
    }
}
