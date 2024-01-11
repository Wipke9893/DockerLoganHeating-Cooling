import { createStore as _createStore } from 'vuex';
import axios from 'axios';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},


    },
    mutations: {
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        localStorage.setItem('token', token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      },
      SET_USER(state, user) {
        state.user = user;
        localStorage.setItem('user', JSON.stringify(user));
      },
      LOGOUT(state) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        state.token = '';
        state.user = {};
        axios.defaults.headers.common = {};
        state.brewersID = 0;
      },


      SET_DATA(state, data) {
        state.data = data;
      },


    },
    actions: {
      fetchChartData({ commit }) {
        axios.get('/barChartData')
          .then(response => {
            commit('SET_DATA', response.data);
          })
          .catch(error => {
            console.error('Error fetching chart data:', error);
          });
      }
    }
  });
  return store;
}
