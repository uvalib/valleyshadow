<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Soldiers' Records Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold; } .warning{font-weight:bold; padding:5px; color:#000099;} 
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/dossiers_search.js"/>
				<script type="text/javascript" src="javascript/generic_search_paging.js"/>
			</head>
			<body TEXT="#000000" BGCOLOR="FFFFFF" LINK="#CD7F32" VLINK="#00009C">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
					<!-- Table which contains navigation table and intro material -->
					<table>

						<tr>
							<td valign="center">
								<!-- Table containing navigation tools -->
								<table bgcolor="#ffcc99" border="0" width="80%" cellpadding="10">
									<tr>
										<td align="center">
											<a href="VoS/cwdossier1.html">
												<b>Return to Soldier's Records Home</b>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="veteran">
												<b>1890 U.S. Veterans Census</b>
											</a>
											<br/>
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
									<tr>
										<td align="center">
											<a href="VoS/aboutsoldiers.html">
												<b>More Information About the Records</b>
											</a>
										</td>
									</tr>
								</table>

							</td>

							<td>
								<center>
									<img src="VoS/OR/combo.gif"/>
								</center>
								<br/>

								<p>
									<h1 class="red-head">
										<b>
											<center> Search the Soldiers' Records </center>
										</b>
									</h1>
								</p>

								<blockquote> The soldiers' records in the database are those ONLY of
									Augusta and Franklin soldiers. This database does not include
									every man in the regiment or company, but only those from
									Augusta or Franklin. Queries of regimental or company statistics
									should not be treated as complete, but only representative of
									what happened to the men from Augusta and Franklin.<br/><br/>
								</blockquote>
								<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle
									or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
									full explanation. </blockquote>
							</td>
						</tr>
					</table>

					<hr/>
					<form name="dossiersSearchForm" action="dossiers_search_results.html" method="get">
						<input type="hidden" id="query" name="q"/>
						<input type="hidden" name="rows" value="50"/>
						<input type="hidden" name="start" value="0"/>
					<center>
						<p>Order Results By: <select name="sort">
								<option value="last asc, first asc">Last Name, First Name</option>
								<option
									value="year_enl asc, month_enl asc, day_enl asc, regiment asc">Date Enlisted, Unit</option>
							</select>
							<input type="submit" value="Initiate Search" class="search_button"/>
							<input type="reset" value="Clear"/></p>
						<p>
							<b>County:</b>
							<span name="county_cell">
								<input type="radio" name="county" value="augusta" checked="checked">Augusta</input>
								<input type="radio" name="county" value="franklin">Franklin</input>
							</span>
						</p>
					<table cellpadding="10" border="0">

						<tr>
							<td bgcolor="#ffcc99" valign="center" colspan="4">
								<font class="red-head">Name</font>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Last name:</b>
							</td>
							<td align="left">
								<input name="last_name" size="20"/>
							</td>
							<td align="right">
								<b>First name:</b>
							</td>
							<td align="left">
								<input name="first_name" size="20"/>
							</td>
						</tr>
						<tr bgcolor="#ffcc99">
							<td bgcolor="#ffcc99" valign="center" colspan="4">
								<font class="red-head">Enlistment Information</font>
							</td>

						</tr>
						<tr>
							<td align="right">
								<b>Date Enlisted:</b>
							</td>
							<td align="left">
								<select name="date">
									<option/>
									<option value="1860">1860</option>
									<option value="1861">1861</option>
									<option value="1862">1862</option>
									<option value="1863">1863</option>
									<option value="1864">1864</option>
									<option value="1865">1865</option>
								</select>
							</td>

							<td align="right">
								<b>Place Enlisted:</b>
							</td>
							<td align="left">
								<input name="place_enl" size="20"/>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Age at Enlistment:</b>
							</td>
							<td align="left">
								<select id="age_enl-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input name="age_enl" size="6"/>
							</td>
							<td align="right">
								<b>Occupation at Enlistment:</b>
							</td>
							<td align="left">
								<input name="occ_enl" size="20"/>
							</td>
						</tr>
						<tr>
							<td colspan="4" bgcolor="#ffcc99">
								<font class="red-head">Service Information</font>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top">
								<b>Regiment:</b>
							</td>
							<td align="left" valign="top">
								<select name="regiment">
									<option value="" class="reg">all</option>
									<option value="other" class="other_reg">other</option>
									<option class="reg"/>
									<option value="5th Va. Inf." class="reg">5th Va. Inf.</option>
									<option value="52nd Va. Inf." class="reg">52nd Va. Inf.</option>
									<option value="14th Va. Cav." class="reg">14th Va. Cav.</option>
									<option value="1st Va. Cav." class="reg">1st Va. Cav.</option>
									<option value="Staunton Artillery" class="reg">Staunton Artillery</option>
									<option class="reg"/>
									<option value="77th Pa." class="reg">77th Pa.</option>
									<option value="107th Pa." class="reg">107th Pa.</option>
									<option value="126th Pa." class="reg">126th Pa.</option>
									<option value="158th Pa." class="reg">158th Pa.</option>
									<option value="182nd Pa" class="reg">182nd Pa.</option>
									<option value="U.S.C.T." class="reg">U.S.C.T.</option>
								</select>
							</td>
							<td align="right" valign="top"><b>Other Regiments</b><br/>(please select
								"other" in the<br/>regiment box to the left):</td>
							<td align="left" valign="top">
								<input name="other_rgmnt" size="20" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top">
								<b>Company:</b>
							</td>

							<td align="left" valign="top">
								<select name="company">
									<option/>
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
									<option value="M">M</option>
								</select>
							</td>

							<td/>
							<td/>
						</tr>
						<tr>
							<td align="right" valign="top">
								<b>Rank:</b>
							</td>
							<td align="left" valign="top">
								<select name="rank">
									<option class="rank"/>
									<option value="other" class="other_rank">other</option>
									<option value="Col." class="rank">Col.</option>
									<option value="Lt. Col." class="rank">Lt. Col.</option>
									<option value="Capt." class="rank">Capt.</option>
									<option value="Maj." class="rank">Maj.</option>
									<option value="1st Lt." class="rank">1st Lt.</option>
									<option value="2nd Lt." class="rank">2nd Lt.</option>
									<option value="Sgt." class="rank">Sgt.</option>
									<option value="Cpl." class="rank">Cpl.</option>
									<option value="Pvt." class="rank">Pvt.</option>
								</select>
							</td>

							<td align="right" valign="top"><b>Other Rank</b><br/>(please select
								"other" in the<br/>rank box to the left):</td>
							<td align="left" valign="top">
								<input name="other_rank" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<td colspan="4" bgcolor="#ffcc99">
								<font class="red-head">Military Records</font>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Casualties:</b>
							</td>
							<td align="left">
								<select name="casualty">
									<option class="other_casualty"/>
									<option value="dead_wounds" class="casualty">died of wounds</option>
									<option value="dead_disease" class="casualty">died of disease</option>
									<option value="mia" class="casualty">missing in action</option>
									<option value="wia" class="casualty">wounded in action</option>
									<option value="kia_place" class="casualty">killed in action</option>
								</select>
							</td>
							<td align="right">
								<b>Personal Events:</b>
							</td>
							<td align="left">
								<select name="pers_ev_type">
									<option class="other_pers_ev_type"/>
									<option value="desertion" class="pers_ev_type">deserted</option>
									<option value="awol" class="pers_ev_type">AWOL</option>
									<option value="capture" class="pers_ev_type">captured</option>
									<option value="prisoner" class="pers_ev_type">imprisoned</option>
								</select>
							</td>

						</tr>
						<tr>
							<td align="right">
								<b>Casualty Year:</b>
							</td>
							<td align="left">
								<select id="cas_year-op" disabled="disabled">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input name="cas_year" size="6" disabled="disabled"/>
							</td>
							<td align="right">
								<b>Personal Event Year:</b>
							</td>
							<td align="left">
								<select id="pers_ev-op" disabled="disabled">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input name="pers_ev" size="6" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Military Record:</b>
							</td>
							<td align="left">
								<select name="mil_rec">
									<option class="other_mil_rec"/>
									<option value="hospital_record" class="mil_rec">Hospitalized</option>
									<option value="promotions" class="mil_rec">Promoted</option>
									<option value="transfers" class="mil_rec">Transferred</option>
								</select>
							</td>

							<td align="right">
								<b>Military Record Year:</b>
							</td>
							<td align="left">
								<input name="mil_rec_date" size="5" disabled="disabled"/>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Place:</b>
							</td>
							<td align="left">
								<select name="mil_rec_place" >
									<option class="mil_rec_place"/>
									<option value="other" class="other_mil_rec_place">other</option>
									<option value="Andersonville" class="mil_rec_place">Andersonville</option>
									<option value="Antietam" class="mil_rec_place">Antietam</option>
									<option value="Appomattox" class="mil_rec_place">Appomattox</option>
									<option value="Cedar Creek" class="mil_rec_place">Cedar Creek</option>
									<option value="Cedar Mountain" class="mil_rec_place">Cedar Mountain</option>
									<option value="Chambersburg" class="mil_rec_place">Chambersburg</option>
									<option value="Chancellorsville" class="mil_rec_place">Chancellorsville</option>
									<option value="Cross Keys" class="mil_rec_place">Cross Keys</option>
									<option value="Fisher's Hill" class="mil_rec_place">Fisher's Hill</option>
									<option value="Fort Pillow " class="mil_rec_place">Fort Pillow </option>
									<option value="Fredericksburg" class="mil_rec_place">Fredericksburg</option>
									<option value="Gettysburg" class="mil_rec_place">Gettysburg</option>
									<option value="Harper's Ferry" class="mil_rec_place">Harper's Ferry</option>
									<option value="Malvern Hill" class="mil_rec_place">Malvern Hill</option>
									<option value="Manassas" class="mil_rec_place">Manassas</option>
									<option value="Milliken's Bend" class="mil_rec_place">Milliken's Bend</option>
									<option value="Petersburg" class="mil_rec_place">Petersburg</option>
									<option value="Port Republic" class="mil_rec_place">Port Republic</option>
									<option value="Richmond" class="mil_rec_place">Richmond</option>
									<option value="Valley" class="mil_rec_place">Valley</option>
									<option value="Wilderness" class="mil_rec_place">Wilderness</option>
									<option value="Winchester" class="mil_rec_place">Winchester</option>
								</select>
							</td>

							<td align="right" valign="top"><b>Other Place: </b>
								<br/>(please select "other"<br/>in the place box on the left)</td>
							<td align="left">
								<input name="other_place" size="20" disabled="disabled"/>
							</td>
						</tr>
					</table>
					</center>

					<br/>
					<br/>
					<center>
						<input type="submit" value="Initiate Search" class="search_button"/>
						<input type="reset" value="Clear"/>
					</center>


					<br/>
					<hr width="80%"/>
					<center>
						<a href="/VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0"
								alt=""/>
						</a>
					</center>
						</form>
				</div>
				
			</body>
		</html>



	</xsl:template>
</xsl:stylesheet>
