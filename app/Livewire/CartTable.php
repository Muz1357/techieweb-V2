<?php

namespace App\Livewire;

use App\Models\Cart;
use App\Models\CartItem;
use Livewire\Component;

class CartTable extends Component
{
    public Cart $cart;

    protected $rules = [
        'quantities.*' => 'required|integer|min:1'
    ];

    public array $quantities = [];

    public function mount()
    {
        $this->cart = auth()->user()->cart?->load('items.product') ?? auth()->user()->cart()->create();
        foreach ($this->cart->items as $item) {
            $this->quantities[$item->id] = $item->quantity;
        }
    }

    public function updateQuantity($itemId)
    {
        $this->validate();
        $item = CartItem::findOrFail($itemId);
        if ($item->cart_id !== $this->cart->id) abort(403);
        $item->update(['quantity' => $this->quantities[$itemId]]);
        $this->cart->refresh()->load('items.product');
        $this->dispatch('toast', 'Quantity updated.');
    }

    public function removeItem($itemId)
    {
        $item = CartItem::findOrFail($itemId);
        if ($item->cart_id !== $this->cart->id) abort(403);
        $item->delete();
        unset($this->quantities[$itemId]);
        $this->cart->refresh()->load('items.product');
        $this->dispatch('toast', 'Item removed.');
    }

    public function render()
    {
        return view('livewire.cart-table');
    }
}
