<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:param name="site-URL"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Population Census Advanced Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold }
					.search_table td {padding:10px;}
					.warning{font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} .debug {color:red; background:brown;}
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/advanced_census_search.js"/>
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
											<a href="population_census">
												<b>Basic Search</b>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="/VoS/govdoc/censi/pcensus.html">
												<b>Information<br/>About the Census</b>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="/VoS/reference/tips.html">
												<b>Tips for Searching</b>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="/VoS/govdoc/censi/census_new.html">
												<b>Return to<br/>Census Home</b>
											</a>
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

								<h1 class="red-head">
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
									specific fields for each year.<br/><br/> This page allows users
									to search on all information found in the 1860 census (such as
									the dwelling number, rank in household, school attendance,
									etc.). If you would like to search only on basic fields found in
									the Census (name, age, sex, color, occupation, wealth, and
									birthplace) please use the <a href="population_census">Basic Search</a>.<br/><br/> A basic
									search of both years of the Census can be accessed by following
									the link at the left.<br/><br/>
									<b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle,
									or back of a word. Please see <b>Tips for Searching</b> for a
									full explanation. </blockquote>


							</td>
						</tr>
					</table>



					<hr/>
					<form id="advancedSearchForm" action="advanced_search_results.html" method="get">
						<input type="hidden" readonly="readonly" id="query" name="q"/>
						<input type="hidden" readonly="readonly" name="rows" value="50"/>
						<input type="hidden" readonly="readonly" name="start" value="0"/>
					<table style="margin-left:auto;margin-right:auto;" class="search_table">
						<tr>
							<td align="center" colspan="4">
								<input type="submit" id="search_button"
									value="Initiate Search"/>
								<input type="reset" value="Clear"/>
							</td>
						</tr>
						<tr>
							<td align="right">Year:</td>
							<td align="left" id="year_cell">
								<input type="radio" name="year" value="1860" checked="checked">1860</input>
								<input type="radio" name="year" value="1870">1870</input>
							</td>

							<td align="right">County:</td>
							<td id="county_cell">
								<input type="radio" name="county" value="aug" checked="checked">Augusta</input>
								<input type="radio" name="county" value="fr">Franklin</input>
							</td>
						</tr>

						<tr>
							<td align="right">Order Results By:</td>
							<td align="left">
								<select id="result_order">
									<option value="name">Last Name/First Name</option>
									<option value="family_num">Family Units</option>
									<option value="location">Location</option>
								</select>
							</td>
							<td align="right">View Statistics Only:</td>
							<td align="left">
								<input type="checkbox" name="stats" value="true"/>
							</td>
						</tr>

						<tr>
							<td colspan="4" bgcolor="#ffcc99">
								<b>Personal Information</b>
							</td>
						</tr>

						<tr>
							<td align="right">
								<a href="/VoS/govdoc/censi/pcensus.html#last">
									<b>Last name:</b>
								</a>
							</td>
							<td align="left">
								<input id="last_name" size="20"/>
							</td>
							<td align="right">
								<a href="/VoS/govdoc/censi/pcensus.html#first">
									<b>First name:</b>
								</a>
							</td>
							<td align="left">
								<input id="first_name" size="20"/>
							</td>

						</tr>

						<tr>
							<td align="right">Age:</td>
							<td align="left">
								<select id="ages-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="age" size="6"/>
								<span> </span>Age (additional limit):
								<select id="ages-op2">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt" selected="selected">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="age2" size="6"/>
							</td>
							<td align="right"><a href="/VoS/govdoc/censi/pcensus.html#sex">
									<b>Sex</b>
								</a>:</td>

							<td align="left" id="sex_cell">
								<input type="radio" name="sex" value="m">male</input>
								<input type="radio" name="sex" value="f">female</input>
							</td>
						</tr>

						<tr>
							<td align="right"><a href="/VoS/govdoc/censi/pcensus.html#color">
									<b>"Color"</b>
								</a>:</td>
							<td align="left" colspan="3" id="color_cell">
								<input type="radio" name="colors" value="color:b">black</input>
								<input type="radio" name="colors" value="color:w">white</input>
								<input type="radio" name="colors" value="color:m">"mulatto"</input>
								<input type="radio" name="colors" value="(color:b OR color:m)">black
									or mulatto</input>
							</td>
						</tr>
						<tr>
							<td align="right">Order in Household:</td>
							<td align="left">
								<select id="head-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="head_num" size="6"/>
							</td>
							<td/>
							<td/>
						</tr>

						<tr>
							<td align="right" valign="center"><a
									href="/VoS/govdoc/censi/pcensus.html#estate">
									<b>Real estate value</b>
								</a><br/>(in $)</td>
							<td align="left" valign="center">

								<select id="realests-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="realests" size="6"/>
							</td>
							<td align="right" valign="center"><a
									href="/VoS/govdoc/censi/pcensus.html#estate">
									<b>Personal estate value</b>
								</a><br/>(in $)</td>

							<td align="left" valign="center">
								<select id="persests-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="persests" size="6"/>
							</td>

						</tr>
						<tr>
							<td align="right"><a href="/VoS/govdoc/censi/pcensus.html#occupation">
									<b>Occupation</b>
							</a>:<br/><a href="VoS/govdoc/alloccs.html">(A list of occupations<br/>is
									available)</a></td>
							<td align="left">
								<input id="occupation"/>
							</td>
							<td align="right"><b>
									<a href="/VoS/govdoc/censi/pcensus.html#birthplace"
									>Birthplace</a>
								</b>: </td>
							<td align="left">
								<input id="birth_place"/>
							</td>
						</tr>

						<tr class="form_1860" style="display:none;">
							<td align="right">Married in Past Year:</td>
							<td align="left" id="married_cell">
								<input type="radio" name="married" value=" AND married:yes">Yes</input>
								<input type="radio" name="married" value=" NOT married:yes">No</input>
							</td>
							<td align="right">Attended School in Past Year:</td>
							<td align="left" id="school_cell_1860">
								<input type="radio" name="school" value=" AND (school:yes OR school:1)">Yes</input>
								<input type="radio" name="school" value=" NOT (school:yes OR school:1)">No</input>
							</td>
						</tr>

						<tr class="form_1860" style="display:none;">
							<td align="right">Can Read/Write:</td>
							<td align="left" id="readwrite_cell">
								<input type="radio" name="readwrite" value=" AND readwrite:yes">Yes</input>
								<input type="radio" name="readwrite" value=" NOT readwrite:yes">No</input>
							</td>
							<td align="right">Handicapped:</td>
							<td align="left">
								<select id="handicap_1860">
									<option/>
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
									<option value=" AND deaf_dumb:weak">Weak</option>
								</select>
							</td>
						</tr>
						<tr class="form_1870" style="display:none;">
							<td align="right">Month Married:<br/>(If married in past year)</td>
							<td align="left">
								<select id="marr_month">
									<option/>
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
									<option value="dec*">December</option>
								</select>
							</td>

							<td align="right">Month Born:<br/>(If born in past year)</td>
							<td align="left">
								<select id="birth_month">
									<option/>
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
									<option value="dec*">December</option>
								</select>
							</td>

						</tr>

						<tr class="form_1870" style="display:none;">
							<td align="right">Attended School:<br/>(If attended in past year)</td>
							<td align="left" id="school_cell_1870">
								<input type="radio" name="school" value=" AND (school:yes OR school:1)">Yes</input>
								<input type="radio" name="school" value=" NOT (school:yes OR school:1)">No</input>
							</td>
							<td align="right">Handicapped:</td>
							<td align="left">
								<select id="handicap_1870">
									<option/>
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
									<option value=" AND deaf_dumb:weak">Weak</option>
								</select>
							</td>
						</tr>

						<tr class="form_1870" style="display:none;">
							<td align="right">Can Read:</td>
							<td align="left" id="read_cell">
								<input type="radio" name="read" value=" AND read:1">Yes</input>
								<input type="radio" name="read" value=" NOT read:1">No</input>
							</td>

							<td align="right">Can Write:</td>
							<td align="left" id="write_cell">
								<input type="radio" name="write" value=" AND write:1">Yes</input>
								<input type="radio" name="write" value=" NOT write:1">No</input>
							</td>
						</tr>

						<tr class="form_1870" style="display:none;">
							<td align="right">Male Over 21:</td>
							<td align="left" id="male_21_cell">
								<input type="radio" name="m21" value=" AND male_21:1">Yes</input>
								<input type="radio" name="m21" value=" NOT male_21:1">No</input>
							</td>

							<td align="right">Male Denied Vote:</td>
							<td align="left" id="male_novote_cell">
								<input type="radio" name="mvote" value=" AND male_novote:1">Yes</input>
								<input type="radio" name="mvote" value=" NOT male_novote:1">No</input>
							</td>
						</tr>
						<tr class="form_1870" style="display:none;">
							<td colspan="4" bgcolor="#ffcc99">
								<b>Family Information</b>
							</td>
						</tr>

						<tr class="form_1870" style="display:none;">
							<td align="right">Foreign Father:</td>
							<td align="left" id="for_father_cell">
								<input type="radio" id="for_father" value=" AND for_father:1">Yes</input>
								<input type="radio" id="for_father" value=" NOT for_father:1"
								>No</input>
							</td>
							<td align="right">Foreign Mother:</td>
							<td align="left" id="for_mother_cell">
								<input type="radio" id="for_mother" value=" AND for_mother:1">Yes</input>
								<input type="radio" id="for_mother" value=" NOT for_mother:1"
								>No</input>
							</td>
						</tr>


						<tr id="location_label" style="display:none;">
							<td colspan="4" bgcolor="#ffcc99">
								<b>Location</b>
							</td>
						</tr>

						<tr class="form_1860" style="display:none;">
							<td align="right">Township:<br/><a href="{$site-URL}VoS/govdoc/place.html">A list of place
									names is available</a></td>
							<td align="left">
								<input id="subdistrict" size="10"/>
							</td>
							<td/>
							<td/>

						</tr>
						<tr class="form_1870" style="display:none;">
							<td align="right">District:<br/><a href="{$site-URL}VoS/govdoc/place.html">A list of place
									names is available</a></td>
							<td align="left">
								<input id="district" size="10"/>
							</td>
							<td align="right">Post Office:<br/><a href="{$site-URL}VoS/govdoc/place.html">A list of place
									names is available</a></td>
							<td align="left">
								<input id="post_office" size="10"/>
							</td>
						</tr>


						<tr>
							<td colspan="4" bgcolor="#ffcc99">
								<b>Census Record Information</b>
							</td>
						</tr>

						<tr>
							<td align="right">Page Number:</td>
							<td align="left">
								<select id="page_num-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="page_num" size="6"/>
							</td>
							<td align="right">Dwelling Number:</td>
							<td align="left">
								<select id="dwelling_num-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="dwelling_num" size="6"/>
							</td>
						</tr>

						<tr>
							<td align="right">Family Number:</td>

							<td align="left">
								<select id="family_num-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="family_num" size="6"/>
							</td>
						</tr>
					</table>
				</form>
					<br/>

					<hr width="80%"/>
					<center>
						<a href="/VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0"
								alt=""/>
						</a>
					</center>
				</div>
				<div id="search" style="margin-top:20px;margin-bottom:20px;"/>
				<div id="search1"
					style="width:49%; float:left;margin-top:20px;margin-bottom:20px;margin-right:1%;"/>
				<div id="search2"
					style="width:49%; float:left;margin-top:20px;margin-bottom:20px;margin-left:1%"
				/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
