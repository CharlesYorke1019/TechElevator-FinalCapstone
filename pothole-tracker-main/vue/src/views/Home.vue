<template>
  <div class="home">
    <the-nav />
    <h1>Welcome to PotholeSentry</h1>
    <div id="factsDiv">
        <h3 id="factsDivHeader" class="apple-font">
      Did you know that potholes can <em>cause significant damage</em> to vehicles?
      <br>
      Explore <strong>PotholeSentry</strong> to learn all about potholes in your area!
    </h3>
    
      <br>
      <div class="column element1">
        <h4>The Earliest Of Potholes...</h4>
        <p id="fact1">
          Potholes have been a nuisance to drivers as far back as the Roman Empire, a newly discovered Roman road has revealed. According to the archaeologists, the grooves were caused by horse-drawn carts being driven over the road over a long period of time. Ancient Roman Roads
          <br>
          <br>
          <a href="https://www.seeker.com/roman-road-reveals-oldest-potholes-1768922672.html" id="fact1Anc">click here to check it out for yourself!</a>
        </p>
      </div>
      <div class="column">
        <h4>1 OUT OF EVERY 5!?!?</h4>
        <p id="fact2">
          According to the American Society of Civil Engineers’ 2017 Infrastructure Report Card, 1 out of every 5 miles of highway pavement in the U.S. is in poor condition.
          <br>
          <br>
          <a href="https://www.cityworks.com/blog/10-fascinating-facts-about-potholes/" id="fact2Anc">click here to check it out for yourself!</a>
        </p>
      </div>
      <div class="column">
        <h4>16 Million Drivers!?!?</h4>
        <p id="fact3">
          According to a study by AAA, between 2013 and 2018, 16 million drivers across the country suffered pothole damage to their vehicles.
          <br>
          <br>
          <a href="https://www.cityworks.com/blog/10-fascinating-facts-about-potholes/" id="fact3Anc">click here to check it out for yourself!</a>
        </p>
      </div>
    </div>
    <div class="gif">
        <img src="../assets/YIgb.gif" alt="Earth Tracker">
    </div>
  </div>
</template>
<script>
import TheNav from '../components/TheNav.vue';
import axios from 'axios';
export default {
  components: { TheNav },
  name: "home",
  data() {
    return {
      fact1: "",
      fact2: "",
      fact3: "",
      factsArr: [
        {
          fact_id: 1,
          fact_info: 'Potholes have been a nuisance to drivers as far back as the Roman Empire, a newly discovered Roman road has revealed. According to the archaeologists, the grooves were caused by horse-drawn carts being driven over the road over a long period of time. Ancient Roman Roads',
          fact_link: 'https://www.seeker.com/roman-road-reveals-oldest-potholes-1768922672.html'
        },
        {
          fact_id: 2,
          fact_info: 'According to the American Society of Civil Engineers’ 2017 Infrastructure Report Card, 1 out of every 5 miles of highway pavement in the U.S. is in poor condition.',
          fact_link: 'https://www.cityworks.com/blog/10-fascinating-facts-about-potholes/'
        },
        {
          fact_id: 3,
          fact_info: 'According to a study by AAA, between 2013 and 2018, 16 million drivers across the country suffered pothole damage to their vehicles.',
          fact_link: 'https://www.cityworks.com/blog/10-fascinating-facts-about-potholes/'
        }
      ]
    };
  },
  mounted() {
    this.getFacts();
  },
  methods: {
    async getFacts() {
      try {
        const apiKey = 'qg+qRiIWIMp6KrZ2wEeiFw==2Zc27w8HC416hHXO';
        const limit = 3;
        const response = await axios.get(`https://api.api-ninjas.com/v1/facts?limit=${limit}&category=potholes`, {
          headers: { 'X-Api-Key': apiKey }
        });
        this.fact1 = response.data[0].fact;
        this.fact2 = response.data[1].fact;
        this.fact3 = response.data[2].fact;
        console.log(this.fact1);
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
<style scoped>
.font-roboto {
  font-family: 'Roboto', sans-serif;
}
h1 {
  text-align: center;
  padding: 20px 0;
  font-weight: bold;
  font-size: 28px;
  background-color: #F09D25;
  border-radius: 10px;
}
#factsDiv {
  border: 2px solid black;
    text-align: center;
  font-family: 'Roboto', sans-serif;
  border-radius:10px;
  width: 100%;
  text-align: center;
  height: 310px;
  font-family: 'Roboto', sans-serif;
}
.column {
  text-align: center;
  font-family: 'Roboto', sans-serif;
  border-radius: 10px;
  border: 2px solid black;
  float: left;
  width: 33%;
  padding: 10px;
  box-sizing: border-box;
  height: 200px;
  font-family: 'Roboto', sans-serif;
  margin-left:2.75px;
  margin-right:1.75px;
  background-color:#E8E8E8;
}
.element1 {
  display: inline-block;
}
.gif {
  margin-top: 25px;
}
</style>
