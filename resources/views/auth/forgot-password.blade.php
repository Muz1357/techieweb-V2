<x-guest-layout>
    <style>
        /* Desktop and Mobile Styles */
        .forgot-page {
            display: flex;
            min-height: 100vh;
        }

        .forgot-form-container {
            width: 100%;
            max-width: 500px;
            margin: auto;
        }

        .image-container {
            display: none;
        }

        @media screen and (min-width: 769px) {
            .forgot-form-container {
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

    <!-- Forgot Password Page -->
    <div class="forgot-page">

        <!-- Forgot Password Form -->
        <div class="forgot-form-container p-8 bg-white flex flex-col justify-center items-start">
            <h2 class="text-4xl font-bold mb-4">Forgot Password</h2>
            <p class="text-sm text-gray-600 mb-4">
                Enter your email and we’ll send you a reset link.
            </p>

            @session('status')
                <div class="mb-4 font-medium text-sm text-green-600">
                    {{ $value }}
                </div>
            @endsession

            <x-validation-errors class="mb-4" />

            <form method="POST" action="{{ route('password.email') }}" class="w-full space-y-6">
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

                <!-- Submit -->
                <div>
                    <button 
                        type="submit" 
                        class="w-full bg-lblue text-white font-semibold shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-lblue hover:bg-sky-500 transition"
                        style="border-radius: 100px; height: 50px"
                    >
                        Email Password Reset Link
                    </button>
                </div>
            </form>
        </div>

        <!-- Image Right -->
        <div class="image-container bg-cover bg-center" style="background-image: url('{{ asset('images/image2.png') }}');"></div>

    </div>
</x-guest-layout>
