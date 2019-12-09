<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Augusta County 1890 Veteran Census -- Search Results</title><style>
					p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
				</style>
	  <link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
	  <link rel="icon" type="image/png" href="../VoS/favicon.ico" />
	
	</head>
   <body>
      <h1><font color="#990000">
            <center>1890 {{ getcounty .County }} County Veterans
               						Census
            </center></font></h1>
           <div style="width:100%;padding-top:10px;padding-bottom:10px;">        	
      	{{ template "pagination" .  }}
        {{ .QS }}
        	<div> Showing records {{ .Start }} to {{ .CURSOR }} ({{ .NumFound }} total)</div>

      </div>
      
      <p><b>Please cite results as coming from: </b>{{ getcounty .County }} County, {{ getstate .County }}, 1890 Veterans Census, Valley of the Shadow: Two Communities in
         					the American Civil War, Virginia Center for Digital History, University of
         					Virginia ({{ getsiteurl }}/{{ .QS}}).
      </p>
      <table border="1px" style="width:100%;text-align:center;">
         <tr>
            <td><b>Name</b></td>
            <td><b>Widow Name/Other Info</b></td>
            <td><b>Location</b></td>
            <td><b>House Number</b></td>
            <td><b>Family Number</b></td>
            <td><b>Rank</b></td>
            <td><b>Company</b></td>
            <td><b>Regiment or Vessel</b></td>
            <td><b>Enlistment Date</b></td>
            <td><b>Discharge Date</b></td>
            <td><b>Length of Service</b></td>
            <td><b>Disability Incurred</b></td>
            <td><b>Remarks</b></td>
         </tr>

 		{{range .Docs}}
         
         <tr>
            <td>{{ .first }} {{ .last }}</td>
            <td>{{ .widow_name }}</td>
            <td>{{ .location }}</td>
            <td>{{ .house_num }}</td>
            <td>{{ .family_num }}</td>
            <td>{{ .rank }}</td>
            <td>{{ .company }}</td>
            <td>{{ .regiment }}</td>
            <td>{{ .enl_date }}</td>
            <td>{{ .discharge_date }}</td>
            <td>{{ .length_of_service }}</td>
            <td>{{ .disability }}</td>
            <td>{{ .remarks }}</td>
         </tr>
         
         {{ end }}
         
         
      </table>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;">        	
      	{{ template "pagination" .  }}
        {{ .QS }}
      </div>
      <script src="javascript/jquery-1.2.1.js" type="text/javascript"></script><script src="javascript/generic_search_paging.js" type="text/javascript"></script><p><a href="veteran">Go back to search page</a></p>
   <script src="http://valley.lib.virginia.edu/javascript/libtools.js" type="text/javascript"></script></body>
</html>