<?php

namespace App\Helpers;

use Stripe\StripeClient;

class StripeHelper
{
    public static function isSubscribed($email, $price_id)
    {
        try {
            $stripe = new StripeClient(env('STRIPE_SECRET'));
            $customers = $stripe->customers->all(['email' => $email]);

            if (count($customers->data) > 0) {
                $customer = $customers->data[0];
                $subscriptions = $stripe->subscriptions->all(['customer' => $customer->id, 'status' => 'active']);
                
                foreach ($subscriptions->data as $subscription) {
                    foreach ($subscription->items->data as $item) {
                        if ($item->price->id === $price_id) {
                            return true; // The customer is subscribed to the specified plan
                        }
                    }
                }
            }
            return false;
        } catch (\Exception $e) {
            return false;
        }
    }
}
