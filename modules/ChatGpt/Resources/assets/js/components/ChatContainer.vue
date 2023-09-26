<template>
    <div class=''>
        <div class='bg-white p-6 shadow text-center'>
            <p>Default Topbar</p>
        </div>
        <div class="p-4 sm:ml-64 h-screen">
            <div class="p-4 rounded-lg dark:border-gray-700 max-w-4xl mx-auto h-full ">
                <div class='flex flex-col gap-4 h-full '>
                    <div v-for="(message, index) in chatHistory" :key="index">
                        <div class='flex gap-4 items-start'>
                            <div class="h-10 w-10 flex-shrink-0 items-center mb-1 "
                                :class="{ 'human-message': message.type === 'Human', 'ai-message': message.type === 'Ai' }">
                            </div>
                            <p class="leading-7  font-semibold mt-1 ">{{ message.content }}</p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <chat-input></chat-input>
    </div>
</template>


<script>
import ChatInput from './ChatInput.vue';
export default {
    components:{
        'chat-input':ChatInput
    },
    data() {
        return {
            chatHistory: [
                {
                    type: 'Human',
                    content: 'What is the Financial report For this month',
                },
                {
                    type: 'Ai',
                    content: 'You spent most money on Supply Chain Here is your report You spent most money on Supply Chain Here is your reportYou spent most money on Supply Chain Here is your reportYou spent most money on Supply Chain Here is your reportYou spent most money on Supply Chain Here is your reportYou spent most money on Supply Chain Here is your reportYou spent most money on Supply Chain Here is your reportYou spent most money on Supply Chain Here is your reportYou spent most money on Supply Chain Here is your reportYou spent most money on Supply Chain Here is your report',
                },
            ]
        }
    }
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