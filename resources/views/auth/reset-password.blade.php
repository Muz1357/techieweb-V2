<x-guest-layout>
    <style>
        /* Desktop and Mobile Styles */
        .reset-page {
            display: flex;
            min-height: 100vh;
        }

        .reset-form-container {
            width: 100%;
            max-width: 500px;
            margin: auto;
        }

        .image-container {
            display: none;
        }

        @media screen and (min-width: 769px) {
            .reset-form-container {
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

    <!-- Password Reset Page -->
    <div class="reset-page">

        <!-- Reset Form Section -->
        <div class="reset-form-container p-8 bg-white flex flex-col justify-center items-start">
            <h2 class="text-4xl font-bold mb-4">Reset Password</h2>

            <!-- Validation Errors -->
            <x-validation-errors class="mb-4" />

            <form method="POST" action="{{ route('password.update') }}" class="w-full space-y-6">
                @csrf

                <input type="hidden" name="token" value="{{ $request->route('token') }}">

                <!-- Email -->
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                    <input 
                        id="email"
                        type="email"
                        name="email"
                        value="{{ old('email', $request->email) }}"
                        required
                        autofocus
                        autocomplete="username"
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
                        required
                        autocomplete="new-password"
                        class="mt-1 block w-full px-4 py-3 border border-lblue shadow-sm focus:ring-lblue focus:border-lblue"
                        style="border-radius: 100px; height: 50px"
                    >
                </div>

                <!-- Confirm Password -->
                <div>
                    <label for="password_confirmation" class="block text-sm font-medium text-gray-700">Confirm Password</label>
                    <input 
                        id="password_confirmation"
                        type="password"
                        name="password_confirmation"
                        required
                        autocomplete="new-password"
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
                        Reset Password
                    </button>
                </div>
            </form>
        </div>

        <!-- Image Right -->
        <div class="image-container bg-cover bg-center" style="background-image: url('{{ asset('images/image2.png') }}');"></div>

    </div>
</x-guest-layout>
