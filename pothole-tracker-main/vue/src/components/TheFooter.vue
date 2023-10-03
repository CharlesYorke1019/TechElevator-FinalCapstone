<template>
  <div class="footer">
    <div class="content">
      <p style="font-weight: bold" class="copyright">PotholeSentry &copy; {{ currentYear }}</p>
      <div class="contact_us">
        <p class="phone">Phone: {{ phone }}</p>
        <p class="email">Email: {{ email }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentYear: new Date().getFullYear(),
      phone: "(555) 555-1234",
      email: "support@potholesentry.com",
    };
  },
};
</script>

<style scoped>
.footer {
  text-align: center;
  font-family: 'Roboto', sans-serif;
  border:2px solid black;
  border-radius:10px;
  background-color: #F09D25;
  /* width: 100%; */
  /* padding: 5px; */
  margin-top:20px;
  width:90vw;
  margin-left:0;
}
</style>
