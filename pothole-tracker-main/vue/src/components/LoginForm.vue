<template>
  <div class="login_form">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
    <h1 style="font-family: 'Roboto', sans-serif;">Login</h1>
    <form id="login_form">
      <label for="username" style="font-family: 'Roboto', sans-serif;">Username</label>
      <input type="text" id="username" v-model="user.username" required style="font-family: 'Roboto', sans-serif;" />
      <label for="password" style="font-family: 'Roboto', sans-serif;">Password</label>
      <input type="password" id="password" v-model="user.password" required style="font-family: 'Roboto', sans-serif;" />
      <button type="submit" v-click:submit.prevent="submitForm" style="font-family: 'Roboto', sans-serif;">Login</button>
    </form>
  </div>
</template>

<script>
import AuthService from '../services/AuthService';
export default {
  data() {
    return {
      user: {
        username: '',
        password: '',
        errorMessage: ''
      }
    }
  },
  methods: {
    submitForm() {
      AuthService.login(this.user).then(response => {
        if (response.status === 201) {
          this.$store.commit("SET_AUTH_TOKEN", response.data.token);
          this.$store.commit("SET_USER", response.data.user);
          this.$store.state.activeUser = true;
          this.$router.push("/"); 
        }
      })
    }
  }
}
</script>

<style>

/* Add your custom styling here */
/* .login {
  /* style after Wednesday's owner meeting} */
</style>
