<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Valley of the Shadow: Augusta County - 1860 Slaveowners Census -- Search Results</title><style>
			p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
		</style>
       <script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
				<script src="/VoS/javascript/generic_search_paging.js" type="text/javascript"></script>
				<link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">
				<link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
        <script src="/VoS/javascript/census-thickbox.js" type="text/javascript"></script>

		</head>
   <body>
      <center><img src="/VoS/images/images/vtitle4.gif"><h1><font color="#990000">
               <center>Augusta County - 1860 Slaveowners Census</center></font></h1>
      </center>
      <p class="citation-help"><b>Please cite results as coming from:</b> Augusta County, Virginia, 1860
         					Slaveowners Census, Valley of the Shadow: Two Communities in the American Civil
         					War, Virginia Center for Digital History, University of Virginia
         					({{ .FURL }}?{{ .QS }})
      <center>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;">
        	{{ template "pagination" .  }}

		</div>
      </center>
      <table border="1px" style="width:100%;text-align:center;">
         <tr>
            <tr>
               <th>Last Name</th>
               <th>First Name</th>
               <th>Location</th>
               <th>Employer Name</th>
               <th>Employer Location</th>
               <th>Total Slaves</th>
               <th>Male Slaves</th>
               <th>Female Slaves</th>
               <th>Black Slaves</th>
               <th>Mulatto Slaves</th>
            </tr>
         </tr>

 		{{range .Docs}}

         <tr>
            <tr>
               <td><a class="thickbox" href="/sc_record?q=db:{{ .db }} AND id_num:{{ .id_num }}&start=0">{{ .last }}</a></td>
               <td>{{ .first }}</td>
               <td>{{ .location }}</td>
               <td>{{ .employer }}</td>
               <td>Staunton</td>
               <td>{{ .total_slaves }}</td>
               <td>{{ .male_slaves }}</td>
               <td>{{ .female_slaves }}</td>
               <td>{{ .black_slaves }}</td>
               <td>{{ .mulatto_slaves }}</td>
            </tr>
         </tr>

         {{ end }}

      </table>
      <center>
         <div style="width:100%;padding-top:10px;padding-bottom:10px;">
            {{ template "pagination" .  }}
         </div>
      </center><p><a href="slave_census">Go back to search page</a></p>
      <hr width="80%">
      <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
