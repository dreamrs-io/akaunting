<template>
    <div class=''>
        <div class='bg-white p-6 shadow text-center'>
            <p>Default Topbar</p>
        </div>
        <div class="p-4 sm:ml-64 h-screen">
            <div class="p-4 rounded-lg dark:border-gray-700 max-w-4xl mx-auto ">
                <chat-loader v-if="chatHistoryLoading"></chat-loader>
                <div class='flex flex-col gap-4 h-full '>
                    <div v-for="(message, index) in chatHistory" :key="index">
                        <div class='flex gap-4 items-start'>
                            <div class="h-10 w-10 flex-shrink-0 items-center mb-1 rounded "
                                :class="{ 'human-message': message.type === 'Human', 'ai-message': message.type === 'Ai' }">
                            </div>
                            <p class="leading-7  font-semibold mt-1 ">{{ message.content }}</p>
                        </div>
                    </div>
                    <ai-loader v-if="aiResponseLoading"></ai-loader>
                </div>
            </div>
        </div>
        <chat-input></chat-input>
    </div>
</template>


<script>
import ChatHistoryLoader from './ChatHistoryLoader.vue';
import ChatInput from './ChatInput.vue';
import AiLoader from './AiLoader.vue'
export default {
    components:{
        'chat-input':ChatInput,
        'chat-loader' :ChatHistoryLoader,
        'ai-loader' :AiLoader
    },
   

    computed: {
        chatHistory() {
            return this.$store.state.chatHistory;
        },
        chatHistoryLoading(){
            return this.$store.state.chatHistoryLoading
        },
        aiResponseLoading(){
            return this.$store.state.aiResponseLoading
        },

        
    },

}
</script>


<style scoped>
.human-message {
    @apply bg-purple
}
.ai-message {
    @apply bg-black
}
</style>