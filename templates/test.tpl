<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
 <title>Valley of the Shadow: Letters -- Search Results</title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta content="The Valley of the Shadow is an electronic archive of two communities 
 in the American Civil War--Augusta County, Virginia, and Franklin County, Pennyslvania. 
 The Valley Web site includes searchable newspapers, population census data, agricultural
 census data, manufacturing census data, slaveowner census data, and tax records. 
 The Valley Web site also contains letters and diaries, images, maps, church records, 
 and military rosters. The Valley project is a University ofVirginia research project 
 funded in part by the National Endowment of the Humanities."
 name="description" />
 <!--   The Valley of the Shadow is an electronic archive of two communities
 in the American Civil War==Augusta County, Virginia, and Franklin County, Pennyslvania.  The
 Valley Web site includes searchable newspapers, population census data,
 agricultural census data, manufacturing census data, slaveowner census
 data, and tax records.  The Valley Web site also contains letters and
 diaries, images, maps, church records, and military rosters.  The Valley Project is a
 University of Virginia research project funded in part by the National
 Endowment for the Humanities. -->
 <meta content="United States Civil War American history Virginia Pennsylvania military 
 geneology archive" name="keywords" />
 
 <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
 <link type="text/css" rel="stylesheet" href="../VoS/css/valleyshadow.css" />   
 <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
 <!-- 
 <script src="../VoS/javascript/replace_em.js" type="text/javascript"></script>
 -->
 <script src="../VoS/javascript/replace_lt_gt.js" type="text/javascript"></script>
 
 
</head>
<body> 

   <div style="width:90%;padding-top:10px;padding-bottom:10px;" id="topNavig"></div>
   
	      <center><img src="/VoS/images/images/vtitle4.gif" border="0"><h2 class="red-head">Search the Valley of the Shadow Letters</h2>
         <div style="padding-bottom:1em;" id="resultSummary">
           {{ template "pagination" .  }}
         </div>
         
         <div id="resultReturns">
		{{range .Docs}}
			<div style="padding-bottom:20px;width:80%;text-align:left;">
				<a href="/papers/{{.id}}">{{  .title }}</a>
				<br><b>Context: </b>...
			<!---	<span class="context">{{ printf "%.1000s" .fulltext}}</span>... -->
				<span class="context">{{ unescape .fulltext}}</span>...

			</div>
		</div>
       {{end}}
   {{ template "pagination" . }}

        </center><br><center><a href="/VoS/choosepart.html"><img alt="" src="/VoS/images/graphics/full7.gif" border="0"></a></center>
  </body>
</html>


