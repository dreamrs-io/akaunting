<template>
    <div>
      <sidebar></sidebar>
      <chat></chat>
      <!-- <welcome></welcome> -->
    </div>

</template>




<script>
import SideBar from '../components/SideBar.vue';
import ChatContainer from '../components/ChatContainer.vue';
import Welcome from '../components/Welcome.vue';
export default {
  components: {
  
  'sidebar': SideBar,
  'chat': ChatContainer,
  'welcome':Welcome
}
}
</script>