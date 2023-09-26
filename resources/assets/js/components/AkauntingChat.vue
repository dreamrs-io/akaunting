<template>
      <div>
        <sidebar></sidebar>
        <!-- <chat></chat> -->
        <welcome></welcome>
      </div>

</template>




<script>
import SideBar from './Chat/SideBar.vue';
import ChatContainer from './Chat/ChatContainer.vue';
import Welcome from './Chat/Welcome.vue';

export default {
    name: 'akaunting-chat',
    components: {
    
    'sidebar': SideBar,
    'chat': ChatContainer,
    'welcome':Welcome
}
}
</script>
