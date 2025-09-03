<x-app-layout>
  <h2 class="font-semibold text-xl text-gray-800 m-4">Add Product</h2>
  <div class="py-8 max-w-3xl mx-auto sm:px-6 lg:px-8">
    <form method="POST" action="{{ route('admin.products.store') }}" enctype="multipart/form-data" class="space-y-4 bg-white p-6 rounded-xl shadow">
      @csrf
      <x-input-label value="Name" />
      <x-text-input name="name" class="w-full" required />
      <x-input-error :messages="$errors->get('name')" />

      <x-input-label value="Category" />
      <select name="category_id" class="w-full border-gray-300 rounded-lg">
        <option value="">— None —</option>
        @foreach($categories as $c)<option value="{{ $c->id }}">{{ $c->name }}</option>@endforeach
      </select>

      <x-input-label value="Description" />
      <textarea name="description" rows="5" class="w-full border-gray-300 rounded-lg"></textarea>

      <x-input-label value="Price" />
      <x-text-input type="number" step="0.01" name="price" class="w-full" required />

      <x-input-label value="Stock" />
      <x-text-input type="number" name="stock" class="w-full" required />

      <x-input-label value="Product Image" />
      <input type="file" name="image" accept="image/*" class="w-full border-gray-300 rounded-lg" />
      <x-input-error :messages="$errors->get('image')" />

      <div class="flex justify-end">
        <x-primary-button type="submit">Save</x-primary-button>
      </div>
    </form>
  </div>
</x-app-layout>
