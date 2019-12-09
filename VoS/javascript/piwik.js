var pkBaseURL = (("https:" == document.location.protocol) ? "https://{analytics.lib.virginia.edu}/" : "http://{analytics.lib.virginia.edu}/");
document.write(unescape("%3Cscript src='" + pkBaseURL + "piwik.js' type='text/javascript'%3E%3C/script%3E"));
try {
  var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 8);
  piwikTracker.trackPageView();
  piwikTracker.enableLinkTracking();
} catch( err ) {}
