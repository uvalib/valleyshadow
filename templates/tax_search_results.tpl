<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: {{ getcounty .County }} County 1860 Tax Records -- Search Results</title>
	  <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
      <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

				</head>
   <body>

      <h1><center><font color="#990000">
          {{ getcounty .County }}, {{ getstate .County }} -1860 Tax Records</font></center></h1>
      <center><p class="citation-help"><b>Please cite results as coming from: </b>{{ getcounty .County }} County, {{ getstate .County }}, 1860 Tax Records</br> Valley of the Shadow: Two Communities in the
         					American Civil War, Virginia Center for Digital History, University of Virginia.
      </p></center>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;text-align:center">
      	{{ template "pagination" .  }}
        <a href="/tax">Go back to search page</a>
      </div>
      <table border="1px" style="width:100%;text-align:center;">
         <tr>
            <td><b>Name</b></td>
            <td><b>Residence</b></td>
            <td><b>Estate</b></td>
            <td><b>Lot Number</b></td>
            <td><b>Building Value</b></td>
            <td><b>Lot-Building Value</b></td>
            <td><b>Tax Amount</b></td>
            <td><b>City Tax Amount</b></td>
         </tr>
  		{{range .Docs}}

         <tr>
            <td>{{ .first}} {{ .last }}</td>
            <td>{{ .estate }}</td>
            <td>{{ .residence }}</td>
            <td>{{ .lot_num }}</td>
            <td>{{ .building_val }}</td>
            <td>{{ .lot_building_val }}</td>
            <td>{{ .tax_amt }}</td>
            <td>{{ .city_tax_amt}}</td>
         </tr>
		{{ end }}
		</table>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;text-align:center">
      	{{ template "pagination" .  }}
          <a href="/tax">Go back to search page</a>
      </div>
      <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
