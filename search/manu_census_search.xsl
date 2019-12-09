<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Manufacturing Census Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/manu_census_search.js"/>
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
											<a href="manu_adv_census">
												<b>Advanced Search</b>
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
									<img src="VoS/redesign/images/vtitle4.gif"/>
								</center>
								<br/>
								<br/>

								<p>
									<h1 class="red-head">
										<b>
											<center> Search the U.S. Manufacturing Census for 1860
												and 1870<br/> Basic Search </center>
										</b>
									</h1>
								</p>

								<blockquote> This page allows you to search the 1860 and 1870 U.S.
									Manufacturing Census in either Augusta County, VA or Franklin
									County, PA. This page only allows users to search on basic
									information found in the manufacturing census (name of owner,
									name of business, location of business, and type of product
									produced). If you would like to search on other fields found in
									the manufacturing census (such as capital investment,
									information on workers, quantity and value of prodects produced,
									and page number in the census record) please use the Advanced Search.<br/>
									<br/> The advanced search can be accessed by following the
									appropriate link at the left.<br/><br/>
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
						<form action="manu_census_search_results.html" method="get" name="manuCensusSearch">
						<table cellpadding="10" style="width:90%">

							<tr>
								<input type="hidden" name="q" id="query" value=""/>
								<input type="hidden" name="rows" value="50"/>
								<input type="hidden" name="start" value="0"/>
								<input type="hidden" name="db" id="db" value=""/>
								<input type="submit" value="Initiate Search" id="search_button"/>
								<input type="reset" value="Clear"/>
								<td> </td>
								<td colspan="1" align="right" id="county_cell">
									<xsl:text>County: </xsl:text>
									<input type="radio" name="county" value="aug" checked="checked">Augusta</input>
									<input type="radio" name="county" value="fr">Franklin</input>
								</td>
								<td align="center" id="year_cell" colspan="1">
									<xsl:text>Year: </xsl:text>
									<input type="radio" name="year" value="60" checked="checked">1860</input>
									<input type="radio" name="year" value="70">1870</input>
								</td>
								<td align="left" id="sort_options" colspan="1" style="padding-right: 1em;">
									<xsl:text>Sort results by: </xsl:text>
									<select name="sort" id="sort" >
										<option value="last asc, first asc">Last Name, First Name</option>
										<option value="business asc">Type of Business</option>
										<option value="kinds_annual asc">Products</option>
										<option value="location asc">Location</option>
									</select>
								</td>
								
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
									<select name="business" id="business">
										<option/>
										<option>[?]</option>
										<option>Agr. Implements</option>
										<option>Baker</option>
										<option>Baker &amp; Confectioner</option>
										<option>Bit Maker</option>
										<option>Blacksmith Shop</option>
										<option>Boot and Shoemaker</option>
										<option>Brewer</option>
										<option>Brickyard</option>
										<option>Butcher</option>
										<option>Cabinet Maker</option>
										<option>Candles</option>
										<option>Carriage Maker</option>
										<option>Cement Mill</option>
										<option>Chopping &amp; Sawmill</option>
										<option>Chopping Mill</option>
										<option>Cigar Manufactory</option>
										<option>Clover Mill</option>
										<option>Coach</option>
										<option>Confectioner</option>
										<option>Cooper</option>
										<option>Daguerrotypist</option>
										<option>Dentist</option>
										<option>Distillery</option>
										<option>Edge Tools</option>
										<option>F. Shop</option>
										<option>Flour &amp;/or Grist Mill</option>
										<option>Foundry</option>
										<option>Foundry &amp; Machine Shop</option>
										<option>Furniture Manufacturer</option>
										<option>Harness</option>
										<option>Hatter</option>
										<option>Iron Furnace</option>
										<option>Iron Furnance</option>
										<option>Lime Kiln</option>
										<option>Lumber</option>
										<option>Machine Shop</option>
										<option>Manufacture of Gas</option>
										<option>Merchant[?] Tailor</option>
										<option>Milliner</option>
										<option>Mining Co.</option>
										<option>Nursery</option>
										<option>Paper Mill</option>
										<option>Planing Mill</option>
										<option>Plaster Mill</option>
										<option>Potter</option>
										<option>Rolling Mill</option>
										<option>Roofing[?] Mill</option>
										<option>Rope Manufactory</option>
										<option>Saddle &amp;/or Harness Shop</option>
										<option>Sawmill</option>
										<option>Silver Plate &amp; [?]</option>
										<option>Slaughterhouse</option>
										<option>Stone Cutter</option>
										<option>Sumac Mill</option>
										<option>Tailor Shop</option>
										<option>Tannery</option>
										<option>Tar Manufacturing</option>
										<option>Tin and Coppersmith</option>
										<option>Tobbaconist</option>
										<option>W. M.[?] Shop</option>
										<option>Wagon Maker</option>
										<option>Windmill Manufacturer</option>
										<option>Wool Carding</option>
										<option>Woolen Factory</option></select>
								</td>
							</tr>

							<tr>
								<td align="right"><a href="VoS/govdoc/censi/mcensus.html#company">
										<b>Products</b>
									</a>:</td>

								<td>
									<input id="products" name="products" size="25"/>

								</td>
								<td align="right"><a href="VoS/govdoc/censi/mcensus.html#page">
										<b>Location</b>
									</a>:</td>
								<td>
									<select name="location" id="location">
										<option/>
										<option value="1st District">Augusta: 1st District</option>
										<option value="North Subdiv.">Augusta: North Subdiv.</option>
										<option value="Staunton Dist. 1">Augusta: Staunton Dist. 1</option>
										<option value="Antrim Tshp.">Franklin: Antrim Tshp.</option>
										<option value="Bor. of Ch\'burg">Franklin: Bor. of Ch\'burg</option>
										<option value="Ch\'burg-S.Ward">Franklin: Ch\'burg-S.Ward</option>
										<option value="Chambersburg">Franklin: Chambersburg</option>
										<option value="Fannett Tshp.">Franklin: Fannett Tshp.</option>
										<option value="Greencastle Bor.">Franklin: Greencastle Bor.</option>
										<option value="Greene Tshp.">Franklin: Greene Tshp.</option>
										<option value="Guilford Tshp.">Franklin: Guilford Tshp.</option>
										<option value="Hamiton Tshp.">Franklin: Hamiton Tshp.</option>
										<option value="LetterkennyTshp.">Franklin: LetterkennyTshp.</option>
										<option value="Lurgan Tshp.">Franklin: Lurgan Tshp.</option>
										<option value="Metal Tshp.">Franklin: Metal Tshp.</option>
										<option value="Montgomery Tshp.">Franklin: Montgomery Tshp.</option>
										<option value="Peters Tshp.">Franklin: Peters Tshp.</option>
										<option value="Quincy Tshp.">Franklin: Quincy Tshp.</option>
										<option value="S\'hampton Tshp.">Franklin: S\'hampton Tshp.</option>
										<option value="St. Thomas Tshp.">Franklin: St. Thomas Tshp.</option>
										<option value="Washington Tshp.">Franklin: Washington Tshp.</option>
										<option value="Waynesboro">Franklin: Waynesboro</option>
									</select>
								</td>
							</tr>
						</table>
						</form>
					</center>
					<br/>
					<hr width="80%"/>
					<center>
						<a href="VoS/choosepart.html">
							<img src="VoS/graphics/full7.gif" border="0"
								alt=""/>
						</a>
					</center>
				</div>
				<div id="search"/>
			</body>
		</html>


	</xsl:template>
</xsl:stylesheet>
