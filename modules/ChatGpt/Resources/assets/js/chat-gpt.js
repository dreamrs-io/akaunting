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
    },
    created() {
        // var currentUrl = window.location.pathname;
        // console.log('currentUrl', currentUrl);
        // axios.get(currentUrl + '/list').then(response => {
        //     let res = response.data;
        //     console.log('getList', res);
        //     // this.chat_list = res.data;
        // }).catch(error => {
        // });
    },
});
