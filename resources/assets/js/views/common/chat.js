/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./../../bootstrap');

import Global from './../../mixins/global';

import AkauntingChat from './../../components/AkauntingChat';

import Vue from 'vue';


const chat = new Vue({
    el: '#app',
    mixins: [
        Global
    ],
    components: {
        AkauntingChat,
      
    },
    
});
