<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Augusta County - 1870 Manufacturing Census -- Search Results</title>
      <style type="text/css"> p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
			.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
			
		</style>
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
		
      <script src="../VoS/javascript/census-thickbox.js" type="text/javascript"></script>
	  <link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
	  <link rel="icon" type="image/png" href="../VoS/favicon.ico" />
	</head>
   <body style="padding: 1em;">
      <h1 class="red-head">
         <center>{{ getcounty .County }} County, {{ getstate .County }} - {{ getyear .Year }}
            							Manufacturing Census
         </center>
      </h1>
      <p><b>Please cite results as coming from:</b>{{ getcounty .County }} County, {{ getyear .Year}}, {{ getyear .Year }} Manufacturing Census, Valley of
         					the Shadow: Two Communities in the American Civil War, Virginia Center for
         					Digital History, University of Virginia</br>
         					({{ getsiteurl }}/{{ .QS }}).
      </p>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;">   			
      {{ template "pagination" . }}
</div>
      <table border="1px" style="width:100%;text-align:center;">
         <tr>
            <tr>
               <th>Name</th>
               <th>Business</th>
               <th>Location</th>
               <th>Products</th>
               <th>Capital</th>
               <th>Male Workers</th>
               <th>Female Workers</th>
               <th>Male Wages</th>
               <th>Female Wages</th>
            </tr>
         </tr>
      {{range .Docs}}

         <tr>
            <td><a class="thickbox" href="/manu_record?q=db:{{ .db }} AND id_num:{{ .id_num }}">{{ .name }}</a></td>
            <td>{{ .business }}</td>
            <td>{{ .location }}</td>
            <td>{{ .kinds_annual }}</td>
            <td>{{ .cap_inv }}</td>
            <td>{{ .male_hands }}</td>
            <td>{{ .female_hands }}</td>
            <td>{{ .male_wage }}</td>
            <td>{{ .female_wage}}</td>
         </tr>
   	{{ end }}
      </table>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;"> 
        			{{ template "pagination" . }}
</div><script src="../VoS/javascript/generic_search_paging.js" type="text/javascript"></script><p><a href="manu_census">Go back to search page</a></p>
      <center><a href="../VoS/choosepart.html"><img alt="" border="0" src="../VoS/images/graphics/full7.gif"></a></center>
   <script src="http:../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>