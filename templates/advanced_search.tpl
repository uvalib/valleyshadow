
<html>
   <head>
      <title>Valley of the Shadow: Population Census Advanced Search</title>
      <style> .red-head {color: #990000; font-family: arial, serif; font-weight: bold }
					.search_table td {padding:10px;}
					.warning{font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} .debug {color:red; background:brown;}
				</style>
				<link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
				<link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
				<script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
				<script src="../VoS/javascript/advanced_census_search.js" type="text/javascript"></script></head>
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
                        <td align="center"><a href="/population_census"><b>Basic Search</b></a></td>
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
                  <center><img src="/VoS/images/images/vtitle4.gif"></center><br><br><h1 class="red-head">
                     <center>Search the 1860 or 1870 U.S. Census - Advanced Search</center>
                  </h1>
                  <blockquote> This page allows you to perform an advanced search on
                     									the 1860 or 1870 U.S. Population Census in either Augusta County, VA or
                     									Franklin County, PA. These searches are separate due to differences in the data
                     									recorded by census-takers. For example, in 1860, census-takers
                     									recorded information about peoples' occupations, their
                     									birthplace, and whether they could read and write. Many of these
                     									questions were asked again in 1870, along with new questions
                     									about peoples' parents, their schooling, and if they were denied
                     									their right to vote. As a result of these differences, two
                     									separate Advanced Search forms have been provided to search the
                     									specific fields for each year.<br><br> This page allows users
                     									to search on all information found in the 1860 census (such as
                     									the dwelling number, rank in household, school attendance,
                     									etc.). If you would like to search only on basic fields found in
                     									the Census (name, age, sex, color, occupation, wealth, and
                     									birthplace) please use the <a href="population_census">Basic Search</a>.<br><br> A basic
                     									search of both years of the Census can be accessed by following
                     									the link at the left.<br><br><b>Note:</b> The wild card character is <b>*</b>. It can be
                     									substituted for any number of characters at the middle,
                     									or back of a word. Please see <b>Tips for Searching</b> for a
                     									full explanation. 
                  </blockquote>
               </td>
            </tr>
         </table>
         <hr>
         <form method="get" action="/advanced_search_results.html" id="advancedSearchForm"><input name="q" id="query" readonly type="hidden"><input value="50" name="rows" readonly type="hidden"><input value="0" name="start" readonly type="hidden"><table class="search_table" style="margin-left:auto;margin-right:auto;">
               <tr>
                  <td colspan="4" align="center"><input value="Initiate Search" id="search_button" type="submit"><input value="Clear" type="reset"></td>
               </tr>
               <tr>
                  <td align="right">Year:</td>
                  <td id="year_cell" align="left"><input checked value="1860" name="year" type="radio">1860<input value="1870" name="year" type="radio">1870</td>
                  <td align="right">County:</td>
                  <td id="county_cell"><input checked value="aug" name="county" type="radio">Augusta<input value="fr" name="county" type="radio">Franklin</td>
               </tr>
               <tr>
                  <td align="right">Order Results By:</td>
                  <td align="left"><select id="result_order">
                        <option value="name">Last Name/First Name</option>
                        <option value="family_num">Family Units</option>
                        <option value="location">Location</option></select></td>
                  <td align="right">View Statistics Only:</td>
                  <td align="left"><input value="true" name="stats" type="checkbox"></td>
               </tr>
               <tr>
                  <td bgcolor="#ffcc99" colspan="4"><b>Personal Information</b></td>
               </tr>
               <tr>
                  <td align="right"><a href="../VoS/govdoc/censi/pcensus.html#last"><b>Last name:</b></a></td>
                  <td align="left"><input size="20" id="last_name"></td>
                  <td align="right"><a href="../VoS/govdoc/censi/pcensus.html#first"><b>First name:</b></a></td>
                  <td align="left"><input size="20" id="first_name"></td>
               </tr>
               <tr>
                  <td align="right">Age:</td>
                  <td align="left"><select id="ages-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="age"><span></span>Age (additional limit):
                     								<select id="ages-op2">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option selected value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="age2"></td>
                  <td align="right"><a href="../VoS/govdoc/censi/pcensus.html#sex"><b>Sex</b></a>:
                  </td>
                  <td id="sex_cell" align="left"><input value="m" name="sex" type="radio">male<input value="f" name="sex" type="radio">female</td>
               </tr>
               <tr>
                  <td align="right"><a href="../VoS/govdoc/censi/pcensus.html#color"><b>"Color"</b></a>:
                  </td>
                  <td id="color_cell" colspan="3" align="left"><input value="color:b" name="colors" type="radio">black<input value="color:w" name="colors" type="radio">white<input value="color:m" name="colors" type="radio">"mulatto"<input value="(color:b OR color:m)" name="colors" type="radio">black
                        									or mulatto</td>
               </tr>
               <tr>
                  <td align="right">Order in Household:</td>
                  <td align="left"><select id="head-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="head_num"></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr>
                  <td valign="center" align="right"><a href="../VoS/govdoc/censi/pcensus.html#estate"><b>Real estate value</b></a><br>(in $)
                  </td>
                  <td valign="center" align="left"><select id="realests-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="realests"></td>
                  <td valign="center" align="right"><a href="../VoS/govdoc/censi/pcensus.html#estate"><b>Personal estate value</b></a><br>(in $)
                  </td>
                  <td valign="center" align="left"><select id="persests-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="persests"></td>
               </tr>
               <tr>
                  <td align="right"><a href="../VoS/govdoc/censi/pcensus.html#occupation"><b>Occupation</b></a>:<br><a href="../VoS/govdoc/alloccs.html">(A list of occupations<br>is
                        									available)</a></td>
                  <td align="left"><input id="occupation"></td>
                  <td align="right"><b><a href="../VoS/govdoc/censi/pcensus.html#birthplace">Birthplace</a></b>: 
                  </td>
                  <td align="left"><input id="birth_place"></td>
               </tr>
               <tr style="display:none;" class="form_1860">
                  <td align="right">Married in Past Year:</td>
                  <td id="married_cell" align="left"><input value=" AND married:yes" name="married" type="radio">Yes<input value=" NOT married:yes" name="married" type="radio">No</td>
                  <td align="right">Attended School in Past Year:</td>
                  <td id="school_cell_1860" align="left"><input value=" AND (school:yes OR school:1)" name="school" type="radio">Yes<input value=" NOT (school:yes OR school:1)" name="school" type="radio">No</td>
               </tr>
               <tr style="display:none;" class="form_1860">
                  <td align="right">Can Read/Write:</td>
                  <td id="readwrite_cell" align="left"><input value=" AND readwrite:yes" name="readwrite" type="radio">Yes<input value=" NOT readwrite:yes" name="readwrite" type="radio">No</td>
                  <td align="right">Handicapped:</td>
                  <td align="left"><select id="handicap_1860">
                        <option></option>
                        <option value=" AND deaf_dumb:ass*">Ass. &amp; Battery</option>
                        <option value=" AND deaf_dumb:blind">Blind</option>
                        <option value=" AND deaf_dumb:cataract">Cataract</option>
                        <option value=" AND deaf_dumb:convict">Convict</option>
                        <option value=" AND deaf_dumb:crip*">Cripple</option>
                        <option value=" AND deaf_dumb:deaf NOT deaf_dumb:dumb">Deaf</option>
                        <option value=" AND deaf_dumb:deaf AND deaf_dumb:dumb">Deaf and Dumb</option>
                        <option value=" AND deaf_dumb:dumb NOT  AND deaf_dumb:deaf">Dumb</option>
                        <option value=" AND deaf_dumb:forgery">Forgery</option>
                        <option value=" AND  AND deaf_dumb:idiot*">Idiotic</option>
                        <option value=" AND deaf_dumb:invalid">Invalid</option>
                        <option value=" AND deaf_dumb:insane">Insane</option>
                        <option value=" AND deaf_dumb:larceny">Larceny</option>
                        <option value=" AND deaf_dumb:lun*">Lunatic</option>
                        <option value=" AND deaf_dumb:mischief">Mischief Malicious</option>
                        <option value=" AND deaf_dumb:pals*">Palsied</option>
                        <option value=" AND deaf_dumb:pauper">Pauper</option>
                        <option value=" AND deaf_dumb:sup*">Supported by Friends</option>
                        <option value=" AND deaf_dumb:weak">Weak</option></select></td>
               </tr>
               <tr style="display:none;" class="form_1870">
                  <td align="right">Month Married:<br>(If married in past year)
                  </td>
                  <td align="left"><select id="marr_month">
                        <option></option>
                        <option value="jan*">January</option>
                        <option value="feb*">February</option>
                        <option value="mar*">March</option>
                        <option value="apr*">April</option>
                        <option value="may">May</option>
                        <option value="jun*">June</option>
                        <option value="jul*">July</option>
                        <option value="aug*">August</option>
                        <option value="sep*">September</option>
                        <option value="oct*">October</option>
                        <option value="nov*">November</option>
                        <option value="dec*">December</option></select></td>
                  <td align="right">Month Born:<br>(If born in past year)
                  </td>
                  <td align="left"><select id="birth_month">
                        <option></option>
                        <option value="jan*">January</option>
                        <option value="feb*">February</option>
                        <option value="mar*">March</option>
                        <option value="apr*">April</option>
                        <option value="may">May</option>
                        <option value="jun*">June</option>
                        <option value="jul*">July</option>
                        <option value="aug*">August</option>
                        <option value="sep*">September</option>
                        <option value="oct*">October</option>
                        <option value="nov*">November</option>
                        <option value="dec*">December</option></select></td>
               </tr>
               <tr style="display:none;" class="form_1870">
                  <td align="right">Attended School:<br>(If attended in past year)
                  </td>
                  <td id="school_cell_1870" align="left"><input value=" AND (school:yes OR school:1)" name="school" type="radio">Yes<input value=" NOT (school:yes OR school:1)" name="school" type="radio">No</td>
                  <td align="right">Handicapped:</td>
                  <td align="left"><select id="handicap_1870">
                        <option></option>
                        <option value=" AND deaf_dumb:ass*">Ass. &amp; Battery</option>
                        <option value=" AND deaf_dumb:blind">Blind</option>
                        <option value=" AND deaf_dumb:cataract">Cataract</option>
                        <option value=" AND deaf_dumb:convict">Convict</option>
                        <option value=" AND deaf_dumb:crip*">Cripple</option>
                        <option value=" AND deaf_dumb:deaf NOT deaf_dumb:dumb">Deaf</option>
                        <option value=" AND deaf_dumb:deaf AND deaf_dumb:dumb">Deaf and Dumb</option>
                        <option value=" AND deaf_dumb:dumb NOT  AND deaf_dumb:deaf">Dumb</option>
                        <option value=" AND deaf_dumb:forgery">Forgery</option>
                        <option value=" AND  AND deaf_dumb:idiot*">Idiotic</option>
                        <option value=" AND deaf_dumb:invalid">Invalid</option>
                        <option value=" AND deaf_dumb:insane">Insane</option>
                        <option value=" AND deaf_dumb:larceny">Larceny</option>
                        <option value=" AND deaf_dumb:lun*">Lunatic</option>
                        <option value=" AND deaf_dumb:mischief">Mischief Malicious</option>
                        <option value=" AND deaf_dumb:pals*">Palsied</option>
                        <option value=" AND deaf_dumb:pauper">Pauper</option>
                        <option value=" AND deaf_dumb:sup*">Supported by Friends</option>
                        <option value=" AND deaf_dumb:weak">Weak</option></select></td>
               </tr>
               <tr style="display:none;" class="form_1870">
                  <td align="right">Can Read:</td>
                  <td id="read_cell" align="left"><input value=" AND read:1" name="read" type="radio">Yes<input value=" NOT read:1" name="read" type="radio">No</td>
                  <td align="right">Can Write:</td>
                  <td id="write_cell" align="left"><input value=" AND write:1" name="write" type="radio">Yes<input value=" NOT write:1" name="write" type="radio">No</td>
               </tr>
               <tr style="display:none;" class="form_1870">
                  <td align="right">Male Over 21:</td>
                  <td id="male_21_cell" align="left"><input value=" AND male_21:1" name="m21" type="radio">Yes<input value=" NOT male_21:1" name="m21" type="radio">No</td>
                  <td align="right">Male Denied Vote:</td>
                  <td id="male_novote_cell" align="left"><input value=" AND male_novote:1" name="mvote" type="radio">Yes<input value=" NOT male_novote:1" name="mvote" type="radio">No</td>
               </tr>
               <tr style="display:none;" class="form_1870">
                  <td bgcolor="#ffcc99" colspan="4"><b>Family Information</b></td>
               </tr>
               <tr style="display:none;" class="form_1870">
                  <td align="right">Foreign Father:</td>
                  <td id="for_father_cell" align="left"><input value=" AND for_father:1" id="for_father" type="radio">Yes<input value=" NOT for_father:1" id="for_father" type="radio">No</td>
                  <td align="right">Foreign Mother:</td>
                  <td id="for_mother_cell" align="left"><input value=" AND for_mother:1" id="for_mother" type="radio">Yes<input value=" NOT for_mother:1" id="for_mother" type="radio">No</td>
               </tr>
               <tr style="display:none;" id="location_label">
                  <td bgcolor="#ffcc99" colspan="4"><b>Location</b></td>
               </tr>
               <tr style="display:none;" class="form_1860">
                  <td align="right">Township:<br><a href="../VoS/govdoc/place.html">A list of place
                        									names is available</a></td>
                  <td align="left"><input size="10" id="subdistrict"></td>
                  <td></td>
                  <td></td>
               </tr>
               <tr style="display:none;" class="form_1870">
                  <td align="right">District:<br><a href="../VoS/govdoc/place.html">A list of place
                        									names is available</a></td>
                  <td align="left"><input size="10" id="district"></td>
                  <td align="right">Post Office:<br><a href="../VoS/govdoc/place.html">A list of place
                        									names is available</a></td>
                  <td align="left"><input size="10" id="post_office"></td>
               </tr>
               <tr>
                  <td bgcolor="#ffcc99" colspan="4"><b>Census Record Information</b></td>
               </tr>
               <tr>
                  <td align="right">Page Number:</td>
                  <td align="left"><select id="page_num-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="page_num"></td>
                  <td align="right">Dwelling Number:</td>
                  <td align="left"><select id="dwelling_num-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="dwelling_num"></td>
               </tr>
               <tr>
                  <td align="right">Family Number:</td>
                  <td align="left"><select id="family_num-op">
                        <option value="gt">&gt;</option>
                        <option value="equal">=</option>
                        <option value="lt">&lt;</option>
                        <option value="not">&lt;&gt;</option></select><input size="6" id="family_num"></td>
               </tr>
            </table>
         </form><br><hr width="80%">
         <center><a href="../VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
      </div>
      <div style="margin-top:20px;margin-bottom:20px;" id="search"></div>
      <div style="width:49%; float:left;margin-top:20px;margin-bottom:20px;margin-right:1%;" id="search1"></div>
      <div style="width:49%; float:left;margin-top:20px;margin-bottom:20px;margin-left:1%" id="search2"></div>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>