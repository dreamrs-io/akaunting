
<x-layouts.gpt>
    {{-- <div style="display: none">
        <x-slot name="title">{{ trans('chat-gpt::general.name') }}</x-slot>
    </div> --}}
    

    {{-- <x-slot name="favorite"
        title="{{ trans('chat-gpt::general.name') }}"
        icon="sms"
        route="chat-gpt.main.index"
    ></x-slot> --}}

    {{-- <x-slot name="buttons">
        <x-link href="{{ route('chat-gpt.main.index') }}" kind="primary" id="index-more-actions-new-item">
            {{ trans('chat-gpt::general.new_chant_btn') }}
        </x-link>
    </x-slot> --}}

    <x-slot name="content">
        <div class="bg-gray-100 z-10 transform translate-x-0 transition-color duration-100 border-b">
            <div class="h-10 flex justify-between px-6 lg:px-10 mx-auto max-w-4xl lg:max-w-[90rem]">
                <ul class="-ml-3 sm:-ml-5 grid grid-flow-col justify-start items-center">
                    <li>
                        <a href="#"><button class="
                            group px-3 sm:px-5 h-10 uppercase tracking-wider text-xs font-medium
                            hover:text-red-500
                            text-red-500
                        ">ChatGpt</button></a>
                    </li>
                </ul>
                <ul class="-mr-3 sm:-mr-5 grid grid-flow-col justify-end items-center">
                    <li>
                        <a href="#settings" target="_self"><button class="
                            group px-3 sm:px-5 h-10 uppercase tracking-wider text-xs font-medium
                            hover:text-red-500
                        ">Chat Mode</button></a>
                    </li>
        
                    <li>
                        <!-- Switch Container -->
                        <div class="w-10 h-6 flex items-center bg-gray-300 cursor-pointer rounded-full p-1 duration-300 ease-in-out" 
                            :class="{ 'bg-green-400': toggleActive}"
                            @click="onToggleChatMode('{{ route('chat-gpt.main.send')}}')">
                            
                            <!-- Switch -->
                            <div class="bg-white w-4 h-4 rounded-full shadow-md transform duration-300 ease-in-out" 
                                :class="{ 'translate-x-4': toggleActive,}"></div>
                        
                        </div>
                        <!-- Switch Container End -->
                    </li>
                </ul>
            </div>
            
        </div>

        <div class="flex flex-row my-2">
            <div class="w-full lg:w-3/12 bg-black-300 text-white-400">
                <div>
                    <div class="flex items-center justify-between text-xl text-black-800 border-b p-2">
                        <h2>Chat History</h2>
                        <span></span>
                    </div>
                    <ul class="space-y-2 my-3 px-2">
                        <template v-for="item in chat_list">
                            <li class="hover:bg-gray-100">
                                <div class="flex justify-between border-0 m-0 p-0">
                                    <div class="flex-1 pr-2 cursor-pointer truncate"
                                    @click="onSelect(item.id)">
                                        <span v-text="item.title"></span>
                                    </div>
                                    <span class="flex w-12" v-text="item.id">.</span>
                                </div>
                            </li>
                        </template>
                    </ul>
                    
                </div>
               
            </div>
            <div class="w-full lg:w-9/12 border-l p-2 lg:rtl:pr-8 ml-2 bg-gray-100">
                    {{-- <x-form id="chat" :route="['chat-gpt.main.send', $chat->id]" :model="$chat"> --}}
                    <x-form id="chat">
                        <div class="w-full relative" style="height: 86vh;">
                            <x-form.section class="mb-0" override="class">
                                <x-slot name="head">
                                    <x-form.section.head title="{{ trans('chat-gpt::general.gpt_model_default') }}" description="" />
                                </x-slot>
                                <x-slot name="foot">
                                    <div class="cursor-pointer" @click="scrollDown()">
                                        #<span v-text="chat.id">...</span> |
                                        PId: <span v-text="chat.parent_id">...</span> |
                                        Loading: <span v-text="form.loading">...</span>
                                    </div>
                                    <div ref="chat_container" class="w-full overflow-y-auto scroll-smooth" style="height: 60vh">
                                        <ul class="space-y-2 my-3">
                                            <template v-for="msg in chat_history">
                                            <li class="border-b p-2" :class="{'bg-blue-200': msg.type > 0}">
                                                <div class="flex justify-start">
                                                    {{-- <div class="bg-blue-100 w-8" v-text="msg.id">#</div> --}}
                                                    <div class="w-20">
                                                        <span v-if="msg.type <= 0">You</span>
                                                        <span v-if="msg.type > 0">ChatGpt</span>
                                                    </div>
                                                    <div class="break-all" v-text="msg.content"></div>
                                                </div>
                                            </li>
                                            </template>
                                        </ul>
                                    </div>
                                </x-slot>
                                
                            </x-form.section>

                            
                            
                            <x-form.section override="class"
                                class="mb-0 w-full absolute bottom-0 left-0">
                                    <x-slot name="foot" override="class" class="relative">
                                        <x-form.input.textarea
                                            name="content"
                                            value=""
                                            placeholder="Send a message"
                                            rows="1"
                                            v-model="form.content"
                                            />
                                        <x-form.input.hidden v-model="form.parent_id" name="parent_id" value="0" />
                                        {{-- <x-form.buttons without-cancel="true"/> --}}
                                        <x-button
                                            type="button"
                                            id="btn_send_message"
                                            class="absolute bottom-4 right-4 bg-green hover:bg-green-700 border pt-2 px-2 cursor-pointer rounded-md"
                                            override="class"
                                            @disabled="form.loading"
                                            @click="onSend('{{ route('chat-gpt.main.send')}} ')">
                                            <span class="material-icons-outlined text-white text-xlg">send</span>
                                        </x-button>
                                        
                                    </x-slot>
                            </x-form.section>
                            
                        </div>
                        

                    </x-form>
            </div>
        </div>
        
    </x-slot>
</x-layouts.admin>
<!-- Styles -->
{{-- <link href="{{ asset('css/pizza.css') }}" rel="stylesheet"> --}}
<!-- Scripts -->
<script src="{{ asset('public/modules/chat-gpt/js/chat-gpt.min.js')}}"></script>