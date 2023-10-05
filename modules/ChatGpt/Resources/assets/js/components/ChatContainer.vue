<template>
    <div class=''>
        <div class='bg-white p-6 shadow text-center'>
            <p>Default Topbar</p>
        </div>
        <div class=" md:ml-64 h-screen">
            <div class=" rounded-lg dark:border-gray-700 ">
                <chat-loader v-if="chatHistoryLoading"></chat-loader>
                <div class='flex flex-col gap-4 h-full  '>
                    <div v-for="(message, index) in chatHistory" :key="index">
                        <div :class="{ 'human-message-container': message.type === 'Human' }">
                            <div class="max-w-3xl mx-auto flex gap-4 items-start">

                                <div class="h-10 w-10 flex-shrink-0 items-center mb-1 rounded"
                                    :class="{ 'human-message': message.type === 'Human', 'ai-message': message.type === 'Ai' }">
                                </div>
                                <!-- <p class="leading-7  font-semibold mt-1 whitespace-pre-line " v-html="message.content"> </p> -->
                                <!-- <vue-markdown class="font-semibold leading-7 " :source="message.content" /> -->
                                <VueShowdown class="font-medium leading-7 markdown" :markdown="message.content"  :options="{ emoji: true }" />
                            </div>
                        </div>
                    </div>
                    <ai-loader v-if="aiResponseLoading"></ai-loader>
                    <div class="h-36"></div>
                </div>
            </div>
        </div>
        <chat-input></chat-input>
        <div class="markdown hidden">
            <table>
                <thead></thead>
            </table>

        </div>

    </div>
</template>


<script>
import ChatHistoryLoader from './ChatHistoryLoader.vue';
import ChatInput from './ChatInput.vue';
import AiLoader from './AiLoader.vue'
import Vue from 'vue'
import { VueShowdown,showdown } from 'vue-showdown' 
Vue.component('VueShowdown', VueShowdown)

Vue.use(VueShowdown, {
  flavor:'github'
})
showdown.setFlavor('github');
export default {
    components: {

        'chat-input': ChatInput,
        'chat-loader': ChatHistoryLoader,
        'ai-loader': AiLoader
    },


    computed: {
        chatHistory() {
            return this.$store.state.chatHistory;
        },
        chatHistoryLoading() {
            return this.$store.state.chatHistoryLoading
        },
        aiResponseLoading() {
            return this.$store.state.aiResponseLoading
        },

    },

}
</script>


<style >

.markdown table{
    @apply w-full text-sm text-left text-gray-500 mt-4 
}
.markdown thead{
    @apply text-xs text-gray-700 uppercase bg-gray-50 
}


.human-message {
    @apply bg-purple
}

.human-message-container {
    @apply border-t-2 border-dashed py-2 bg-gray-100
}

.ai-message {
    @apply bg-black
}
</style>