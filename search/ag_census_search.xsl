<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Agricultural Census Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} </style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/ag_census_search.js"/>
			</head>

			<body text="#000000" bgcolor="FFFFFF" link="#CD7F32" vlink="#00009C">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
					<!-- Table which contains navigation table and intro material -->
					<center>
						<table cellpadding="10">

							<tr>

								<td valign="center">

									<!-- Table containing navigation tools -->
									<table bgcolor="#ffcc99" border="0" width="80%" cellpadding="10">
										<tr>
											<td align="center">
												<a href="VoS/govdoc/censi/acensus.html">
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
										<br/>
										<br/>

										<h1 class="red-head"> Search the U.S. Agricultural
											Census </h1>
									</center>
									<blockquote> This page allows you to search the 1860 or 1870 U.S.
										Agricultural Census in either Augusta County, VA or Franklin
										County, PA. This page only allows users to search on all
										information found in the agricultural census (such as name
										of owner, acreage, location of farm, and production values).<br/><br/>
										</blockquote>
									<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
										substituted for any number of characters at the middle
										or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
										full explanation. </blockquote>
								</td>
							</tr>
						</table>
					</center>
					<hr/>
					<center>
					<form id="ag_censusSearchForm" name="ag_censusSearchForm" action="ag_census_search_results.html" method="get">
						<input type="hidden" id="query" name="q"/>
						<input type="hidden" name="rows" value="50"/>
						<input type="hidden" name="start" value="0"/>
						<input type="hidden" name="sort" value="last asc, first asc"/>
					<table cellpadding="10">
						<tr>
							<td colspan="4" align="center">

								<input type="submit" value="Initiate Search" id="search_button"/>
								<input type="reset" value="clear"/>
							</td>
						</tr>
						<tr>
							<td align="right">County:</td>
							<td id="county_cell">
								<input type="radio" name="county" value="aug" checked="checked">Augusta</input>
								<input type="radio" name="county" value="fr">Franklin</input>
							</td>
							<td align="right">Year:</td>
							<td id="year_cell">
								<input type="radio" name="year" value="60" checked="checked">1860</input>
								<input type="radio" name="year" value="70">1870</input>
							</td>
						</tr>
						<tr bgcolor="#ffcc99">
							<td bgcolor="#ffcc99" valign="center" colspan="4">
								<font class="red-head">Ownership</font>
							</td>
						</tr>
						<tr>
							<td align="right">
								<a href="VoS/govdoc/censi/acensus.html#last">Last name</a>:</td>

							<td align="left">
								<input name="last_name" size="25"/>
							</td>
							<td align="right">
								<a href="VoS/govdoc/censi/acensus.html#first">First name</a>:</td>
							<td align="left">
								<input name="first_name" size="25"/>
							</td>
						</tr>
						<tr bgcolor="#ffcc99">
							<td bgcolor="#ffcc99" valign="center" colspan="4">
								<font class="red-head">Real Estate</font>
							</td>

						</tr>
						<tr>
							<td align="right"><a href="VoS/govdoc/censi/acensus.html#land">Total
									Acres of Land</a>:</td>
							<td>
								<select name="no_tot_land-op">
									<option>=</option>
									<option>&gt;</option>
									<option>&lt;</option>
									<option>&lt;&gt;</option>
								</select>
								<input name="no_tot_land" size="6"/>
							</td>
							<td align="right"><a href="VoS/govdoc/censi/acensus.html#farm">Farm
									Value</a>: </td>
							<td>
								<select name="farm_val-op">
									<option>=</option>
									<option>&gt;</option>
									<option>&lt;</option>
									<option>&lt;&gt;</option>
								</select>
								<input name="farm_val" size="6"/>
							</td>
						</tr>
						<tr bgcolor="#ffcc99">
							<td bgcolor="#ffcc99" valign="center" colspan="4">
								<font class="red-head">Crops</font>
							</td>
						</tr>

						<tr>
							<td align="right"><a href="VoS/govdoc/censi/acensus.html#tobacco"
									>Total pounds of tobacco</a>:</td>
							<td>
								<select name="no_tobacco-op">
									<option>=</option>
									<option>&gt;</option>
									<option>&lt;</option>
									<option>&lt;&gt;</option>
								</select>

								<input name="no_tobacco" size="6"/>
							</td>
							<td align="right"><a href="VoS/govdoc/censi/acensus.html#tobacco"
									>Total bushels of grain</a>:</td>
							<td>
								<select name="no_tot_grain-op">
									<option>=</option>
									<option>&gt;</option>
									<option>&lt;</option>
									<option>&lt;&gt;</option>
								</select>
								<input name="no_tot_grain" size="6"/>
							</td>
						</tr>
						<tr bgcolor="#ffcc99">
							<td bgcolor="#ffcc99" valign="center" colspan="4">
								<font class="red-head">Animals</font>
							</td>
						</tr>
						<tr>

							<td align="right"><a href="VoS/govdoc/censi/acensus.html#livestock"
									>Cash value of livestock</a>:</td>
							<td>
								<select name="tot_livestock-op">
									<option>=</option>
									<option>&gt;</option>
									<option>&lt;</option>
									<option>&lt;&gt;</option>
								</select>
								<input name="tot_livestock" size="6"/>
							</td>
							<td align="right"><a href="VoS/govdoc/censi/acensus.html#animals"
									>Total animals</a>:</td>
							<td>
								<select name="no_tot_animals-op">
									<option>=</option>
									<option>&gt;</option>
									<option>&lt;</option>
									<option>&lt;&gt;</option>
								</select>
								<input name="no_tot_animals" size="6"/>
							</td>
						</tr>
						<tr bgcolor="#ffcc99">
							<td bgcolor="#ffcc99" valign="center" colspan="4">
								<font class="red-head">Manufacturing</font>
							</td>
						</tr>

						<tr>
							<td align="right"><a href="VoS/govdoc/censi/acensus.html#home">Cash
									Value of Home Manufacturing</a>:</td>
							<td>
								<select name="no_manu-op">
									<option>=</option>
									<option>&gt;</option>
									<option>&lt;</option>
									<option>&lt;&gt;</option>
								</select>

								<input name="no_manu" size="6"/>
							</td>
						</tr>
						

					</table>
					</form>
					</center>
					<br/>
					<hr width="80%"/>
					<center>
						<a href="VoS/choosepart.html">
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
