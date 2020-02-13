<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Chambersburg Claims Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/claims_search.js"/>
				
				<script type="text/javascript" src="javascript/replace_em.js"/>
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
											<a href="/VoS/reference/tips.html">
												<b>Tips for Searching</b>
											</a>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="VoS/paclaims.html">
												<b>Return to<br/> Claims Home</b>
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

								<p>
									<h1 class="red-head">
										<b>
											<center> Search the Chambersburg Claims Database
											</center>
										</b>
									</h1>
								</p>

								<blockquote> After the war Pennsylvania established a claims
									commission to review petitions for reimbursement for damages
									sustained during the war by communities along the border. A
									great majority of the claims came from Franklin County, largely
									because of the burning of Chamberburg. This database is a
									searchable set of the 594 Chambersburg claims. <br/><br/>
								</blockquote>
								<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle
									or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
									full explanation. </blockquote>
							</td>
						</tr>
					</table>
					<hr/>
					<center>
						<form name="claimsSearchForm" action="claims_search_results.html" method="get">
						<table cellpadding="10">

							<tr>
								<td align="center" colspan="4">
									<input type="hidden" id="query" name="q"/>
									<input type="hidden" name="rows" value="50"/>
									<input type="hidden" name="start" value="0"/>
									<input type="submit" value="Initiate Search" id="search_button"/>
									<input type="reset" value="Clear"/><span> Sort records by: </span>
									<select name="sort">
										<option value="last asc, first asc">Last name</option>
										<option value="amount_award asc">Amount Awarded</option>
										<option value="amount_rec asc">Amount Received</option>
										<option value="claim_total asc">Total Claim</option>
										<option value="real_property asc">Real Property Value</option>
										<option value="race asc">Race of Claimant</option>
										<option value="gender asc">Gender of Claimant</option>
									</select>
								</td>
							</tr>

							<tr>
								<td align="right">Last name:</td>
								<td align="left">
									<input name="last_name"/>
								</td>
								<td align="right">First name:</td>
								<td align="left">
									<input name="first_name"/>
								</td>
							</tr>

							<tr>
								<td align="right">Sex:</td>
								<td align="left" id="sex_cell">
									<input name="sex" type="radio" value="m">Male</input>
									<input name="sex" type="radio" value="f">Female</input>
								</td>
								<td align="right">Color:</td>
								<td align="left" id="race_cell">
									<input name="race" type="radio" value="b">Black</input>
									<input name="race" type="radio" value="w">White</input>
									<input name="race" type="radio" value="m">Mulatto</input>
								</td>

							</tr>

							<tr>
								<td align="right">Total Amount Claimed:</td>
								<td align="left">
									<select id="claim_total-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>

									<input name="claim_total" size="6"/>
								</td>
							</tr>

							<tr>
								<td align="right">Personal Property Claim:</td>
								<td align="left">
									<select id="pers_prop-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="pers_prop" size="6"/>
								</td>
								<td align="right">Real Property Claim:</td>
								<td align="left">
									<select id="real_prop-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>

									<input name="real_prop" size="6"/>
								</td>
							</tr>

							<tr>
								<td align="right">Amount Awarded:</td>
								<td align="left">
									<select id="amount_award-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>
									<input name="amount_award" size="6"/>
								</td>
								<td align="right">Amount Received:</td>
								<td align="left">
									<select id="amount_rec-op">
										<option value="gt">&gt;</option>
										<option value="equal">=</option>
										<option value="lt">&lt;</option>
										<option value="not">&lt;&gt;</option>
									</select>

									<input name="amount_rec" size="6"/>
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
