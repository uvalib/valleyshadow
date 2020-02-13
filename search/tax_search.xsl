<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Franklin County Tax Records Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/tax_search.js"/>
				<script type="text/javascript" src="javascript/generic_search_paging.js"/>
			</head>

			<body text="#000000" bgcolor="FFFFFF" link="#CD7F32" vlink="#00009C">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<!-- Table which contains navigation table and intro material -->
				<div id="form">
					<center>
						<table cellpadding="10">

							<tr>
								<td valign="center">
									<!-- Table containing navigation tools -->
									<table bgcolor="#ffcc99" border="0" width="80%" cellpadding="10">
										<tr>
											<td align="center">
												<a href="VoS/govdoc/citytax/citytax.intro.html">
												<b>Information<br/>About the Records</b>
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
									</table>
								</td>
								<td>

									<center>
										<img src="/VoS/images/images/vtitle4.gif"/>
										<br/>
										<br/>

										<p>
											<h1 class="red-head"> Search the 1860 Augusta or
												Franklin County Tax Records </h1>
										</p>
									</center>
									<blockquote> This page allows you to search the 1860 Augusta or
										Franklin County Tax Records Census for Staunton, Virginia or
										Chambersburg, Pennsylvania, respectively. This page allows
										users to search on a number of the fields found in the
										agricultural census (such as name, occupation, and various
										tax amounts).<br/><br/>
										</blockquote>
									<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
										substituted for any number of characters at the middle
										or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
										full explanation. </blockquote>
								</td>
							</tr>
						</table>
					</center>
					<hr/>
					<center>
						<form name="taxSearchForm" action="tax_search_results.html" method="get">
							<input type="hidden" id="query" name="q"/>
							<input type="hidden" name="rows" value="50"/>
							<input type="hidden" name="start" value="0"/>
							<input type="hidden" name="sort" value="last asc, first asc"/>
						<table cellpadding="10" style="width:75%;">
							<tr>
								<td colspan="4" align="center">
									<input type="submit" value="Initiate Search" id="search_button"/>
									<input type="reset" value="clear"/>
								</td>
								
							</tr>
							<tr>
								<td id="county_cell">County: <input type="radio" name="county" id="county_default"
										value="augusta">Augusta</input>
									<input type="radio" name="county" value="franklin"
									>Franklin</input>
								</td>
							</tr>
							<tr>
								<td colspan="4" bgcolor="#ffcc99">
									<b>Personal Information</b>
								</td>

							</tr>
							<tr>
								<td>Last name:</td>
								<td>
									<input name="last_name"/>
								</td>
								<td>First name:</td>
								<td>
									<input name="first_name"/>
								</td>
							</tr>
							<tr class="franklin_form" style="display:none;">
								<td>Occupation:</td>
								<td>
									<input name="occupation"/>
								</td>
							</tr>
							<tr>
								<td colspan="4" bgcolor="#ffcc99">
									<b>Tax Information</b>
								</td>
							</tr>
							<tr class="franklin_form" style="display:none;">
								<td>County tax amount:</td>

								<td>
									<select id="co_tax-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="co_tax" size="6"/>
								</td>
								<td>State tax amount:</td>
								<td>
									<select id="st_tax-op">

										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="st_tax" size="6"/>
								</td>
							</tr>
							<tr class="franklin_form" style="display:none;">
								<td>State personal tax amount:</td>

								<td>
									<select id="st_per_tax-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="st_per_tax" size="6"/>
								</td>
							</tr>
							<tr class="augusta_form" style="display:none;">
								<td>Building value:</td>
								<td>
									<select id="build-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="build" size="6"/>
								</td>
								<td>Lot-building value:</td>
								<td>
									<select id="lot_build-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="lot_build" size="6"/>
								</td>
							</tr>
							<tr class="augusta_form" style="display:none;">
								<td>Tax amount:</td>
								<td>
									<select id="tax_amt-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="tax_amt" size="6"/>
								</td>
								<td>City tax amount:</td>
								<td>
									<select id="city_tax_amt-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="city_tax_amt" size="6"/>
								</td>
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
