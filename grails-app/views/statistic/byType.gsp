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
                                                       ['Type', 'Issue count'],
                                                       ${raw(data.collect({ "['${it.first}', ${it.second}]" }).join(','))}
                                                     ]);

    var options = {
      title: 'Issues by type',
      legend: 'none',
      chartArea:{left:300,top:20,width:"90%",height:"90%"}
    };

    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>

<div id="chart_div" style="height: 700px">

</div>

</body>

</html>
