<tmpl:chart>

  <g:form class="parametersForm" name="chartParameters">
    <g:datePicker name="since" value="${since}"/>
    <br>
    <g:datePicker name="until" value="${until}"/>
  </g:form>

  <script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = new google.visualization.DataTable();
      data.addColumn('date')
      data.addColumn('number', "Reports")
      data.addRows([${data.collect { "[new Date(${it.year}, ${it.month}, ${it.day - 1}), ${it.count}]" }.join(',') }])

      var options = {
        title: 'Reports',
        legend: 'none',
        pointSize: 5
        //chartArea: {left:60,top:30,width:"90%",height:"75%"}
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
  </script>

</tmpl:chart>