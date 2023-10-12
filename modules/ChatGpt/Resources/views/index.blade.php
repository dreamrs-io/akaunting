<x-chat-gpt::layouts.chat>
    <x-slot name="title">Chat</x-slot>
    <x-slot name="content">
      <chat user-id={{$userId}} user-email={{$userEmail}}></chat>
     
    </x-slot>
    
</x-chat-gpt::layouts.chat>