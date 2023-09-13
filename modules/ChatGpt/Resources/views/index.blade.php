<x-layouts.admin>
    <x-slot name="title">{{ trans('chat-gpt::general.name') }}</x-slot>

    <x-slot name="favorite"
        title="{{ trans('chat-gpt::general.name') }}"
        icon="sms"
        route="chat-gpt.main.index"
    ></x-slot>

    <x-slot name="content">
        <div class="flex flex-col lg:flex-row mt-12">
            <div class="w-full lg:w-3/12">
                <div>
                    <div class="flex items-center justify-between text-xl text-black-400 border-b pb-2">
                            <h2>Hello World</h2>
                            <span>#23423432</span>
                    </div>
                        <ul class="space-y-2 my-3">
                            <li class="hover:bg-gray-100">
                                <div class="flex justify-between border-0 m-0 p-0">
                                    <div style="display:flex; align-items: center;">
                                        <span>Names</span>
                                    </div>
                                    <span>$234,234</span>
                                </div>
                            </li>
                        </ul>
                    
                </div>
                <h1>Hello World</h1>

                <p>
                    This view is loaded from module: {!! config('chat-gpt.name') !!}
                </p>
            </div>
            <div class="w-full lg:w-9/12 border-l pl-4 lg:rtl:pr-8 ml-4">
                Form
            </div>
        </div>
        
    </x-slot>
</x-layouts.admin>