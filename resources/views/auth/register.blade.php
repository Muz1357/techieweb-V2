<x-guest-layout>
    <style>
        /* Desktop and Mobile Styles */
        .register-page {
            display: flex;
            min-height: 100vh;
        }

        .register-form-container {
            width: 100%;
            max-width: 500px;
            margin: auto;
        }

        .image-container {
            display: none;
        }

        @media screen and (min-width: 769px) {
            .register-form-container {
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

    <!-- Register Page -->
    <div class="register-page">

        <!-- Register Form -->
        <div class="register-form-container p-8 bg-white flex flex-col justify-center items-start">
            <h2 class="text-5xl font-bold mb-4">Create Account</h2>
            <p class="text-sm text-gray-600 mb-4">
                Already have an account?
                <a href="{{ route('login') }}" class="underline hover:text-blue-700">Log In</a>
            </p>

            <!-- Validation Errors -->
            <x-validation-errors class="mb-4" />

            <form method="POST" action="{{ route('register') }}" class="w-full space-y-6">
                @csrf

                <!-- Name -->
                <div>
                    <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                    <input 
                        id="name" 
                        type="text" 
                        name="name" 
                        value="{{ old('name') }}" 
                        required autofocus autocomplete="name"
                        class="mt-1 block w-full px-4 py-3 border border-lblue shadow-sm focus:ring-lblue focus:border-lblue"
                        style="border-radius: 100px; height: 50px"
                    >
                </div>

                <!-- Email -->
                <div>
                    <label for="email" class="block text-sm font-medium text-gray-700">E-mail</label>
                    <input 
                        id="email" 
                        type="email" 
                        name="email" 
                        value="{{ old('email') }}" 
                        required autocomplete="username"
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
                        required autocomplete="new-password"
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
                        required autocomplete="new-password"
                        class="mt-1 block w-full px-4 py-3 border border-lblue shadow-sm focus:ring-lblue focus:border-lblue"
                        style="border-radius: 100px; height: 50px"
                    >
                </div>

                <!-- Terms & Privacy -->
                @if (Laravel\Jetstream\Jetstream::hasTermsAndPrivacyPolicyFeature())
                    <div>
                        <label for="terms" class="flex items-center">
                            <input id="terms" type="checkbox" name="terms" required class="rounded text-lblue focus:ring-lblue">
                            <span class="ml-2 text-sm text-gray-600">
                                {!! __('I agree to the :terms_of_service and :privacy_policy', [
                                    'terms_of_service' => '<a target="_blank" href="'.route('terms.show').'" class="underline hover:text-blue-700">'.__('Terms of Service').'</a>',
                                    'privacy_policy' => '<a target="_blank" href="'.route('policy.show').'" class="underline hover:text-blue-700">'.__('Privacy Policy').'</a>',
                                ]) !!}
                            </span>
                        </label>
                    </div>
                @endif

                <!-- Submit -->
                <div>
                    <button 
                        type="submit" 
                        class="w-full bg-lblue text-white font-semibold shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-lblue hover:bg-sky-500 transition"
                        style="border-radius: 100px; height: 50px"
                    >
                        Create Account
                    </button>
                </div>
            </form>
        </div> 

        <!-- Image Right -->
        <div class="image-container bg-cover bg-center" style="background-image: url('{{ asset('images/image2.png') }}');"></div>

    </div>
</x-guest-layout>
