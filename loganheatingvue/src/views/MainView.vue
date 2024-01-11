<template>
  <div>
    <time-series-data />
  </div>
</template>

<script>
import TimeSeriesData from '@/components/TimeSeriesData.vue'

export default {
  components: {
    TimeSeriesData
  },
  data() {
    return {
      chartData: [],
    };
  },
};
</script>

<style>
ul {
  list-style-type: none;
  padding: 0;
}
li {
  margin: 10px 0;
  padding: 10px;
  background-color: #f0f0f0;
  border: 1px solid #ddd;
}
</style>





<!--<template>-->
<!--  <div>-->
<!--    <bar-chart :data="chartData" />-->
<!--    <button @click="fetchData">Load Data</button>-->
<!--  </div>-->
<!--</template>-->

<!--<script>-->
<!--import BarChart from '@/components/BarChart.vue';-->
<!--import axios from 'axios';-->

<!--export default {-->
<!--  components: {-->
<!--    BarChart-->
<!--  },-->
<!--  data() {-->
<!--    return {-->
<!--      chartData: [],-->
<!--    };-->
<!--  },-->
<!--  methods: {-->
<!--    fetchData() {-->
<!--      axios.get('/barChartData')-->
<!--        .then(response => {-->
<!--          if (response.status === 200) {-->
<!--            console.log("Fetched Data:", response.data); // Add this line-->
<!--            this.chartData = response.data;-->
<!--          }-->
<!--        })-->
<!--        .catch(error => console.error(error));-->
<!--    }-->
<!--  },-->
<!--  mounted() {-->
<!--    this.fetchData();-->
<!--  }-->
<!--};-->
<!--</script>-->

