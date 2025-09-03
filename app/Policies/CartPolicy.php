<?php

namespace App\Policies;

use App\Models\Cart;
use App\Models\User;

class CartPolicy
{
    public function update(User $user, Cart $cart): bool
    {
        return $cart->user_id === $user->id;
    }
}
