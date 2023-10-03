<template>
  <div> 
    <div>
      <label>
        <gmap-autocomplete @place_changed="initMarker" @click="askForCurrenLoc" id="testGmapAuto" placeholder="street, city, state, zip"></gmap-autocomplete>
        <button @click="addLocationMarker">Search</button>
      </label>
      <br/>
 
    </div>
    <br>
    <gmap-map
        :zoom="17"    
        :center="center"
        style="width:1300px;  height: 500px; position:absolute; left:16vw; border:2px solid black"
      >
      <gmap-info-window :options="gmapInfoOptions" :position="gmapInfoWindowPos" :opened="gmapInfoWinOpen" @closeclick="gmapInfoWinOpen=false">
           <p style="font-weight:600;font-size:.75em"> {{ this.gmapInfoContent.loc }} </p>
           <p style="font-size:.75em"> {{ this.gmapInfoContent.desc }} </p>
           
      </gmap-info-window>
      <gmap-marker
        :key="index"
        v-for="(m, index) in locationMarkers"
        :position="m.position"
        :clickable="true" 
        @click="toggleInfoWindow(m,index)"
      ></gmap-marker>
    </gmap-map>
  </div>

</template>
 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyClOCIPevg3OyJvFPJo-tTyp2JNhr2Xx0g"></script>
<script>
import sentryServices from '../services/sentryServices.js'

export default {
  name: "ActivePotholesGoogleMap",
  data() {
    return {
      center: { 
        lat: 40.7127753,
        lng: -74.0059728
      },
      locationMarkers: [],
      locPlaces: [],
      existingPlace: null,
      alreadyPlacesMarkers: [],
      userPermissionCurrentLoc: false,
      gmapInfoContent: {
        lat: '',
        lng: '',
        loc: '',
        desc: ''
      },
      gmapInfoWindowPos: null,
      gmapInfoWinOpen: false,
      gmapCurrentMidx: null,
      gmapInfoOptions: {
        pixelOffset: {
          width: 0,
          height: -35
        }
      },
    }
  },
  methods: {
    initMarker(loc) {

      this.existingPlace = loc;
    },
    addLocationMarker() {
      if (this.existingPlace) {
        const marker = {
          lat: this.existingPlace.geometry.location.lat(),
          lng: this.existingPlace.geometry.location.lng(),
        };
        marker.color = 'Orange';
        this.center = marker;

        sentryServices.getPotholes().then((response) => {
            response.data.forEach((el) => {
                if (el.lat != null && el.lng != null) {
                  if (el.status != 'Repaired') {
                    const marker = {
                      lat: Number(el.lat),
                      lng: Number(el.lng),
                      loc: el.location,
                      desc: el.description
                    };
                    this.locationMarkers.push({ position: marker });
                    this.locPlaces.push(this.existingPlace);
                    this.existingPlace = null;
                    console.log(marker);
                  }
                }
            })
        })

      }
    },
    locateGeoLocation: function() {
      navigator.geolocation.getCurrentPosition(res => {
        this.center = {
          lat: res.coords.latitude,
          lng: res.coords.longitude
        }
      });
    },
    askForCurrenLoc() {
      if (!this.userPermissionCurrentLoc) {
          if (confirm("Do You Want To Grant Access To Your Current Location?")) {
            navigator.geolocation.getCurrentPosition(position => {
            this.center.lat = position.coords.latitude;
            this.center.lng = position.coords.longitude
            sentryServices.getPotholes().then((response) => {
              response.data.forEach((el) => {
                  if (el.lat != null && el.lng != null) {
                    if (el.status != 'Repaired') {
                      const marker = {
                        lat: Number(el.lat),
                        lng: Number(el.lng),
                        loc: el.location,
                        desc: el.description
                      };
                      this.locationHolder = el.location;
                      this.locationMarkers.push({ position: marker });
                      this.locPlaces.push(this.existingPlace);
                      this.existingPlace = null;
                    }
                  }
                })
              })
            this.locateGeoLocation();
            this.userPermissionCurrentLoc = true;
          } ) 
        }
      }
    },
    toggleInfoWindow: function(marker, idx) {
      this.gmapInfoWindowPos = marker.position;
      // this.gmapInfoContent = marker.position.desc;
      // console.log(marker)
      this.gmapInfoContent.lat = marker.position.lat;
      this.gmapInfoContent.lng = marker.position.lng;
      this.gmapInfoContent.loc = marker.position.loc;
      this.gmapInfoContent.desc = marker.position.desc;

      this.center = this.gmapInfoWindowPos

      if (this.gmapCurrentMidx == idx) {
        this.gmapInfoWinOpen = !this.gmapInfoWinOpen;
      } else {
        this.gmapInfoWinOpen = true;
        this.gmapCurrentMidx = idx;

      }
    }
  },
}
</script>

<style>

* {
  text-align: center;
}

</style>