<!DOCTYPE html>
<html dir="{{ language()->direction() }}" lang="{{ app()->getLocale() }}">
    <x-layouts.chat.head>
        @if (! empty($metaTitle))
        <x-slot name="metaTitle">
            {!! !empty($metaTitle->attributes->has('title')) ? $metaTitle->attributes->get('title') : $metaTitle !!}
        </x-slot>
        @endif

        <x-slot name="title">
            {!! !empty($title->attributes->has('title')) ? $title->attributes->get('title') : $title !!}
        </x-slot>
    </x-layouts.chat.head>

    @mobile
    <body class="bg-[#f1f5f9]">
    @elsemobile
    <body class="bg-[#f1f5f9] overflow-y-overlay">
    @endmobile
        @stack('body_start')
            <x-layouts.chat.content>     
                {!! $content !!}
            </x-layouts.chat.content>
        @stack('body_end')
        <x-layouts.chat.scripts />
    </body>
</html>
