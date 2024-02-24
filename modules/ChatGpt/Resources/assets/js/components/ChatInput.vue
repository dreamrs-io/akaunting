<template>
    <div class="fixed bottom-16  md:left-16 lg:left-32 w-full ">
        <div class='px-4 relative max-w-3xl mx-auto p-4 '>
            <div v-if="aiResponseLoading" class="absolute right-10 mt-3">
                <ai-loader></ai-loader>
            </div>
            <span>
                <button @click="showMenu = !showMenu" class="bg-gray-100 hover:bg-gray-300">
                    <span class="material-icons text-gray-400 ml-3 text-2xl absolute mt-6" :class="{'text-purple-500':chatInput.length>0}">chat</span>
                    <span class="material-icons text-gray-400 ml-7 text-3xl absolute mt-5" :class="{'text-purple-500':chatInput.length>0}">arrow_drop_down</span>
                </button>

                <ul v-if="showMenu" class="absolute left-6 top-20 bg-gray-200 border-1 p-2">
                   <li class="relative pl-8 leading-8 cursor-pointer hover:bg-gray-300" @click="select('chat')">
                        <span class="material-icons w-8 absolute left-0 top-1">chat</span>Chat
                    </li>
                    <li class="relative pl-8 leading-8 cursor-pointer hover:bg-gray-300" @click="select('db')">
                        <span class="material-icons w-8 absolute left-0 top-1">table</span>Database
                    </li>
                </ul>
            </span>

            <input :disabled="aiResponseLoading" v-model="chatInput"  class='inp shad' placeholder='Send a message' @keyup.enter="sendchat" />

        </div>
    </div>
</template>

<script>
import AiLoader from './AiLoader.vue'
import {ref} from "vue";
export default {
    setup() {
        const mode = ref('chat')
        const showMenu = ref(false)
        return {
            showMenu,
            mode,
        }
    },
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
      if (!this.chatInput.length > 0) { return }
      this.$store.dispatch('sendNewChat', {});
        // if (this.$store.state.currentChatId==''){
        //     this.$store.dispatch('sendNewChat', {});
        // }else{
        //   this.$store.dispatch('sendChat');
        // }

    },
      select(mode) {
        if (this.mode !== mode) {
            this.mode = mode;
            if (this.mode === 'db') {
                this.chatInput = '/db ' + this.chatInput;
            } else {
                this.chatInput = this.chatInput.replace(/(^\/db+|\/db+$)/mg, '').trim();
            }
            // console.log('mode', this.mode, this.chatInput)
        }
        this.showMenu = !this.showMenu;
      }
  },

}
</script>


<style scoped>

.shad{
    box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
}

.inp {
    @apply bg-white placeholder-purple-500 rounded-md p-4 w-full outline-none duration-300 transition-all ring-0 focus:ring-2 ring-purple-500 pl-14 shad
}

</style>
