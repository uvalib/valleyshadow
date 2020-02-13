<!DOCTYPE html >
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Valley of the Shadow: Church Records -- Search Results</title>
      <link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">            
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="../VoS/javascript/replace_em.js" type="text/javascript"></script>
      <style> 
			.highlightme { color: inherit; background-color: yellow; }
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
			p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
		</style></head>
   <body>
      <center><img src="/VoS/images/images/vtitle4.gif" align="center"></center>
      <center>
         <h1><font color="#990000">
               <center>{{ getcounty .County }} County &#8211; Church Records</center></font></h1>
         <p class="citation-help"><b>Please cite results as coming from: </b>{{ getcounty .County}} County, {{ getstate .County }}, Church Records, Valley of the Shadow: Two Communities in the
            					American Civil War, Virginia Center for Digital History, University of Virginia.<br>
            					(http://valley.lib.virginia.edu/church_search_results.html?q=db:church_aug).
         </p>
      </center>
      <p style="align:left; padding-left: 2em;"><a href="/church">Go back to search page</a></p>
      <center>
         <div style="width:90%;padding-top:10px;padding-bottom:10px;">
   {{ template "pagination" . }}
         </div>
         <table border="1px" style="width:100%;text-align:center;">
            <tr>
               <td><b>Church/Congregation</b></td>
               <td><b>Location</b></td>
               <td><b>Name</b></td>
               <td><b>Type of Record</b></td>
               <td><b>Age or D.O.B.</b></td>
               <td><b>Date of Confirmation</b></td>
               <td><b>Date of Baptism</b></td>
               <td><b>Date of Communion</b></td>
               <td><b>Date of Marriage</b></td>
               <td><b>Date of Death</b></td>
               <td><b>Sex</b></td>
               <td><b>Race</b></td>
               <td><b>Officiating Clergy</b></td>
               <td><b>Familial Relations</b></td>
               <td><b>Witnesses or Sponsors</b></td>
               <td><b>Misc. Notes</b></td>
            </tr>
            {{range .Docs}}
            <tr>
               <td>{{ .church }}</td>
               <td>{{ .location }}</td>
               <td>{{ .first}} {{ .last }}</td>
               <td>{{ .record_type }}</td>
               <td>{{ .dob }}</td>
               <td>{{ .confirmation}}</td>
               <td>{{ .baptism }}</td>
               <td>{{ .communion}}</td>
               <td>{{ .marriage }}</td>
               <td>{{ .death}}</td>
               <td>{{ .sex }}</td>
               <td>{{ .race }}</td>
               <td>{{ .clergy }}</td>
               <td>{{ .family }}</td>
               <td>{{ .witness }}</td>
               <td>{{ .notes }}</td>
            </tr>
          {{ end }}


         </table>
         <div style="width:90%;padding-top:10px;padding-bottom:10px;">
   {{ template "pagination" . }}
         </div>
      </center>
      <p><a href="church">Go back to search page</a></p>
      <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>