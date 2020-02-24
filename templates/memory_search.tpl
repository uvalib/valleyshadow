<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Search the Memory Articles</title>
		    <script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
        <script src="/VoS/javascript/memory_search.js" type="text/javascript"></script>
        <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
        <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
  </head>
   <body vlink="#00009c" link="#cd7f32" bgcolor="#FFFFFF">
      <div id="no-javascript" style="width:100%;text-align:center;">
         <h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
      </div>
      <div id="form">
         <div style="width:100%;text-align:center;"><img style="padding-left:10px;" src="/VoS/images/images/vtitle4.gif"><h2 class="red-head">Search the Valley Memory Articles</h2>
         </div>
         <form method="get" action="/memory_results.html" name="memorySearchForm">
           <input name="q" id="query" type="hidden">
           <input value="50" name="rows" type="hidden">
           <input value="0" name="start" type="hidden">
           <div style="width:65%;margin-left:auto;margin-right:auto;">
               <blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
                  							substituted for any number of characters at the middle
                  							or back of a word. Please see <a id="search_page_infolinks" href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
                  							full explanation.
               </blockquote>
               <hr>
               <p><label>Search for: <input type="text" class="search_box" name="search_text"></label></p>
               <p><label>Date Range:</label><select name="start_year" class="year_selector" id="start_year">
                     <option value="*">Select Year...</option>
                     <option selected value="1871">1871</option>
                     <option value="1872">1872</option>
                     <option value="1873">1873</option>
                     <option value="1874">1874</option>
                     <option value="1875">1875</option>
                     <option value="1876">1876</option>
                     <option value="1877">1877</option>
                     <option value="1878">1878</option>
                     <option value="1879">1879</option></select>through<select name="end_year" class="year_selector" id="end_year">
                     <option value="*">Select Year...</option>
                     <option value="1871">1871</option>
                     <option value="1872">1872</option>
                     <option value="1873">1873</option>
                     <option value="1874">1874</option>
                     <option value="1875">1875</option>
                     <option value="1876">1876</option>
                     <option value="1877">1877</option>
                     <option value="1878">1878</option>
                     <option selected value="1879">1879</option></select><span style="display:inline" id="validationField"></span></p>
               <p id="county"> Search Units from:<br><input checked value="all" name="county" type="radio">Both
                     								Counties<input value="augusta" name="county" type="radio">Augusta<input value="franklin" name="county" type="radio">Franklin</p>
               <p><input value="Search" id="search_button" type="submit"><input value="Reset" id="clear_button" type="reset"></p>
               <hr>
               <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
            </div>
         </form>
      </div>
   <script src="http://valley.lib.virginia.edu/javascript/libtools.js" type="text/javascript"></script></body>
</html>
