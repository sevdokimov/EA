<g:applyLayout name="main">
  <html>
  <head>
    <title><g:layoutTitle default="EA Statistic"/></title>
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
      <g:link controller="statistic" action="byType">Exception types</g:link>
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
</g:applyLayout>