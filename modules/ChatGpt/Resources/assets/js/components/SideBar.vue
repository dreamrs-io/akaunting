<template>
    <div>
      <button class="inline-flex items-center p-2 mt-2 ml-3 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
          <span class="material-icons text-black text-2xl">menu</span>
      </button>
      <aside  role='model' class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full md:translate-x-0" aria-label="Sidebar">
      <div class="h-full px-3 py-4 overflow-y-auto bg-[#1e2129]">
          <ul class="space-y-2 font-medium">
              <li>
                  <button class="flex items-center p-2 rounded hover:bg-[#414250]  group border border-gray-500 w-full"    @click="newChat">
                      <span class="material-icons text-gray-300  text-2xl">add</span>
                  <span class="ml-3 text-gray-300 ">New Chat</span>
                  </button>
              </li>
              <li v-for="(item, index) in chatList" :key="index" class='cursor-pointer hover:border-gray-400 border-transparent border overflow-hidden rounded'>
                  <div class="flex items-center p-2  justify-between rounded dark:text-gray-300 hover:bg-[#414250]  group" :class="{'bg-[#414250]':isActive(item._id)}" >
                      <button class="flex items-center w-full" @click="loadChat(item._id)">
                        <span class="material-icons text-gray-300  text-2xl mt-1">message</span>
                        <span class="ml-3 text-xs text-gray-300  whitespace-nowrap">{{item.messages[0].content.substring(0,24)+'..'}}</span>
                      </button>
                      <span v-if="isActive(item._id)" class="material-icons text-gray-300" @click="deleteChat(item._id)">delete</span>
                  </div>
              </li>
              <loader v-if="chatListLoading"></loader>             
          </ul>
      </div>
      </aside>
    </div>
  </template>
<script>
import ChatListLoader from './ChatListLoader.vue'


export default {
    components:{
        'loader':ChatListLoader
    },
    computed: {
        chatList() {
            return this.$store.state.chatList;
        },
        chatListLoading() {
            return this.$store.state.chatListLoading;
        },
    },
    mounted() {
        this.$store.dispatch('fetchChatList');
    },
    methods:{
        loadChat(id){
            this.$store.dispatch('fetchChatHistory', id);
        },
        newChat(){
            this.$store.commit('newChat')
        },
        isActive(id){
            if (this.$store.state.currentChatId==id){
                return true
            }
            return false 
        },
        deleteChat(id){
            this.$store.dispatch('deleteChat', id);
        }

    }

}
</script>