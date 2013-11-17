<html>
<head>
  <meta name="layout" content="statistic"/>
</head>

<body>

<script type="text/javascript">
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
                                                       ['User', 'Linked reports'],
                                                       ${raw(data.entrySet().collect({ "['${it.key}', ${it.value}]" }).join(',') )}
                                                     ]);

    var options = {
      title: 'Best linkers',
      legend: 'none',
      chartArea: {left:300,top:30,width:"90%",height:"90%"}
    };

    var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>

<div id="chart_div" style="height: 900px">

</div>

</body>

</html>