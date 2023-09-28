<template>
     <div class='flex flex-col gap-4 h-full '>
        <div v-for="(message, index) in chatHistory" :key="index">
            <div class='flex gap-4 items-start animate-pulse  '>
                <div class="h-10 w-10 flex-shrink-0 items-center mb-1 "
                    :class="{ 'human-message': message.type === 'Human', 'ai-message': message.type === 'Ai' }">
                </div>
                <div class="w-full">
                    <p class="leading-7  font-semibold mt-1 w-full p-2 bg-gray-300"></p>
                    <p class="leading-7  font-semibold mt-1 w-1/2 p-2 bg-gray-300"></p>
                    <p class="leading-7  font-semibold mt-1 w-1/3 p-2 bg-gray-300"></p>
                    
                </div>
               
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            chatHistory: [
                {
                    type:'Human',
                    content:" "
                },
                {
                    type:'Ai',
                    content:""
                },
                {
                    type:'Human',
                    content:""
                },
                {
                    type:'Ai',
                    content:""
                },
                {
                    type:'Human',
                    content:""
                },
                {
                    type:'Ai',
                    content:""
                },
                {
                    type:'Human',
                    content:""
                },       
            ]
        }
    }
}

</script>


<style scoped>
.human-message {
    @apply bg-gray-300
}
.ai-message {
    @apply bg-gray-300
}
</style>