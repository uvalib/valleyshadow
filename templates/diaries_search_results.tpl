<!DOCTYPE html >
<html>
<head>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	  <link type="text/css" rel="stylesheet" href="../VoS/css/valleyshadow.css" />   
      <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
	  <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
	  <script src="../VoS/javascript/replace_lt_gt.js" type="text/javascript"></script>
   </head>
   <body>
      <center>
      <img border="0" src="/VoS/images/images/vtitle4.gif">
      <h2>Search the Valley of the Shadow Diaries</h2>
         {{ template "pagination" .  }}

         <div id="resultReturns">
         
           		{{range .Docs}}
			<div style="padding-bottom:20px;width:80%;text-align:left;">
				<a href="/papers/{{.id}}">{{  .title }}</a>
				<br><b>Context: </b>...
			<!---	<span class="context">{{ printf "%.500s" .fulltext}}</span>... -->
				<span class="context">{{printf "%.500s" .fulltext}}</span>...

			</div>
		</div>
       {{end}}
         
         </div>
         <div id="bottomNavig">           
         	{{ template "pagination" .  }}
		</div>
      </center><br><center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>