import axios from "axios";
import { chatApiUrl } from "./variables";
import store from './store';

const currentUrl = window.location.pathname;

const client = axios.create({
    // baseURL: chatApiUrl,
});

client.interceptors.request.use(
    (config) => {
        config.headers.Authorization = store.state.userChatToken;
        return config;
    },
    (error) => {
        return Promise.reject(error);
    }
);

const sendMessage = async (id, content) => {
    try {
        // const response = await client.post('/chat', { message })
        const res = await axios.post(currentUrl + '/call-gpt', {
            'parent_id': id,
            'content': content
        })
        console.log('sendMessage::res', res);
        return res.data;
        // const res = await fetch(currentUrl + '/call-gpt-streamed');
        // console.log(res);
        // if (!res.ok) {
        //     throw new Error('Request Error...')
        // }
        //
        // const reader = res.body.getReader();
        // const textDecoder = new TextDecoder;
        // let result = true;
        // let output = '';
        //
        // while (result) {
        //     const {done, value} = await reader.read();
        //     if (done) {
        //         console.log('Stream read ended!')
        //         result = false;
        //         break;
        //     }
        //
        //     const chunkText = textDecoder.decode(value);
        //     output += chunkText;
        //     console.log('Received:', chunkText);
        // }

    } catch (e) {
        console.error('sendMessage', e)
    }

}

const getChatList = async () => {
    await new Promise(resolve => { setTimeout(resolve, 1000); })
    try {
        console.log('getChatList', currentUrl)

        // const response = await client.get('/chat')
        const res = await axios.get(currentUrl + '/list')
        console.log('getChatList::res', res);
        return res.data.data;

    } catch (e) {
        console.error(); ('getChatList', e)
    }
}

const getChatHistory = async (id) => {
    await new Promise(resolve => { setTimeout(resolve, 1000); });
    try {
        console.log('getChatHistory', currentUrl)
        // const response = await client.get('/chat/' + id)
        const res = await axios.get(currentUrl + '/detail/' + id)
        console.log('getChatHistory::res', res);
        return res.data.data
    } catch (e) {
        console.error('getChatHistory', e)
    }
}

const updateChat = async (id, message) => {

    try {
        console.log('updateChat')
        const response = await client.put('/chat/' + id, { message })
        return response.data
    } catch (e) {
        console.error('updateChat', e)
    }

}
const delChat = async (id) => {

    try {
        console.log('delChat')
        // const response = await client.delete('/chat/' + id)
        const res = await axios.delete(currentUrl + '/delete', { id })
        console.log('delChat::res', res);
        return res.data;
    } catch (e) {
        console.error('delChat', e)
    }
}

export {
    sendMessage,
    getChatList,
    getChatHistory,
    updateChat,
    delChat
};
