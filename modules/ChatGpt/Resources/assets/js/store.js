import Vue from 'vue';
import Vuex from 'vuex';
import { getChatHistory, getChatList, sendMessage, updateChat } from './api';
Vue.use(Vuex);
export default new Vuex.Store({
  state: {
    userId: null,
    chatInput: '',
    welcome:true,

    chatList: [],
    chatListLoading: true,

    chatHistory: [],
    chatHistoryLoading: false,
    currentChatId: '',
    
    aiResponseLoading:false

  },
  mutations: {
    setUserId(state, userId) {
      state.userId = userId; 
    },
    setChatList(state, chatList) {
      state.chatList = chatList;
    },
    appendChatList(state,chatList){
      state.chatList = [...state.chatList, ...chatList];
    },

    setChatListLoading(state, isLoading) {
      state.chatListLoading = isLoading;
    },

    setChatHistory(state,chatHistory){
      state.chatHistory=chatHistory
    },
    appendChatHistory(state,chatHistory){
      state.chatHistory=[...state.chatHistory,...chatHistory]
    },

    setChatHistoryLoading(state,isLoading){
      state.chatHistoryLoading=isLoading
    },

    setWelcome(state,bol){
      state.welcome=bol
    },

    setCurrentChatId(state,id){
      state.currentChatId=id
    },

    setChatInput(state, value) {
      state.chatInput = value;
    },

    setAiResponseLoading(state,value){
      state.aiResponseLoading=value
    },
    newChat(state){
      state.chatInput = '';
      state.welcome = true;
      state.chatHistory = [];
      state.chatHistoryLoading = false;
      state.currentChatId = '';
      state.aiResponseLoading = false;
    }
    },
  actions: {
    async fetchChatList({ commit }) {
      commit('setChatListLoading', true)
      const res = await getChatList();
      commit('setChatList', res.chats)
      commit('setChatListLoading', false)
    },
    async fetchChatHistory({ commit },chatId) {
      commit('setChatHistory', [])
      commit('setWelcome', false)
      commit('setAiResponseLoading',false)
      commit('setChatHistoryLoading', true)
      commit('setCurrentChatId',chatId)
      const res = await getChatHistory(chatId);
      commit('setChatHistory', res.chatHistory[0].messages)
      commit('setChatHistoryLoading', false)
    },
    async sendNewChat({commit}){
      commit('setWelcome', false);
      let  chatHistory = [ 
            {
              "type": "Human",
              "content": this.state.chatInput,
            }
        ]
      commit('setChatHistory',chatHistory)
      commit('setAiResponseLoading',true)
      let input =  this.state.chatInput
      commit('setChatInput','')
      const res = await sendMessage(input)
      commit('setChatHistory', res.chatHistory.messages)
      commit('appendChatList',[res.chatHistory])
      commit('setCurrentChatId',res.chatHistory._id)
      commit('setAiResponseLoading',false)
    },
    async sendChat({commit}){
      let  chatHistory = [ 
        {
          "type": "Human",
          "content": this.state.chatInput,
        }
    ]
      commit('appendChatHistory',chatHistory)
      commit('setAiResponseLoading',true)
      let input =  this.state.chatInput
      commit('setChatInput','')
      const res = await updateChat(this.state.currentChatId,input)
      chatHistory = [
        {
          "type": "Ai",
          "content": res.message,
        }
      ]
      commit('appendChatHistory',chatHistory)
      commit('setAiResponseLoading',false)
    }

  },
});

   