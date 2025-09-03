<div class="p-4 md:p-8 bg-gray-100 min-h-screen">

  @if($cart->items->count())
    @foreach($cart->items as $item)
      <div class="grid grid-cols-2 md:grid-cols-4 gap-4 font-bold text-gray-700 border-b-2 pb-3 mb-4">
        <div class="col-span-2 md:col-span-1 text-left">Product</div>
        <div class="text-center">Price</div>
        <div class="text-center">Qty</div>
        <div class="text-right">Total</div>
      </div>
      <div class="grid grid-cols-2 md:grid-cols-4 gap-4 items-center border-b py-4 bg-white rounded-lg shadow mb-4">
          {{-- Product --}}
          <div class="flex justify-center col-span-2 md:col-span-1 m-4 ">
            <div class="border-2 border-blue-300 rounded-lg p-4 bg-white shadow-md flex flex-col items-center w-[150px]">
              @if($item->product->image_url)
                <img src="{{ $item->product->image_url }}" 
                    alt="{{ $item->product->name }}" 
                    class="w-24 h-24 object-cover mb-2" />
              @endif
              <h3 class="text-sm font-semibold text-center">{{ $item->product->name }}</h3>
              <p class="text-xs text-gray-500">{{ $item->product->category?->name }}</p>
              <button wire:click="removeItem({{ $item->id }})" 
                      class="mt-2 bg-red-600 hover:bg-red-700 text-white px-4 py-1 rounded-full text-sm">
                Remove
              </button>
            </div>
          </div>

          {{-- Price --}}
          <div class="text-center text-lg">
            Rs {{ number_format($item->price, 2) }}
          </div>

          {{-- Qty --}}
          <div class="flex justify-center items-center">
            <input type="number" min="1" 
                  wire:model.defer="quantities.{{ $item->id }}" 
                  class="w-16 border-gray-300 rounded-lg text-center">
            <button wire:click="updateQuantity({{ $item->id }})" 
                    class="ml-4 bg-lblue hover:bg-indigo-700 text-white px-3 py-1 rounded-lg">
              Update
            </button>
          </div>

          {{-- Total --}}
          <div class="text-right text-lg font-semibold">
            Rs {{ number_format($item->price * $item->quantity, 2) }}
          </div>
        </div>
    @endforeach

    {{-- Totals / Checkout --}}
    @php 
      $subtotal = $cart->items->sum(fn($i)=>$i->price*$i->quantity); 
      $tax = round($subtotal*0.10,2); 
      $total = $subtotal + $tax; 
    @endphp

    <div class="mt-8 bg-white p-6 rounded-lg shadow-md max-w-2xl mx-auto">
      <h2 class="text-2xl font-bold mb-4">Checkout</h2>
      <hr class="mb-4">

      <div class="grid grid-cols-2 md:grid-cols-3 gap-4 mb-6 text-gray-800">
        <div>
          <p class="font-medium">Subtotal:</p>
          <p>Rs {{ number_format($subtotal, 2) }}</p>
        </div>
        <div>
          <p class="font-medium">Tax (10%):</p>
          <p>Rs {{ number_format($tax, 2) }}</p>
        </div>
        <div>
          <p class="font-medium">Total:</p>
          <p class="font-bold">Rs {{ number_format($total, 2) }}</p>
        </div>
      </div>

      <div class="text-right">
        <a href="{{ route('checkout.show') }}" 
           class="bg-lblue hover:bg-emerald-700 text-white font-bold py-2 px-4 rounded">
          Proceed to Checkout
        </a>
      </div>
    </div>

  @else
    <p class="text-center text-gray-500 mt-8">Your cart is empty.</p>
  @endif
</div>
