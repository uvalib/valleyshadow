<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Search the Newspapers</title>
				<style> .highlightme { background-color: yellow; } 
					.noresults { font-size: 16px; margin: 10px 0 10px 0; } 
					.currentShowing { width: 100px; text-align: center; padding: 0 10px 0 10px; } 
					.previousPage { width: 250px; text-align: right; }
					.nextPage { width: 250px; text-align: left; } 
					#resultSummary { padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; border-bottom: 1px solid #c6c6c6; }
					#returnPage { width: 65%; } 
					#topNavig { text-align: center; margin: 5px 0 5px 0;} 
					#bottomNavig { text-align: center; margin: 5px 0 5px 0; } 
					#jumpPages { padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; } 
					#resultReturns { clear: both; } 
					.warning{font-weight:bold; padding:5px; color:#000099;} 
					.red-head {color: #990000; font-family: times, serif; font-weight: bold;} 
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/newspapers_search.js"/>
			</head>
			<body bgcolor="#FFFFFF" link="#CD7F32" vlink="#00009C">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
					<center>
						<img src="/VoS/images/images/vtitle4.gif"
							border="0"/>

						<h2 class="red-head">Search the Valley Newspapers</h2>
						<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
							substituted for any number of characters at the middle
							or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
							full explanation. </blockquote>
						<form name="newspaperSearchForm" method="get" action="newspapers_search_results.html">
							<input type="hidden" name="q" id="query"/>
							<input type="hidden" name="rows" value="50"/>
							<input type="hidden" name="start" value="0"/>
						<table border="0" width="65%">
							<tr>
								<td>
									<p>
										<i>By default, all dates and newspapers will be searched. To
											limit your search, select specific dates and/or
											newspapers.</i>
									</p>
									<hr/>
								</td>

							</tr>
							<tr>
								<td>
									<p>
										<label>Search for: <input name="search_text" type="text"/>
										</label> Sort results by:<select name="sort">
											<option value="newspaper_date asc">Date (ascending)</option>
											<option value="newspaper_date desc">Date (decending)</option>
										</select>
									</p>
									<p>
										<label>Date Range:</label>
										<select name="start_year" style="margin-right:5px">
											<option value="">Select Year...</option>
											<option value="1857">1857</option>
											<option value="1858">1858</option>
											<option value="1859">1859</option>
											<option value="1860">1860</option>
											<option value="1861">1861</option>
											<option value="1862">1862</option>
											<option value="1863">1863</option>
											<option value="1864">1864</option>
											<option value="1865">1865</option>
											<option value="1866">1866</option>
											<option value="1867">1867</option>
											<option value="1868">1868</option>
											<option value="1869">1869</option>
											<option value="1870">1870</option>
										</select>
										<select name="start_month" style="margin-right:5px"
											disabled="disabled">
											<option value="00">Select Month...</option>
											<option value="01">January</option>
											<option value="02">February</option>
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
										</select>
										<xsl:text> through </xsl:text>
										<select name="end_year" style="margin-right:5px">
											<option value="">Select Year...</option>
											<option value="1857">1857</option>
											<option value="1858">1858</option>
											<option value="1859">1859</option>
											<option value="1860">1860</option>
											<option value="1861">1861</option>
											<option value="1862">1862</option>
											<option value="1863">1863</option>
											<option value="1864">1864</option>
											<option value="1865">1865</option>
											<option value="1866">1866</option>
											<option value="1867">1867</option>
											<option value="1868">1868</option>
											<option value="1869">1869</option>
											<option value="1870">1870</option>
										</select>
										<select name="end_month" style="margin-right:5px;"
											disabled="disabled">
											<option value="13">Select Month...</option>
											<option value="01">January</option>
											<option value="02">February</option>
											<option value="03">March</option>
											<option value="04">April</option>
											<option value="05">May</option>
											<option value="06">June</option>
											<option value="07">July</option>
											<option value="08">August</option>
											<option value="09">September</option>
											<option value="10">October</option>
											<option value="11">November</option>
											<option value="12">December</option>
										</select>
										<span id="validationField"></span>
									</p>

									<label>Select Newspapers: </label>

									<table width="600" border="0" cellspacing="3" cellpadding="3">
										<tr>
											<td width="263">
												<strong>
												<label>Augusta County Papers</label>
												</strong>
											</td>
											<td width="316">
												<strong>Franklin County Papers</strong>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" class="newspaper"
												value="Staunton Vindicator">Staunton Vindicator
												(1859-1870)</input>
											</td>
											<td>
												<input type="checkbox" class="newspaper"
												value="Franklin Repository">Franklin Repository
												(1859-1870)</input>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" class="newspaper"
												value="Staunton Spectator"> Staunton Spectator
												(1857-1870)</input>
											</td>
											<td>
												<input type="checkbox" class="newspaper"
												value="Semi-Weekly Dispatch"> Semi-Weekly
												Dispatch (1861-1862)</input>
											</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox" class="newspaper"
												value="Valley Virginian"> Valley Virginian
												(1865-1870)</input>
											</td>
											<td>
												<input type="checkbox" class="newspaper"
												value="Valley Spirit"> Valley Spirit
												(1859-1870)</input>
											</td>
										</tr>
										<tr>
											<td/>
											<td>
												<input type="checkbox" class="newspaper"
												value="Waynesboro Village Record"> Waynesboro
												Village Record (1863)</input>
											</td>
										</tr>
									</table>
									<p>
										<input type="submit" value="Search" name="search_button"/>
										<input type="reset" value="Reset" id="clear"/>
									</p>
									<p>
										<label> </label>
									</p>

									<!--R1C1-->
								</td>
							</tr>
						</table>
						</form>
					</center>
					<hr/>
					<br/>
					<center>
						<a href="/VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0"
								alt="Full Valley Archive"/>
						</a>
					</center>
				</div>
				<div id="search"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
