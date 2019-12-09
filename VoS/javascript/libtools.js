var pkBaseURL = (
    ( "https:" == document.location.protocol )
    ?
    "https://analytics.lib.virginia.edu/"
    :
    "http://analytics.lib.virginia.edu/");  

var piwik_script = document.createElement( "script" ) ;
piwik_script.src = pkBaseURL + "piwik.js" ;
document.body.appendChild( piwik_script ) ;

function track ()
{
  try
  {
    var piwikTracker = Piwik.getTracker(pkBaseURL + "piwik.php", 8);
    piwikTracker.trackPageView();
    piwikTracker.enableLinkTracking();
  } catch( err ) {}
}

if (piwik_script.addEventListener) {
piwik_script . addEventListener ( "load", track );
} else if (piwik_script.attachEvent){
piwik_script . attachEvent ('onload', track );
}
