<template>
    <div class=''>
        <div class="p-4 md:ml-64 h-[88vh]">
            <div class="p-4 rounded-lg dark:border-gray-700 max-w-4xl mx-auto h-full flex flex-col ">
                <div class="flex justify-center">
                    <div class="p-3 bg-[#dee1e4] flex gap-4 rounded-md">
                        <button class="btn" :class="{'btn-active': conversationType == 'conversation'}" @click="changeConversationType('conversation')">Conversation</button>
                        <button  class="btn" :class="{'btn-active': conversationType == 'document'}"     @click="changeConversationType('document')">Data Entry</button>
                    </div>
                </div>
                <h3 class="text-4xl font-extrabold text-gray-400 text-center mt-10 md:mt-auto">Welcome</h3>
                <div class="grid md:grid-cols-2 mt-8  sm:mt-auto sm:mb-8 lg:mb-8 md:mb-10 md:px-20 gap-4">
                    <div v-for="(item, index) in demoQuestions" :key="index" class="p-4 text-sm font-bold border border-black rounded-md cursor-pointer ">
                        <p>{{ item }}</p>
                    </div>
                </div>


            </div>
        </div>
        <chat-input></chat-input>       
    </div>
</template>


<script>
import ChatInput from './ChatInput.vue';
export default{
    components:{
        'chat-input':ChatInput,
        
    },
    data () {
      return {
        conversationType: 'conversation',
        demoQuestions:[
            'Genarate Financial Statement For this Month',
            'Genarate A New Invoice For Customer',
            'Record A New Income',
            'Create A Sales Report For this Year'
        ]
      };
    },
    methods: {
        changeConversationType(value){
            this.conversationType=value
        }
        
    },
}
</script>


<style scoped>
.btn{
    @apply px-6  py-3 rounded-md font-bold whitespace-nowrap
}
.btn-active{
   @apply bg-white duration-500 
}
</style>