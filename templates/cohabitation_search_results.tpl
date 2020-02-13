<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Official Records -- Search Results</title>
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="../VoS/javascript/thickbox.js" type="text/javascript"></script>
  	  <link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">
	  <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

      <style> body { text-align: center; }
			 div#wrapper { margin-left:auto;
						margin-right:auto; width: 700px; text-align: left; }
			 td {padding:2px;}

						div#husbandInfo { padding: 10px; width: 500px; float: left; }
			 div#wifeInfo {
						padding: 10px; width: 350px; float: left; }
			 div#generalInfo { padding: 30px
						10px 10px 10px; clear: both; width: 600px; }
			 .musterTableHead {
						background-color:#D3D1AC; font-size:12px;font-weight:bold; }

						.musterTableBody { background-color:#D3D1BC; font-size:12px; }
			 .rowodd {
						width: 450px; height: 25px; margin: 8px; font-family:verdana, arial;
						font-size: 12px; }
			 .roweven { width: 450px; height: 25px; margin: 8px;
						font-family:verdana, arial; font-size: 12px; }
			 .label { float:left;
						text-align: right; width: 225px; padding: 5px; background-color: #CFCFCF; }

						.content { float:right; text-align:left; width: 200px; padding: 5px; }
			 input
						{ font-family:verdana, arial; font-size: 12px; }
			 option {
						font-family:verdana, arial; font-size: 12px; }
			 #TB_window { font: 12px
						Arial, Helvetica, sans-serif; color: #333333; }
			 #TB_secondLine { font: 10px
						Arial, Helvetica, sans-serif; color:#666666; }
			 #TB_window a:link { color:
						#666666; }
			 #TB_window a:visited { color: #666666; }
			 #TB_window a:hover {
						color: #000; }
			 #TB_window a:active { color: #666666; }
			 #TB_window a:focus {
						color: #666666; }
			 #TB_overlay { position: absolute; z-index:100; top: 0px;
						left: 0px; }
			 #TB_window { position: absolute; background: #ffffff;
						z-index: 102; color:#000000; display:none; border: 4px solid #525252;
						text-align:left; }
			 #TB_window img { display:block; margin: 15px 0 0 15px;
						border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; border-top: 1px
						solid #666; border-left: 1px solid #666; }
			 #TB_caption { height:25px;
						padding:7px 30px 10px 25px; float:left; }
			 #TB_closeWindow { height:25px;
						padding:11px 25px 10px 0; float:right; }
			 #TB_closeAjaxWindow { padding:5px
						10px 7px 0; margin-bottom:1px; text-align:right; float:right; }

						#TB_ajaxWindowTitle { float:left; padding:7px 0 5px 10px; margin-bottom:1px;
						}
			 #TB_title { background-color:#e8e8e8; height:27px; }
			 #TB_ajaxContent {
						clear:both; padding:2px 15px 15px 15px; overflow:auto; text-align:left;
						line-height:1.4em; }
			 #TB_ajaxContent p { padding:5px 0px 5px 0px; }
			 #TB_load
						{ position: absolute; display:none; height:100px; width:100px; z-index:101;
						}
			 #TB_HideSelect { z-index:99; position:absolute; top: 0; left: 0;
						background-color:#fff; border:none; filter:alpha(opacity=0); -moz-opacity:
						0; opacity: 0; }
			 #TB_iframeContent { clear:both; border:none;
						margin-bottom:-1px; margin-top:1px; margin-bottom:1px; padding-left:5px;
						padding-right:5px; }

			.highlightme { color: inherit; background-color: yellow; }
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
		</style></head>
   <body>
      <center><img border="0" src="/VoS/images/images/vtitle4.gif"><h2>Search the Cohabitation Records</h2><a href="/VoS/freedmen1.html">Return to Bureau Home</a> | <a href="../VoS/about.html">About
            						the Cohabitation Records</a></center>
      <hr>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;">   
      	{{ template "pagination" . }}

      </div>
      <table cellspacing="1px" cellpadding="0" style="width:700px;text-align:center;margin-left:auto;margin-right:auto;">
         <tr class="musterTableHead">
            <td>Report Date</td>
            <td>Husband First Name</td>
            <td>Husband Last Name</td>
            <td>Wife First Name</td>
            <td>Wife Last Name</td>
            <td>Husband Age</td>
            <td>Wife Age</td>
            <td>Husband Birth Place</td>
            <td>Wife Birth Place</td>
            <td>Husband Occupation</td>
            <td>Current Residence</td>
            <td>Originial Remarks</td>
            <td># of Children</td>
         </tr>
        
        {{range .Docs}}
      
         <tr class="musterTableBody">
            <td>1866-04-25</td>
            <td>{{ .cohab_husband_first_name }} </td>
            <td>{{ .cohab_husband_last_name }}</td>
            <td>{{ .cohab_wife_first_name }}</td>
            <td>{{ .cohab_wife_last_name }}</td>
            <td>{{ .cohab_husband_age }}</td>
            <td>{{ .cohab_wife_age }}</td>
            <td>{{ .cohab_husband_birth_place }}</td>
            <td>{{ .cohab_wife_birth_place}}</td>
            <td>{{ .cohab_husband_occupation }}</td>
            <td>{{ .cohab_current_residence }}</td>
            <td>{{ .cohab_transcriber_notes }}</td>
            <td><a class="thickbox" href="/cohab_children?q=db:{{ .db }}_children AND child_family_id:{{ .cohab_family_id }}&amp;sort=child_age asc&TB_iframe=true&father={{ .cohab_husband_first_name }} {{ .cohab_husband_last_name }}">{{ .cohab_num_children}}</a></td>
         </tr>
         
         {{ end }}
      </table>
      <div style="width:100%;padding-top:10px;padding-bottom:10px;">   
      {{ template "pagination" . }}

      </div><script src="javascript/generic_search_paging.js" type="text/javascript"></script><p><a href="cohabitation">Go back to search page</a></p>
      <div style="display:block; clear:both; border: none; padding-top: 1em;" id="footer">
         <center><a shape="rect" href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" border="0" alt="Return to Full Valley Archive"></a></center>
      </div>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>