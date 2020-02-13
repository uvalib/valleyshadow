<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <title>Valley of the Shadow: Census Search Results</title>
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="../VoS/javascript/census-thickbox.js" type="text/javascript"></script>
			<link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
			<link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
</head>
   <body bgcolor="#FFFFFF">
      <div align="center" class="census_results"><img src="/VoS/images/images/vtitle4.gif"></div>

      <h1 class="red-head">
         <center>{{ getcounty .County }} County, {{ getstate .County }} - {{ getyear .Year }}
            							Population Census
         </center>
      </h1>
      <div class="cite-results-banner">
      <p><b>Please cite results as coming from: </b>{{ getcounty .County }} County, {{ getstate .County }} - {{ getyear .Year }} Population Census.</br> Valley of
         					the Shadow: Two Communities in the American Civil War, Virginia Center for
         					Digital History, University of Virginia</br>
         					({{ getsiteurl }}/{{ .QS }}).
      </p>
    </div>
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
               <td><a class="thickbox" href="/census_results?q=id_num:{{ .id_num }} AND db:{{ .db }}&TB_iframe=true&start=0&county={{ .County }}&year={{ .Year}}">{{ .last }}</a></td>
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
         <center><a shape="rect" href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" border="0" alt="Return to Full Valley Archive"></a></center>
      </div>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
