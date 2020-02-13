<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <title>Valley of the Shadow: Slaveowners Census Search</title>
      <style> 
      	.red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} 
	</style>
			<script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript">
				</script><script src="../VoS/javascript/slave_census_search.js" type="text/javascript"></script>
				<script src="../VoS/javascript/generic_search_paging.js" type="text/javascript"></script>
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
                        <td align="center"><a href="../VoS/govdoc/censi/slcensus.html"><b>Information <br>About the Census</b></a></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/reference/tips.html"><b>Tips for Searching</b></a><br></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/govdoc/censi/census_new.html"><b>Return to <br> Census Home</b></a></td>
                     </tr>
                  </table>
               </td>
               <td>
                  <center><img src="/VoS/images/images/vtitle4.gif"></center><br><br><p>
                     <h1 class="red-head"><b>
                           <center> Search the U.S. Slaveowners Census for 1860
                              											
                           </center></b></h1>
                  </p>
                  <blockquote> In Augusta County the slaveowner census counted the
                     									number of slaves, their gender and color, but did not record
                     									their names. Instead, the census recorded the owners' names. You
                     									will find other information including employers of slaves and
                     									the location of the plantation. 
                  </blockquote>
                  <blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
                     									substituted for any number of characters at the middle
                     									or back of a word. Please see <a href="../VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
                     									full explanation. 
                  </blockquote>
               </td>
            </tr>
         </table>
         <hr>
         <center>
            <form method="get" action="/slave_census_search_results.html" name="slaveCensusSearchForm" id="slaveCensusSearchForm"><input name="q" id="query" type="hidden"><input value="50" name="rows" type="hidden"><input value="0" name="start" type="hidden"><input value="last asc, first asc" name="sort" type="hidden"><table cellpadding="10">
                  <tr>
                     <td colspan="2" align="right"><input id="search_button" value="Initiate Search" type="submit"></td>
                     <td align="left" colspan="2"><input value="Clear" type="reset"></td>
                  </tr>
                  <tr bgcolor="#ffcc99">
                     <td colspan="4" valign="center" bgcolor="#ffcc99"><font class="red-head">Basic Information</font></td>
                  </tr>
                  <tr>
                     <td align="right"><a href="../VoS/govdoc/censi/slcensus.html#name"><b>Last Name</b></a>:
                     </td>
                     <td align="left"><input id="last_name" name="last_name"></td>
                     <td align="right"><a href="../VoS/govdoc/censi/slcensus.html#name"><b>First Name</b></a>:
                     </td>
                     <td align="left"><input id="first_name" name="first_name"></td>
                  </tr>
                  <tr>
                     <td align="right">Location:</td>
                     <td align="left"><input id="location" name="location"></td>
                  </tr>
                  <tr>
                     <td align="right"><a href="../VoS/govdoc/censi/slcensus.html#employer"><b>Employer Name</b></a>:
                     </td>
                     <td align="left"><input id="emp_name" name="emp_name"></td>
                     <td align="right">Employer Location:</td>
                     <td align="left"><input id="emp_location" name="emp_location"></td>
                  </tr>
                  <tr bgcolor="#ffcc99">
                     <td colspan="4" valign="center" bgcolor="#ffcc99"><font class="red-head">Slave Information</font></td>
                  </tr>
                  <tr>
                     <td align="right"><a href="../VoS/govdoc/censi/slcensus.html#number"><b>Total number of slaves</b></a>:
                     </td>
                     <td align="left"><select name="tot_slaves-op" id="tot_slaves-op">
                           <option value="equal">=</option>
                           <option value="gt">&gt;</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" id="tot_slaves" name="total_slaves"></td>
                  </tr>
                  <tr>
                     <td align="right">Number of Male Slaves:</td>
                     <td align="left"><select name="male_slaves-op" id="male_slaves-op">
                           <option value="equal">=</option>
                           <option value="gt">&gt;</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" id="male_slaves" name="male_slaves"></td>
                     <td align="right">Number of Female Slaves:</td>
                     <td align="left"><select name="female_slaves-op" id="female_slaves-op">
                           <option value="equal">=</option>
                           <option value="gt">&gt;</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" id="female_slaves" name="female_slaves"></td>
                  </tr>
                  <tr>
                     <td align="right">Number of Black Slaves:</td>
                     <td align="left"><select name="black_slaves-op" id="black_slaves-op">
                           <option value="equal">=</option>
                           <option value="gt">&gt;</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" id="black_slaves" name="black_slaves"></td>
                     <td align="right">Number of Mulatto Slaves:</td>
                     <td align="left"><select name="mulatto_slaves-op" id="mulatto_slaves-op">
                           <option value="equal">=</option>
                           <option value="gt">&gt;</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" id="mulatto_slaves" name="mulatto_slaves"></td>
                  </tr>
               </table>
            </form>
         </center><br><hr width="80%">
         <center><a href="../VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
      </div>
      <div id="search"></div>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>