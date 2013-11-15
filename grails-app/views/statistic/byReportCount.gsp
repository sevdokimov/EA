<%@ page import="com.jetbrains.eaViewer.Product" %>


<html>
<head>
  <meta name="layout" content="statistic"/>
</head>

<body>

<content tag="chartParameters">
  <r:require module="${'jquery-ui'}" />

  <g:form class="parametersForm" method="GET" name="chartParameters">
    <label for="since">Since:</label> <input type="text" name="since" id="since" size="9" value="${sinceDate}" />

    <label for="until">Until:</label> <input type="text" name="until" id="until" size="9" value="${untilDate}" />
    <div style="padding: 10px 0">
      <g:select name="productId" from="${Product.listOrderByName()}" noSelection="['': 'All products']" value="${productId}" optionKey="id" optionValue="name" />
    </div>

    <div style="text-align: right; padding-top: 20px">
      <g:submitButton name="Show"/>
    </div>

  </g:form>
</content>

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

</body>

</html>