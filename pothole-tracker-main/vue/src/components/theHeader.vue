<template>
  <div class="theHeader" style="position: relative;">
    
    <!-- Header content -->
    <div class="header-content">
      <!-- Background image -->
    <div class="bg-image" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; z-index: 2; opacity: 0.5; background: url(../assets/landscape%201.webp) center/cover no-repeat;"></div>
      <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
      <!-- Link to home -->
      <router-link :to="{name: 'home'}">
        <!-- Header logo -->
        <img id="headerLogo" src="../assets/OrangeLogoWithoutBackground.png" alt="PotholeSentry logo">
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "the-Header",
}
</script>

<style>
/* Media query for smaller screens */
@media screen and (max-width: 768px) {
  .theHeader {
    flex-direction: column;
    align-items: center;
  }
}

/* Font style */
.font-roboto {
  font-family: 'Roboto', sans-serif;
}

/* Header container */
.theHeader {
  background-color: lightGrey;
  text-align: center;
  font-family: 'Roboto', sans-serif;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
  border-top: 2px solid black;
  border-left: 2px solid black;
  border-right: 2px solid black;
  width: 100%;
}

/* Header logo */
#headerLogo {
  width: 200px;
  padding-top: 8px;
}
</style>
