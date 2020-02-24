<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Memory -- Search Results</title>
      <script src="/Vos/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="/Vos/javascript/replace_em.js" type="text/javascript"></script>
      <script src="/Vos/javascript/replace_lt_gt.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">
    <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

  </head>
   <body>
      <center><img border="0" src="/VoS/images/images/vtitle4.gif"><h2 class="red-head">Search the Valley of the Shadow Memory Articles</h2>
         <div style="padding-bottom:1em;" id="resultSummary">
           {{ template "pagination" .  }}

         </div>
         <div id="resultReturns">
           {{range .Docs}}

            <div style="padding-bottom:20px;width:80%;text-align:left;" class="document"><a href="mem/AM0015">{{ .title }}</a>
              <br><b>Context:</b>{{ printf "%.1000s" .fulltext}}...
            </div>
            {{ end }}
         </div>
         <div style="width:90%;padding-top:10px;padding-bottom:10px;" id="bottomNavig">
           {{ template "pagination" .  }}

         </div><br></center><br><center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
