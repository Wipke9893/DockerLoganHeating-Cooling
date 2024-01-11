<template>
  <div class="chart-container">
    <canvas ref="canvas"></canvas>
  </div>
</template>

<script>
import Chart from 'chart.js/auto';
import 'chartjs-adapter-date-fns';

export default {
  props: {
    data: Array,
  },
  data() {
    return {
      myChart: null,
    };
  },
  watch: {
    data(newData) {
      this.createChart(newData);
    }
  },
  methods: {
    createChart(newData) {
      console.log("Creating chart with data:", newData); // Add this line
      console.log("Processed data for chart:", newData.map(item => ({ x: item.timestamp, y: item.value })));
      if (this.myChart) {
        this.myChart.destroy();
      }
      const ctx = this.$refs.canvas.getContext('2d');
      this.myChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: newData.map(item => item.timestamp),
          datasets: [{
            label: 'Data',
            data: newData.map(item => {
              return { x: item.timestamp, y: item.value };
            }),
            backgroundColor: 'rgba(54, 162, 235, 0.2)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1,
          }]
        },
        options: {
          scales: {
            x: {
              type: 'time',
              time: {
                unit: 'day',
                parser: 'yyyy-MM-dd\'T\'HH:mm:ss.SSSxxx', // Adjust based on your timestamp format
              }
            },
            y: {
              beginAtZero: true
            }
          }
        }
      });
    }
  },
  mounted() {
    this.createChart(this.data);
  }
};
</script>

<style>
.chart-container {
  width: 50rem;
  height: 40rem;
}
</style>


