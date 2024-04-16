<x-layouts.error>
    <x-slot name="title">
        Payment Required
    </x-slot>

    <x-slot name="content">
        <div class="flex flex-col sm:flex-row items-center justify-center h-screen">
            <div class="flex flex-col items-start gap-y-4 mb-10 sm:mb-0 sm:-mt-24">
                <h1 class="font-medium text-5xl lg:text-8xl">
                    Payment Required
                </h1>

                <span class="text-lg">
                    Please update your subscription 
                </span>

                @if (! empty($message))
                <span class="text-lg">
                    Please update your subscription 
                </span>
                @endif

                @php $landing_page = user() ? user()->getLandingPageOfUser() : route('login'); @endphp
                <x-link
                    href="https://www.pocketcfos.com"
                    class="relative flex items-center justify-center bg-green hover:bg-green-700 text-white px-6 py-1.5 text-base rounded-lg disabled:bg-green-100 mt-3"
                    override="class"
                >
                        Manage Your Payment
                </x-link>
            </div>

            <img width="300" src="{{ asset('public/img/errors/402.png') }}" alt="402" />
        </div>
    </x-slot>
</x-layouts.error>
