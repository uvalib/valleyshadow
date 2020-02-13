<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Search the Official Records</title>
				<style> .highlightme { background-color: yellow; } 
					.noresults { font-size: 16px; margin: 10px 0 10px 0; } 
					.currentShowing { width: 100px; text-align: center; padding: 0 10px 0 10px; } 
					.previousPage { width: 250px; text-align: right; }
					.nextPage { width: 250px; text-align: left; } 
					#resultSummary { padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; border-bottom: 1px solid #c6c6c6; }
					#returnPage { width: 65%; } 
					#topNavig { text-align: center; margin: 5px 0 5px 0;} 
					#bottomNavig { text-align: center; margin: 5px 0 5px 0; } 
					#jumpPages {padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; } 
					#resultReturns { clear: both; } select{margin:2px;} input{margin:2px;} 
					.warning{font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;}
					.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/or_search.js"/>
			</head>
			<body bgcolor="#FFFFFF" link="#cd7f32" vlink="#00009c">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
					<div style="width:100%;text-align:center;">

						<img src="/VoS/images/images/vtitle4.gif"
							style="padding-left:10px;"/>
						<h2 class="red-head">Search the Valley Official Records</h2>
					</div>


					<form name="orSearchForm" action="or_search_results.html" method="get">
						<input type="hidden" readonly="readonly" name="q" id="query" />
						<input type="hidden" readonly="readonly" name="rows" value="50"/>
						<input type="hidden" readonly="readonly" name="start" value="0"/>
						
					<div style="width:65%;margin-left:auto;margin-right:auto;">
						<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
							substituted for any number of characters at the middle
							or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
							full explanation. </blockquote>
						<p>
							<i>By default, all dates will be searched. To limit your search, select
								specific dates</i>
						</p>
						<hr/>
						<p>
							<label>Search for: <input name="search_text" type="text" value=""/>
							</label>
						</p>
						<p>
							<label>Date Range:</label><select name="start_year">
								<option value="">Select Year...</option>
								<option value="1861">1861</option>
								<option value="1862">1862</option>
								<option value="1863">1863</option>
								<option value="1864">1864</option>
								<option value="1865">1865</option>
							</select>
							<select name="start_month" disabled="disabled">
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
							</select> through <select name="end_year">
								<option value="">Select Year...</option>
								<option value="1861">1861</option>
								<option value="1862">1862</option>
								<option value="1863">1863</option>
								<option value="1864">1864</option>
								<option value="1865">1865</option>
							</select><select name="end_month" disabled="disabled">
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
							<span id="validationField"></span>
						</p>
						<p id="county"> Search Units from:<br/>
							<input type="radio" name="county" value="all" checked="checked">Both
								Counties</input>
							<input type="radio" name="county" value="augusta">Augusta</input>
							<input type="radio" name="county" value="franklin">Franklin</input>
						</p>
						<p>
							<input type="submit" id="search_button" value="Search"/>
							<input type="reset" id="reset" value="Reset"/>
						</p>
						<hr/>
					</div>
						</form>
				</div>
				<center>
					<a href="/VoS/choosepart.html">
						<img src="/VoS/images/graphics/full7.gif" border="0" alt=""/>
					</a>
				</center>
			</body>
		</html>

	</xsl:template>
</xsl:stylesheet>
