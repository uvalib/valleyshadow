<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Claims Search Results</title><style>
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
		</style></head>
   <body style="padding: 1em;">
      <h1><font color="#990000">
            <center>Pennsylvania Border Commission Claims - Franklin County</center></font></h1>
      <p><b>Please cite results as coming from: </b>Pennsylvania Border Commission
         					Claims--Franklin County, Valley of the Shadow: Two Communities in the American
         					Civil War, Virginia Center for Digital History, University of Virginia
         					({{ .QS }}).
      </p>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;">
               {{ template "pagination" . }}
      </div>
      <table border="1px" style="width:100%;text-align:center;">
         <tr>
            <td><b>Name</b></td>
            <td><b>Race</b></td>
            <td><b>Gender</b></td>
            <td><b>Total Claim</b></td>
            <td><b>Claim Num - Date</b></td>
            <td><b>Real Property</b></td>
            <td><b>Personal Property</b></td>
            <td><b>Amount Awarded</b></td>
            <td><b>Amount Received</b></td>
         </tr>
      		{{range .Docs}}

         <tr>
            <td>{{ .first }} {{ .last }}</td>
            <td>{{ .race }}</td>
            <td>{{ .sex }}</td>
            <td>{{ .claim_total }}</td>
            <td>{{ .claim_num }} - {{ .claim_date }}</td>
            <td>{{ .real_property }}</td>
            <td>{{ .personal_property }}</td>
            <td>{{ .amount_award }}</td>
            <td>{{ .amount_rec }}</td>
         </tr>
     	{{ end }}
      </table>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;">
         {{ template "pagination" . }}      
      </div><script src="../VoS/javascript/generic_search_paging.js" type="text/javascript"></script><p><a href="paclaims">Go back to search page</a></p><br><center><a href="VoS/choosepart.html"><img alt="" border="0" src="VoS/graphics/full7.gif"></a></center>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>