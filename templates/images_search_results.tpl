<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Civil War Images -- Search Results</title>
      <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
      <link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">
      <script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="/VoS/javascript/replace_em.js" type="text/javascript"></script>
      <style>
			p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
			span.pagingNav { padding: 5px 25px 5px 25px; border: none; }
			.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
			#topNavig, #bottomNavig { display:block; padding: 10px; align: center; }
		</style></head>
   <body>
      <center><img src="/VoS/images/images/vtitle4.gif" align="center"><h1><font color="#990000">Civil War Images</font></h1><br><p style="padding: 1em;"><b>Please cite results as coming from:</b> Civil War Image Database, Valley of
            					the Shadow: Two Communities in the American Civil War, Virginia Center for
            					Digital History, University of Virginia<br>
            					({{ .FURL }}?{{ .QS }}).
         </p>
         <div id="topNavig">
   			{{ template "pagination" . }}
        <a href="/images">Go back to search page</a>

         </div>
         <table border="1px" style="width:100%;text-align:center;">
            <tr>
               <tr>
                  <tr>
                     <th>Image</th>
                     <th>Title</th>
                     <th>Source</th>
                     <th>Original Location</th>
                     <th>Artist</th>
                     <th>Image Date</th>
                     <th>Image Type</th>
                     <th>Subject</th>
                     <th>Place Name</th>
                     <th>Regiment</th>
                     <th>People's Names</th>
                     <th>Description</th>
                  </tr>
               </tr>
            </tr>
            {{range .Docs}}

            <tr>
               <tr>
                  <td><a target="" href="/VoS/images/{{ noext .image_name }}.html?q=db:images AND image_name:{{ .image_name}}"><img src="/VoS/images/old_photos/{{ .image_name }}"></a></td>
                  <td>{{ .title }}</td>
                  <td>{{ .source }}</td>
                  <td>{{ .orig_location }}</td>
                  <td>{{ .artist }}</td>
                  <td>{{ .image_date }}</td>
                  <td>{{ .image_type }}</td>
                  <td>{{ .subject_date }}</td>
                  <td>{{ .place_name}}</td>
                  <td>{{ .regiment }}</td>
                  <td>{{ .people_name }}</td>
                  <td>{{ .description }}</td>
               </tr>
            </tr>

           {{ end }}






            </tr>
         </table>
           {{ template "pagination" . }}
           <a href="/images">Go back to search page</a>

         </div>
      </center>
      <div style="display:block; clear:both; border: none; padding-top: 1em;" id="footer">
         <center><a shape="rect" href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" border="0" alt="Return to Full Valley Archive"></a></center>
      </div>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
