<x-app-layout>
    <div class="p-6 max-w-4xl mx-auto bg-white rounded-xl shadow">
        <div class="flex flex-col md:flex-row gap-6">
            
            <!-- Product Image -->
            <div class="md:w-1/2">
                <img src="{{ asset($product->image_url) }}" alt="{{ $product->name }}" class="w-full h-auto rounded-lg object-cover">
            </div>

            <!-- Product Details -->
            <div class="md:w-1/2 flex flex-col justify-between">
                <div>
                    <h2 class="text-3xl font-bold mb-4">{{ $product->name }}</h2>
                    <p class="text-gray-700 mb-4">{{ $product->description }}</p>
                    <p class="text-gray-700 mb-4">{{ $product->category->name ?? '' }}</p>
                    <p class="text-lblue font-bold text-2xl mb-6">Rs.{{ number_format($product->price, 2) }}</p>
                </div>

                <!-- Add to Cart -->
                <form method="POST" action="{{ route('cart.add',$product) }}" class="mt-4">
                    @csrf
                    <input type="hidden" name="product_id" value="{{ $product->id }}">
                    <button type="submit" class="bg-lblue text-white px-6 py-2 rounded-full hover:bg-lblue transition w-full">
                        Add to Cart
                    </button>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
