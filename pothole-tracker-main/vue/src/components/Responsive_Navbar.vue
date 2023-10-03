
<template>
  <div class="navbar">
    <div class="navbar-logo">PotholeSentry</div>
    <ul class="navbar-links">
      <li><a class="navbar-link" href="#">Home</a></li>
      <li class="navbar-dropdown">
        <a class="navbar-link" href="#">Potholes</a>
        <div class="navbar-dropdown-content">
          <a class="navbar-link" href="#">View Active Potholes</a>
          <a class="navbar-link" href="#">View City Pothole History</a>
          <a class="navbar-link" href="#">Add Pothole Report</a>
        </div>
      </li>
      <li class="navbar-dropdown">
        <a class="navbar-link" href="#">Account</a>
        <div class="navbar-dropdown-content">
          <a class="navbar-link" href="#">Add Insurance Report</a>
          <a class="navbar-link" href="#">Login</a>
          <a class="navbar-link" href="#">Logout</a>
        </div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "ResponsiveNavbar",
};
</script>

<style scoped>
/* Add CSS styles here */
body {
  font-family: 'Roboto', sans-serif;
}

.navbar {
  display: flex;
  justify-content: space-between;
  background-color: #333;
  padding: 10px;
}

.navbar-logo {
  color: white;
  font-size: 24px;
}

.navbar-links {
  display: flex;
  gap: 20px;
  list-style: none;
  margin: 0;
  padding: 0;
}

.navbar-link {
  color: white;
  text-decoration: none;
  font-weight: bold;
}

.navbar-dropdown {
  position: relative;
}

.navbar-dropdown-content {
  display: none;
  position: absolute;
  background-color: #333;
  min-width: 150px;
  z-index: 1;
}

.navbar-dropdown:hover .navbar-dropdown-content {
  display: block;
}
</style>
