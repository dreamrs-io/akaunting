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
                    <div @click="setInput(index)" v-for="(item, index) in demoQuestions" :key="index" class="flex justify-between items-center p-4 text-xs font-bold border border-black rounded-md cursor-pointer group hover:bg-[#ececf1] duration-300 ">
                        <p>{{ item }}</p>
                        <span class="material-icons duration-300 text-white group-hover:text-[#1e2129]">send</span>
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
            'Show me the profit and loss of 2023',
            'How much does client Kallie Haley owe us in total?',
            'Show me the recent transactions from my bank',
            'What\'s the total revenue for this year so far?'
        ]
      };
    },
    methods: {
        changeConversationType(value){
            this.conversationType=value
        },
        setInput(i){
            this.$store.commit('setChatInput', this.demoQuestions[i]);
            this.$store.dispatch('sendNewChat');
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