<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <title>The Valley of the Shadow: Two Communities in the American
  Civil War</title>
  <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  <meta content=
  "The Valley of the Shadow is an electronic archive of two communities in the American Civil War--Augusta County, Virginia, and Franklin County, Pennyslvanai. The Valley Web site includes searchable newspapers, population census data, agricultural census data, manufacturing census data, slaveowner census data, and tax records. The Valley Web site also contains letters and diaries, images, maps, church records, and military rosters. The Valley project is a University ofVirginia research project funded in part by the National Endowment of the Humanities."
  name="description" />
  <!--   The Valley of the Shadow is an electronic archive of two communities
in the American Civil War==Augusta County, Virginia, and Franklin County, Pennyslvania.  The
Valley Web site includes searchable newspapers, population census data,
agricultural census data, manufacturing census data, slaveowner census
data, and tax records.  The Valley Web site also contains letters and
diaries, images, maps, church records, and military rosters.  The Valley Project is a
University of Virginia research project funded in part by the National
Endowment for the Humanities. -->
  <meta content=
  "United States Civil War American history Virginia Pennsylvania military geneology archive"
  name="keywords" />
  <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
  <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
  <script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
  <script src="/VoS/javascript/replace_em.js" type="text/javascript"></script>
  <script src="/VoS/javascript/census-thickbox.js" type="text/javascript"></script>
  <style> .highlightme { color: inherit; background-color: yellow; }
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
			#topNavig, #bottomNavig { display:block; padding: 10px; align: center; }
			.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
  </style>
</head>
   <body style="padding: 1em;">
      <h1><font color="#990000">
            <center>Soldiers' Records</center></font></h1>
      <h3><center><font color="#990000">
            From Compiled Military Service Records at National Archives</font></center></h3>
      <center><p>Results printed below are the short version of the results of your search.
         					Columns in bold denote columns searched on (beyond the basic returns of Name,
         					service information, and enlistment information. Clicking on the last name of
         					each person will allow you to see a full record for that individual
      </p>
      <p><b>Please cite results as coming from: </b>{{ getcounty .County }} County, {{ getstate .County }}, Soldiers Records</br> Valley of the Shadow: Two Communities in the
         					American Civil War, Virginia Center for Digital History, University of Virginia
                </br>({{ .FURL }}?{{ .QS }}).</center>
      </p>
      <center>
         <div id="topNavig">
         {{ template "pagination" . }}
         <a href="dossiers">Go back to search page</a>

         </div>
      </center>
      <table border="1px" style="width:100%;text-align:center;">
         <tr>
            <td><b>Last</b></td>
            <td><b>First</b></td>
            <td><b>Rank</b></td>
            <td><b>Company</b></td>
            <td><b>Regiment</b></td>
            <td><b>Place Enlisted</b></td>
            <td><b>Year Enlisted</b></td>
         </tr>

      {{range .Docs}}

         <tr>
            <td><a class="thickbox" href="/dossier_record?q=db:{{ .db }} AND id_num:{{ .id_num }}">{{ .last }}</a></td>
            <td>{{ .first }}</td>
            <td>{{ .rank_enl }}</td>
            <td>{{ .company }}</td>
            <td>{{ .regiment }}</td>
            <td>{{ .place_enl }}</td>
            <td>{{ .year_enl}}</td>
         </tr>
      {{ end }}

      </table>
      <center>
         <div id="bottomNavig">
   	       {{ template "pagination" . }}
           <a href="/dossiers">Go back to search page</a>

         </div>
      </center>
      <div style="display:block; clear:both; border: none; padding-top: 1em;" id="footer">
         <center><a shape="rect" href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" border="0" alt="Return to Full Valley Archive"></a></center>
      </div>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
