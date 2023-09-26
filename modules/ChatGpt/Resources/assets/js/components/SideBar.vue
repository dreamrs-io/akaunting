<template lang="">
    <div>
      <button class="inline-flex items-center p-2 mt-2 ml-3 text-sm text-gray-500 rounded-lg sm:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
          <span class="material-icons text-black text-2xl">menu</span>
      </button>
      <aside  role='model' class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0" aria-label="Sidebar">
      <div class="h-full px-3 py-4 overflow-y-auto bg-[#1e2129]">
          <ul class="space-y-2 font-medium">
  
              <li>
                  <button class="flex items-center p-2 rounded hover:bg-[#414250]  group border border-gray-500 w-full">
                      <span class="material-icons text-gray-300  text-2xl">add</span>
                  <span class="ml-3 text-gray-300 ">New Chat</span>
                  </button>
              </li>
              <li v-for="(item, index) in chatList" :key="index" class='cursor-pointer hover:border-gray-400 border-transparent border overflow-hidden'>
                  <div class="flex items-center p-2  rounded dark:text-gray-300 hover:bg-[#414250]  group">
                      <span class="material-icons text-gray-300  text-2xl mt-1">message</span>
                      <span class="ml-3 text-xs text-gray-300  whitespace-nowrap">{{item.message.substring(0,28)+'....'}}</span>
                  </div>
  
              </li>
          </ul>
      </div>
      </aside>
    </div>
  </template>
  
  
  <script>
  export default {
      data(){
          return{
              chatList:[
                  {
                      message:'Genarate Financial Statement'
                  },
                  {
                      message:'Summurize invoice'
                  },
                  {
                      message:'Customer Address'
                  },
                  {
                      message:'Billing'
                  },
              ]
          }
      }
      
  }
  </script>