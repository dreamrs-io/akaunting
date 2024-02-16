<template>
  <div>
      <topbar></topbar>
      <sidebar></sidebar>
      <welcome v-if="isWelcome"></welcome>
      <chat v-else></chat>
   
  </div>
</template>
<script>
import TopBar from '../components/TopBar.vue';
import SideBar from '../components/SideBar.vue';
import ChatContainer from '../components/ChatContainer.vue';
import Welcome from '../components/Welcome.vue';





export default {
  props:['userChatToken'],
  components: {
    'topbar': TopBar,
    'sidebar': SideBar,
    'chat': ChatContainer,
    'welcome': Welcome
  },
 
  computed: {
    isWelcome() {
      return this.$store.state.welcome;
    },
  },

  created() {
    this.$store.commit('setUserId',this.userChatToken);

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



</style>