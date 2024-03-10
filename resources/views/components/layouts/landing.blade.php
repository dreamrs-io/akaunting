<!DOCTYPE html>
<html dir="{{ language()->direction() }}" lang="{{ app()->getLocale() }}">
    <x-layouts.pocketcfo.head>
        <x-slot name="title">
            {!! !empty($title->attributes->has('title')) ? $title->attributes->get('title') : $title !!}
        </x-slot>
    </x-layouts.pocketcfo.head>

    @mobile
    <body class="bg-body">
    @elsemobile
    <body class="bg-body overflow-y-overlay">
    @endmobile

    <x-layouts.pocketcfo.navbar.navbar/>

        @stack('body_start')

        <div id="app">
                <x-layouts.pocketcfo.content>
                    {!! $content !!}
                    <x-layouts.pocketcfo.footer />
                </x-layouts.pocketcfo.content>
        </div>

        @stack('body_end')

    </body>
</html>





