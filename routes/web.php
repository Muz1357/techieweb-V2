<?php

use App\Http\Controllers\Admin\AdminDashboardController;
use App\Http\Controllers\Admin\OrderController as AdminOrderController;
use App\Http\Controllers\Admin\ProductController as AdminProductController;
use App\Http\Controllers\Admin\UserController as AdminUserController;
use App\Http\Controllers\Customer\CartController;
use App\Http\Controllers\Customer\ProductController;
use App\Http\Controllers\Customer\CheckoutController;
use App\Http\Controllers\Customer\CustomerDashboardController;
use App\Http\Controllers\Customer\OrderController as CustomerOrderController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

Route::get('/', HomeController::class)->name('home');

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/dashboard', DashboardController::class)->name('dashboard');

    // Customer area
    Route::get('/customer', CustomerDashboardController::class)->name('customer.dashboard');
    Route::get('/products/{id}', [ProductController::class, 'show'])->name('products.show');
    Route::get('products/{product}', [ProductController::class, 'show'])->name('customer.products.show');

    Route::prefix('cart')->name('cart.')->group(function () {
        Route::get('/', [CartController::class,'index'])->name('index');
        Route::post('/add/{product}', [CartController::class,'add'])->name('add');
        Route::patch('/item/{item}', [CartController::class,'update'])->name('update');
        Route::delete('/item/{item}', [CartController::class,'remove'])->name('remove');
    });

    Route::get('/checkout', [CheckoutController::class,'show'])->name('checkout.show');
    Route::post('/checkout', [CheckoutController::class,'process'])->name('checkout.process');

    Route::get('/orders', [CustomerOrderController::class,'index'])->name('orders.index');
    Route::get('/orders/{order}', [CustomerOrderController::class,'show'])->name('orders.show');

    // Admin area
    Route::middleware('admin')->prefix('admin')->name('admin.')->group(function () {
        Route::get('/', AdminDashboardController::class)->name('dashboard');

        Route::resource('products', AdminProductController::class)->except(['admin.dashboard']);
        Route::get('/products/{id}', [ProductController::class, 'show'])->name('products.show');
        Route::get('orders', [AdminOrderController::class,'index'])->name('orders.index');
        Route::get('orders/{order}', [AdminOrderController::class,'show'])->name('orders.show');
        Route::get('users', [AdminUserController::class,'index'])->name('users.index');
    });
});