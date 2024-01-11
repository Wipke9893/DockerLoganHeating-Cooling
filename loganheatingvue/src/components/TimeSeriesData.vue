<template>
  <div class="data-container">
    <button @click="fetchData">Refresh Data</button>
    <h2>Time Series Data hit Refresh Data^^ after 10 seconds</h2>
    <ul>
      <li v-for="(data, index) in timeSeriesData" :key="index">
        Timestamp: {{ data.timestamp }}, Value: {{ data.value }}
      </li>
    </ul>
  </div>

</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      timeSeriesData: [],
    };
  },
  methods: {
    fetchData() {
      axios.get('/barChartData') // Make sure this URL matches your API endpoint
        .then(response => {
          this.timeSeriesData = response.data;
        })
        .catch(error => {
          console.error('Error fetching data:', error);
        });
    }
  },
  mounted() {
    this.fetchData();
  }
};
</script>

<style>
.data-container {
  max-width: 800px;
  margin: auto;
  padding: 20px;
  background-color: #f8f9fa;
  border-radius: 10px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  text-align: center;
}

.data-container h2 {
  color: #333;
  margin-bottom: 20px;
}

.data-container ul {
  list-style: none;
  padding: 0;
  margin-top: 20px;
  text-align: left;
}

.data-container li {
  background-color: #fff;
  border: 1px solid #ddd;
  padding: 10px 20px;
  margin-bottom: 10px;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.data-container button {
  background-color: #007bff;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 16px;
  margin-bottom: 20px;
}

.data-container button:hover {
  background-color: #0056b3;
}

</style>
