<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Valley of the Shadow: Augusta County 1890 Veteran Census -- Search Results</title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta content="The Valley of the Shadow is an electronic archive of two communities
 in the American Civil War--Augusta County, Virginia, and Franklin County, Pennyslvania.
 The Valley Web site includes searchable newspapers, population census data, agricultural
 census data, manufacturing census data, slaveowner census data, and tax records.
 The Valley Web site also contains letters and diaries, images, maps, church records,
 and military rosters. The Valley project is a University ofVirginia research project
 funded in part by the National Endowment of the Humanities."
 name="description" />
 <!--   The Valley of the Shadow is an electronic archive of two communities
 in the American Civil War==Augusta County, Virginia, and Franklin County, Pennyslvania.  The
 Valley Web site includes searchable newspapers, population census data,
 agricultural census data, manufacturing census data, slaveowner census
 data, and tax records.  The Valley Web site also contains letters and
 diaries, images, maps, church records, and military rosters.  The Valley Project is a
 University of Virginia research project funded in part by the National
 Endowment for the Humanities. -->
 <meta content="United States Civil War American history Virginia Pennsylvania military
 geneology archive" name="keywords" />

 <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
 <link type="text/css" rel="stylesheet" href="../VoS/css/valleyshadow.css" />
 <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
</head>


   <body>
      <h1><font color="#990000">
            <center>1890 {{ getcounty .County }} County Veterans
               						Census
            </center></font></h1>
           <div style="width:100%;padding-top:10px;padding-bottom:10px;">
             <center><p><b>Please cite results as coming from: </b>{{ getcounty .County }} County, {{ getstate .County }}, 1890 Veterans Census</br> Valley of the Shadow: Two Communities in
                					the American Civil War, Virginia Center for Digital History, University of
                					Virginia</br> ({{ getsiteurl }}/{{ .QS}}).
             </p>
      	{{ template "pagination" .  }}</center>

      </div>


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
