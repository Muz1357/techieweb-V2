<div class="bg-lblue text-white p-4 rounded-lg shadow-lg m-4 flex justify-between items-center">
    <a href="{{ auth()->check() && auth()->user()->role === 'admin' 
              ? route('admin.dashboard') 
              : url('/') }}" 
     class="flex items-center">
      <img src="{{ asset('images/logo.png') }}" alt="Logo Image" class="w-10 h-10 cursor-pointer">
    </a>

    <div class="flex items-center space-x-4">
        {{-- Show cart only for customers --}}
        @if(Auth::user()->role === 'customer')
            <a href="{{ route('cart.index') }}" class="flex items-center bg-white p-1" style="border-radius: 100px;">
                <img src="{{ asset('images/image3.png') }}" alt="Cart" class="w-10 h-10 cursor-pointer">
            </a>
        @endif

        {{-- Jetstream Profile Dropdown --}}
        <x-dropdown align="right" width="48">
            <x-slot name="trigger">
                <button class="flex text-sm border-2 border-transparent rounded-full focus:outline-none focus:border-gray-300 transition">
                    <img class="w-10 h-10 rounded-full object-cover" src="{{ Auth::user()->profile_photo_url }}" alt="{{ Auth::user()->name }}" />
                </button>
            </x-slot>

            <x-slot name="content">
                <!-- Account Management -->
                <div class="block px-4 py-2 text-xs text-gray-400">
                    {{ __('Manage Account') }}
                </div>

                <x-dropdown-link href="{{ route('profile.show') }}">
                    {{ __('Profile') }}
                </x-dropdown-link>

                @if (Laravel\Jetstream\Jetstream::hasApiFeatures())
                    <x-dropdown-link href="{{ route('api-tokens.index') }}">
                        {{ __('API Tokens') }}
                    </x-dropdown-link>
                @endif

                <div class="border-t border-gray-200"></div>

                <!-- Authentication -->
                <form method="POST" action="{{ route('logout') }}" x-data>
                    @csrf
                    <x-dropdown-link href="{{ route('logout') }}" 
                        @click.prevent="$root.submit();">
                        {{ __('Log Out') }}
                    </x-dropdown-link>
                </form>
            </x-slot>
        </x-dropdown>
    </div>
</div>
