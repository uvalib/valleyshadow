<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Search the Newspapers</title><style> .highlightme { background-color: yellow; } 
					.noresults { font-size: 16px; margin: 10px 0 10px 0; } 
					.currentShowing { width: 100px; text-align: center; padding: 0 10px 0 10px; } 
					.previousPage { width: 250px; text-align: right; }
					.nextPage { width: 250px; text-align: left; } 
					#resultSummary { padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; border-bottom: 1px solid #c6c6c6; }
					#returnPage { width: 65%; } 
					#topNavig { text-align: center; margin: 5px 0 5px 0;} 
					#bottomNavig { text-align: center; margin: 5px 0 5px 0; } 
					#jumpPages { padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; } 
					#resultReturns { clear: both; } 
					.warning{font-weight:bold; padding:5px; color:#000099;} 
					.red-head {color: #990000; font-family: times, serif; font-weight: bold;} 
				</style>
	  <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
      <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
				<script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
				<script src="../VoS/javascript/newspapers_search.js" type="text/javascript"></script></head>
   <body vlink="#00009C" link="#CD7F32" bgcolor="#FFFFFF">
      <div id="no-javascript" style="width:100%;text-align:center;">
         <h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
      </div>
      <div id="form">
         <center><img border="0" src="/VoS/images/images/vtitle4.gif"><h2 class="red-head">Search the Valley Newspapers</h2>
            <blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
               							substituted for any number of characters at the middle
               							or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
               							full explanation. 
            </blockquote>
            <form action="/newspapers_search_results.html" method="get" name="newspaperSearchForm"><input id="query" name="q" type="hidden"><input value="50" name="rows" type="hidden"><input value="0" name="start" type="hidden"><table width="65%" border="0">
                  <tr>
                     <td>
                        <p><i>By default, all dates and newspapers will be searched. To
                              											limit your search, select specific dates and/or
                              											newspapers.</i></p>
                        <hr>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <p><label>Search for: <input type="text" name="search_text"></label> Sort results by:<select name="sort">
                              <option value="newspaper_date asc">Date (ascending)</option>
                              <option value="newspaper_date desc">Date (decending)</option></select></p>
                        <p><label>Date Range:</label><select style="margin-right:5px" name="start_year">
                              <option value="">Select Year...</option>
                              <option value="1857">1857</option>
                              <option value="1858">1858</option>
                              <option value="1859">1859</option>
                              <option value="1860">1860</option>
                              <option value="1861">1861</option>
                              <option value="1862">1862</option>
                              <option value="1863">1863</option>
                              <option value="1864">1864</option>
                              <option value="1865">1865</option>
                              <option value="1866">1866</option>
                              <option value="1867">1867</option>
                              <option value="1868">1868</option>
                              <option value="1869">1869</option>
                              <option value="1870">1870</option></select><select disabled style="margin-right:5px" name="start_month">
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
                              <option value="12">December</option></select> through <select style="margin-right:5px" name="end_year">
                              <option value="">Select Year...</option>
                              <option value="1857">1857</option>
                              <option value="1858">1858</option>
                              <option value="1859">1859</option>
                              <option value="1860">1860</option>
                              <option value="1861">1861</option>
                              <option value="1862">1862</option>
                              <option value="1863">1863</option>
                              <option value="1864">1864</option>
                              <option value="1865">1865</option>
                              <option value="1866">1866</option>
                              <option value="1867">1867</option>
                              <option value="1868">1868</option>
                              <option value="1869">1869</option>
                              <option value="1870">1870</option></select><select disabled style="margin-right:5px;" name="end_month">
                              <option value="13">Select Month...</option>
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
                              <option value="12">December</option></select><span id="validationField"></span></p><label>Select Newspapers: </label><table cellpadding="3" cellspacing="3" border="0" width="600">
                           <tr>
                              <td width="263"><strong><label>Augusta County Papers</label></strong></td>
                              <td width="316"><strong>Franklin County Papers</strong></td>
                           </tr>
                           <tr>
                              <td><input value="Staunton Vindicator" class="newspaper" type="checkbox">Staunton Vindicator
                                    												(1859-1870)</td>
                              <td><input value="Franklin Repository" class="newspaper" type="checkbox">Franklin Repository
                                    												(1859-1870)</td>
                           </tr>
                           <tr>
                              <td><input value="Staunton Spectator" class="newspaper" type="checkbox"> Staunton Spectator
                                    												(1857-1870)</td>
                              <td><input value="Semi-Weekly Dispatch" class="newspaper" type="checkbox"> Semi-Weekly
                                    												Dispatch (1861-1862)</td>
                           </tr>
                           <tr>
                              <td><input value="Valley Virginian" class="newspaper" type="checkbox"> Valley Virginian
                                    												(1865-1870)</td>
                              <td><input value="Valley Spirit" class="newspaper" type="checkbox"> Valley Spirit
                                    												(1859-1870)</td>
                           </tr>
                           <tr>
                              <td></td>
                              <td><input value="Waynesboro Village Record" class="newspaper" type="checkbox"> Waynesboro
                                    												Village Record (1863)</td>
                           </tr>
                        </table>
                        <p><input name="search_button" value="Search" type="submit" id="search_button"><input id="clear_button" value="Reset" type="reset"></p>
                        <p><label></label></p>
                     </td>
                  </tr>
               </table>
            </form>
         </center>
         <hr><br><center><a href="/VoS/choosepart.html"><img alt="Full Valley Archive" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
      </div>
      <div id="search"></div>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>