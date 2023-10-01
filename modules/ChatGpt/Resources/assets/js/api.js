import axios from "axios";

const client = axios.create({
    baseURL: `http://localhost:3000/api`,
    withCredentials: true, 

})

const sendMessage = async (message) => {
    try {
        const response = await client.post('/chat', { message })
        return response.data
    } catch (e) {
        console.log(e)
    }

}

const getChatList = async () => {
    await new Promise(resolve => { setTimeout(resolve, 1000); })
    try {
        const response = await client.get('/chat')
        return response.data

    } catch (e) {
        console.log(e)
    }
}

const getChatHistory = async (id) => {
    await new Promise(resolve => { setTimeout(resolve, 1000); });
    try {
        const response = await client.get('/chat/' + id)
        return response.data
    } catch (e) {
        console.log(e)
    }
}

const updateChat = async (id, message) => {

    try {
        const response = await client.put('/chat/'+id, { message })
        return response.data
    } catch (e) {
        console.log(e)
    }

}
const delChat = async (id) => {

    try {
        const response = await client.delete('/chat/'+id)
        return response.data
    } catch (e) {
        console.log(e)
    }
}

export {
    sendMessage,
    getChatList,
    getChatHistory,
    updateChat,
    delChat
};