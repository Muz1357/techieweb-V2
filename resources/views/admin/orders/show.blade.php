<x-app-layout>
  <x-slot name="header"><h2 class="font-semibold text-xl text-gray-800">Order #{{ $order->id }}</h2></x-slot>
  <div class="py-8 max-w-5xl mx-auto sm:px-6 lg:px-8 space-y-6">
    <div class="bg-white p-6 rounded-xl shadow">
      <div class="flex justify-between">
        <div>User: {{ $order->user->name }} ({{ $order->user->email }})</div>
        <div>Status: <span class="font-semibold">{{ ucfirst($order->status) }}</span></div>
      </div>
      <div class="mt-2">Total: <span class="font-semibold">Rs {{ number_format($order->total,2) }}</span></div>
      <div class="text-sm text-gray-500">Payment Ref: {{ $order->payment_ref ?? '-' }}</div>
    </div>
    <div class="bg-white p-6 rounded-xl shadow">
      <div class="font-semibold mb-3">Items</div>
      <div class="divide-y">
        @foreach($order->items as $it)
        <div class="py-3 flex justify-between">
          <div>{{ $it->product->name }} × {{ $it->quantity }}</div>
          <div>Rs {{ number_format($it->price * $it->quantity,2) }}</div>
        </div>
        @endforeach
      </div>
    </div>
  </div>
</x-app-layout>
