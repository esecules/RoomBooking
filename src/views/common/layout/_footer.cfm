<cfoutput>
<!-----------------------------Scripts--------------------------->
<cfif application.wheels.environment EQ "production">
  #javascriptIncludeTag("rbs.min")#
<cfelse>
  <script type="text/javascript" src="/javascripts/rbs.js" data-cover></script>
  <script data-cover-flags="debug" data-cover-adapter="/javascripts/usage-blanket.js" src="/javascripts/blanket.min.js"></script>
</cfif>

<!--- Dynamic Javascript Set in Page --->
<cfif structkeyexists(request, "js")><cfloop list="#structKeyList(request.js)#" index="key"><cfoutput>#request.js[key]#</cfoutput></cfloop></cfif>
<cfif application.rbs.setting.googleanalytics NEQ "UA-">
    <script>
        (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
        function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
        e=o.createElement(i);r=o.getElementsByTagName(i)[0];
        e.src='//www.google-analytics.com/analytics.js';
        r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
        ga('create','#application.rbs.setting.googleanalytics#');ga('send','pageview');
    </script>
</cfif>
</body>
</html>
</cfoutput>