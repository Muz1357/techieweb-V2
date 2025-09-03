<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Cart;
use App\Models\CartItem;
use App\Http\Controllers\Api\ProfileController;

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/profile', function (Request $request) {
        return response()->json(['data' => $request->user()]);
    });

    Route::put('/profile', function (Request $request) {
        $request->user()->update($request->only('name','email','phone'));
        return response()->json(['message' => 'Profile updated', 'data' => $request->user()]);
    });

    Route::put('/password', function (Request $request) {
        $request->validate([
            'current_password' => 'required',
            'password' => 'required|confirmed',
        ]);

        if (!Hash::check($request->current_password, $request->user()->password)) {
            return response()->json(['message' => 'Current password incorrect'], 422);
        }

        $request->user()->update(['password' => Hash::make($request->password)]);
        return response()->json(['message' => 'Password updated']);
    });

    Route::delete('/profile', function (Request $request) {
        $request->user()->delete();
        return response()->json(['message' => 'Account deleted']);
    });
    
    Route::get('/products', function (Request $request) {
        $q = $request->query('q');
        $products = Product::when($q, fn($qry)=>$qry->where('name','like',"%{$q}%"))
            ->latest()->paginate(10);
        return response()->json($products);
    });

    Route::get('/products/{id}', function ($id) {
        $product = Product::findOrFail($id);
        return response()->json($product);
    });

    Route::get('/cart', function (Request $request) {
    $cart = $request->user()->cart ?: Cart::create(['user_id' => $request->user()->id]);
    $cart->load('items.product');
    return response()->json($cart);
    });

    Route::post('/cart/{product}', function (Request $request, Product $product) {
    $request->validate([
        'quantity' => 'nullable|integer|min:1',
    ]);
    $qty = (int) ($request->input('quantity', 1));

    $cart = $request->user()->cart ?: Cart::create(['user_id' => $request->user()->id]);

    $item = CartItem::firstOrNew([
        'cart_id' => $cart->id,
        'product_id' => $product->id,
    ]);

    $item->quantity = ($item->exists ? $item->quantity : 0) + $qty;
    $item->price = $product->price;
    $item->save();

    return response()->json(['message' => 'Added to cart', 'item' => $item->load('product')]);
   });

    Route::patch('/cart/{item}', function (Request $request, CartItem $item) {
        $request->validate(['quantity' => 'required|integer|min:1']);
        abort_unless($item->cart->user_id === $request->user()->id, 403);

        $item->update(['quantity' => $request->quantity]);

        return response()->json(['message' => 'Cart updated', 'item' => $item->load('product')]);
    });

    Route::delete('/cart/{item}', function (Request $request, CartItem $item) {
        abort_unless($item->cart->user_id === $request->user()->id, 403);

        $item->delete();
        return response()->json(['message' => 'Item removed']);
    });

    Route::post('/checkout', function (Request $request) {
        $user = $request->user();
        $cart = $user->cart?->load('items.product');

        if (!$cart || $cart->items->isEmpty()) {
            return response()->json(['message' => 'Cart is empty'], 400);
        }

        $request->validate([
            'address' => 'required|string|max:2000',
        ]);

        
        $subtotal = $cart->items->sum(fn($i) => $i->price * $i->quantity);
        $tax = round($subtotal * 0.10, 2); 
        $total = $subtotal + $tax;

        $order = DB::transaction(function () use ($user, $cart, $subtotal, $tax, $total) {
            
            $order = Order::create([
                'user_id'   => $user->id,
                'status'    => 'paid', 
                'subtotal'  => $subtotal,
                'tax'       => $tax,
                'total'     => $total,
                'payment_ref' => 'SIM-' . Str::upper(Str::random(10)),
            ]);

            foreach ($cart->items as $ci) {
                OrderItem::create([
                    'order_id'   => $order->id,
                    'product_id' => $ci->product_id,
                    'quantity'   => $ci->quantity,
                    'price'      => $ci->price,
                ]);

                
                $ci->product->decrement('stock', $ci->quantity);
            }

            
            $cart->items()->delete();

            return $order;
        });

        return response()->json([
            'message' => 'Order placed successfully',
            'order'   => $order->load('items.product'),
        ]);
    });

    Route::get('/orders', function (Request $request) {
        $orders = Order::with('items.product')
            ->where('user_id', $request->user()->id)
            ->latest()
            ->paginate(10); 

        return response()->json($orders);
    });

    Route::get('/orders/{order}', function (Request $request, Order $order) {
        abort_if($order->user_id !== $request->user()->id, 403);

        $order->load('items.product');
        return response()->json($order);
    });

    
});


Route::post('/token', function (Request $request) {
    $request->validate([
        'email'=>'required|email',
        'password'=>'required',
        'device_name'=>'required|string',
    ]);

    if (!Auth::attempt($request->only('email','password'))) {
        return response()->json(['message'=>'Invalid credentials'], 401);
    }
    $user = \App\Models\User::whereEmail($request->email)->first();
    $token = $user->createToken($request->device_name, ['read-products'])->plainTextToken;

    return response()->json(['token'=>$token]);
});

Route::middleware(['auth:sanctum', 'abilities:read-products'])->get('/secure-products', function () {
    return \App\Models\Product::latest()->limit(5)->get();
});