<template>
    <div class="w-full fixed top-0 left-0 bg-gray-100 relative">
        <div class="rx-switch" 
            :class="switchOn ? 'on' : ''"
            @click="click">
        </div>
        <div class="switch-label">{{ label }}</div>
    </div>
</template>

<script>

export default {
    data() {
        return {
            switchOn: true,
            label: 'Chat Mode'
        }
    },
    props:{
      value:{ default:'on' }, 
      onValue:{ default:'on' },
      offValue:{ default:'off' },
    },
    components:{
        
    },
    computed: {
        inputValue: {
            get:function() {
                return this.value;
            },
            set:function(val) {
                this.$emit('input', val);
            },
        },
    },
    mounted() {
    },
    methods:{
        click() {
            this.switchOn = !this.switchOn;
            console.log('click...after', this.switchOn);
            if (!this.switchOn) {
                window.location.href = '../../';
                this.label ='Loading'
            }
            // console.log('click...before', this.inputValue, this.inputValue === this.onValue, this.offValue);
            // this.inputValue = this.inputValue === this.onValue
            //     ? this.offValue : this.onValue;
            // this.inputValue = 'off';
            // console.log('click...after', this.inputValue);
            // window.location.href = '../../';
        },
    }

}
</script>

<style>
    .switch-label {
        position: absolute;
        top: 5px;
        right: 105px;
    }
  .rx-switch{
    position: absolute;
    top: 5px;
    right: 200px;
    width: 28px;
    height: 15px;
    background: #424242;
    margin-top:4px;
    border-radius:8px;
    cursor: pointer;
  }
  
  .rx-switch::after{
    content: '';
    position: absolute;
    top:-1px;
    left:-1px;
    height: 16px;
    width: 16px;
    background: #e0e0e0;
    border-radius: 50%;
    box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.4); 
  }
  
  .rx-switch.on{
    background: #75b325;
  }
  
  .rx-switch.on::after{
    content: '';
    position: absolute;
    top:-1px;
    left:auto;
    right: -1px;
    height: 16px;
    width: 16px;
    background: #e0e0e0;
    border-radius: 50%;
    box-shadow: 2px 2px 5px 0px rgba(0, 0, 0, 0.4); 
  }
  </style>