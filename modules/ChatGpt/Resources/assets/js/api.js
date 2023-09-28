import axios from "axios";

const client = axios.create({
    baseURL: `http://localhost:3000/api`,
    
})

const sendMessage = (message) => {
    console.log(message)
}
const getChatList = async () => {
    await new Promise(resolve => { setTimeout(resolve, 1000);});
    try {
        const response = await client.get('/chat')
        return response.data
        
    } catch (e) {
        console.log(e)
    }
}

const getChatHistory =async (id) => {
    await new Promise(resolve => { setTimeout(resolve, 1000);});
    try {
        const response = await client.get('/chat/'+id)
        return response.data
    } catch (e) {
        console.log(e)
    }
}
const updateChat = (id) => {
    console.log(id)
}

export {
    sendMessage,
    getChatList,
    getChatHistory,
    updateChat
};