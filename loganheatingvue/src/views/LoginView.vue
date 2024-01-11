<template>

  <div>
    <header-view />
  </div>

  <div id="login">
<!--    <div id="home">-->
<!--      <router-link v-bind:to="{ name: 'home' }" class="white-link">Home</router-link>-->
<!--    </div>-->
    <form v-on:submit.prevent="login">
      <h1>Please Sign In</h1>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Email</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <button type="submit" class="styled-button">Sign in</button>

      <p>
        <router-link v-bind:to="{ name: 'register' }" class="white-link">Need an account? Sign up.</router-link>
      </p>
    </form>
  </div>

  <div>
    <footer-view />
  </div>

</template>

<script>
import authService from "../services/AuthService";
import headerView from "@/views/HeaderView.vue";
import footerView from "@/views/FooterView.vue";


export default {
  components: {
    headerView,
    footerView

  },
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>


<style scoped>

#login {
  display: flex;
  justify-content: center;
  align-items: center;
  background-size: cover;
  height: 38rem;
  background-repeat: no-repeat;
  background-position: bottom;
}

.styled-button {
  display: inline-block;
  padding: 10px 20px;
  color: #03e9f4;
  font-size: 16px;
  text-decoration: none;
  text-transform: uppercase;
  overflow: hidden;
  transition: .5s;
  margin-top: 40px;
  letter-spacing: 4px;
  background: transparent;
  border: none;
  border-radius: 5px;
  box-shadow: 0 0 5px transparent,
  0 0 25px transparent,
  0 0 50px transparent,
  0 0 100px transparent;
  position: relative;
  overflow: hidden;
  z-index: 1;

}

.styled-button span {
  position: relative;
  z-index: 2;
}

.styled-button:hover {
  background: #03e9f4;
  color: #fff;
  box-shadow: 0 0 5px #03e9f4,
  0 0 25px #03e9f4,
  0 0 50px #03e9f4,
  0 0 100px #03e9f4;
}
.styled-button::before,
.styled-button::after,
.styled-button span::before,
.styled-button span::after {
  opacity: 1;
  content: '';
  position: absolute;
  background: #03e9f4;
}

.styled-button::before,
.styled-button::after {
  left: 0;
  right: 0;
  height: 2px;
  opacity: 0;
  background: linear-gradient(to right, transparent, #03e9f4);
  animation: btn-anim-horizontal 2s linear infinite;
}

.styled-button::before { top: 0; }
.styled-button::after { bottom: 0; }

.styled-button span::before,
.styled-button span::after {
  top: 0;
  bottom: 0;
  width: 2px;
  opacity: 0;
  background: linear-gradient(to bottom, transparent, #03e9f4);
  animation: btn-anim-vertical 2s linear infinite;
}

.styled-button span::before { left: 0; }
.styled-button span::after { right: 0; }

@keyframes btn-anim-horizontal {
  0%, 100% { transform: scaleX(0); opacity: 1; }
  50% { transform: scaleX(1); opacity: 1; }
}

@keyframes btn-anim-vertical {
  0%, 100% { transform: scaleY(0); opacity: 1; }
  50% { transform: scaleY(1); opacity: 1; }
}


</style>