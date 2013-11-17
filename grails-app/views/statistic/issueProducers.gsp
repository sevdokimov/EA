<html>
<head>
  <meta name="layout" content="statistic"/>
</head>

<body>

<content tag="chartParameters">
  <g:form class="parametersForm" method="GET" name="chartParameters" action="issueProducers">
    <g:radioGroup values="['all', 'open', 'closed']"
                  labels="['All', 'Open issue', 'Closed issue']"
                  name="state" value="${state ?: 'all'}">
      <p><label>${it.radio} ${it.label}</label></p>
    </g:radioGroup>

    <div style="text-align: right; padding-top: 20px">
      <g:submitButton name="Show"/>
    </div>

  </g:form>
</content>

<script type="text/javascript">
  google.load("visualization", "1", {packages:["corechart"]});
  google.setOnLoadCallback(drawChart);
  function drawChart() {
    var data = google.visualization.arrayToDataTable([
                                                       ['User', 'Assigned issues'],
                                                       ${raw(data.entrySet().collect({ "['${it.key}', ${it.value}]" }).join(',') )}
                                                     ]);

    var options = {
      title: 'Best exception producer',
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