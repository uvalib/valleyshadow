<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><style>
                        body { min-width: 700px; text-align: center; }
                    .title {color: #990000; font-family: times, serif}
                    .p10 {margin-left: 3em; margin-right: 3em; }
                    .p11 {text-align: center; margin-left: 3em; margin-right: 3em; }
                    .p12 {margin-left: 5em; margin-right: 5em; font-size: 80%; }
                    h4 {text-align: center; margin-left: 3em; margin-right: 3em; }

                    div#mainResults {
                        margin: 0 auto;
                        width: 80%; text-align:left;
                        display: inline-block; align: center;
                    }
                    img.screenImage { padding-top: 2em; }
                    img.screenImage, div#imageMetadata table { align: center; margin: 0 auto; display: block;}
                    div#imageMetadata table { padding: 1em; display: table !important;}
                    div#navigationHead { padding-bottom: 1em; }
                    td.mdName { color: rgb(0,0,153); padding-right: 1em;}
		    .tableHead { color: #990000; background: #FFCC99; font-weight: bold;}
                </style>
                <link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">      
                <script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
                <script src="/VoS/javascript/images_search.js" type="text/javascript"></script>
    </head>
   <body text="#000000" vlink="#00009c" link="#cd7f32" bgcolor="#ffffff">
      <center><img border="0" src="/VoS/images/images/vtitle4.gif"><br><br><h2>Valley of the Shadow Image Selection</h2><br></center>
      <div id="navigationHead"><a onClick="javascript:history.back(-1)" href="javascript:history.back(-1)"><b>Return to Search</b></a><br><a href="/images"><b>New Search</b></a><br></div>
      <div id="mainResults">
        {{range .Docs}}

         <hr width="75%" align="center"><img class="screenImage" src="/VoS/images/old_photos/{{ noext .image_name}}.JPG"><div id="imageMetadata">
            <table calss="imageRecord">
               <tr class="tableHead">
                  <td colspan="2">Image Record</td>
               </tr>
               <tr>
                  <td class="mdName">image date:</td>
                  <td>nd</td>
               </tr>
               <tr>
                  <td class="mdName">image name:</td>
                  <td>{{ .image_name}}</td>
               </tr>
               <tr>
                  <td class="mdName">image type:</td>
                  <td>{{ .image_type}}</td>
               </tr>
               <tr>
                  <td class="mdName">orig_location:</td>
                  <td>Original Photograph</td>
               </tr>
               		{{ if .people_name }}
               <tr>
                  <td class="mdName">Personal Name: </td>
                  <td>{{ .people_name }}</td>
               </tr>
               
               	    {{ end}}
               <tr>
                  <td class="mdName">Comments: </td>
                  <td>{{ .comment }}</td>
               </tr>          
               		
               		
               		{{ if .regiment }}
               <tr>
                  <td class="mdName">regiment:</td>
                  <td>{{ .regiment }}</td>                 
               </tr>
               	    {{ end }}
               	    
               <tr>
                  <td class="mdName">source:</td>
                  <td>{{ .source }}</td>
               </tr>
               <tr>
                  <td class="mdName">subject type:</td>
                  <td>{{ .subject_type }}</td>
               </tr>
               <tr>
                  <td class="mdName">title:</td>
                  <td>{{ .title }}</td>
               </tr>
               <tr>
                  <td class="mdName">valley_id:</td>
                  <td>{{ .valley_id }}</td>
               </tr>
            </table>
            {{ end }}
         </div>
      </div><br><hr width="80%">
      <center><a href="/VoS/choosepart.html"><img alt="Return to Full Valley Archive" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>