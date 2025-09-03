<x-guest-layout>

  <!-- Top Bar -->
  <div class="bg-lblue text-white p-4 rounded-lg shadow-lg m-4 flex justify-between items-center">
    <a href="{{ url('/') }}" class="flex items-center">
      <img src="{{ asset('images/logo.png') }}" alt="Logo Image" class="w-10 h-10 cursor-pointer">
    </a>
    <div class="flex items-center space-x-4">
      @guest
        <a href="{{ route('login') }}" class="px-4 py-2 bg-white text-lblue font-semibold rounded-full">Login</a>
        <a href="{{ route('register') }}" class="px-4 py-2 bg-slate text-white font-semibold rounded-full">Register</a>
      @else
        <span class="font-semibold">Hello, {{ auth()->user()->name }}</span>
      @endguest
    </div>
  </div>

  <!-- Hero Section -->
  <div class="flex flex-col items-center justify-center text-center my-10">
    <div class="bg-lblue text-white p-10 rounded-xl max-w-4xl">
      <h1 class="text-4xl font-bold mb-4">Welcome to Our Tech Store</h1>
      <p class="text-lg">
        Welcome to Techie, your one-stop destination for high-quality tech products.  
        Browse the latest and greatest tech products with ease and enjoy fast delivery & secure payments.
      </p>
      <div class="mt-6">
        <a href="{{ route('dashboard') }}" class="px-6 py-3 bg-gray-900 text-white rounded-lg">Shop Now</a>
      </div>
    </div>
  </div>

  <!-- Latest Products Section -->
  <div id="latest-products" class="max-w-7xl mx-auto px-4 py-10">
    <h1 class="text-2xl font-bold text-slate mb-6">Latest Products</h1>
    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      @foreach($products as $p)
        <div class="bg-white rounded-xl shadow overflow-hidden border border-slate">
          @if($p->image_url)
            <img src="{{ $p->image_url }}" class="w-full h-40 object-cover" alt="">
          @endif
          <div class="p-4">
            <div class="font-semibold text-gray-800">{{ $p->name }}</div>
            <div class="text-sm text-gray-500 mb-2">{{ $p->category?->name }}</div>
            <div class="font-bold text-lblue mb-3">Rs {{ number_format($p->price,2) }}</div>
            
            @auth
              @if(auth()->user()->role === 'customer')
                <form action="{{ route('cart.add',$p) }}" method="POST" class="flex items-center gap-2">
                  @csrf
                  <input type="number" min="1" name="quantity" value="1" class="w-20 border-gray-300 rounded-lg">
                  <button class="px-3 py-2 bg-lblue text-white rounded-lg">Add to Cart</button>
                </form>
              @endif
            @else
              <a href="{{ route('login') }}" class="text-lblue font-semibold">Login to buy</a>
            @endauth
          </div>
        </div>
      @endforeach
    </div>
    <div class="mt-6">{{ $products->links() }}</div>
  </div>

</x-guest-layout>
