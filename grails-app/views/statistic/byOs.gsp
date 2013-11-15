<tmpl:chart>
  <script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['OS', 'Reports'],
        ${raw(data.entrySet().collect({ "['${it.key.value}', ${it.value}]" }).join(','))}
      ]);

      var options = {
        title: 'Reports by OS'

      };

      var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
  </script>
</tmpl:chart>