<template>
  <div>
    <div class="hidden el-dialog"></div>
   
        <el-dialog :fullscreen="false" :center="true" type="text" title="Enter Password" :visible="!isAuthSet">
          <input  v-model="password" type="password" class="inpu"  :class="{ 'inpu-error': error}" placeholder='Your Password' @keyup.enter="setCookie" />
          <div v-if="error" class="mt-2 text-red-500">
            {{ errorPrompt }}

          </div>
        </el-dialog>
      <sidebar></sidebar>
      <welcome v-if="isWelcome"></welcome>
      <chat v-else></chat>
   
  </div>
</template>
<script>
import SideBar from '../components/SideBar.vue';
import ChatContainer from '../components/ChatContainer.vue';
import Welcome from '../components/Welcome.vue';
import { Dialog } from 'element-ui';
import Vue from 'vue';
import {verifyPassword} from '../helper'


Vue.component(Dialog.name, Dialog);





export default {
  props:['userId','userEmail'],
  components: {
    'sidebar': SideBar,
    'chat': ChatContainer,
    'welcome': Welcome
  },
  data() {
    return {
      password: '',
      errorPrompt:''
    }
  },
  computed: {
    isWelcome() {
      return this.$store.state.welcome;
    },
    isAuthSet(){
      return this.$store.state.authCookie
    },
    error(){
      return this.errorPrompt !== '';
    }
  },
  methods: {

   async setCookie(){
      if(this.password===''){
        this.errorPrompt='Password Is Empty'
        return
      }
    const verification = await verifyPassword(this.$store.state.userEmail,this.password)
    if (verification.status){
      console.log(verification)
      this.$store.commit('setAuthCookie',verification.token)
    }else{
      this.errorPrompt='Password Verification Failed Please Enter Correct Password'
    }
    }
  },

  created() {
    this.$store.commit('setUserId', {userId:this.userId,userEmail:this.userEmail});
    this.$store.commit('isAuthCookieSet')

  },
}
</script>

<style >




.inpu {

    @apply bg-white placeholder-purple-500 rounded-md p-4 w-full outline-none duration-300 transition-all ring-0 focus:ring-2 ring-purple-500 

}
.inpu-error {

    @apply bg-white !placeholder-red-500  !ring-red-500 

}

.el-dialog__wrapper {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background-color: rgba(56, 56, 61, 0.11);
}
.el-dialog{

  width: 30% !important;
}

</style>