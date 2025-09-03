<x-app-layout>
  <div class="py-8 max-w-7xl mx-auto sm:px-6 lg:px-8">
    <div class="bg-white rounded-xl shadow overflow-hidden">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-4 py-3 text-left text-xs font-semibold">Name</th>
            <th class="px-4 py-3 text-left text-xs font-semibold">Email</th>
            <th class="px-4 py-3 text-left text-xs font-semibold">Role</th>
            <th class="px-4 py-3 text-left text-xs font-semibold">Joined</th>
          </tr>
        </thead>
        <tbody class="divide-y">
          @foreach($users as $u)
          <tr>
            <td class="px-4 py-3">{{ $u->name }}</td>
            <td class="px-4 py-3">{{ $u->email }}</td>
            <td class="px-4 py-3">{{ ucfirst($u->role) }}</td>
            <td class="px-4 py-3">{{ $u->created_at->format('Y-m-d') }}</td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
    <div class="mt-4">{{ $users->links() }}</div>
  </div>
</x-app-layout>
