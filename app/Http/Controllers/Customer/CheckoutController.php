<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\DB;

class CheckoutController extends Controller
{
    public function show()
    {
        $cart = auth()->user()->cart?->load('items.product');
        abort_unless($cart && $cart->items->count(), 404, 'Cart empty.');
        return view('customer.checkout', compact('cart'));
    }

    public function process(Request $request)
    {
        $user = auth()->user();
        $cart = $user->cart?->load('items.product');
        if (!$cart || !$cart->items->count()) {
            return redirect()->route('cart.index')->withErrors('Cart is empty.');
        }

        $request->validate([
            'address' => 'required|string|max:2000',
        ]);

        // Tax simulation 10%
        $subtotal = $cart->items->sum(fn($i) => $i->price * $i->quantity);
        $tax = round($subtotal * 0.10, 2);
        $total = $subtotal + $tax;

        DB::transaction(function () use ($user, $cart, $subtotal, $tax, $total, $request) {
            // Create order
            $order = Order::create([
                'user_id' => $user->id,
                'status'  => 'pending',
                'subtotal'=> $subtotal,
                'tax'     => $tax,
                'total'   => $total,
            ]);

            foreach ($cart->items as $ci) {
                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $ci->product_id,
                    'quantity' => $ci->quantity,
                    'price' => $ci->price,
                ]);

                // reduce stock
                $ci->product->decrement('stock', $ci->quantity);
            }

            // Payment simulation
            $order->update([
                'status' => 'paid',
                'payment_ref' => 'SIM-' . Str::upper(Str::random(10)),
            ]);

            // Clear cart
            $cart->items()->delete();
        });

        return redirect()->route('orders.index')->with('success', 'Payment successful!');
    }
}
