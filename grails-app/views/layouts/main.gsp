<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><g:layoutTitle default="Exception Analyzer"/></title>
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">


  <g:layoutHead/>
  <r:layoutResources/>
</head>

<body>

<div id="header">
  %{--<g:link controller="issueNavigator">Issues</g:link>--}%
  %{--<g:link controller="statistic">Statistic</g:link>--}%
</div>

<div id="content">
  <g:layoutBody/>
</div>

<g:javascript library="application"/>
<r:layoutResources/>
</body>
</html>
