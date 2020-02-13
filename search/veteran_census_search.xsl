<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: 1890 Veterens Census Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold;} .warning{font-weight:bold; padding:5px; color:#000099;} 
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/veteran_search.js"/>
			</head>
			<body TEXT="#000000" BGCOLOR="FFFFFF" LINK="#CD7F32" VLINK="#00009C">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<!-- Table which contains navigation table and intro material -->
				<div id="form">
					<table>
						<tr>
							<td valign="center">

								<!-- Table containing navigation tools -->
								<table bgcolor="#ffcc99" border="0" width="80%" cellpadding="10">
									<tr>
										<td align="center">
											<a href="VoS/veterans1.html">
												<b>Return to<br/> Census and<br/> Veterans Home</b>
											</a>
										</td>
									</tr>

									<tr>
										<td align="center">
											<a href="VoS/reference/tips.html">
												<b>Tips for Searching</b>
											</a>
											<br/>
										</td>
									</tr>
								</table>

							</td>
							<td>
								<center>
									<img src="/VoS/images/images/vtitle4.gif"/>
								</center>
								<br/>
								<br/>

								<p>
									<h1 class="red-head">
										<b>
											<center> Search the 1890 Veterans Census Records
											</center>
										</b>
									</h1>
								</p>

								<blockquote>
									<p>The 1890 U.S. Veterans Census Database allows users to search
										for information about veterans and widows from Augusta
										County, Virginia, and Franklin County, Pennsylvania, who
										were living in the two counties in 1890. Users may search by
										name, residence, rank during the war, regiment, and other
										criteron. Please note that the 1890 U.S. Veterans Census
										Database only includes veterans and widows who were living
										in the Augusta County or Franklin County in 1890. It is
										therefore not a complete list of all Augusta or Franklin
										County men who served in the war.</p>
									<p>You can search the database by name or regiment. </p>
								</blockquote>
								<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle
									or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
									full explanation. </blockquote>
							</td>
						</tr>
					</table>

					<hr/>
					<center>
						<form method="get" name="veteranSearch" action="veteran_search_results.html">
							<input type="hidden" id="query" name="q"/>
							<input type="hidden" name="rows" value="50"/>
							<input type="hidden" name="start" value="0"/>
							<input type="hidden" name="db" value="vet_census_aug_90"/>
							<input type="hidden" name="sort" value="last asc, first asc"/>
						<table cellpadding="10">
							<tr>
								<td align="center" colspan="4">
									<input type="submit" value="Initiate Search" id="search_button"/>
									<input type="reset" value="Clear"/>
								</td>
							</tr>

							<tr>
								<td align="center" colspan="4" id="county_cell"> County:<input
										type="radio" name="county" value="augusta" id="county_default">Augusta</input><input
										type="radio" name="county" value="franklin">Franklin</input>
								</td>
							</tr>

							<tr>
								<td colspan="4" bgcolor="#ffcc99" align="left">
									<b>Personal Information</b>
								</td>
							</tr>

							<tr>
								<td align="right">Last Name:</td>
								<td>
									<input class="textField" name="last_name"/>
								</td>
								<td align="right">First Name:</td>
								<td>
									<input class="textField" name="first_name"/>
								</td>

							</tr>

							<tr>
								<td align="right">Location: Township Residence in 1890:</td>
								<td align="left">
									<select name="location">
										<option value="[* TO *]">All Townships</option>
										<option value="Augusta County Jail">Augusta County Jail,
											Augusta County</option>
										<option value="Beverly Manor District">Beverly Manor
											District, Augusta County</option>
										<option value="Middle River Mg. District">Middle River Mg.
											District, Augusta County</option>
										<option value="North River District">North River District,
											Augusta County</option>
										<option value="Pastures District">Pastures District, Augusta
											County</option>
										<option value="Riverheads District">Riverheads District,
											Augusta County</option>
										<option value="South River District">South River District,
											Augusta County</option>
										<option value="Ward No. 1 Staunton">Ward No. 1 Staunton,
											Augusta County</option>
										<option value="Ward No. 2 Staunton">Ward No. 2 Staunton,
											Augusta County</option>
										<option value="Western Lunatic Asylum">Western Lunatic
											Asylum, Augusta County</option>
										<option value="Antrim Tshp">Antrim Tshp., Franklin County</option>
										<option value="Chambersburg">Chambersburg, Franklin County</option>
										<option value="Fannett Tshp">Fannett Tshp., Franklin County</option>
										<option value="Greencastle">Greencastle, Franklin County</option>
										<option value="Greene Tshp.">Greene Tshp., Franklin County</option>
										<option value="Guilford Tshp.">Guilford Tshp., Franklin
											County</option>
										<option value="Hamilton Tshp.">Hamilton Tshp., Franklin
											County</option>
										<option value="Letterkenny Tshp.">Letterkenny Tshp.,
											Franklin County</option>
										<option value="Lurgan Tshp.">Lurgan Tshp., Franklin County</option>
										<option value="Metal Tshp.">Metal Tshp., Franklin County</option>
										<option value="Montgomery Tshp.">Montgomery Tshp., Franklin
											County</option>
										<option value="Peters Tshp.">Peters Tshp., Franklin County</option>
										<option value="Quincy Tshp.">Quincy Tshp., Franklin County</option>
										<option value="Rouzerville">Rouzerville, Franklin County</option>
										<option value="Southampton Tshp.">Southampton Tshp.,
											Franklin County</option>
										<option value="St. Thomas Tshp.">St. Thomas Tshp., Franklin
											County</option>
										<option value="Trugan Tshp.">Trugan Tshp., Franklin County</option>
										<option value="Warren Tshp.">Warren Tshp., Franklin County</option>
										<option value="Washington Tshp.">Washington Tshp., Franklin
											County</option>
										<option value="Waynesboro">Waynesboro Tshp., Franklin County</option>
										<option value="Welsh Run District">Welsh Run District,
											Franklin County</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="4" bgcolor="#ffcc99" align="left">
									<b>Military Record</b>
								</td>
							</tr>
							<tr>
								<td align="right">Rank:</td>
								<td align="left">
									<select name="rank" size="6">
										<option/>
										<option value="1-4 Gunner">1-4 Gunner</option>
										<option value="1st Cpl.">1st Cpl.</option>
										<option value="1st Lt.">1st Lt.</option>
										<option value="1st Lt.-Capt.">1st Lt.-Capt.</option>
										<option value="1st Lt.; Asst. Surgeon">1st Lt.; Asst.
											Surgeon</option>
										<option value="1st Sgt.">1st Sgt.</option>
										<option value="2nd Lt.">2nd Lt.</option>
										<option value="2nd Sgt.">2nd Sgt.</option>
										<option value="3rd Cpl.">3rd Cpl.</option>
										<option value="3rd Sgt.">3rd Sgt.</option>
										<option value="4th Sgt.">4th Sgt.</option>
										<option value="6th Cpl.">6th Cpl.</option>
										<option value="7th Cpl.">7th Cpl.</option>
										<option value="Artificer">Artificer</option>
										<option value="Asst. Surgeon">Asst. Surgeon</option>
										<option value="Bugler">Bugler</option>
										<option value="Capt.">Capt.</option>
										<option value="Capt., AAG staff">Capt., AAG staff</option>
										<option value="Chaplain">Chaplain</option>
										<option value="Chief Musician">Chief Musician</option>
										<option value="Col.">Col.</option>
										<option value="Cpl.">Cpl.</option>
										<option value="Drummer">Drummer</option>
										<option value="Engineer">Engineer</option>
										<option value="Ferrier">Ferrier</option>
										<option value="Hosp. Steward">Hosp. Steward</option>
										<option value="Lance Cpl.">Lance Cpl.</option>
										<option value="Lt.">Lt.</option>
										<option value="Lt. Col.">Lt. Col.</option>
										<option value="Maj.">Maj.</option>
										<option value="Maj. Sgt.">Maj. Sgt.</option>
										<option value="Maj. Surgeon">Maj. Surgeon</option>
										<option value="Musician">Musician</option>
										<option value="Officer">Officer</option>
										<option value="Paymaster">Paymaster</option>
										<option value="Pvt.">Pvt.</option>
										<option value="QM Sgt.">QM Sgt.</option>
										<option value="Seaman">Seaman</option>
										<option value="Sgt.">Sgt.</option>
										<option value="Sgt. &amp; Lt.">Sgt. &amp; Lt.</option>
										<option value="Sgt. Maj.">Sgt. Maj.</option>
										<option value="Sol.">Sol.</option>
										<option value="Surgeon">Surgeon</option>
										<option value="[]">[]</option>
										<option value="[] Lt.">[] Lt.</option>
										<option value="1st Lieut.">1st Lieut.</option>
										<option value="CSA Sol.">CSA Sol.</option>
										<option value="Corp.">Corp.</option>
										<option value="Pvt.">Pvt.</option>
										<option value="Sgt.">Sgt.</option>
										<option value="US Sol.">US Sol.</option>
									</select>
								</td>

								<td align="right">Company:</td>
								<td align="left">
									<input name="company" class="textField" size="25"/>
								</td>
							</tr>
							<tr>
								<td align="right">Regiment:</td>
								<td align="left">
									<select type="text" size="6" name="regiment">
										<option value=""/>
										<option value="11th Pa. Cavalry">11th Pa. Cavalry</option>
										<option value="11th W.Va. Inf.">11th W.Va. Inf.</option>
										<option value="150th Ill. Inf.">150th Ill. Inf.</option>
										<option value="16th M. Guard">16th M. Guard</option>
										<option value="16th U.S. Inf.">16th U.S. Inf.</option>
										<option value="1st Md. Inf.">1st Md. Inf.</option>

										<option value="1st N.Y. Cavalry">1st N.Y. Cavalry</option>
										<option value="1st Ohio Inf.">1st Ohio Inf.</option>
										<option value="1st W.Va. Cavalry">1st W.Va. Cavalry</option>
										<option value="21st N.Y. Volunteers">21st N.Y. Volunteers</option>
										<option value="21st Ohio Inf.">21st Ohio Inf.</option>
										<option value="31st U.S. Volunteers">31st U.S. Volunteers</option>
										<option value="36th Ind. Volunteers">36th Ind. Volunteers</option>
										<option value="3rd Md. Cavalry">3rd Md. Cavalry</option>
										<option value="4th Reg. Inf.">4th Reg. Inf.</option>

										<option value="51st Pa. Inf.">51st Pa. Inf.</option>
										<option value="5th Regular Cavalry">5th Regular Cavalry</option>
										<option value="5th U.S. Reg.">5th U.S. Reg.</option>
										<option value="63rd W.Va. Inf.">63rd W.Va. Inf.</option>
										<option value="6th Ohio Cavalry">6th Ohio Cavalry</option>
										<option value="6th W.Va. Inf.">6th W.Va. Inf.</option>
										<option value="77th Pa.">77th Pa.</option>
										<option value="79th Ill. Inf.">79th Ill. Inf.</option>
										<option value="81st N.Y. Volunteers">81st N.Y. Volunteers</option>

										<option value="A H B">A H B</option>
										<option value="Engineer Corps">Engineer Corps</option>
										<option value="NJ Volunteers">NJ Volunteers</option>
										<option value="U.S. Artillery">U.S. Artillery</option>
										<option value="'3rd Md. Cav.">'3rd Md. Cav.</option>
										<option value="'79th Pa.">'79th Pa.</option>
										<option value="100">100</option>
										<option value="100th Day Inf.">100th Day Inf.</option>
										<option value="100th Day Pa.">100th Day Pa.</option>

										<option value="100th Ill.">100th Ill.</option>
										<option value="100th Pa.">100th Pa.</option>
										<option value="100th Pa. Vet.">100th Pa. Vet.</option>
										<option value="100th Pa. Vet.  Inf.">100th Pa. Vet. Inf.</option>
										<option value="101st Pa.">101st Pa.</option>
										<option value="102nd Pa.">102nd Pa.</option>
										<option value="102nd Pa. Vet.">102nd Pa. Vet.</option>
										<option value="102nd Pa. Vet. Inf.">102nd Pa. Vet. Inf.</option>
										<option value="103rd Ill">103rd Ill</option>

										<option value="103rd Pa.">103rd Pa.</option>
										<option value="104th Pa.">104th Pa.</option>
										<option value="106th Ill. Inf.">106th Ill. Inf.</option>
										<option value="107th Pa.">107th Pa.</option>
										<option value="108th Pa.">108th Pa.</option>
										<option value="108th Pa. Militia">108th Pa. Militia</option>
										<option value="10th R.V. Cav.">10th R.V. Cav.</option>
										<option value="10th U.S.C.T.">10th U.S.C.T.</option>
										<option value="10th W.V.">10th W.V.</option>

										<option value="110th Pa.">110th Pa.</option>
										<option value="112">112</option>
										<option value="112th Heavy Arty.">112th Heavy Arty.</option>
										<option value="112th Pa.">112th Pa.</option>
										<option value="112th Pa.  Arty.">112th Pa. Arty.</option>
										<option value="112th Pa.  Heavy Arty.">112th Pa. Heavy Arty.</option>
										<option value="112th Pa. Arty.">112th Pa. Arty.</option>
										<option value="112th Pa. Heavy Arty.">112th Pa. Heavy Arty.</option>
										<option value="115th Ill.">115th Ill.</option>

										<option value="117th Pa.">117th Pa.</option>
										<option value="118th Pa.">118th Pa.</option>
										<option value="11[] Pa.">11[] Pa.</option>
										<option value="11th Md. Inf.">11th Md. Inf.</option>
										<option value="11th Mo. Inf.">11th Mo. Inf.</option>
										<option value="11th Mo.[] Inf.">11th Mo.[] Inf.</option>
										<option value="11th Pa.">11th Pa.</option>
										<option value="11th Pa.  Cav">11th Pa. Cav</option>
										<option value="11th Pa.  Cav.">11th Pa. Cav.</option>

										<option value="11th Pa. Batt.">11th Pa. Batt.</option>
										<option value="11th Pa. Cav.">11th Pa. Cav.</option>
										<option value="120th Pa.">120th Pa.</option>
										<option value="121st Pa.  Cav.">121st Pa. Cav.</option>
										<option value="121st Pa. Cav.">121st Pa. Cav.</option>
										<option value="122nd Pa.">122nd Pa.</option>
										<option value="125th Pa.">125th Pa.</option>
										<option value="126">126</option>
										<option value="126th Pa.">126th Pa.</option>

										<option value="126th Pa. 9th MO">126th Pa. 9th MO</option>
										<option value="126th Pa. Batt.">126th Pa. Batt.</option>
										<option value="126thInf.">126thInf.</option>
										<option value="126thR Pa.">126thR Pa.</option>
										<option value="126thU.S.  Inf.">126thU.S. Inf.</option>
										<option value="127">127</option>
										<option value="127th Mass. Inf.">127th Mass. Inf.</option>
										<option value="127th Pa.">127th Pa.</option>
										<option value="127th U.S.C.T.">127th U.S.C.T.</option>

										<option value="127th U.S.C.T.  Inf.">127th U.S.C.T. Inf.</option>
										<option value="129th Md.">129th Md.</option>
										<option value="12th Ill.  Inf.">12th Ill. Inf.</option>
										<option value="12th M.V. Cav.">12th M.V. Cav.</option>
										<option value="12th M.V. Inf.">12th M.V. Inf.</option>
										<option value="12th Md. Inf.">12th Md. Inf.</option>
										<option value="12th O.V. Inf.">12th O.V. Inf.</option>
										<option value="12th Pa.">12th Pa.</option>
										<option value="12th Pa. Cav.">12th Pa. Cav.</option>

										<option value="12th Pa. R.S. Inf.">12th Pa. R.S. Inf.</option>
										<option value="12th Pa. Reserves">12th Pa. Reserves</option>
										<option value="12th Pa. []">12th Pa. []</option>
										<option value="130th Pa.">130th Pa.</option>
										<option value="133rd Pa.">133rd Pa.</option>
										<option value="137th Ill. Inf.">137th Ill. Inf.</option>
										<option value="137th Pa.">137th Pa.</option>
										<option value="138th Pa.">138th Pa.</option>
										<option value="138th Pa. Mil.">138th Pa. Mil.</option>

										<option value="13th M. Inf.">13th M. Inf.</option>
										<option value="13th M.H.B.">13th M.H.B.</option>
										<option value="13th M.V. Inf.">13th M.V. Inf.</option>
										<option value="13th Md. Inf.">13th Md. Inf.</option>
										<option value="13th Pa.">13th Pa.</option>
										<option value="13th Pa.  Cav.">13th Pa. Cav.</option>
										<option value="13th Pa. Cav.">13th Pa. Cav.</option>
										<option value="141st Pa.">141st Pa.</option>
										<option value="143rd Pa.">143rd Pa.</option>

										<option value="148">148</option>
										<option value="148th Pa.">148th Pa.</option>
										<option value="148th Pa. Vet.">148th Pa. Vet.</option>
										<option value="149th Pa.">149th Pa.</option>
										<option value="14th U.S.C.T.">14th U.S.C.T.</option>
										<option value="150th Pa.">150th Pa.</option>
										<option value="151st Pa.">151st Pa.</option>
										<option value="155th Pa.">155th Pa.</option>
										<option value="156th Pa.">156th Pa.</option>

										<option value="156th Pa. Reserves">156th Pa. Reserves</option>
										<option value="158th">158th</option>
										<option value="158th  Pa.">158th Pa.</option>
										<option value="158th Cav.">158th Cav.</option>
										<option value="158th Pa.">158th Pa.</option>
										<option value="158th Pa. Cav.">158th Pa. Cav.</option>
										<option value="158th Pa. Militia">158th Pa. Militia</option>
										<option value="158th Pa. Reserves">158th Pa. Reserves</option>
										<option value="158th Pa. []">158th Pa. []</option>

										<option value="15th Oh. Bat.">15th Oh. Bat.</option>
										<option value="15th Pa.">15th Pa.</option>
										<option value="15th Pa.  Cav.">15th Pa. Cav.</option>
										<option value="15th Pa. Cav.">15th Pa. Cav.</option>
										<option value="15th Reserves Inf.">15th Reserves Inf.</option>
										<option value="15th U.S.  Inf.">15th U.S. Inf.</option>
										<option value="15th U.S. Arty.">15th U.S. Arty.</option>
										<option value="16">16</option>
										<option value="161st Pa. Cav.">161st Pa. Cav.</option>

										<option value="164th O.V. Inf.">164th O.V. Inf.</option>
										<option value="164th Oh.">164th Oh.</option>
										<option value="165th Inf.">165th Inf.</option>
										<option value="165th Pa.">165th Pa.</option>
										<option value="165th Pa. Drafted Militia">165th Pa. Drafted
											Militia</option>
										<option value="165th Pa. Drafted Militia Inf.">165th Pa.
											Drafted Militia Inf.</option>
										<option value="165th Pa. Militia">165th Pa. Militia</option>
										<option value="16th Pa.">16th Pa.</option>
										<option value="16th Pa.  Cav">16th Pa. Cav</option>

										<option value="16th Pa.  Cav.">16th Pa. Cav.</option>
										<option value="16th Pa. Cav.">16th Pa. Cav.</option>
										<option value="16th Pa. cvt">16th Pa. cvt</option>
										<option value="16th U.S. Vet. Reserves">16th U.S. Vet.
											Reserves</option>
										<option value="16th U.S.C.T. Inf.">16th U.S.C.T. Inf.</option>
										<option value="177th Pa.">177th Pa.</option>
										<option value="17th CN">17th CN</option>
										<option value="17th Pa.">17th Pa.</option>
										<option value="17th Pa.  Cav">17th Pa. Cav</option>

										<option value="17th Pa.  Cav.">17th Pa. Cav.</option>
										<option value="17th Pa. Cav.">17th Pa. Cav.</option>
										<option value="184th Pa.">184th Pa.</option>
										<option value="187th Pa.">187th Pa.</option>
										<option value="188th Pa.">188th Pa.</option>
										<option value="189th Pa.">189th Pa.</option>
										<option value="18th Pa. Cav.">18th Pa. Cav.</option>
										<option value="190th Pa.">190th Pa.</option>
										<option value="191st Pa. Vet. Inf.">191st Pa. Vet. Inf.</option>

										<option value="194th Pa.">194th Pa.</option>
										<option value="195th Pa.">195th Pa.</option>
										<option value="197th Pa.">197th Pa.</option>
										<option value="198th Pa.">198th Pa.</option>
										<option value="198th Pa.  Inf">198th Pa. Inf</option>
										<option value="19[] Pa.">19[] Pa.</option>
										<option value="19th Pa.  Cav.">19th Pa. Cav.</option>
										<option value="19th Pa. Cav.">19th Pa. Cav.</option>
										<option value="19th Vet. Res. Corps">19th Vet. Res. Corps</option>

										<option value="1[]8th Pa.">1[]8th Pa.</option>
										<option value="1st Batt. 100th Day Pa Inf.">1st Batt. 100th
											Day Pa Inf.</option>
										<option value="1st Conn. Cav.">1st Conn. Cav.</option>
										<option value="1st M. V. Cav.">1st M. V. Cav.</option>
										<option value="1st M. V. Inf.">1st M. V. Inf.</option>
										<option value="1st MP. Inf.">1st MP. Inf.</option>
										<option value="1st Md.">1st Md.</option>
										<option value="1st Md.  Inf.">1st Md. Inf.</option>
										<option value="1st Md. Cav.">1st Md. Cav.</option>

										<option value="1st Md. Cav. Phl.">1st Md. Cav. Phl.</option>
										<option value="1st Md. Inf.">1st Md. Inf.</option>
										<option value="1st Minn. Heavy Arty.">1st Minn. Heavy Arty.</option>
										<option value="1st N.Y.">1st N.Y.</option>
										<option value="1st N.Y. Cav.">1st N.Y. Cav.</option>
										<option value="1st Oh. Inf.">1st Oh. Inf.</option>
										<option value="1st P.V. Light Arty.">1st P.V. Light Arty.</option>
										<option value="1st P[]">1st P[]</option>
										<option value="1st Pa.">1st Pa.</option>

										<option value="1st Pa.  Arty.">1st Pa. Arty.</option>
										<option value="1st Pa.  Heavy Art">1st Pa. Heavy Art</option>
										<option value="1st Pa. Arty.">1st Pa. Arty.</option>
										<option value="1st Pa. Batt.">1st Pa. Batt.</option>
										<option value="1st Pa. F. A.">1st Pa. F. A.</option>
										<option value="1st Pa. Light Arty.">1st Pa. Light Arty.</option>
										<option value="1st Ph B []">1st Ph B []</option>
										<option value="1st Reg. Cav.">1st Reg. Cav.</option>
										<option value="1st U.S. Vet.">1st U.S. Vet.</option>

										<option value="200th Pa.">200th Pa.</option>
										<option value="201st Pa.">201st Pa.</option>
										<option value="201st Vet.  Inf.">201st Vet. Inf.</option>
										<option value="202">202</option>
										<option value="202nd Pa.">202nd Pa.</option>
										<option value="203rd Pa.">203rd Pa.</option>
										<option value="204th Pa.">204th Pa.</option>
										<option value="205th Pa.">205th Pa.</option>
										<option value="207th Pa.">207th Pa.</option>

										<option value="208th Pa.">208th Pa.</option>
										<option value="209th Pa.">209th Pa.</option>
										<option value="20th Pa.">20th Pa.</option>
										<option value="20th Pa.  Cav.">20th Pa. Cav.</option>
										<option value="20th Pa. Cav.">20th Pa. Cav.</option>
										<option value="210th Pa.">210th Pa.</option>
										<option value="21st Pa.">21st Pa.</option>
										<option value="21st Pa.  Cav">21st Pa. Cav</option>
										<option value="21st Pa.  Cav.">21st Pa. Cav.</option>

										<option value="21st Pa. CVA">21st Pa. CVA</option>
										<option value="21st Pa. Cav.">21st Pa. Cav.</option>
										<option value="22nd Pa.">22nd Pa.</option>
										<option value="22nd Pa.  Cav">22nd Pa. Cav</option>
										<option value="22nd Pa.  Cav.">22nd Pa. Cav.</option>
										<option value="22nd Pa. Cav.">22nd Pa. Cav.</option>
										<option value="22nd Pa. Colored Reg.">22nd Pa. Colored Reg.</option>
										<option value="22nd U.S. Colored Inf.">22nd U.S. Colored
											Inf.</option>
										<option value="22nd U.S.C.T.">22nd U.S.C.T.</option>

										<option value="22nd U.S.C.T. Inf.">22nd U.S.C.T. Inf.</option>
										<option value="24th Pa.">24th Pa.</option>
										<option value="24th Pa. Militia">24th Pa. Militia</option>
										<option value="24th U.S.C.T.">24th U.S.C.T.</option>
										<option value="24th U.S.C.T. Inf.">24th U.S.C.T. Inf.</option>
										<option value="258th Pa.">258th Pa.</option>
										<option value="25th Pa.">25th Pa.</option>
										<option value="25th U.S.C.T.">25th U.S.C.T.</option>
										<option value="26th Colored Inf.">26th Colored Inf.</option>

										<option value="26th Pa.">26th Pa.</option>
										<option value="27th Pa. Cav.">27th Pa. Cav.</option>
										<option value="289th Pa.">289th Pa.</option>
										<option value="28th Ill. Inf.">28th Ill. Inf.</option>
										<option value="28th N.Y. Inf.">28th N.Y. Inf.</option>
										<option value="29th Conn. Inf.">29th Conn. Inf.</option>
										<option value="29th Pa.">29th Pa.</option>
										<option value="2nd  U.S.C.T.">2nd U.S.C.T.</option>
										<option value="2nd Batt. Reserve Vet.">2nd Batt. Reserve
											Vet.</option>

										<option value="2nd Col.">2nd Col.</option>
										<option value="2nd Heavy Arty.">2nd Heavy Arty.</option>
										<option value="2nd Mass.">2nd Mass.</option>
										<option value="2nd Md.">2nd Md.</option>
										<option value="2nd Md. Inf.">2nd Md. Inf.</option>
										<option value="2nd P. Vet.   Heavy Arty.">2nd P. Vet. Heavy
											Arty.</option>
										<option value="2nd Pa.">2nd Pa.</option>
										<option value="2nd Pa.  Arty.">2nd Pa. Arty.</option>
										<option value="2nd Pa.  Cav.">2nd Pa. Cav.</option>
										<option value="2nd Pa.  Heavy Arty.">2nd Pa. Heavy Arty.</option>
										<option value="2nd Pa. 3rd Month men">2nd Pa. 3rd Month men</option>
										<option value="2nd Pa. 3rd month">2nd Pa. 3rd month</option>
										<option value="2nd Pa. Arty.">2nd Pa. Arty.</option>
										<option value="2nd Pa. Cav.">2nd Pa. Cav.</option>
										<option value="2nd Pa. Heavy Arty.">2nd Pa. Heavy Arty.</option>
										<option value="2nd Pa. Light Arty.">2nd Pa. Light Arty.</option>
										<option value="2nd Pa. Reg.">2nd Pa. Reg.</option>
										<option value="2nd Pa. Vet. Arty.">2nd Pa. Vet. Arty.</option>
										<option value="2nd Pa. [3rd month men]">2nd Pa. [3rd month
											men]</option>
										<option value="2nd U.S. Cav.">2nd U.S. Cav.</option>
										<option value="2nd U.S.C.T. Cav.">2nd U.S.C.T. Cav.</option>
										<option value="2nd V. Heavy Arty.">2nd V. Heavy Arty.</option>
										<option value="2nd Va. Inf.">2nd Va. Inf.</option>
										<option value="2nd []">2nd []</option>
										<option value="30th Pa.">30th Pa.</option>
										<option value="30th U.S.C.T.">30th U.S.C.T.</option>
										<option value="32nd Brigade England">32nd Brigade England</option>
										<option value="32nd U.S.C.T.">32nd U.S.C.T.</option>
										<option value="32nd U.S.C.T. Inf.">32nd U.S.C.T. Inf.</option>
										<option value="33rd U.S. Inf.">33rd U.S. Inf.</option>
										<option value="34th Ill. Inf.">34th Ill. Inf.</option>
										<option value="35th Pa.">35th Pa.</option>
										<option value="36th 2nd Batt. Vet. Res. Corps">36th 2nd
											Batt. Vet. Res. Corps</option>
										<option value="36th Pa.">36th Pa.</option>
										<option value="37th Wt. Inf.">37th Wt. Inf.</option>
										<option value="38th U.S. Colored Inf.">38th U.S. Colored
											Inf.</option>
										<option value="39th N.J. Inf.">39th N.J. Inf.</option>
										<option value="3rd M.V.I.">3rd M.V.I.</option>
										<option value="3rd Mass. Inf.">3rd Mass. Inf.</option>
										<option value="3rd Md.">3rd Md.</option>
										<option value="3rd Md. Cav.">3rd Md. Cav.</option>
										<option value="3rd Md. Home Brigade Inf.">3rd Md. Home
											Brigade Inf.</option>
										<option value="3rd Md. Inf.">3rd Md. Inf.</option>
										<option value="3rd N.Y. Cav.">3rd N.Y. Cav.</option>
										<option value="3rd P.P.V. Cav">3rd P.P.V. Cav</option>
										<option value="3rd Pa.  Cav">3rd Pa. Cav</option>
										<option value="3rd Pa.  Cav.">3rd Pa. Cav.</option>
										<option value="3rd Pa. Cav.">3rd Pa. Cav.</option>
										<option value="3rd Pa. Heavy Arty.">3rd Pa. Heavy Arty.</option>
										<option value="3rd Pa. Militia">3rd Pa. Militia</option>
										<option value="3rd Prov. Cav. Inf.">3rd Prov. Cav. Inf.</option>
										<option value="3rd Prov. Pa.  Cav.">3rd Prov. Pa. Cav.</option>
										<option value="3rd R.V. Arty">3rd R.V. Arty</option>
										<option value="41st Pa.">41st Pa.</option>
										<option value="41st U.S.C.T.">41st U.S.C.T.</option>
										<option value="42nd Pa.">42nd Pa.</option>
										<option value="43rd U.S.C.T.">43rd U.S.C.T.</option>
										<option value="45th O.V. Inf.">45th O.V. Inf.</option>
										<option value="45th U.S. Colored">45th U.S. Colored</option>
										<option value="45th U.S.C.T.">45th U.S.C.T.</option>
										<option value="47th Pa.">47th Pa.</option>
										<option value="48th Pa. Militia">48th Pa. Militia</option>
										<option value="49th Pa.">49th Pa.</option>
										<option value="4th Cal. Inf.">4th Cal. Inf.</option>
										<option value="4th Md. Colored Inf.">4th Md. Colored Inf.</option>
										<option value="4th Pa.">4th Pa.</option>
										<option value="4th Pa. Cav.">4th Pa. Cav.</option>
										<option value="50th Mass. Inf.">50th Mass. Inf.</option>
										<option value="50th Pa.">50th Pa.</option>
										<option value="50th Pa. Vet.">50th Pa. Vet.</option>
										<option value="50th Pa.Vet. Inf.">50th Pa.Vet. Inf.</option>
										<option value="53rd Pa.">53rd Pa.</option>
										<option value="53rd Pa. Vet.  Inf.">53rd Pa. Vet. Inf.</option>
										<option value="54th Mass  Inf.">54th Mass Inf.</option>
										<option value="54th Mass.">54th Mass.</option>
										<option value="54th Mass.  Inf.">54th Mass. Inf.</option>
										<option value="54th Mass. Colored  Inf.">54th Mass. Colored
											Inf.</option>
										<option value="54th Mass. Colored Inf.">54th Mass. Colored
											Inf.</option>
										<option value="54th Mass. Inf.">54th Mass. Inf.</option>
										<option value="54th Md. Inf.">54th Md. Inf.</option>
										<option value="54th Pa.">54th Pa.</option>
										<option value="55th Mass.  Inf.">55th Mass. Inf.</option>
										<option value="55th Mass. Colored Cav.">55th Mass. Colored
											Cav.</option>
										<option value="55th Mass. Inf.">55th Mass. Inf.</option>
										<option value="55th Pa.">55th Pa.</option>
										<option value="56th Pa.">56th Pa.</option>
										<option value="56th Pa. Vet.  Inf.">56th Pa. Vet. Inf.</option>
										<option value="57th Pa.">57th Pa.</option>
										<option value="58th M[] Inf.">58th M[] Inf.</option>
										<option value="58th Pa.">58th Pa.</option>
										<option value="5th Inf.">5th Inf.</option>
										<option value="5th M.V.I.">5th M.V.I.</option>
										<option value="5th Md.[] Inf.">5th Md.[] Inf.</option>
										<option value="5th Pa. Cav.">5th Pa. Cav.</option>
										<option value="5th RE Arty.">5th RE Arty.</option>
										<option value="5th Roc. Rec.">5th Roc. Rec.</option>
										<option value="5th U.S.">5th U.S.</option>
										<option value="5th U.S. Cav.">5th U.S. Cav.</option>
										<option value="5th Vt. Inf.">5th Vt. Inf.</option>
										<option value="6">6</option>
										<option value="62nd Pa.">62nd Pa.</option>
										<option value="67th Pa.">67th Pa.</option>
										<option value="6th C of P">6th C of P</option>
										<option value="6th Ia. Cav.">6th Ia. Cav.</option>
										<option value="6th M.V. Inf.">6th M.V. Inf.</option>
										<option value="6th Md.  Inf.">6th Md. Inf.</option>
										<option value="6th Md. Inf.">6th Md. Inf.</option>
										<option value="6th Md.[] Inf.">6th Md.[] Inf.</option>
										<option value="6th Pa.">6th Pa.</option>
										<option value="6th Pa. Cor">6th Pa. Cor</option>
										<option value="6th Pa. R.V.C. Inf.">6th Pa. R.V.C. Inf.</option>
										<option value="6th Pa. Res.">6th Pa. Res.</option>
										<option value="6th Pa. Reserve Inf.">6th Pa. Reserve Inf.</option>
										<option value="6th Pa. Reserves">6th Pa. Reserves</option>
										<option value="71st Pa.">71st Pa.</option>
										<option value="73rd Pa.">73rd Pa.</option>
										<option value="76th Pa.">76th Pa.</option>
										<option value="77th Pa.">77th Pa.</option>
										<option value="77th Pa. Regiment Band">77th Pa. Regiment
											Band</option>
										<option value="77th Pa. Vet. Inf.">77th Pa. Vet. Inf.</option>
										<option value="79">79</option>
										<option value="79th Pa.">79th Pa.</option>
										<option value="79th Pa. Cav.">79th Pa. Cav.</option>
										<option value="79th Pa. Vet.  Inf.">79th Pa. Vet. Inf.</option>
										<option value="79th Pa. Vet. Inf.">79th Pa. Vet. Inf.</option>
										<option value="7th M.C.I.">7th M.C.I.</option>
										<option value="7th M.V. Inf.">7th M.V. Inf.</option>
										<option value="7th Md.">7th Md.</option>
										<option value="7th Md.  Inf.">7th Md. Inf.</option>
										<option value="7th Md. Inf.">7th Md. Inf.</option>
										<option value="7th Pa.">7th Pa.</option>
										<option value="7th Pa. Cav.">7th Pa. Cav.</option>
										<option value="81st Pa.">81st Pa.</option>
										<option value="82nd O.V Col.">82nd O.V Col.</option>
										<option value="82nd Pa.">82nd Pa.</option>
										<option value="87th Pa.">87th Pa.</option>
										<option value="87th Pa. Cav.">87th Pa. Cav.</option>
										<option value="88th Pa.">88th Pa.</option>
										<option value="8th M.C.R.">8th M.C.R.</option>
										<option value="8th Pa.  Cav.">8th Pa. Cav.</option>
										<option value="8th Pa. Cav.">8th Pa. Cav.</option>
										<option value="8th U.S.C.T.">8th U.S.C.T.</option>
										<option value="8th U.S.C.T.  Inf.">8th U.S.C.T. Inf.</option>
										<option value="92nd Ill. Inf. Cav.">92nd Ill. Inf. Cav.</option>
										<option value="93rd Pa.">93rd Pa.</option>
										<option value="93rd Pa. Vet.  Inf.">93rd Pa. Vet. Inf.</option>
										<option value="95th Pa.">95th Pa.</option>
										<option value="95th Pa. Vet. Militia">95th Pa. Vet. Militia</option>
										<option value="97th Pa.">97th Pa.</option>
										<option value="98th Pa.">98th Pa.</option>
										<option value="99th  Inf.">99th Inf.</option>
										<option value="99th Pa.">99th Pa.</option>
										<option value="99th Pa. Vet.">99th Pa. Vet.</option>
										<option value="9th  Mass.">9th Mass.</option>
										<option value="9th Pa.">9th Pa.</option>
										<option value="9th Pa.  Cav.">9th Pa. Cav.</option>
										<option value="9th Pa. Cav.">9th Pa. Cav.</option>
										<option value="9th corps">9th corps</option>
										<option value="Capt. Bruce Lambert's Indpt. Cav.">Capt.
											Bruce Lambert's Indpt. Cav.</option>
										<option value="Capt. Bruce Lambert's Indpt. Co.">Capt. Bruce
											Lambert's Indpt. Co.</option>
										<option value="Carlisle Barracks">Carlisle Barracks</option>
										<option value="Cav.">Cav.</option>
										<option value="Cole's Cav.">Cole's Cav.</option>
										<option value="Cole's Md. Cav.">Cole's Md. Cav.</option>
										<option value="Confederate Soldier">Confederate Soldier</option>
										<option value="Daylight">Daylight</option>
										<option value="Deckhand Navy Cutter">Deckhand Navy Cutter</option>
										<option value="Hessian">Hessian</option>
										<option value="Ind. Co., Mounted Inf.">Ind. Co., Mounted
											Inf.</option>
										<option value="Indpt. Colored Md. Cav. ">Indpt. Colored Md.
											Cav. </option>
										<option value="Indpt. Inf.">Indpt. Inf.</option>
										<option value="Indpt. Light Arty.">Indpt. Light Arty.</option>
										<option value="Indpt. Pa.  Batt.">Indpt. Pa. Batt.</option>
										<option value="Indpt. Pa.  Light Arty.">Indpt. Pa. Light
											Arty.</option>
										<option value="Indpt. Pa. Batt.">Indpt. Pa. Batt.</option>
										<option value="Indpt. Pa. Cav.">Indpt. Pa. Cav.</option>
										<option value="Indpt. Pa. Sign">Indpt. Pa. Sign</option>
										<option value="Indpt. Pa. Vet.  Light Arty.">Indpt. Pa. Vet.
											Light Arty.</option>
										<option value="Indpt. Reg, Light Arty.">Indpt. Reg, Light
											Arty.</option>
										<option value="Indpt. Reg. Pa. Light Arty.">Indpt. Reg. Pa.
											Light Arty.</option>
										<option value="Indpt. Reg. Pa. Vet.  Light Arty.">Indpt.
											Reg. Pa. Vet. Light Arty.</option>
										<option value="Kearney Cav.">Kearney Cav.</option>
										<option value="MP. H.B.V. Inf.">MP. H.B.V. Inf.</option>
										<option value="Md. Cole's Cav.">Md. Cole's Cav.</option>
										<option value="Mercereau's Ind. Cav.">Mercereau's Ind. Cav.</option>
										<option value="Mercereau's Pa.  Cav.">Mercereau's Pa. Cav.</option>
										<option value="Mercereau's Pa. Cav.">Mercereau's Pa. Cav.</option>
										<option value="Mountain Rangers (Capt. McDowell)">Mountain
											Rangers (Capt. McDowell)</option>
										<option value="N.J.  Arty.">N.J. Arty.</option>
										<option value="Not known">Not known</option>
										<option value="Pa.">Pa.</option>
										<option value="Pa.  Inf">Pa. Inf</option>
										<option value="Pa.  Light Arty.">Pa. Light Arty.</option>
										<option value="Pa. Cav.">Pa. Cav.</option>
										<option value="Pa. HBMV Cav.">Pa. HBMV Cav.</option>
										<option value="Pa. HBMV Inf.">Pa. HBMV Inf.</option>
										<option value="Pa. Heavy Arty.; Md. Cav.">Pa. Heavy Arty.;
											Md. Cav.</option>
										<option value="Pa. Light Arty.">Pa. Light Arty.</option>
										<option value="Penguin">Penguin</option>
										<option value="Rank &amp; record unknown">Rank &amp;
											record unknown</option>
										<option value="Regular Army">Regular Army</option>
										<option value="Soldier U.S.">Soldier U.S.</option>
										<option value="U.S.  Cav.">U.S. Cav.</option>
										<option value="U.S.  Soldier">U.S. Soldier</option>
										<option value="U.S.  Team Driver">U.S. Team Driver</option>
										<option value="U.S. Army">U.S. Army</option>
										<option value="U.S. Colored  Inf.">U.S. Colored Inf.</option>
										<option value="U.S. Marines">U.S. Marines</option>
										<option value="U.S. Signal Corps">U.S. Signal Corps</option>
										<option value="U.S. Soldier">U.S. Soldier</option>
										<option value="Unattached Pa. Militia Inf.">Unattached Pa.
											Militia Inf.</option>
										<option value="White's Batt., Md. Inf.">White's Batt., Md.
											Inf.</option>
										<option value="[]">[]</option>
										<option value="[] Arty.">[] Arty.</option>
										<option value="[] Md. Inf.">[] Md. Inf.</option>
										<option value="[] Pa.">[] Pa.</option>
										<option value="[] Pa.  Cav.">[] Pa. Cav.</option>
										<option value=""/>

									</select>
								</td>
								<td align="right"/>
								<td align="left"/>
							</tr>
						</table>
							</form>
					</center>
					<br/>
					<hr width="80%"/>
					<center>
						<a href="/VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0"
								alt=""/>
						</a>
					</center>
				</div>
				<div id="search"/>
			</body>
		</html>



	</xsl:template>
</xsl:stylesheet>
