import Vue from 'vue';
import Vuex from 'vuex';
import { getChatHistory, getChatList } from './api';
Vue.use(Vuex);
export default new Vuex.Store({
  state: {
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
    setChatList(state, chatList) {
      state.chatList = chatList;
    },

    setChatListLoading(state, isLoading) {
      state.chatListLoading = isLoading;
    },

    setChatHistory(state,chatHistory){
      state.chatHistory=chatHistory
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
      commit('setChatHistoryLoading', true)
      const res = await getChatHistory(chatId);
      commit('setChatHistory', res.chatHistory[0].messages)
      commit('setCurrentChatId',res.chatHistory[0]._id)
      commit('setChatHistoryLoading', false)
    },
    async sendMessage({commit}){
      commit('setWelcome', false);
    let  chatHistoryObject = [ 
        {
          "type": "Human",
          "content": this.state.chatInput,
        },
      ]
      commit('setChatHistory',chatHistoryObject)
      commit('setAiResponseLoading',true)

      commit('setChatInput','')

    }
  },
});

   
