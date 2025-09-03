<x-app-layout>
  <div class="py-8 max-w-5xl mx-auto sm:px-6 lg:px-8">
    <h2 class="text-3xl font-bold mb-6">Checkout</h2>
    <div class="grid md:grid-cols-3 gap-6">
      <div class="md:col-span-2 bg-white p-6 rounded-xl shadow">
        <h3 class="font-semibold mb-4">Shipping Address</h3>
        <form method="POST" action="{{ route('checkout.process') }}" class="space-y-4">
          @csrf
          <textarea name="address" rows="6" class="w-full border-gray-300 rounded-lg" required>{{ old('address', auth()->user()->address) }}</textarea>
          <button class="px-4 py-2 bg-lblue text-white rounded-lg">Pay Now (Simulation)</button>
        </form>
      </div>
      <div class="bg-white p-6 rounded-xl shadow">
        <h3 class="font-semibold mb-3">Order Summary</h3>
        @php $subtotal = $cart->items->sum(fn($i)=>$i->price*$i->quantity); $tax = round($subtotal*0.10,2); $total=$subtotal+$tax; @endphp
        <div class="flex justify-between"><span>Subtotal</span><span>Rs {{ number_format($subtotal,2) }}</span></div>
        <div class="flex justify-between"><span>Tax (10%)</span><span>Rs {{ number_format($tax,2) }}</span></div>
        <div class="flex justify-between font-bold text-lg mt-2"><span>Total</span><span>Rs {{ number_format($total,2) }}</span></div>
      </div>
    </div>
  </div>
</x-app-layout>
