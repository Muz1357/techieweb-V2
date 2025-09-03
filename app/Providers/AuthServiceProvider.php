<?php

namespace App\Providers;

use App\Models\User;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;
use App\Models\Cart;
use App\Policies\CartPolicy;


class AuthServiceProvider extends ServiceProvider
{
    protected $policies = [];

    public function boot(): void
    {
        Gate::define('admin-only', fn(User $user) => $user->isAdmin());
        $this->policies[Cart::class] = CartPolicy::class;
    }
}
