<x-app-layout>
    <style>
        
        @media screen and (max-width: 768px) {
            .layout-container {
                flex-direction: column;
            }
            .app-bar {
                flex-direction: row;
                justify-content: space-between; 
                align-items: center;
                margin-bottom: 1.5rem;
            }
            .mobile-bottom-nav {
                display: block;
            }
            .sidebar {
                display: none;
            }
            .product-container {
                grid-template-columns: 1fr;
                justify-items: center;
            }
        }

        @media screen and (min-width: 769px) {
            .layout-container {
                display: flex;
                gap: 20px;
            }
            .sidebar {
                width: 25%;
                display: block;
                margin-right: 20px;
            }
            .main-content {
                width: 100%;
            }
            .mobile-bottom-nav {
                display: none;
            }
            .product-container {
                grid-template-columns: repeat(3, 1fr);
            }
        }
        
        
        .product-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        
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

    
    <div class="layout-container mx-8 mb-8">
        
        
        <div class="main-content bg-white rounded-lg p-4 shadow-lg m-4">
            
            <h2 class="text-3xl font-bold mb-6">Customer Dashboard</h2>

            
            <div class="grid md:grid-cols-2 gap-6 mb-8">
                <a href="{{ route('orders.index') }}" 
                   class="block bg-white p-6 rounded-xl shadow border border-lblue hover:bg-gray-50 transition">
                    <div class="text-lg font-semibold">Order History</div>
                    <div class="text-gray-500">View previous orders</div>
                </a>
            </div>

            <br>

            
            <div class="bg-white p-6 rounded-xl shadow border border-lblue">
                <h2 class="text-2xl font-bold mb-6">Products</h2>

                <div class="product-container grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    @forelse($products as $product)
                        <div class="product-box">
                            <div class="product-card">
                                
                                <a href="{{ route('customer.products.show', $product->id) }}">
                                    <img src="{{ asset($product->image_url) }}" 
                                         alt="{{ $product->name }}" 
                                         class="w-32 h-32 object-cover mb-4 cursor-pointer">
                                </a>

                                
                                <h3 class="text-xl font-semibold text-center text-gray-800 mb-4">
                                    {{ $product->name }}
                                </h3>
                            </div>
                            <br>
                            
                            <form method="POST" action="{{ route('cart.add',$product) }}">
                                @csrf
                                <input type="hidden" name="product_id" value="{{ $product->id }}">
                                <button type="submit" 
                                        class="bg-lblue text-white px-6 py-2 rounded-full hover:bg-blue-600 transition"
                                        style="width:150px">
                                    Add to Cart
                                </button>
                            </form>
                        </div>
                    @empty
                        <div class="text-gray-500">No products available.</div>
                    @endforelse
                </div>
            </div>

        </div>
    </div>
</x-app-layout>