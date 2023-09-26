<!DOCTYPE html>
<html dir="{{ language()->direction() }}" lang="{{ app()->getLocale() }}">
    <x-chat-gpt::layouts.chat.head>
        @if (! empty($metaTitle))
        <x-slot name="metaTitle">
            {!! !empty($metaTitle->attributes->has('title')) ? $metaTitle->attributes->get('title') : $metaTitle !!}
        </x-slot>
        @endif

        <x-slot name="title">
            {!! !empty($title->attributes->has('title')) ? $title->attributes->get('title') : $title !!}
        </x-slot>
    </x-chat-gpt::layouts.chat.head>
    <body class="bg-[#f1f5f9]">
 
        @stack('body_start')
            <x-chat-gpt::layouts.chat.content>     
                {!! $content !!}
            </x-chat-gpt::layouts.chat.content>
        @stack('body_end')
        <x-chat-gpt::layouts.chat.scripts />
    </body>
</html>