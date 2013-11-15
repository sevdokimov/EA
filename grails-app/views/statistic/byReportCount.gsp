<%@ page import="com.jetbrains.eaViewer.Product" %>

%{--<g:pageProperty name="chartParameters">--}%
  %{--<r:require module="${'jquery-ui'}" />--}%

  %{--<g:form class="parametersForm" method="GET" name="chartParameters">--}%
  %{-- <g:datePicker name="since" relativeYears="${-4..0}" precision="day" value="${since}"/>--}%

    %{--<label for="since">Since:</label> <input type="text" name="since" id="since" size="9" value="${sinceDate}" />--}%

  %{-- <g:datePicker name="until" relativeYears="${-4..0}" precision="day" value="${until}"/>--}%
    %{--<label for="until">Until:</label> <input type="text" name="until" id="until" size="9" value="${untilDate}" />--}%

    %{--<br>--}%

    %{--<g:select name="project" from="${Product.getAll()}" optionKey="id" optionValue="name" />--}%

    %{--<g:submitButton name="Show"/>--}%
  %{--</g:form>--}%
%{--</g:pageProperty>--}%

<tmpl:chart>
  <script type="text/javascript">
    $('#since').datepicker({
      dateFormat: "yy-mm-dd"
    })
    $('#until').datepicker({
      dateFormat: "yy-mm-dd"
    })

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