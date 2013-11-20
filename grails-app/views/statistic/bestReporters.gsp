<html>
<head>
  <meta name="layout" content="statistic"/>
</head>

<body>


<content tag="chartParameters">
  <r:require module="${'jquery-ui'}" />

  <g:form class="parametersForm" method="GET" name="chartParameters" action="bestReporters">
    <g:select name="reportType"
              from="['all':'All reports', 'assigned':'Reports assigned by reporter']"
              value="${reportType}"
              optionKey="key"
              optionValue="value"
    />

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
      title: 'Best reporters',
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