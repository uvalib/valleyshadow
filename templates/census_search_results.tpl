<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Census Search Results</title>
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="../VoS/javascript/census-thickbox.js" type="text/javascript"></script>
				<link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
				<link rel="icon" type="image/png" href="../VoS/favicon.ico" />
      <style>td {padding-left:5px;padding-right:5px;}
					.debug {background:yellow;} .citationHelp { text-align: center; padding-left: 2em; padding-right: 2em; }
					a { color: #CD7F32 ;} .searchReturn { float:left;}
					a.visited, a:visited { color: blue!important; }
					a:hover { color: red !important; }
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
					
			 #TB_window { font: 12px
						Arial, Helvetica, sans-serif; color: #333333; }
			 #TB_secondLine { font: 10px
						Arial, Helvetica, sans-serif; color:#666666; }
			 #TB_window a:link { color:
						#666666; }
			 #TB_window a:visited { color: #666666; }
			 #TB_window a:hover {
						color: #000; }
			 #TB_window a:active { color: #666666; }
			 #TB_window a:focus {
						color: #666666; }
			 #TB_overlay { position: absolute; z-index:100; top: 0px;
						left: 0px; }
			 #TB_window { position: absolute; background: #ffffff;
						z-index: 102; color:#000000; display:none; border: 4px solid #525252;
						text-align:left; }
			 #TB_window img { display:block; margin: 15px 0 0 15px;
						border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; border-top: 1px
						solid #666; border-left: 1px solid #666; }
			 #TB_caption { height:25px;
						padding:7px 30px 10px 25px; float:left; }
			 #TB_closeWindow { height:25px;
						padding:11px 25px 10px 0; float:right; }
			 #TB_closeAjaxWindow { padding:5px
						10px 7px 0; margin-bottom:1px; text-align:right; float:right; }

						#TB_ajaxWindowTitle { float:left; padding:7px 0 5px 10px; margin-bottom:1px;
						}
			 #TB_title { background-color:#e8e8e8; height:27px; }
			 #TB_ajaxContent {
						clear:both; padding:2px 15px 15px 15px; overflow:auto; text-align:left;
						line-height:1.4em; }
			 #TB_ajaxContent p { padding:5px 0px 5px 0px; }
			 #TB_load
						{ position: absolute; display:none; height:100px; width:100px; z-index:101;
						}
			 #TB_HideSelect { z-index:99; position:absolute; top: 0; left: 0;
						background-color:#fff; border:none; filter:alpha(opacity=0); -moz-opacity:
						0; opacity: 0; }
			 #TB_iframeContent { clear:both; border:none;
						margin-bottom:-1px; margin-top:1px; margin-bottom:1px; padding-left:5px;
						padding-right:5px; }
				</style></head>
   <body bgcolor="#FFFFFF">
      <div align="center" class="census_results"><img src="../VoS/images/images/vtitle4.gif"></div>
      <h1 style="color:#990000;text-align:center;">{{ getcounty .County }} County {{ getstate .County }} -
         							{{ .Year }} Population
      </h1>
      <p class="citationHelp"><b>Please cite results as coming from: </b>{{ getcounty .County }}
         						County, {{ getstate .County }}, {{ .Year }} Population Census, Valley of
         						the Shadow: Two Communities in the American Civil War, Virginia Center for
         						Digital History, University of Virginia<br>
         						( http://valley.lib.virginia.edu/census_search_results?q=db:pop_aug_60 last:smith ).
      </p>						{{ .QS }}
      <p><a href="population_census" class="searchReturn">Start a new search</a></p><br><center>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;">   
                 
         {{ template "pagination" .  }}
       <!--  <p><a class="detailed_results" href="/census_search_results?q=db:{{ .QS }}&amp;start=0&amp;rows=50&amp;detailed=yes&amp;county=aug&amp;year=1860&amp;sort=last asc">View detailed search on this page of results</a></p> -->

         </div>
         <table border="1px" style="width:100%">
            <tr>

               <td><b>Family Number</b></td>
               <td><b>Order in House</b></td>
               <td><b>Last Name</b></td>
               <td><b>First Name</b></td>
               <td><b>Age</b></td>
               <td><b>Sex</b></td>
               <td><b>Color</b></td>
               <td><b>Occupation</b></td>
               <td><b>Township</b></td>
            </tr>
     		{{range .Docs}}

            <tr>
               <td>{{ .family_num}}</td>
               <td>2</td>
               <td><a class="thickbox" href="/census_results?q=id_num:{{ .id_num }} AND db:{{ .db }}&amp;TB_iframe=true">{{ .last }}</a></td>
               <td>{{ .first }}</td>
               <td>{{ .age }}</td>
               <td>{{ .sex }}</td>
               <td>{{ .color }}</td>
               <td>{{ .occupation }}</td>
               <td>{{ .subdistrict_text }}</td>
            </tr>
			{{ end }}            
         </table>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;">           
         {{ template "pagination" .  }}

         </div>
      </center>
      <p><a href="population_census" class="searchReturn">Start a new search</a></p>
      <div style="display:block; clear:both; border: none; padding-top: 1em;" id="footer">
         <center><a shape="rect" href="../VoS/choosepart.html"><img src="../VoS/images/graphics/full7.gif" border="0" alt="Return to Full Valley Archive"></a></center>
      </div>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>