<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Population Census Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold; }
					.search_table td {padding:10px;} div[special=search1] { border: thin solid blue; background: #99CCFF; padding: 4px; } 
					div[special=search2] { border: thin solid red; background: #FF9999; padding: 4px; } 
					.warning{font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} .debug {color:red; background:brown;}  
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/population_census.js"/>
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
											<a href="advanced">
												<b>Advanced Search</b>
											</a>
											<b> </b>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="VoS/govdoc/censi/pcensus.html">
												<b>Information<br/>About the Census</b>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="VoS/reference/tips.html">
												<b>Tips for Searching</b>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="VoS/govdoc/censi/census_new.html">
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

								<p>
									<h1 class="red-head">
										<b>
											<center> Search the U.S. Census - Basic Search </center>
										</b>
									</h1>
								</p>

								<blockquote> This page allows you to search either the 1860 or 1870
									U.S. Population Census in either Augusta County, Virginia, or
									Franklin County, Pennsylvania. This page only allows users to
									search on basic information found in the census (name, age, sex,
									color, occupation, wealth, and birthplace). If you would like to
									search on other fields found in the Census (such as the dwelling
									number, rank in household, page number in the census record)
									please use the Advanced Search for the specific year you wish to
									search.<br/> An advanced search of each year of the Census can
									be accessed by following the appropriate link at the left.<br/><br/>
									<b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle
									or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
									full explanation. </blockquote>

							</td>
						</tr>
					</table>



					<hr/>
					<div style="float:left;" id="objectInspector"></div>
					<form id="basic_census" method="get" action="census_search_results">
						<input type="hidden" id="query" name="q" value="PLEASE_TURN_ON_JAVASCRIPT"/>
						<input type="hidden" id="query_dual" name="q_dual" value=""/>
						<input type="hidden" id="db" name="db" value=""/>
						<input type="hidden" id="db1" name="db1" value=""/>
						<input type="hidden" id="db2" name="db2" value=""/>
						<input type="hidden" name="rows" value="50"/>
						<input type="hidden" name="start" value="0"/>
						<input type="hidden" id="census_interface_marker" name="detailed" value="no"/>
						<input type="hidden" id="sort" name="sort" value="please turn on your browsers javascript"/>
					<table style="margin-left:auto;margin-right:auto;" class="search_table">

						<tr>
							<td id="formSubmission" align="center" colspan="4">
								<input type="submit" id="search_button" value="Initiate Search"/>
								<input type="reset"  id="reset_button" value="Clear"/>
							</td>
						</tr>
						<tr><td colspan="1" id="debugDisplay1"></td><td colspan="1" id="debugDisplay2"></td></tr>
						<tr>
							<td align="right">Year:</td>
							<td align="left" id="year_cell" class="validate">
								<input type="radio" name="year" value="1860" id="year_1860" checked="checked">1860</input>
								<input type="radio" name="year" value="1870" id="year_1870">1870</input>
								<input type="radio" name="year" value="both" id="year_default">Both</input>
							</td>

							<td align="right">County:</td>
							<td id="county_cell" class="validate">
								<input type="radio" name="county" value="aug" id="county_augusta" checked="checked">Augusta</input>
								<input type="radio" name="county" value="fr" id="county_franklin">Franklin</input>
							</td>
						</tr>

						<tr>
							<td align="right">Order Results By:</td>
							<td align="left">
								<select id="result_order" class="validate">
									<option value="last asc, first asc" selected="selected">Last Name/First Name</option>
									<option value="family_num asc">Family Units</option>
									<option value="subdistrict asc, district asc, post_office asc">Location</option>
								</select>
							</td>
							
							<td/>
							<td/>
						</tr>

						<tr>
							<td colspan="4">
								<hr/>
							</td>
						</tr>

						<tr>
							<td align="right">
								<a href="VoS/govdoc/censi/pcensus.html#last">
									<b>Last name:</b>
								</a>
							</td>
							<td align="left" id="last_name_display" class="validate">
								<input id="last" size="20" class="text"/><span/>
							</td>
							<td align="right">
								<a href="VoS/govdoc/censi/pcensus.html#first">
									<b>First name:</b>
								</a>
							</td>
							<td align="left" id="first_name_display" class="validate">
								<input id="first" size="20" class="text"/><span/>
							</td>
						</tr>

						<tr>
							<td align="right">Age:</td>
							<td align="left" class="validate">
								<select id="ages-op">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="age" size="6"/>
							</td>
							<td align="right"><a href="VoS/govdoc/censi/pcensus.html#sex">
									<b>Sex</b>
								</a>:</td>

							<td align="left" id="sex_cell" class="validate">
								<input type="radio" name="sex" value="sex:m">male</input>
								<input type="radio" name="sex" value="sex:f">female</input>
							</td>
						</tr>

						<tr>
							<td align="right"><a href="VoS/govdoc/censi/pcensus.html#color">
									<b>"Color"</b>
								</a>:</td>
							<td align="left" colspan="3" id="color_cell" class="validate">
								<input type="radio" name="colors" id="cr1" value="color:b">black</input>
								<input type="radio" name="colors" id="cr2" value="color:w">white</input>
								<input type="radio" name="colors" id="cr3" value="color:m">"mulatto"</input>
								<input type="radio" name="colors" id="cr4" value="(color:b OR color:m)">black
									or mulatto</input>
							</td>
						</tr>

						<tr>
							<td align="right" valign="center"><a
									href="VoS/govdoc/censi/pcensus.html#estate">
									<b>Real estate value</b>
								</a><br/>(in $)</td>
							<td align="left" valign="center">

								<select id="realests-op" class="validate">
									<option value="gt">&gt;</option>
									<option value="equal">=</option>
									<option value="lt">&lt;</option>
									<option value="not">&lt;&gt;</option>
								</select>
								<input id="realests" size="6"/>
							</td>
							<td align="right" valign="center"><a
									href="VoS/govdoc/censi/pcensus.html#estate">
									<b>Personal estate value</b>
								</a><br/>(in $)</td>

							<td align="left" valign="center" class="validate">
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
							<td align="right"><a href="VoS/govdoc/censi/pcensus.html#occupation">
									<b>Occupation</b>
							</a>:<br/><a href="VoS/govdoc/alloccs.html">(A list of occupations<br/>is
									available)</a></td>
							<td align="left" class="validate">
								<input id="occupation" class="text"/><span/>
							</td>
							<td align="right"><b>
									<a href="VoS/govdoc/censi/pcensus.html#birthplace"
									>Birthplace</a>
								</b>: </td>
							<td align="left" class="validate">
								<input id="birth_place" class="text"/><span/>
							</td>
						</tr>

					</table>
					</form>
					
					<br/>

					<hr width="80%"/>
					<center>
						<a href="VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0"
								alt=""/>
						</a>
					</center>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
