<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Search the Official Records</title><style> .highlightme { background-color: yellow; }
					.noresults { font-size: 16px; margin: 10px 0 10px 0; }
					.currentShowing { width: 100px; text-align: center; padding: 0 10px 0 10px; }
					.previousPage { width: 250px; text-align: right; }
					.nextPage { width: 250px; text-align: left; }
					#resultSummary { padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; border-bottom: 1px solid #c6c6c6; }
					#returnPage { width: 65%; }
					#topNavig { text-align: center; margin: 5px 0 5px 0;}
					#bottomNavig { text-align: center; margin: 5px 0 5px 0; }
					#jumpPages {padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; }
					#resultReturns { clear: both; } select{margin:2px;} input{margin:2px;}
					.warning{font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;}
					.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
				</style>
				<script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
				<script src="/VoS/javascript/or_search.js" type="text/javascript"></script></head>
			    <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
      			<link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

   <body vlink="#00009c" link="#cd7f32" bgcolor="#FFFFFF">
      <div id="no-javascript" style="width:100%;text-align:center;">
         <h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
      </div>
      <div id="form">
         <div style="width:100%;text-align:center;"><img style="padding-left:10px;" src="/VoS/images/images/vtitle4.gif"><h2 class="red-head">Search the Valley Official Records</h2>
         </div>
         <form method="get" action="/or_search_results.html" name="orSearchForm"><input id="query" name="q" readonly type="hidden"><input value="50" name="rows" readonly type="hidden"><input value="0" name="start" readonly type="hidden"><div style="width:65%;margin-left:auto;margin-right:auto;">
               <blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
                  							substituted for any number of characters at the middle
                  							or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
                  							full explanation.
               </blockquote>
               <p><i>By default, all dates will be searched. To limit your search, select
                     								specific dates</i></p>
               <hr>
               <p><label>Search for: <input value="" type="text" name="search_text"></label></p>
               <p><label>Date Range:</label><select name="start_year">
                     <option value="">Select Year...</option>
                     <option value="1861">1861</option>
                     <option value="1862">1862</option>
                     <option value="1863">1863</option>
                     <option value="1864">1864</option>
                     <option value="1865">1865</option></select><select disabled name="start_month">
                     <option value="00">Select Month...</option>
                     <option value="01">January</option>
                     <option value="02">February</option>
                     <option value="03">March</option>
                     <option value="04">April</option>
                     <option value="05">May</option>
                     <option value="06">June</option>
                     <option value="07">July</option>
                     <option value="08">August</option>
                     <option value="09">September</option>
                     <option value="10">October</option>
                     <option value="11">November</option>
                     <option value="12">December</option></select> through <select name="end_year">
                     <option value="">Select Year...</option>
                     <option value="1861">1861</option>
                     <option value="1862">1862</option>
                     <option value="1863">1863</option>
                     <option value="1864">1864</option>
                     <option value="1865">1865</option></select><select disabled name="end_month">
                     <option value="00">Select Month...</option>
                     <option value="01">January</option>
                     <option value="02">February</option>
                     <option value="03">March</option>
                     <option value="04">April</option>
                     <option value="05">May</option>
                     <option value="06">June</option>
                     <option value="07">July</option>
                     <option value="08">August</option>
                     <option value="09">September</option>
                     <option value="10">October</option>
                     <option value="11">November</option>
                     <option value="12">December</option></select><span id="validationField"></span></p>
               <p id="county"> Search Units from:<br><input checked value="all" name="county" type="radio">Both
                     								Counties<input value="augusta" name="county" type="radio">Augusta<input value="franklin" name="county" type="radio">Franklin</p>
               <p><input value="Search" id="search_button" type="submit"><input value="Reset" id="clear_button" type="reset"></p>
               <hr>
            </div>
         </form>
      </div>
      <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
