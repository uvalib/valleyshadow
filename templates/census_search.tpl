<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Valley of the Shadow: Population Census Search</title><style> .red-head {color: #990000; font-family: times, serif; font-weight: bold; }
					.search_table td {padding:10px;} div[special=search1] { border: thin solid blue; background: #99CCFF; padding: 4px; } 
					div[special=search2] { border: thin solid red; background: #FF9999; padding: 4px; } 
					.warning{font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} .debug {color:red; background:brown;}  
				</style>
				<script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
				<script src="../VoS/javascript/population_census.js" type="text/javascript"></script>
				<link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
				<link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

	</head>
   <body VLINK="#00009C" LINK="#CD7F32" BGCOLOR="FFFFFF" TEXT="#000000">
      <div id="no-javascript" style="width:100%;text-align:center;">
         <h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
      </div>
      <div id="form">
         <table>
            <tr>
               <td valign="center">
                  <table cellpadding="10" width="80%" border="0" bgcolor="#ffcc99">
                     <tr>
                        <td align="center"><a href="/advanced"><b>Advanced Search</b></a><b></b></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/govdoc/censi/pcensus.html"><b>Information<br>About the Census</b></a></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/reference/tips.html"><b>Tips for Searching</b></a></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/govdoc/censi/census_new.html"><b>Return to<br>Census Home</b></a></td>
                     </tr>
                  </table>
               </td>
               <td>
                  <center><img src="/VoS/images/images/vtitle4.gif"></center><br><br><p>
                     <h1 class="red-head"><b>
                           <center> Search the U.S. Census - Basic Search </center></b></h1>
                  </p>
                  <blockquote> This page allows you to search either the 1860 or 1870
                     									U.S. Population Census in either Augusta County, Virginia, or
                     									Franklin County, Pennsylvania. This page only allows users to
                     									search on basic information found in the census (name, age, sex,
                     									color, occupation, wealth, and birthplace). If you would like to
                     									search on other fields found in the Census (such as the dwelling
                     									number, rank in household, page number in the census record)
                     									please use the Advanced Search for the specific year you wish to
                     									search.<br> An advanced search of each year of the Census can
                     									be accessed by following the appropriate link at the left.<br><br><b>Note:</b> The wild card character is <b>*</b>. It can be
                     									substituted for any number of characters at the middle
                     									or back of a word. Please see <a href="../VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
                     									full explanation. 
                  </blockquote>
               </td>
            </tr>
         </table>
         <hr>
         <div id="objectInspector" style="float:left;"></div>
         <form action="/census_search_results" method="get" id="basic_census">
         <input value="PLEASE_TURN_ON_JAVASCRIPT" name="q" id="query" type="hidden">
         <input value="" name="q_dual" id="query_dual" type="hidden">
         <input value="" name="db" id="db" type="hidden">
         <input value="" name="db1" id="db1" type="hidden">
         <input value="" name="db2" id="db2" type="hidden">
         <input value="50" name="rows" type="hidden">
         <input value="0" name="start" type="hidden">
         <input value="no" name="detailed" id="census_interface_marker" type="hidden">
         <input value="please turn on your browsers javascript" name="sort" id="sort" type="hidden">
         
         <table class="search_table" style="margin-left:auto;margin-right:auto;">
               <tr>
                  <td colspan="4" align="center" id="formSubmission"><input value="Initiate Search" id="search_button" type="submit"><input value="Clear" id="reset_button" type="reset"></td>
               </tr>
               <tr>
                  <td id="debugDisplay1" colspan="1"></td>
                  <td id="debugDisplay2" colspan="1"></td>
               </tr>
               <tr>
                  <td align="right">Year:</td>
                  <td class="validate" id="year_cell" align="left"><input checked id="year_1860" value="1860" name="year" type="radio">1860<input id="year_1870" value="1870" name="year" type="radio">1870<input id="year_default" value="both" name="year" type="radio">Both</td>
                  <td align="right">County:</td>
                  <td class="validate" id="county_cell"><input checked id="county_augusta" value="aug" name="county" type="radio">Augusta<input id="county_franklin" value="fr" name="county" type="radio">Franklin</td>
               </tr>
               <tr>
                  <td align="right">Order Results By:</td>
                  <td align="left"><select class="validate" id="result_order">
                        <option selected value="last asc, first asc">Last Name/First Name</option>
                        <option value="family_num asc">Family Units</option>
                        <option value="subdistrict asc, district asc, post_office asc">Location</option></select></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td colspan="4">
                     <hr>
                  </td>
               </tr>
               <tr>
                  <td align="right"><a href="VoS/govdoc/censi/pcensus.html#last"><b>Last name:</b></a></td>
                  <td class="validate" id="last_name_display" align="left"><input class="text" size="20" id="last"><span></span></td>
                  <td align="right"><a href="VoS/govdoc/censi/pcensus.html#first"><b>First name:</b></a></td>
                  <td class="validate" id="first_name_display" align="left"><input class="text" size="20" id="first"><span></span></td>
               </tr>
               <tr>
                  <td align="right">Age:</td>
                  <td class="validate" align="left"><select id="ages-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="age"></td>
                  <td align="right"><a href="VoS/govdoc/censi/pcensus.html#sex"><b>Sex</b></a>:
                  </td>
                  <td class="validate" id="sex_cell" align="left"><input value="sex:m" name="sex" type="radio">male<input value="sex:f" name="sex" type="radio">female</td>
               </tr>
               <tr>
                  <td align="right"><a href="VoS/govdoc/censi/pcensus.html#color"><b>"Color"</b></a>:
                  </td>
                  <td class="validate" id="color_cell" colspan="3" align="left"><input value="color:b" id="cr1" name="colors" type="radio">black<input value="color:w" id="cr2" name="colors" type="radio">white<input value="color:m" id="cr3" name="colors" type="radio">"mulatto"<input value="(color:b OR color:m)" id="cr4" name="colors" type="radio">black
                        									or mulatto</td>
               </tr>
               <tr>
                  <td valign="center" align="right"><a href="../VoS/govdoc/censi/pcensus.html#estate"><b>Real estate value</b></a><br>(in $)
                  </td>
                  <td valign="center" align="left"><select class="validate" id="realests-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="realests"></td>
                  <td valign="center" align="right"><a href="../VoS/govdoc/censi/pcensus.html#estate"><b>Personal estate value</b></a><br>(in $)
                  </td>
                  <td class="validate" valign="center" align="left"><select id="persests-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="persests"></td>
               </tr>
               <tr>
                  <td align="right"><a href="../VoS/govdoc/censi/pcensus.html#occupation"><b>Occupation</b></a>:<br><a href="../VoS/govdoc/alloccs.html">(A list of occupations<br>is
                        									available)</a></td>
                  <td class="validate" align="left"><input class="text" id="occupation"><span></span></td>
                  <td align="right"><b><a href="../VoS/govdoc/censi/pcensus.html#birthplace">Birthplace</a></b>: 
                  </td>
                  <td class="validate" align="left"><input class="text" id="birth_place"><span></span></td>
               </tr>
            </table>
         </form><br><hr width="80%">
         <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
      </div>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>