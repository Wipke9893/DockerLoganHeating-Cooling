<template>
  <header class="header">
    <div class="nav">
      <router-link v-bind:to="{ name: 'home' }" class="nav-link">Home</router-link>
      <router-link v-bind:to="{ name: 'login' }" v-if="!$store.state.token" class="nav-link">Login</router-link>
      <router-link v-bind:to="{ name: 'register' }" v-if="!$store.state.token" class="nav-link">Register</router-link>
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token" class="nav-link">Logout</router-link>
    </div>
  </header>

</template>

<script>
export default {
  data() {
    return {

    }
  },
  created() {

  },
}
</script>

<style scoped>

.header {
  background-color: rgb(72, 72, 72);
  display: flex;
  height: 5rem;
}
.nav {
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  align-items: center;
  width: 100%;
}

.nav-link {
  color: white;
  text-decoration: none;
  padding: 0.5rem 1rem;
  font-size: 1.6rem;
  font-weight: bold;
}


</style>