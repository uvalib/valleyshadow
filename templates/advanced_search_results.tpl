<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Census Search Results</title>
  	  <link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">
	  <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
      <script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="/VoS/javascript/census-thickbox.js" type="text/javascript"></script>

    	<style>td {padding-left:5px;padding-right:5px;}
					.debug {background:yellow;} .citationHelp { text-align: center; padding-left: 2em; padding-right: 2em; }
					a { color: #CD7F32 ;} .searchReturn { float:left;}
					a.visited, a:visited { color: blue!important; }
					a:hover { color: red !important; }
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}

		</style></head>
   <body bgcolor="#FFFFFF">
      <div align="center" class="census_results"><img src="/VoS/images/images/vtitle4.gif"></div>
      <h1 style="color:#990000;text-align:center;">{{ getcounty .County }} County {{ getstate .County}}-
         							{{ .Year }} Population
      </h1>
      <p class="citationHelp"><b>Please cite results as coming from: </b>{{ getcounty .County}}
         						County, {{ getstate .County }}, {{ getyear .Year }} Population Census, Valley of
         						the Shadow: Two Communities in the American Civil War, Virginia Center for
         						Digital History, University of Virginia<br>
         						( {{ .FURL }}?{{ .QS }}).
      </p>
      <center>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;text-align:center">
          {{ template "pagination" . }}
          <a href="/advanced">Start a new search</a><br>

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
               <td>{{ .family_num }}</td>
               <td>{{ .head_num }}</td>
               <td><a class="thickbox" href="census_results?q=id_num:{{ .id_num }} AND db:{{ .db }}&amp;TB_iframe=true">{{ .last }}</a></td>
               <td>{{ .first }}</td>
               <td>{{ .age }}</td>
               <td>{{ .sex }}</td>
               <td>{{ .color }}</td>
               <td>{{ .occupation }}</td>
               <td>{{ .subdistrict_text }}</td>
            </tr>
          {{ end }}
         </table>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;text-align:center">
         {{ template "pagination" . }}
         <a href="/advanced">Start a new search</a>

         </div>

      </center>
      <div style="display:block; clear:both; border: none; padding-top: 1em;" id="footer">
         <center><a shape="rect" href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" border="0" alt="Return to Full Valley Archive"></a></center>
      </div>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
