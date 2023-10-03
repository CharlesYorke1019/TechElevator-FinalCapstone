<template>
  <div> 
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover, maximum-scale=1">
    <div>
      <!-- <h2>Vue Js Search and Add Marker</h2> -->
      <label>
        <gmap-autocomplete @place_changed="initMarker" id="testGmapAuto"></gmap-autocomplete>
        <button @click="addLocationMarker">Add</button>
      </label>
      <br/>
 
    </div>
    <br>
    <gmap-map
        :zoom="14"    
        :center="center"
        style="width:600px;  height: 600px;"
      >
      <gmap-marker
        :key="index"
        v-for="(m, index) in locationMarkers"
        :position="m.position"
        @click="center=m.position"
      ></gmap-marker>
    </gmap-map>
  </div>
</template>
 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyClOCIPevg3OyJvFPJo-tTyp2JNhr2Xx0g"></script>
<script>
export default {
  name: "AddGoogleMap",
  data() {
    return {
      center: { 
        lat: 39.7837304,
        lng: -100.4458825
      },
      locationMarkers: [],
      locPlaces: [],
      existingPlace: null
    };
  },
 
  mounted() {
    this.locateGeoLocation();
  },
 
  methods: {
    initMarker(loc) {
      this.existingPlace = loc;
    },
    addLocationMarker() {
      if (this.existingPlace) {
        let gmapAutocomplete = document.getElementById('testGmapAuto')
        const marker = {
          lat: this.existingPlace.geometry.location.lat(),
          lng: this.existingPlace.geometry.location.lng()
        };
        this.locationMarkers.push({ position: marker });
        this.locPlaces.push(this.existingPlace);
        this.center = marker;
        this.existingPlace = null;
        localStorage.setItem('potholeReportAddress', gmapAutocomplete.value)
        localStorage.setItem('markerLat', Number(marker.lat))
        localStorage.setItem('markerLng', Number(marker.lng))
      }
    },
    locateGeoLocation: function() {
      navigator.geolocation.getCurrentPosition(res => {
        this.center = {
          lat: res.coords.latitude,
          lng: res.coords.longitude
        };
      });
    },
    setPlace(place) {
        this.markers.splice(0, this.markers.length);
        this.places.splice(0, this.places.length);
        this.currentPlace = place;
        this.updateLocation(place.formatted_address);


        this.addMarker();
    },
  }
};
</script>
<style scoped>

</style>