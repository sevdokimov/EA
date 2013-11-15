<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta name="layout" content="statistic"/>

  <title>EA statistic</title>

  <script type="text/javascript" src="https://www.google.com/jsapi"></script>
</head>

<body>

<tmpl:menu />

<div style="clear: both"></div>

<div id="statBody">
  ${raw(body())}

  <div id="chart_div" style="width: 900px; height: 500px;">

  </div>

</div>

</body>
</html>