<template>
    <div class="fixed bottom-16  md:left-20 lg:left-40 w-full  ">
        <div class='px-8 relative max-w-4xl mx-auto p-4'>
            <div v-if="aiResponseLoading" class="absolute right-10 mt-3">
                <ai-loader></ai-loader>
            </div>
            <span class="material-icons text-gray-400 ml-3 text-2xl absolute mt-4" :class="{'text-purple-500':chatInput.length>0}" >add_circle</span>
            <input :disabled="aiResponseLoading" v-model="chatInput"  class='inp shad' placeholder='Send a message' @keyup.enter="sendchat" />
        </div>
        
    </div>
</template>


<script>

import AiLoader from './AiLoader.vue'
export default {
    components:{
        'ai-loader' :AiLoader
    },




    computed: {
    aiResponseLoading(){
            return this.$store.state.aiResponseLoading
    },
    chatInput: {
      get() {
        return this.$store.state.chatInput;
      },
      set(value) {
        this.$store.commit('setChatInput', value);
      },
    },
  },
  methods: {
    sendchat(){
        if (!this.chatInput.length>0){return}
        this.$store.dispatch('sendMessage');
    }

  },
    
}
</script>


<style scoped>

.shad{

    box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
}


.inp {
    @apply placeholder-purple-500 rounded-md p-4 w-full outline-none duration-300 transition-all ring-0 focus:ring-2 ring-purple-500 pl-10 shad
}


</style>