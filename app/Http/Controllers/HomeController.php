<?php

namespace App\Http\Controllers;

use App\Models\Product;

class HomeController extends Controller
{
    public function __invoke()
    {
        $products = Product::latest()->paginate(12);
        return view('welcome', compact('products'));
    }
}
