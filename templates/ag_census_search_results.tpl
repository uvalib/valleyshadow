<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
      <title>Valley of the Shadow: {{ getcounty .County }} County - {{ getyear .Year }} Agricultural Census -- Search Results</title><style>
					p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}

				</style>
				      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
				      <script src="../VoS/javascript/census-thickbox.js" type="text/javascript"></script>
     				  <link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
	     			  <link rel="icon" type="image/png" href="../VoS/favicon.ico" />

				</head>
   <body>
      <center><img src="../VoS/images/images/vtitle4.gif"><h1><font color="#990000">
               <center>{{ getcounty .County }} County - {{ getyear .Year }} Agricultural Census </center></font></h1>
         <p><b>Please cite results as coming from: </b>{{ getcounty .County }} County, {{ getstate .County}}, {{ getyear .Year}} Agricultural Census, Valley of the
            					Shadow: Two Communities in the American Civil War, Virginia Center for Digital
            					History, University of Virginia</br>
            					({{ getsiteurl }}/{{ .QS }}).
         </p>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;">
         {{ template "pagination" .  }}

         </div>
      </center>
      <p style="align:left; padding-left: 2em;"><a href="ag_census">Go back to search page</a></p>
      <center>
         <table border="1px" style="width:100%;text-align:center;">
            <tr>
               <td><b>Last Name</b></td>
               <td><b>First Name</b></td>
               <td><b>Location</b></td>
               <td><b>Farm Value</b></td>
               <td><b>Total Value of Livestock</b></td>
               <td><b>Pounds of Tobacco</b></td>
               <td><b>Value of Home Manufacturing</b></td>
               <td><b>Total Land</b></td>
               <td><b>Total Animals</b></td>
               <td><b>Total Grain</b></td>
            </tr>
            {{range .Docs}}

            <tr>
               <td><a class="thickbox" href="/ag_record?q=db:{{ .db }} AND id_num:{{ .id_num }}&start=0">{{ .last }}</a></td>
               <td>{{ .first }}</td>
               <td>{{ .location }}</td>
               <td>{{ .farm_val }}</td>
               <td>{{ .tot_livestock }}</td>
               <td>{{ .tobacco }}</td>
               <td>{{ .home_manu }}</td>
               <td>{{ .tot_land }}</td>
               <td>{{ .tot_animals }}</td>
               <td>{{ .tot_grain }}</td>
            </tr>
            {{ end }}
         </table>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;">
         {{ template "pagination" .  }}

         </div>
      </center>
      <p><a href="ag_census">Go back to search page</a></p>
      <div style="display:block; clear:both; border: none; padding-top: 1em;" id="footer">
         <center><a shape="rect" href="../VoS/choosepart.html"><img src="../VoS/images/graphics/full7.gif" border="0" alt="Return to Full Valley Archive"></a></center>
      </div>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
