<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Manufacturing Census Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold }
					.warning{font-weight:bold; padding:5px; color:#000099;} .header
					{background:#FFCC99; vertical-align:center; color: #990000; font-weight: bold;} </style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/manu_adv_census_search.js"/>
			</head>
			<body TEXT="#000000" BGCOLOR="FFFFFF" LINK="#CD7F32" VLINK="#00009C">
				<div style="width:100%;text-align:center;" id="no-javascript">
					<h3 class="warning">This page requires Javascript. Please ensure that you have
						enabled Javascript in your browser's preferences</h3>
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
											<a href="manu_census">
												<b>Basic Search</b>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="VoS/govdoc/censi/mcensus.html">
												<b>Information<br/>About the Census</b>
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
									<tr>
										<td align="center">
											<a href="VoS/govdoc/censi/census_new.html">
												<b>Return to<br/> Census Home</b>
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
											<center> Search the U.S. Manufacturing Census for 1860
												and 1870<br/> Advanced Search </center>
										</b>
									</h1>
								</p>

								<blockquote>This page allows you to search the 1860 U.S.
									Manufacturing Census in either Augusta County, VA or Franklin
									County, PA. This page is the Advanced Search, and so has a large
									number of possible search fields. If most of these fields seem
									irrelevent to your question you might want to look at the
										<b>Basic Search</b> page, which can be accessed from the
										link to the left.</blockquote>
								<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle
									or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
									full explanation. </blockquote>

							</td>
						</tr>
					</table>

					<hr/>
					<center>
						<form action="manu_adv_census_search_results.html" method="get"
							id="manuAdvCensusSearch" name="manuAdvCensusSearch">
							<table cellpadding="10" style="width:70%">
								<tr>
									<td colspan="4" align="center" style="padding: 1em;">
										<input type="hidden" name="q" id="query" value=""/>
										<input type="hidden" name="rows" value="50"/>
										<input type="hidden" name="start" value="0"/>
										<input type="hidden" name="db" id="db" value=""/>
										<input type="submit" value="Initiate Search" id="search_button"/>
										<input type="reset" value="Clear"/>
									</td></tr>
								<tr><td colspan="2" align="center" style="padding: 1em;" id="county_cell">
										<xsl:text>County: </xsl:text>
										<input type="radio" name="county" value="aug" checked="checked">Augusta</input>
										<input type="radio" name="county" value="fr">Franklin</input>
									</td>
									<td align="center" id="year_cell" colspan="1" style="padding: 1em;" >
										<xsl:text>Year: </xsl:text>
										<input type="radio" name="year" value="60" checked="checked">1860</input>
										<input type="radio" name="year" value="70">1870</input>
									</td>
									<td align="center" id="sort_cell" colspan="1" style="padding: 1em;" >
										<xsl:text>Sort records by </xsl:text>
										<select name="sort" id="sort">
											<option selected="selected" value="id_num asc">Record Number (Default)</option>
											<option value="name asc, last_name asc">Business (or Owner) Name</option>
										</select>
									</td>

								</tr>
								<tr class="header">
									<td colspan="4">Basic Information</td>
								</tr>
								<tr>
									<td align="right" style="width:20%;"><a
											href="VoS/govdoc/censi/mcensus.html#company">
											<b>Name of Business<br/>(or Owner)</b>
										</a>:</td>

									<td style="width:30%;">
										<input id="name" name="name"/>
									</td>
									<td align="right" style="width:20%;"><a
											href="VoS/govdoc/censi/mcensus.html#page">
											<b>Type of Business</b>
										</a>:</td>
									<td style="width:30%;">
										<input name="business" id="business"/>
									</td>
								</tr>

								<tr>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#page">
											<b>Location</b>
										</a>:</td>
									<td>
										<input name="location" id="location"/>
									</td>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#capital"
										><b>Capital Investment</b></a>:</td>
									<td nowrap="nowrap">
										<select name="capital-op">
											<option>=</option>
											<option>&gt;</option>
											<option>&lt;</option>
											<option>&lt;&gt;</option>
										</select>
										<input name="capital" size="7"/>
										dollars
									</td>
								</tr>
								<tr bgcolor="#ffcc99">
									<td bgcolor="#ffcc99" valign="center" colspan="4">
										<font class="red-head">Workers</font>
									</td>
								</tr>

								<tr>
									<td align="right">Number of male workers:</td>
									<td nowrap="nowrap">
										<select name="male_hands-op">
											<option>=</option>
											<option>&gt;</option>
											<option>&lt;</option>
											<option>&lt;&gt;</option>
										</select>
										<input name="male_hands" size="7"/>
										
									</td>
									<td align="right">Number of female workers:</td>
									<td nowrap="nowrap">
										<select name="female_hands-op">
											<option>=</option>
											<option>&gt;</option>
											<option>&lt;</option>
											<option>&lt;&gt;</option>
										</select>
										<input name="female_hands" size="7"/>
										
									</td>
								</tr>
								<tr>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#wage"
											>Male wage</a>:</td>
									<td nowrap="nowrap">
										<select name="male_wage-op">
											<option>=</option>
											<option>&gt;</option>
											<option>&lt;</option>
											<option>&lt;&gt;</option>
										</select>
										<input name="male_wage" size="7"/>
										dollars
									</td>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#wage"
											>Female wage</a>:</td>
									<td nowrap="nowrap">
										<select name="female_wage-op">
											<option>=</option>
											<option>&gt;</option>
											<option>&lt;</option>
											<option>&lt;&gt;</option>
										</select>
										<input name="female_wage" size="7"/>
										dollars
									</td>
								</tr>
								<tr bgcolor="#ffcc99">
									<td bgcolor="#ffcc99" valign="center" colspan="4">
										<font class="red-head">Products (Annual)</font>
									</td>
								</tr>
								<tr>
									<td align="right"><a
											href="VoS/govdoc/censi/mcensus.html#products">Kind of
											products</a>:</td>
									<td>
										<input name="products" size="25"/>
									</td>
									<td/>
									<td/>
								</tr>
								<tr>
									<td align="right"><a
											href="VoS/govdoc/censi/mcensus.html#products">Quantity
											of products</a>: </td>
									<td>
										<input name="qty_annual" size="25"/>
									</td>
									<td align="right"><a
											href="VoS/govdoc/censi/mcensus.html#products">Value of
											products</a>:</td>
									<td align="left">
										<select name="val_annual-op">
											<option>=</option>
											<option>&gt;</option>
											<option>&lt;</option>
											<option>&lt;&gt;</option>
										</select>
										<input name="val_annual" size="7"/>
										dollars
									</td>
								</tr>
								<tr bgcolor="#ffcc99">
									<td bgcolor="#ffcc99" valign="center" colspan="4">
										<font class="red-head">Raw Materials (Annual)</font>
									</td>
								</tr>
								<tr>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#raw"
											>Kind of raw materials</a>:</td>
									<td>
										<input name="kinds_raw" size="25"/>
									</td>
									<td/>
									<td/>
								</tr>
								<tr>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#raw"
											>Quantity of raw materials</a>: </td>
									<td>
										<input name="qty_raw" size="25"/>
									</td>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#raw"
											>Value of raw materials</a>:</td>
									<td align="left">
										<select name="val_raw-op">
											<option>=</option>
											<option>&gt;</option>
											<option>&lt;</option>
											<option>&lt;&gt;</option>
										</select>
										<input name="val_raw" size="7"/>
										dollars
									</td>
								</tr>

								<tr bgcolor="#ffcc99">
									<td bgcolor="#ffcc99" valign="center" colspan="4">
										<font class="red-head">Power</font>
									</td>
								</tr>
								<tr>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#power"
											>Type of power used in production</a>:</td>
									<td>
										<input name="power" size="25"/>
									</td>
								</tr>

								<tr>
									<td bgcolor="#ffcc99" valign="center" colspan="4">
										<font class="red-head">Census Information</font>
									</td>
								</tr>
								<tr>
									<td align="right"><a href="VoS/govdoc/censi/mcensus.html#page"
											>Page number</a>:</td>
									<td>
										<select name="pageno-op">
											<option>=</option>
											<option>&gt;</option>
											<option>&lt;</option>
											<option>&lt;&gt;</option>											
										</select>
										<input name="pageno" size="7"/>
										
									</td>
									<td/>
									<td/>
								</tr>
							</table>
						</form>
					</center>
					<br/>
					<hr width="80%"/>
					<center>
						<a href="VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0" alt=""/>
						</a>
					</center>
				</div>
				<div id="search"/>
			</body>
		</html>


	</xsl:template>
</xsl:stylesheet>
