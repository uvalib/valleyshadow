
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Record of Events Database</title><style>
					body { padding: 1em; }
					p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
				</style>
	  <link type="text/css" rel="stylesheet" href="../VoS/css/valleyshadow.css" />   
      <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
				
				</head>
   <body>
      <center><img src="/VoS/images/images/vtitle4.gif"><h1><font color="#990000">Record of Events Database - Results</font></h1>
      </center><br><p><b>Please cite results as coming from:</b> Record of Events Database, Valley of
         					the Shadow: Two Communities in the American Civil War, Virginia Center for
         					Digital History, University of Virginia
         					({{ getsiteurl }}/{{ .QS }}).
      </p><br><br><div style="width:100%;padding-top:10px;padding-bottom:10px;text-align:center">           
      	{{ template "pagination" .  }}

      </div>
      <div style="width:100%;display:table;text-align:center">
      
      		{{range .Docs}}
		<center>
         	<hr width="95%">
      	</center><br>
         <div style="width:33%;float:left;text-align:center;"><b>Battle: </b>{{ .battle }}<br><b>Regiment: </b>{{ .regiment }}<br><b>Date: </b>{{ .battle_date }}</div>
         <div style="width:33%;float:left;text-align:center;"><b>Commander: </b>{{ .commander }}<br><b>Brigade: </b>{{ .brigade }}<br><b>Division: </b>{{ .division }}<br><b>Corps: </b>{{ .corps }}
         </div>
         <div style="width:33%;float:left;text-align:center;"><b>Regiment Strength: </b>{{ .strength }}<br><b>Number Killed: </b>{{ .killed }}<br><b>Number Wounded: </b>{{ .wounded }}<br><b>Number Missing: </b>{{ .missing }}
         </div>
      </div>
      <div>
         <p><b>Summary of Events: </b>{{ .summary }}
         </p>
         <p><b>Georgetown Weather Station Report: </b><i>date, temperature (time) </i>{{ .gtown_weather }}
         </p>
         <p><b>Local Weather Conditions: </b><i>from soldiers' diaries and letters </i>{{ .local_weather}}.
         </p>
         {{ end }}
      </div>
      <center>
         	<hr width="95%">
      	</center><br>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;">           
      	{{ template "pagination" .  }}

      </div><script src="../VoS/javascript/generic_search_paging.js" type="text/javascript"></script><p><a href="mapdata">Go back to search page</a></p><br><hr width="80%">
      <center><a href="../VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>