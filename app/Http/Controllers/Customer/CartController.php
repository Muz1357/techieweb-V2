<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    protected function getCart(): Cart
    {
        $cart = auth()->user()->cart ?: Cart::create(['user_id' => auth()->id()]);
        return $cart->load('items.product');
    }

    public function index()
    {
        $cart = $this->getCart();
        return view('customer.cart', compact('cart'));
    }

    public function add(Request $request, Product $product)
    {
        $request->validate(['quantity' => 'nullable|integer|min:1']);
        $qty = (int) ($request->input('quantity', 1));

        $cart = $this->getCart();

        $item = CartItem::firstOrNew([
            'cart_id' => $cart->id,
            'product_id' => $product->id,
        ]);

        $item->quantity = ($item->exists ? $item->quantity : 0) + $qty;
        $item->price = $product->price;
        $item->save();

        return back()->with('success', 'Added to cart.');
    }

    public function update(Request $request, CartItem $item)
    {
        $this->authorize('update', $item->cart);
        $request->validate(['quantity' => 'required|integer|min:1']);
        $item->update(['quantity' => $request->quantity]);
        return back()->with('success', 'Cart updated.');
    }

    public function remove(CartItem $item)
    {
        $this->authorize('update', $item->cart);
        $item->delete();
        return back()->with('success', 'Item removed.');
    }
}
