<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Newspapers Search -- Search Results</title>
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
    <!--  <script src="../VoS/javascript/replace_em.js" type="text/javascript"></script> -->
      <script src="../VoS/javascript/replace_lt_gt.js" type="text/javascript"></script>
      
      <style> .highlightme { color: inherit; background-color: yellow; }
					h6.debug { color: #FFFFFF; }
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
					.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
					span.pagingNav { padding: 5px 25px 5px 25px; border: none; }
				</style>
  		        <link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">
				</head>
   <body>
      <center><img border="0" src="/VoS/images/images/vtitle4.gif"><h2 class="red-head">Search the Valley Newspapers</h2>
         <div style="width:90%;padding-top:10px;padding-bottom:10px;" id="topNavig"> 
         {{ template "pagination" .  }}

         </div>
         <div id="resultReturns">
           
        {{range .Docs}}
				 <div style="padding-bottom:20px;width:80%;text-align:left;">
				 <a href="news/{{ .paper_id }}.xml#{{ .newspaper_pagenum }}">{{ .newspaper }}, {{ .newspaper_datestring }}, Page {{ .newspaper_pagenum }}</a><br><b>Article Title: </b><span class="title">{{ .title }}</span><br>
            		<b>Context: </b>...<span class="context">{{ printf "%.500s" .fulltext }}</span>...
           		 </div>
        {{ end }} 
         </div>
         <div style="width:90%;padding-top:10px;padding-bottom:10px;" id="bottomNavig">
        {{ template "pagination" .  }}

         </div><br></center><br><p><a href="newspapers">Go back to search page</a></p>
      <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
      <h6 class="debug">results from http://libsvr40.lib.virginia.edu:8080/solr/valley/</h6>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>