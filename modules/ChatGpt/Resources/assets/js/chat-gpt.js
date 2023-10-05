/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('../../../../../resources/assets/js/bootstrap');

import Vue from 'vue';
import AppLayout from './layout/AppLayout'
import store from './store';



const app = new Vue({
    el: '#app',
    store,
    components:{
        'chat': AppLayout
    }

});
