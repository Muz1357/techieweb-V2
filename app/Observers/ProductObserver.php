<?php

namespace App\Observers;

use App\Jobs\CacheHomepage;
use App\Models\Product;

class ProductObserver
{
    public function created(Product $product) { CacheHomepage::dispatch(); }
    public function updated(Product $product) { CacheHomepage::dispatch(); }
    public function deleted(Product $product) { CacheHomepage::dispatch(); }
}
