<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Agricultural Census Search</title><style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} </style>
	  <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
      <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

      <script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="/VoS/javascript/ag_census_search.js" type="text/javascript"></script>
    </head>
   <body bgcolor="FFFFFF" >
      <div id="no-javascript" style="width:100%;text-align:center;">
         <h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
      </div>
      <div id="form">
         <center>
            <table cellpadding="10">
               <tr>
                  <td valign="center">
                     <table cellpadding="10" width="80%" border="0" bgcolor="#416d83">
                        <tr>
                           <td align="center"><a id="search_page_infolinks_white" href="/VoS/govdoc/censi/acensus.html"><b>Information<br>About the Census</b></a></td>
                        </tr>
                        <tr>
                           <td align="center"><a id="search_page_infolinks_white" href="/VoS/reference/tips.html"><b>Tips for Searching</b></a></td>
                        </tr>
                        <tr>
                           <td align="center"><a id="search_page_infolinks_white" href="/VoS/govdoc/censi/census_new.html"><b>Return to<br>Census Home</b></a></td>
                        </tr>
                     </table>
                  </td>
                  <td>
                     <center><img src="/VoS/images/images/vtitle4.gif"><br><br><h1 class="red-head"> Search the U.S. Agricultural
                           											Census
                        </h1>
                     </center>
                     <blockquote> This page allows you to search the 1860 or 1870 U.S.
                        										Agricultural Census in either Augusta County, VA or Franklin
                        										County, PA. This page only allows users to search on all
                        										information found in the agricultural census (such as name
                        										of owner, acreage, location of farm, and production values).<br><br></blockquote>
                     <blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
                        										substituted for any number of characters at the middle
                        										or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
                        										full explanation.
                     </blockquote>
                  </td>
               </tr>
            </table>
         </center>
         <hr>
         <center>
            <form method="get" action="/ag_census_search_results.html" name="ag_censusSearchForm" id="ag_censusSearchForm"><input name="q" id="query" type="hidden"><input value="50" name="rows" type="hidden"><input value="0" name="start" type="hidden"><input value="last asc, first asc" name="sort" type="hidden"><table cellpadding="10">
                  <tr>
                     <td align="center" colspan="4"><input id="search_button" value="Initiate Search" type="submit"><input value="clear" type="reset"></td>
                  </tr>
                  <tr>
                     <td align="right">County:</td>
                     <td id="county_cell"><input checked value="aug" name="county" type="radio">Augusta<input value="fr" name="county" type="radio">Franklin</td>
                     <td align="right">Year:</td>
                     <td id="year_cell"><input checked value="60" name="year" type="radio">1860<input value="70" name="year" type="radio">1870</td>
                  </tr>
                  <tr bgcolor="#416d83">
                     <td colspan="4" valign="center" bgcolor="#416d83" id="search_page_infolinks_white">Ownership</td>
                  </tr>
                  <tr>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#last">Last name</a>:
                     </td>
                     <td align="left"><input size="25" name="last_name"></td>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#first">First name</a>:
                     </td>
                     <td align="left"><input size="25" name="first_name"></td>
                  </tr>
                  <tr bgcolor="#416d83">
                     <td colspan="4" valign="center" bgcolor="#416d83" id="search_page_infolinks_white">Real Estate</td>
                  </tr>
                  <tr>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#land">Total
                           									Acres of Land</a>:
                     </td>
                     <td><select name="no_tot_land-op">
                           <option>=</option>
                           <option>&gt;</option>
                           <option>&lt;</option>
                           <option>&lt;&gt;</option></select><input size="6" name="no_tot_land"></td>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#farm">Farm
                           									Value</a>:
                     </td>
                     <td><select name="farm_val-op">
                           <option>=</option>
                           <option>&gt;</option>
                           <option>&lt;</option>
                           <option>&lt;&gt;</option></select><input size="6" name="farm_val"></td>
                  </tr>
                  <tr bgcolor="#416d83">
                     <td colspan="4" valign="center" bgcolor="#416d83" id="search_page_infolinks_white">Crops</td>
                  </tr>
                  <tr>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#tobacco">Total pounds of tobacco</a>:
                     </td>
                     <td><select name="no_tobacco-op">
                           <option>=</option>
                           <option>&gt;</option>
                           <option>&lt;</option>
                           <option>&lt;&gt;</option></select><input size="6" name="no_tobacco"></td>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#tobacco">Total bushels of grain</a>:
                     </td>
                     <td><select name="no_tot_grain-op">
                           <option>=</option>
                           <option>&gt;</option>
                           <option>&lt;</option>
                           <option>&lt;&gt;</option></select><input size="6" name="no_tot_grain"></td>
                  </tr>
                  <tr bgcolor="#416d83">
                     <td colspan="4" valign="center" bgcolor="#416d83" id="search_page_infolinks_white">Animals</td>
                  </tr>
                  <tr>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#livestock">Cash value of livestock</a>:
                     </td>
                     <td><select name="tot_livestock-op">
                           <option>=</option>
                           <option>&gt;</option>
                           <option>&lt;</option>
                           <option>&lt;&gt;</option></select><input size="6" name="tot_livestock"></td>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#animals">Total animals</a>:
                     </td>
                     <td><select name="no_tot_animals-op">
                           <option>=</option>
                           <option>&gt;</option>
                           <option>&lt;</option>
                           <option>&lt;&gt;</option></select><input size="6" name="no_tot_animals"></td>
                  </tr>
                  <tr bgcolor="#416d83">
                     <td colspan="4" valign="center" bgcolor="#416d83" id="search_page_infolinks_white">Manufacturing</td>
                  </tr>
                  <tr>
                     <td align="right"><a id="search_page_infolinks" href="/VoS/govdoc/censi/acensus.html#home">Cash
                           									Value of Home Manufacturing</a>:
                     </td>
                     <td><select name="no_manu-op">
                           <option>=</option>
                           <option>&gt;</option>
                           <option>&lt;</option>
                           <option>&lt;&gt;</option></select><input size="6" name="no_manu"></td>
                  </tr>
               </table>
            </form>
         </center><br><hr width="80%">
         <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
      </div>
      <div id="search"></div>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
