<x-app-layout>
  <div class="py-8 max-w-7xl mx-auto sm:px-6 lg:px-8">
    <div class="bg-white rounded-xl shadow overflow-hidden">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-4 py-3 text-left text-xs font-semibold">Order #</th>
            <th class="px-4 py-3 text-left text-xs font-semibold">Status</th>
            <th class="px-4 py-3 text-left text-xs font-semibold">Total</th>
            <th class="px-4 py-3 text-left text-xs font-semibold">Date</th>
            <th class="px-4 py-3"></th>
          </tr>
        </thead>
        <tbody class="divide-y">
          @foreach($orders as $o)
          <tr>
            <td class="px-4 py-3">#{{ $o->id }}</td>
            <td class="px-4 py-3">{{ ucfirst($o->status) }}</td>
            <td class="px-4 py-3">Rs {{ number_format($o->total,2) }}</td>
            <td class="px-4 py-3">{{ $o->created_at->format('Y-m-d H:i') }}</td>
            <td class="px-4 py-3"><a href="{{ route('orders.show',$o) }}" class="text-lblue">View</a></td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
    <div class="mt-4">{{ $orders->links() }}</div>
  </div>
</x-app-layout>
