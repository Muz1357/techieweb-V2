<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Product; 

class CustomerDashboardController extends Controller
{
    public function __invoke()
    {
        $products = Product::latest()->get();

        return view('customer.dashboard', compact('products'));
        
    }
}
