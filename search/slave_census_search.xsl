<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Slaveowners Census Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} 
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/slave_census_search.js"/>
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
											<a href="VoS/govdoc/censi/slcensus.html">
												<b>Information <br/>About the Census</b>
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
												<b>Return to <br/> Census Home</b>
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
											<center> Search the U.S. Slaveowners Census for 1860
											</center>
										</b>
									</h1>
								</p>

								<blockquote> In Augusta County the slaveowner census counted the
									number of slaves, their gender and color, but did not record
									their names. Instead, the census recorded the owners' names. You
									will find other information including employers of slaves and
									the location of the plantation. </blockquote>
								<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle
									or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
									full explanation. </blockquote>
							</td>
						</tr>
					</table>

					<hr/>
					<center>

						<form id="slaveCensusSearchForm" name="slaveCensusSearchForm" action="slave_census_search_results.html" method="get">
							<input type="hidden" id="query" name="q"/>
							<input type="hidden" name="rows" value="50"/>
							<input type="hidden" name="start" value="0"/>
							<input type="hidden" name="sort" value="last asc, first asc"/>
						<table cellpadding="10">
							<tr>
								<td align="right" colspan="2">
									<input type="submit" value="Initiate Search" id="search_button"/>
									</td><td colspan="2" align="left">
									<input type="reset" value="Clear"/>
								</td>
								
							</tr>

							<tr bgcolor="#ffcc99">
								<td bgcolor="#ffcc99" valign="center" colspan="4">
									<font class="red-head">Basic Information</font>
								</td>
							</tr>

							<tr>
								<td align="right"><a href="VoS/govdoc/censi/slcensus.html#name">
										<b>Last Name</b>
									</a>:</td>
								<td align="left">
									<input name="last_name" id="last_name"/>
								</td>
								<td align="right"><a href="VoS/govdoc/censi/slcensus.html#name">
										<b>First Name</b>
									</a>:</td>
								<td align="left">
									<input name="first_name" id="first_name"/>
								</td>
							</tr>

							<tr>
								<td align="right">Location:</td>

								<td align="left">
									<input name="location" id="location"/>
								</td>
							</tr>

							<tr>
								<td align="right"><a
										href="VoS/govdoc/censi/slcensus.html#employer">
										<b>Employer Name</b>
									</a>:</td>
								<td align="left">
									<input name="emp_name" id="emp_name"/>
								</td>
								<td align="right">Employer Location:</td>
								<td align="left">
									<input name="emp_location" id="emp_location"/>
								</td>
							</tr>

							<tr bgcolor="#ffcc99">
								<td bgcolor="#ffcc99" valign="center" colspan="4">
									<font class="red-head">Slave Information</font>
								</td>
							</tr>

							<tr>
								<td align="right"><a href="VoS/govdoc/censi/slcensus.html#number">
										<b>Total number of slaves</b>
									</a>:</td>
								<td align="left">
									<select id="tot_slaves-op" name="tot_slaves-op">
										<option value="equal">=</option>
										<option value="gt">&gt;</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="total_slaves" id="tot_slaves" size="6"/>
								</td>
							</tr>

							<tr>
								<td align="right">Number of Male Slaves:</td>
								<td align="left">
									<select id="male_slaves-op" name="male_slaves-op">
										<option value="equal">=</option>
										<option value="gt">&gt;</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="male_slaves" id="male_slaves" size="6"/>
								</td>
								<td align="right">Number of Female Slaves:</td>
								<td align="left">
									<select id="female_slaves-op" name="female_slaves-op">
										<option value="equal">=</option>
										<option value="gt">&gt;</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="female_slaves" id="female_slaves" size="6"/>
								</td>
							</tr>

							<tr>
								<td align="right">Number of Black Slaves:</td>
								<td align="left">
									<select id="black_slaves-op" name="black_slaves-op">
										<option value="equal">=</option>
										<option value="gt">&gt;</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="black_slaves" id="black_slaves" size="6"/>
								</td>
								<td align="right">Number of Mulatto Slaves:</td>
								<td align="left">
									<select id="mulatto_slaves-op" name="mulatto_slaves-op">
										<option value="equal">=</option>
										<option value="gt">&gt;</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="mulatto_slaves" id="mulatto_slaves" size="6"/>
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
