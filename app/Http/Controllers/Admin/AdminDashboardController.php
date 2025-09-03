<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\User;

class AdminDashboardController extends Controller
{
    public function __invoke()
    {
        $metrics = [
            'users' => User::count(),
            'orders' => Order::count(),
            'revenue' => (float) Order::where('status','paid')->sum('total'),
            'products' => Product::count(),
        ];
        $latestOrders = Order::with('user')->latest()->take(10)->get();

        $products = Product::latest()->paginate(12);

        return view('admin.dashboard', compact('metrics','latestOrders' , 'products'));
    }
}
