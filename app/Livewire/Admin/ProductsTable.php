<?php

namespace App\Livewire\Admin;

use App\Models\Product;
use Livewire\Component;
use Livewire\WithPagination;

class ProductsTable extends Component
{
    use WithPagination;

    public string $q = '';

    protected $queryString = ['q'];

    public function updatingQ() { $this->resetPage(); }

    public function render()
    {
        $products = Product::with('category')
            ->when($this->q, fn($qry) => $qry->where('name','like',"%{$this->q}%"))
            ->latest()->paginate(10);

        return view('livewire.admin.products-table', compact('products'));
    }
}
