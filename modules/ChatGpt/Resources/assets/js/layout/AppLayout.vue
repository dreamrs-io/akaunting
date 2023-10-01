<template>
  <div>
    <sidebar></sidebar>
    <welcome v-if="isWelcome"></welcome>
    <chat v-else></chat>
  </div>
</template>
<script>
import SideBar from '../components/SideBar.vue';
import ChatContainer from '../components/ChatContainer.vue';
import Welcome from '../components/Welcome.vue';
export default {
  props:['userId'],
  components: {
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
    this.$store.commit('setUserId', this.userId);
  },
}
</script>