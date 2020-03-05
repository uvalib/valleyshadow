<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Franklin County Tax Records Search</title>
      <style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
      <script src="/VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="/VoS/javascript/tax_search.js" type="text/javascript"></script>
      <!-- <script src="/VoS/javascript/generic_search_paging.js" type="text/javascript"></script> -->
	  <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
      <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

	</head>
   <body vlink="#00009C" link="#CD7F32" bgcolor="FFFFFF" text="#000000">
      <div id="no-javascript" style="width:100%;text-align:center;">
         <h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
      </div>
      <div id="form">
         <center>
            <table cellpadding="10">
               <tr>
                  <td valign="center">
                     <table cellpadding="10" width="80%" border="0" bgcolor="#ffcc99">
                        <tr>
                           <td align="center"><a href="/VoS/govdoc/citytax/citytax.intro.html"><b>Information<br>About the Records</b></a></td>
                        </tr>
                        <tr>
                           <td align="center"><a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a></td>
                        </tr>
                     </table>
                  </td>
                  <td>
                     <center><img src="/VoS/images/images/vtitle4.gif"><br><br><p>
                           <h1 class="red-head"> Search the 1860 Augusta or
                              												Franklin County Tax Records
                           </h1>
                        </p>
                     </center>
                     <blockquote> This page allows you to search the 1860 Augusta or
                        										Franklin County Tax Records Census for Staunton, Virginia or
                        										Chambersburg, Pennsylvania, respectively. This page allows
                        										users to search on a number of the fields found in the
                        										agricultural census (such as name, occupation, and various
                        										tax amounts).<br><br></blockquote>
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
            <form method="get" action="/tax_search_results.html" name="taxSearchForm"><input name="q" id="query" type="hidden"><input value="50" name="rows" type="hidden"><input value="0" name="start" type="hidden"><input value="last asc, first asc" name="sort" type="hidden"><table style="width:75%;" cellpadding="10">
                  <tr>
                     <td align="center" colspan="4"><input id="search_button" value="Initiate Search" type="submit"><input value="clear" id="clear_button" type="reset"></td>
                  </tr>
                  <tr>
                     <td id="county_cell">County: <input value="augusta" id="county_default" name="county" type="radio">Augusta<input value="franklin" name="county" type="radio">Franklin</td>
                  </tr>
                  <tr>
                     <td bgcolor="#ffcc99" colspan="4"><b>Personal Information</b></td>
                  </tr>
                  <tr>
                     <td>Last name:</td>
                     <td><input name="last_name"></td>
                     <td>First name:</td>
                     <td><input name="first_name"></td>
                  </tr>
                  <tr style="display:none;" class="franklin_form">
                     <td>Occupation:</td>
                     <td><input name="occupation"></td>
                  </tr>
                  <tr>
                     <td bgcolor="#ffcc99" colspan="4"><b>Tax Information</b></td>
                  </tr>
                  <tr style="display:none;" class="franklin_form">
                     <td>County tax amount:</td>
                     <td><select id="co_tax-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="co_tax"></td>
                     <td>State tax amount:</td>
                     <td><select id="st_tax-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="st_tax"></td>
                  </tr>
                  <tr style="display:none;" class="franklin_form">
                     <td>State personal tax amount:</td>
                     <td><select id="st_per_tax-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="st_per_tax"></td>
                  </tr>
                  <tr style="display:none;" class="augusta_form">
                     <td>Building value:</td>
                     <td><select id="build-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="build"></td>
                     <td>Lot-building value:</td>
                     <td><select id="lot_build-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="lot_build"></td>
                  </tr>
                  <tr style="display:none;" class="augusta_form">
                     <td>Tax amount:</td>
                     <td><select id="tax_amt-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="tax_amt"></td>
                     <td>City tax amount:</td>
                     <td><select id="city_tax_amt-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="city_tax_amt"></td>
                  </tr>
               </table>
            </form>
         </center><br><hr width="80%">
         <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
      </div>
      <div id="search"></div>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
