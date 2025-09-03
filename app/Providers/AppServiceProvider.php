<?php

namespace App\Providers;

use App\Models\Product;
use App\Observers\ProductObserver;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        // Force HTTPS in production so forms/assets always use https://
        if ($this->app->environment('production')) {
            URL::forceScheme('https');
        }

        // Register product observer
        Product::observe(ProductObserver::class);
    }
}
