<x-guest-layout>
    <style>
        /* Desktop and Mobile Styles */
        .twofactor-page {
            display: flex;
            min-height: 100vh;
        }

        .twofactor-form-container {
            width: 100%;
            max-width: 500px;
            margin: auto;
        }

        .image-container {
            display: none;
        }

        @media screen and (min-width: 769px) {
            .twofactor-form-container {
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

    <!-- Two-Factor Challenge Page -->
    <div class="twofactor-page">

        <!-- Form Section -->
        <div class="twofactor-form-container p-8 bg-white flex flex-col justify-center items-start">
            <h2 class="text-4xl font-bold mb-4">Two-Factor Authentication</h2>
            <div x-data="{ recovery: false }" class="w-full">

                <!-- Instructions -->
                <div class="mb-4 text-sm text-gray-600" x-show="! recovery">
                    {{ __('Please confirm access to your account by entering the authentication code provided by your authenticator application.') }}
                </div>
                <div class="mb-4 text-sm text-gray-600" x-cloak x-show="recovery">
                    {{ __('Please confirm access to your account by entering one of your emergency recovery codes.') }}
                </div>

                <!-- Validation Errors -->
                <x-validation-errors class="mb-4" />

                <!-- Form -->
                <form method="POST" action="{{ route('two-factor.login') }}" class="w-full space-y-6">
                    @csrf

                    <!-- Auth Code -->
                    <div x-show="! recovery">
                        <label for="code" class="block text-sm font-medium text-gray-700">Authentication Code</label>
                        <input 
                            id="code"
                            type="text"
                            name="code"
                            inputmode="numeric"
                            autocomplete="one-time-code"
                            x-ref="code"
                            autofocus
                            class="mt-1 block w-full px-4 py-3 border border-lblue shadow-sm focus:ring-lblue focus:border-lblue"
                            style="border-radius: 100px; height: 50px"
                        >
                    </div>

                    <!-- Recovery Code -->
                    <div x-cloak x-show="recovery">
                        <label for="recovery_code" class="block text-sm font-medium text-gray-700">Recovery Code</label>
                        <input 
                            id="recovery_code"
                            type="text"
                            name="recovery_code"
                            autocomplete="one-time-code"
                            x-ref="recovery_code"
                            class="mt-1 block w-full px-4 py-3 border border-lblue shadow-sm focus:ring-lblue focus:border-lblue"
                            style="border-radius: 100px; height: 50px"
                        >
                    </div>

                    <!-- Actions -->
                    <div class="flex items-center justify-between">
                        <!-- Toggle Button -->
                        <button 
                            type="button"
                            class="text-sm text-gray-600 hover:text-lblue underline cursor-pointer"
                            x-show="! recovery"
                            x-on:click="
                                recovery = true;
                                $nextTick(() => { $refs.recovery_code.focus() })
                            "
                        >
                            {{ __('Use a recovery code') }}
                        </button>

                        <button 
                            type="button"
                            class="text-sm text-gray-600 hover:text-lblue underline cursor-pointer"
                            x-cloak
                            x-show="recovery"
                            x-on:click="
                                recovery = false;
                                $nextTick(() => { $refs.code.focus() })
                            "
                        >
                            {{ __('Use an authentication code') }}
                        </button>

                        <!-- Submit -->
                        <button 
                            type="submit"
                            class="ms-4 w-40 bg-lblue text-white font-semibold shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-lblue hover:bg-sky-500 transition"
                            style="border-radius: 100px; height: 45px; width: 65px"
                        >
                            Log In
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Image Right -->
        <div class="image-container bg-cover bg-center" style="background-image: url('{{ asset('images/image1.png') }}');"></div>

    </div>
</x-guest-layout>
