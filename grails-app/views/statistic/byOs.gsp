<html>
<head>
  <meta name="layout" content="statistic"/>
</head>

<body>
<script type="text/javascript">
  google.load("visualization", "1", {packages: ["corechart"]});
  google.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
                                                       ['OS', 'Reports'],
                                                       ${raw(data.entrySet().collect({ "['${it.key.value}', ${it.value}]" }).join(','))}
                                                     ]);

    var options = {
      title: 'Reports by OS',
      chartArea:{left:20,top:20,width:"300px",height:"80%"}
    };

    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>

<div id="chart_div" style="height: 400px">

</div>

</body>

</html>
