<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title><g:layoutTitle default="EA Statistic"/></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'statistic.css')}" type="text/css">

  <script type="text/javascript" src="https://www.google.com/jsapi"></script>

  <g:layoutHead/>
  <r:layoutResources/>
</head>

<body>

<div id="statMenu">
  <div>
    <g:link controller="statistic" action="byReportCount">New reports</g:link>
  </div>
  <div>
    <g:link controller="statistic" action="bestLinker">Best linkers</g:link>
  </div>
  <div>
    <g:link controller="statistic" action="bestReporters">Best reporters</g:link>
  </div>
  <div>
    <g:link controller="statistic" action="issueProducers">Best exception producers</g:link>
  </div>
  <div>
    <g:link controller="statistic" action="byOs">Reports by OS</g:link>
  </div>
  <div>
    <g:link controller="statistic" action="byProducts">Reports by product</g:link>
  </div>
</div>

<g:ifPageProperty name="page.chartParameters">
  <div id="chartParametersDiv">
    <div class="paramPanel">
      <g:pageProperty name="page.chartParameters"/>
    </div>
  </div>
</g:ifPageProperty>

<div style="clear: both"></div>

<div id="statBody">
  <g:layoutBody/>

</div>

<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>
