<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Southern Claims Commission -- Search Results</title><style> .highlightme { background-color: yellow; }
					.red-head {color: #990000; font-family: times, serif; font-weight: bold;} 
					p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
					span.pagingNav { padding: 5px 25px 5px 25px; border: none; }
				</style><script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script></head>
   <body>
      <center><img border="0" src="/VoS/images/images/vtitle4.gif"><h2 class="red-head">Search the Valley Southern Claims Commission</h2>
         <div style="padding-bottom:1em;" id="resultSummary">
         <div style="width:100%;padding-top:10px;padding-bottom:10px;" id="topNavig">
         {{ template "pagination" .  }}
        	{{ .QS }}

         </div>
         <div id="resultReturns">
           		{{range .Docs}}

            <div style="padding-bottom:20px;width:80%;text-align:left;"><a href="claims/{{ .id }}">{{ .title }}</a><br><b>Context: </b>...<span class="context">
                  			{{ printf "%.1000s" .fulltext }}</span>...
            </div>
           	{{ end}}
         </div>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;" id="bottomNavig">Previous | 1 | Next
            <p>Showing records 1 to 6 (6 total)</p>
         </div><br></center><br><script src="../VoS/javascript/replace_em.js" type="text/javascript"></script><p><a href="soclaims">Go back to search page</a></p>
      <center><a href="VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="http://valley.lib.virginia.edu/javascript/libtools.js" type="text/javascript"></script></body>
</html>


