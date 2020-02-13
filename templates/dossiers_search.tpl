<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Soldiers' Records Search</title><style> .red-head {color: #990000; font-family: times, serif; font-weight: bold; } .warning{font-weight:bold; padding:5px; color:#000099;}
				</style><script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
				<script src="../VoS/javascript/dossiers_search.js" type="text/javascript"></script>
				<script src="../VoS/javascript/generic_search_paging.js" type="text/javascript"></script></head>
   	  <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
      <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

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
                        <td align="center"><a href="../VoS/cwdossier1.html"><b>Return to Soldier's Records Home</b></a></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="veteran"><b>1890 U.S. Veterans Census</b></a><br></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a><br></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/aboutsoldiers.html"><b>More Information About the Records</b></a></td>
                     </tr>
                  </table>
               </td>
               <td>
                  <center><img src="../VoS/OR/combo.gif"></center><br><p>
                     <h1 class="red-head"><b>
                           <center> Search the Soldiers' Records </center></b></h1>
                  </p>
                  <blockquote> The soldiers' records in the database are those ONLY of
                     									Augusta and Franklin soldiers. This database does not include
                     									every man in the regiment or company, but only those from
                     									Augusta or Franklin. Queries of regimental or company statistics
                     									should not be treated as complete, but only representative of
                     									what happened to the men from Augusta and Franklin.<br><br></blockquote>
                  <blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
                     									substituted for any number of characters at the middle
                     									or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
                     									full explanation.
                  </blockquote>
               </td>
            </tr>
         </table>
         <hr>
         <form method="get" action="/dossiers_search_results.html" name="dossiersSearchForm"><input name="q" id="query" type="hidden"><input value="50" name="rows" type="hidden"><input value="0" name="start" type="hidden"><center>
               <p>Order Results By: <select name="sort">
                     <option value="last asc, first asc">Last Name, First Name</option>
                     <option value="year_enl asc, month_enl asc, day_enl asc, regiment asc">Date Enlisted, Unit</option></select><input class="search_button" value="Initiate Search" type="submit"><input value="Clear" type="reset"></p>
               <p><b>County:</b><span name="county_cell"><input checked value="augusta" name="county" type="radio">Augusta<input value="franklin" name="county" type="radio">Franklin</span></p>
               <table border="0" cellpadding="10">
                  <tr>
                     <td colspan="4" valign="center" bgcolor="#ffcc99"><font class="red-head">Name</font></td>
                  </tr>
                  <tr>
                     <td align="right"><b>Last name:</b></td>
                     <td align="left"><input size="20" name="last_name"></td>
                     <td align="right"><b>First name:</b></td>
                     <td align="left"><input size="20" name="first_name"></td>
                  </tr>
                  <tr bgcolor="#ffcc99">
                     <td colspan="4" valign="center" bgcolor="#ffcc9"><font class="red-head">Enlistment Information</font></td>
                  </tr>
                  <tr>
                     <td align="right"><b>Date Enlisted:</b></td>
                     <td align="left"><select name="date">
                           <option></option>
                           <option value="1860">1860</option>
                           <option value="1861">1861</option>
                           <option value="1862">1862</option>
                           <option value="1863">1863</option>
                           <option value="1864">1864</option>
                           <option value="1865">1865</option></select></td>
                     <td align="right"><b>Place Enlisted:</b></td>
                     <td align="left"><input size="20" name="place_enl"></td>
                  </tr>
                  <tr>
                     <td align="right"><b>Age at Enlistment:</b></td>
                     <td align="left"><select id="age_enl-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="age_enl"></td>
                     <td align="right"><b>Occupation at Enlistment:</b></td>
                     <td align="left"><input size="20" name="occ_enl"></td>
                  </tr>
                  <tr>
                     <td bgcolor="#ffcc99" colspan="4"><font class="red-head">Service Information</font></td>
                  </tr>
                  <tr>
                     <td valign="top" align="right"><b>Regiment:</b></td>
                     <td valign="top" align="left"><select name="regiment">
                           <option class="reg" value="">all</option>
                           <option class="other_reg" value="other">other</option>
                           <option class="reg"></option>
                           <option class="reg" value="5th Va. Inf.">5th Va. Inf.</option>
                           <option class="reg" value="52nd Va. Inf.">52nd Va. Inf.</option>
                           <option class="reg" value="14th Va. Cav.">14th Va. Cav.</option>
                           <option class="reg" value="1st Va. Cav.">1st Va. Cav.</option>
                           <option class="reg" value="Staunton Artillery">Staunton Artillery</option>
                           <option class="reg"></option>
                           <option class="reg" value="77th Pa.">77th Pa.</option>
                           <option class="reg" value="107th Pa.">107th Pa.</option>
                           <option class="reg" value="126th Pa.">126th Pa.</option>
                           <option class="reg" value="158th Pa.">158th Pa.</option>
                           <option class="reg" value="182nd Pa">182nd Pa.</option>
                           <option class="reg" value="U.S.C.T.">U.S.C.T.</option></select></td>
                     <td valign="top" align="right"><b>Other Regiments</b><br>(please select
                        								"other" in the<br>regiment box to the left):
                     </td>
                     <td valign="top" align="left"><input disabled size="20" name="other_rgmnt"></td>
                  </tr>
                  <tr>
                     <td valign="top" align="right"><b>Company:</b></td>
                     <td valign="top" align="left"><select name="company">
                           <option></option>
                           <option value="A">A</option>
                           <option value="B">B</option>
                           <option value="C">C</option>
                           <option value="D">D</option>
                           <option value="E">E</option>
                           <option value="F">F</option>
                           <option value="G">G</option>
                           <option value="H">H</option>
                           <option value="I">I</option>
                           <option value="J">J</option>
                           <option value="K">K</option>
                           <option value="L">L</option>
                           <option value="M">M</option></select></td>
                     <td></td>
                     <td></td>
                  </tr>
                  <tr>
                     <td valign="top" align="right"><b>Rank:</b></td>
                     <td valign="top" align="left"><select name="rank">
                           <option class="rank"></option>
                           <option class="other_rank" value="other">other</option>
                           <option class="rank" value="Col.">Col.</option>
                           <option class="rank" value="Lt. Col.">Lt. Col.</option>
                           <option class="rank" value="Capt.">Capt.</option>
                           <option class="rank" value="Maj.">Maj.</option>
                           <option class="rank" value="1st Lt.">1st Lt.</option>
                           <option class="rank" value="2nd Lt.">2nd Lt.</option>
                           <option class="rank" value="Sgt.">Sgt.</option>
                           <option class="rank" value="Cpl.">Cpl.</option>
                           <option class="rank" value="Pvt.">Pvt.</option></select></td>
                     <td valign="top" align="right"><b>Other Rank</b><br>(please select
                        								"other" in the<br>rank box to the left):
                     </td>
                     <td valign="top" align="left"><input disabled name="other_rank"></td>
                  </tr>
                  <tr>
                     <td bgcolor="#ffcc99" colspan="4"><font class="red-head">Military Records</font></td>
                  </tr>
                  <tr>
                     <td align="right"><b>Casualties:</b></td>
                     <td align="left"><select name="casualty">
                           <option class="other_casualty"></option>
                           <option class="casualty" value="dead_wounds">died of wounds</option>
                           <option class="casualty" value="dead_disease">died of disease</option>
                           <option class="casualty" value="mia">missing in action</option>
                           <option class="casualty" value="wia">wounded in action</option>
                           <option class="casualty" value="kia_place">killed in action</option></select></td>
                     <td align="right"><b>Personal Events:</b></td>
                     <td align="left"><select name="pers_ev_type">
                           <option class="other_pers_ev_type"></option>
                           <option class="pers_ev_type" value="desertion">deserted</option>
                           <option class="pers_ev_type" value="awol">AWOL</option>
                           <option class="pers_ev_type" value="capture">captured</option>
                           <option class="pers_ev_type" value="prisoner">imprisoned</option></select></td>
                  </tr>
                  <tr>
                     <td align="right"><b>Casualty Year:</b></td>
                     <td align="left"><select disabled id="cas_year-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input disabled size="6" name="cas_year"></td>
                     <td align="right"><b>Personal Event Year:</b></td>
                     <td align="left"><select disabled id="pers_ev-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input disabled size="6" name="pers_ev"></td>
                  </tr>
                  <tr>
                     <td align="right"><b>Military Record:</b></td>
                     <td align="left"><select name="mil_rec">
                           <option class="other_mil_rec"></option>
                           <option class="mil_rec" value="hospital_record">Hospitalized</option>
                           <option class="mil_rec" value="promotions">Promoted</option>
                           <option class="mil_rec" value="transfers">Transferred</option></select></td>
                     <td align="right"><b>Military Record Year:</b></td>
                     <td align="left"><input disabled size="5" name="mil_rec_date"></td>
                  </tr>
                  <tr>
                     <td align="right"><b>Place:</b></td>
                     <td align="left"><select name="mil_rec_place">
                           <option class="mil_rec_place"></option>
                           <option class="other_mil_rec_place" value="other">other</option>
                           <option class="mil_rec_place" value="Andersonville">Andersonville</option>
                           <option class="mil_rec_place" value="Antietam">Antietam</option>
                           <option class="mil_rec_place" value="Appomattox">Appomattox</option>
                           <option class="mil_rec_place" value="Cedar Creek">Cedar Creek</option>
                           <option class="mil_rec_place" value="Cedar Mountain">Cedar Mountain</option>
                           <option class="mil_rec_place" value="Chambersburg">Chambersburg</option>
                           <option class="mil_rec_place" value="Chancellorsville">Chancellorsville</option>
                           <option class="mil_rec_place" value="Cross Keys">Cross Keys</option>
                           <option class="mil_rec_place" value="Fisher's Hill">Fisher's Hill</option>
                           <option class="mil_rec_place" value="Fort Pillow ">Fort Pillow </option>
                           <option class="mil_rec_place" value="Fredericksburg">Fredericksburg</option>
                           <option class="mil_rec_place" value="Gettysburg">Gettysburg</option>
                           <option class="mil_rec_place" value="Harper's Ferry">Harper's Ferry</option>
                           <option class="mil_rec_place" value="Malvern Hill">Malvern Hill</option>
                           <option class="mil_rec_place" value="Manassas">Manassas</option>
                           <option class="mil_rec_place" value="Milliken's Bend">Milliken's Bend</option>
                           <option class="mil_rec_place" value="Petersburg">Petersburg</option>
                           <option class="mil_rec_place" value="Port Republic">Port Republic</option>
                           <option class="mil_rec_place" value="Richmond">Richmond</option>
                           <option class="mil_rec_place" value="Valley">Valley</option>
                           <option class="mil_rec_place" value="Wilderness">Wilderness</option>
                           <option class="mil_rec_place" value="Winchester">Winchester</option></select></td>
                     <td valign="top" align="right"><b>Other Place: </b><br>(please select "other"<br>in the place box on the left)
                     </td>
                     <td align="left"><input disabled size="20" name="other_place"></td>
                  </tr>
               </table>
            </center><br><br><center><input class="search_button" value="Initiate Search" type="submit"><input value="Clear" type="reset"></center><br><hr width="80%">
            <center><a href="/VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
         </form>
      </div>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
