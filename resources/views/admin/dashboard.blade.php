<x-app-layout>
  <style>
    .product-card {
            border: 2px solid #6BC6E4;
            border-radius: 70px;
            width: 250px;
            padding: 1.5rem;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
  </style>

  <div class="py-8 max-w-7xl mx-auto sm:px-6 lg:px-8 space-y-6">
    
    {{-- Metrics --}}
    <div class="grid md:grid-cols-4 gap-6">
      <a href="{{ route('admin.users.index') }}" class="block">
        <div class="bg-white p-6 rounded-xl shadow hover:shadow-lg transition-shadow">
            <div class="text-sm text-gray-500">Users</div>
            <div class="text-2xl font-bold">{{ $metrics['users'] }}</div>
        </div>
      </a>
      <div class="bg-white p-6 rounded-xl shadow">
        <div class="text-sm text-gray-500">Orders</div>
        <div class="text-2xl font-bold">{{ $metrics['orders'] }}</div>
      </div>
      <div class="bg-white p-6 rounded-xl shadow">
        <div class="text-sm text-gray-500">Revenue</div>
        <div class="text-2xl font-bold">Rs {{ number_format($metrics['revenue'],2) }}</div>
      </div>
      <div class="bg-white p-6 rounded-xl shadow">
        <div class="text-sm text-gray-500">Products</div>
        <div class="text-2xl font-bold">{{ $metrics['products'] }}</div>
      </div>
    </div>

    {{-- Products as Cards --}}
    <div class="bg-white p-6 rounded-xl shadow">
      <div class="flex items-center justify-between mb-6">
        <div class="font-semibold text-lg">Products</div>
        <a href="{{ route('admin.products.create') }}" 
           class="px-4 py-2 bg-lblue text-white rounded-full hover:bg-lblue">
          Create New Product
        </a>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
        @foreach($products as $product)
          <div class="product-card">
            <a href="{{ route('admin.products.show', $product->id) }}">
              <img src="{{ $product->image_url }}" 
                   alt="{{ $product->name }}" 
                   class="w-32 h-32 object-cover mb-4 rounded">
            </a>
            <h3 class="text-lg font-semibold mb-2 text-center">{{ $product->name }}</h3>
            <p class="text-sm text-gray-500 mb-3">Rs {{ number_format($product->price,2) }}</p>

            <div class="flex justify-center space-x-3">
              <a href="{{ route('admin.products.edit', $product->id) }}" 
                 class="bg-lblue text-white px-4 py-2 rounded-full hover:bg-lblue text-sm m-4">
                Edit
              </a>
              <form method="POST" action="{{ route('admin.products.destroy', $product->id) }}" 
                    onsubmit="return confirm('Are you sure you want to delete this product?');">
                @csrf
                @method('DELETE')
                <button type="submit" 
                        class="bg-red-600 text-white px-4 py-2 rounded-full hover:bg-red-700 text-sm m-4">
                  Delete
                </button>
              </form>
            </div>
          </div>
        @endforeach
      </div>
    </div>

    {{-- Latest Orders --}}
    <div class="bg-white p-6 rounded-xl shadow">
      <div class="font-semibold mb-3">Latest Orders</div>
      <div class="divide-y">
        @foreach($latestOrders as $o)
          <div class="py-3 flex justify-between">
            <div>#{{ $o->id }} — {{ $o->user->name }}</div>
            <div>Rs {{ number_format($o->total,2) }}</div>
          </div>
        @endforeach
      </div>
    </div>

  </div>
</x-app-layout>
