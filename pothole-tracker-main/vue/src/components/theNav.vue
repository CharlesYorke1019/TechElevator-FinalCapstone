<template>
  <div class="theNav" style="position: relative;">
<div class="bg-image" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: -1; opacity: 0.5; background: url(../assets/landscape%201.webp) center/cover no-repeat;"></div>
    <nav>
      <ul class="listContainer">
        <li class="menu-option">
          <router-link :to="{ name: 'home'}" class="home">Home</router-link>
        </li>

        <li class="dropdown" v-on:click="toggleDropdownPotholes">
          <div class="dropdown-box" id="dropdown-potholes" :class="{ 'dropdown-open': isDropDownOpenPotholes }">
            <span class="dropdown-title">Potholes ▼</span>
            <ul v-bind:class="{'dropdown-menu-hidden': !isDropDownOpenPotholes, 'dropdown-menu-shown': isDropDownOpenPotholes}">
              <li>
                <router-link :to="{ name: 'ActivePotholes'}" class="dropdown-link">View Active Potholes</router-link>
              </li>
              <li>
                <router-link :to="{ name: 'history'}" class="dropdown-link">View Pothole History</router-link>
              </li>
              <li v-if="activeUserStatus">
                <router-link :to="{name: 'addPotholeReportView', params: { id: this.$store.state.user.id }}" class="dropdown-link">Add Pothole Report</router-link>
              </li>
            </ul>
          </div>
        </li>
        <li class="dropdown" v-on:click="toggleDropdownAccount">
          <div class="dropdown-box outlined" id="dropdown-account" :class="{ 'dropdown-open': isDropDownOpenAccount }">
            <span class="dropdown-title">Account ▼</span>
            <ul v-bind:class="{'dropdown-menu-hidden': !isDropDownOpenAccount, 'dropdown-menu-shown': isDropDownOpenAccount}">
              <li v-if="!activeUserStatus">
                <router-link :to="{ name: 'login'}" class="dropdown-link">Login</router-link>
              </li>
              <li v-if="!activeUserStatus">
                <router-link :to="{ name: 'register'}" class="dropdown-link">Create Account</router-link>
              </li>
              <li v-if="activeUserStatus">
                <router-link :to="{ name: 'account', params: { id: this.$store.state.user.id }}" class="dropdown-link">Profile</router-link>
              </li>
               <li v-if="activeUserStatus">
                <router-link :to="{name: 'addInsuranceClaimView', params: { id: this.$store.state.user.id }}" class="dropdown-link">Report Insurance Claim</router-link>
              </li>
              <li v-if="activeUserStatus">
                <router-link :to="{ name: 'logout'}" class="dropdown-link">Logout</router-link>
              </li>
            </ul>
          </div>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  name: "TheNav",
  data() {
    return {
      activeUserStatus: false,
      isDropDownOpenPotholes: false,
      isDropDownOpenAccount: false
    };
  },
  methods: {
    activeUser() {
      this.activeUserStatus = this.$store.state.activeUser;
    },
    toggleDropdownPotholes() {
      if (!this.isDropDownOpenAccount) {
        this.isDropDownOpenPotholes = !this.isDropDownOpenPotholes;
        if (this.isDropDownOpenPotholes) {
          document.addEventListener("click", this.handleDocumentClick);
          document.body.classList.add("dropdown-open");
        } else {
          document.removeEventListener("click", this.handleDocumentClick);
          document.body.classList.remove("dropdown-open");
        }
      }
    },
    toggleDropdownAccount() {
      if (!this.isDropDownOpenPotholes) {
        this.isDropDownOpenAccount = !this.isDropDownOpenAccount;
        if (this.isDropDownOpenAccount) {
          document.addEventListener("click", this.handleDocumentClick);
          document.body.classList.add("dropdown-open");
        } else {
          document.removeEventListener("click", this.handleDocumentClick);
          document.body.classList.remove("dropdown-open");
        }
      }
    },
    handleDocumentClick(event) {
      if (!this.$el.contains(event.target)) {
        this.isDropDownOpenPotholes = false;
        this.isDropDownOpenAccount = false;
        document.body.classList.remove("dropdown-open");
        document.removeEventListener("click", this.handleDocumentClick);
      }
    }
  },
  created() {
    this.activeUser();
  }
};
</script>

<style scoped>
.theNav {
  width: 100%;
  margin: 0 auto; /* Center the nav horizontally */
  background-color: transparent;
  border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px;
  display: flex;
  justify-content: center;  
  background-color: lightgrey;
  border-left:2px solid black;
  border-right:2px solid black;
  border-bottom:2px solid black;
}

ul.listContainer {
  display: flex;
  list-style-type: none;
  padding: 0;
  margin: 0;
}

li.menu-option a, .dropdown-title {
  margin-top: 5px;
  margin-bottom: 5px;
  text-decoration: none;
  color: black;
  font-size: 18px;
  padding: 10px 15px;
  border: 1px solid black;
  border-radius: 10px; /* Rounded circles */
  transition: background-color 0.3s ease-in-out;
  display: flex;
  align-items: center;
  cursor: pointer;
  
}

li.menu-option a:hover, .dropdown-title:hover {
  background-color: #F09D25;
  color: black;
}

li.dropdown {
  position: relative;
  margin-left: 10px; /* Add spacing between buttons */
}

.dropdown-box {
  position: relative;
  cursor: pointer;
  display: inline-block;
}

.dropdown-title {
  font-family: 'Roboto', sans-serif;
  padding: 10px;
}

.dropdown-menu-hidden {
  display: none;
}

.dropdown-menu-shown {
  display: block;
  position: absolute;
  width: 100%;
  margin-top: 10px;
  padding: 0px;
  background-color: lightgrey;
  border-radius: 8px;
  box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
  list-style-type: none;
  z-index: 1;
  border: 1px solid black;
}

.dropdown-menu-shown li {
  padding: 10px;
  font-family: 'Roboto', sans-serif;
}

.dropdown-box:hover .dropdown-menu-shown {
  display: block;
}

.dropdown-link {
  text-decoration: none;
  color: black;
  display: block;
  padding: 10px;
  border-radius: 8px;
  transition: background-color 0.3s ease-in-out;
  cursor: pointer;
}

.dropdown-link:hover {
  background-color: #F09D25;
  color: black;
}


/* ... other styles ... */
</style>
