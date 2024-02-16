import Vue from 'vue';
import Vuex from 'vuex';
import { delChat, getChatHistory, getChatList, sendMessage, updateChat } from './api';
Vue.use(Vuex);
export default new Vuex.Store({
  state: {
    userChatToken:'',
    chatInput: '',
    welcome:true,
    chatList: [],
    chatListLoading: true,
    chatHistory: [],
    chatHistoryLoading: false,
    currentChatId: 0,
    aiResponseLoading:false,


  },
  mutations: {
    setUserId(state,userId) {
      state.userChatToken = userId
    },
    setChatList(state, chatList) {
      state.chatList = chatList;
    },
    appendChatList(state,chatList){
      state.chatList = [...chatList,...state.chatList];
    },
    removeChatList(state,chatId){
      state.chatList = state.chatList.filter(chat => chat._id !== chatId);
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
      state.currentChatId = 0;
      state.aiResponseLoading = false;
    }
    },
  actions: {
    async fetchChatList({ commit }) {
      commit('setChatListLoading', true)
      const res = await getChatList();
      commit('setChatList', res)
      commit('setChatListLoading', false)
    },
    async fetchChatHistory({ commit },chatId) {
      commit('setChatHistory', [])
      commit('setWelcome', false)
      commit('setAiResponseLoading',false)
      commit('setChatHistoryLoading', true)
      commit('setCurrentChatId',chatId)
      const res = await getChatHistory(chatId);
      commit('setChatHistory', res)
      // commit('setChatHistory', res.chatHistory[0].messages)
      commit('setChatHistoryLoading', false)
    },
    async sendNewChat({commit}, payload){
      commit('setWelcome', false);
      let chatHistory = this.state.chatHistory;

      chatHistory.push({
        "type": 0, //"Human",
        "content": this.state.chatInput,
      });
      commit('setChatHistory',chatHistory)
      commit('setAiResponseLoading',true)
      let content =  this.state.chatInput
      commit('setChatInput','')
      const res = await sendMessage(this.state.currentChatId, content)
      const resData = res.data
      console.log('sendNewChat.resData', resData)
      if (res.success && resData !== null) {
        chatHistory.push(
          {
            "type": 1,//"Ai",
            "content": resData.content,
          }
        )
        if (resData?.parent !== null) {
          commit('appendChatList', [resData.parent])
        }
        const chatId = resData.parent_id > 0 ? resData.parent_id : resData.id;
        commit('setCurrentChatId', chatId)
      } else {
        chatHistory.push(
          {
            "type": 1,//"Ai",
            "content": res.message,
          }
        )
      }
      commit('setChatHistory', chatHistory)
      commit('setAiResponseLoading',false)
    },

    async sendChat({commit}){
      commit('setWelcome', false);
      let  chatHistory = [ 
        {
          "type": 0,//"Human",
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
          "type": 1,//"Ai",
          "content": res.message,
        }
      ]
      commit('appendChatHistory',chatHistory)
      commit('setAiResponseLoading',false)
    },
    async deleteChat({commit},chatId){
      await delChat(chatId);
      if (chatId === this.state.currentChatId) {
        commit('newChat');
      }
      commit('removeChatList',chatId);
      commit('setWelcome', true);
    }
  },
});

