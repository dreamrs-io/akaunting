/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('../../../../../resources/assets/js/bootstrap');

import Vue from 'vue';

import Global from '../../../../../resources/assets/js/mixins/global';
import Form from '../../../../../resources/assets/js/plugins/form';
import DashboardPlugin from '../../../../../resources/assets/js/plugins/dashboard-plugin';

// plugin setup
Vue.use(DashboardPlugin);

const app = new Vue({
    el: '#app',

    mixins: [
        Global
    ],

    data() {
        return {
            form: new Form('chat'),
            form_loading: '',
            chat: {},
            chat_history: [],
            chat_list: [],
        }
    },
    created() {
        console.log('url', url);
        axios.get(url + '/chat-gpt/main/list').then(response => {
            let res = response.data;
            console.log('getList', res);
            this.chat_list = res.data;
        }).catch(error => {
        });
    },
    mounted() {
        // if you need to Dom manipulation
    },
    methods: {
        onSelect(id) {
            let path = url + '/chat-gpt/main/detail/' + id;
            // console.log('onSelect', path); return;
            axios.get(path).then(response => {
                let res = response.data;
                console.log('onSelect res', res);
                this.chat = res.data.chat;
                this.chat_history = res.data.chat_history;
                this.chat_history.unshift(this.chat);
                this.form.parent_id = this.chat.id;
            }).catch(error => {
            });
        },
        onSend(path) {
            this.form.loading = true;

            let data = Object.assign({}, this.form);
            delete data.loading;
            console.log('data', data, data.content.length);
            if (data.content.length <= 0) { return; }

            axios.post(path, data).then(response => {
                let res = response.data;
                console.log('onSend res', res);
                this.chat.id = res.data.id;
                this.chat.parent_id = res.data.parent_id;
                if (res.data.parent_id > 0) {
                    this.form.parent_id = res.data.parent_id;
                } else {
                    // New chat_history
                    this.form.parent_id = res.data.id;
                    this.chat_list.unshift(res.data);
                }
                this.form.content = '';
                // this.form.code = response.data.data.code;
                this.form.loading = false;
                this.form_loading = '';

                this.chat_history.push(res.data)
            }).catch(error => {
                this.form.loading = false;
                this.form_loading = '';
            });
        },

        // Actions > Delete
        
    }
});
