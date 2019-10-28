<template>
  <div class="about">
    <h1>These are my only friends!</h1>
    <div v-for="contact in contacts">
      <h2>{{ contact.first_name }} {{ contact.last_name }}</h2>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      contacts: []
    };
  },
  created: function() {
    axios.get("/api/contacts").then(response => {
      this.contacts = response.data;
    });
  },
  methods: {}
};
</script>
