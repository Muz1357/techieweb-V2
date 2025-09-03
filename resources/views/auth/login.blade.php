<x-guest-layout>
    <style>
        /* Desktop and Mobile Styles */
        .login-page {
            display: flex;
            min-height: 100vh;
        }

        .login-form-container {
            width: 100%;
            max-width: 500px;
            margin: auto;
        }

        .image-container {
            display: none;
        }

        @media screen and (min-width: 769px) {
            .login-form-container {
                width: 50%;
                margin: auto; /* vertically center */
            }

            .image-container {
                width: 50%;
                display: block;
            }
        }
    </style>

    <!-- Top Bar -->
    <div class="bg-lblue text-white p-4 rounded-lg shadow-lg m-4 flex justify-between items-center">
        <a href="{{ url('/') }}" class="flex items-center">
            <img src="{{ asset('images/logo.png') }}" alt="Logo Image" class="w-10 h-10 cursor-pointer">
        </a>
    </div>

    <!-- Login Page -->
    <div class="login-page">

        <!-- Login Form -->
        <div class="login-form-container p-8 bg-white flex flex-col justify-center items-start">
            <x-page-title class="text-5xl">Log In</x-page-title>
            <p class="text-sm text-gray-600 mb-4">
                Don't have an account?
                <a href="{{ route('register') }}" class="underline hover:text-blue-700">Register</a>
            </p>

            <!-- Validation Errors -->
            <x-validation-errors class="mb-4" />

            @session('status')
                <div class="mb-4 font-medium text-sm text-green-600">
                    {{ $value }}
                </div>
            @endsession

            <form method="POST" action="{{ route('login') }}" class="w-full space-y-6">
                @csrf

                <!-- Email -->
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input 
                        id="email"
                        type="email" 
                        name="email" 
                        value="{{ old('email') }}" 
                        required autofocus autocomplete="username"
                        class="mt-1 block w-full px-4 py-3 border border-lblue shadow-sm focus:ring-lblue focus:border-lblue"
                        style="border-radius: 100px; height: 50px"
                    >
                </div>

                <!-- Password -->
                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input 
                        id="password"
                        type="password" 
                        name="password" 
                        required autocomplete="current-password"
                        class="mt-1 block w-full px-4 py-3 border border-lblue shadow-sm focus:ring-lblue focus:border-lblue"
                        style="border-radius: 100px; height: 50px"
                    >
                </div>

                <!-- Remember Me + Forgot -->
                <div class="flex items-center justify-between">
                    <label for="remember_me" class="flex items-center">
                        <input id="remember_me" type="checkbox" name="remember" class="rounded text-lblue focus:ring-lblue">
                        <span class="ml-2 text-sm text-gray-600">Remember me</span>
                    </label>

                    @if (Route::has('password.request'))
                        <a class="text-sm text-gray-600 hover:text-lblue underline" href="{{ route('password.request') }}">
                            Forgot your password?
                        </a>
                    @endif
                </div>

                <!-- Submit -->
                <div>
                    <button 
                        type="submit" 
                        class="w-full bg-lblue text-white font-semibold shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-lblue hover:bg-sky-500 transition"
                        style="border-radius: 100px; height: 50px"
                    >
                        Log In
                    </button>
                </div>
            </form>
        </div> 

        <!-- Image Right -->
        <div class="image-container bg-cover bg-center" style="background-image: url('{{ asset('images/image1.png') }}');"></div>

    </div>
</x-guest-layout>
