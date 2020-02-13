<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Search the Memory Articles</title>
				<style> 
					.highlightme { background-color: yellow; } 
					.noresults { font-size: 16px;margin: 10px 0 10px 0; } 
					.currentShowing { width: 100px; text-align: center;padding: 0 10px 0 10px; } 
					.previousPage { width: 250px; text-align: right; }
					.nextPage { width: 250px; text-align: left; } 
					#resultSummary { padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; border-bottom: 1px solid #c6c6c6; }
					#returnPage { width: 65%; } 
					#topNavig { text-align: center; margin: 5px 0 5px 0;} 
					#bottomNavig { text-align: center; margin: 5px 0 5px 0; } 
					#jumpPages {padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; } 
					#resultReturns { clear:both; } 
					select {margin:2px;} input{margin:2px;} 
					.warning{font-weight:bold; padding:5px; color:#000099;}
					.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/memory_search.js"/>
			</head>
			<body bgcolor="#FFFFFF" link="#cd7f32" vlink="#00009c">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
					<div style="width:100%;text-align:center;">

						<img src="/VoS/images/images/vtitle4.gif"
							style="padding-left:10px;"/>
						<h2 class="red-head">Search the Valley Memory Articles</h2>
					</div>
					
					<form name="memorySearchForm" action="memory_results.html" method="get">
						<input type="hidden" id="query" name="q"/>
						<input type="hidden" name="rows" value="50"/>
						<input type="hidden" name="start" value="0"/>
					<div style="width:65%;margin-left:auto;margin-right:auto;">
						<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
							substituted for any number of characters at the middle
							or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
							full explanation. </blockquote>
						<hr/>
						<p>
							<label>Search for: <input name="search_text" class="search_box" type="text"/>
							</label>
						</p>
						<p>
							<label>Date Range:</label>
							<select id="start_year" class="year_selector" name="start_year">
								<option value="*">Select Year...</option>
								<option value="1871" selected="selected">1871</option>
								<option value="1872">1872</option>
								<option value="1873">1873</option>
								<option value="1874">1874</option>
								<option value="1875">1875</option>
								<option value="1876">1876</option>
								<option value="1877">1877</option>
								<option value="1878">1878</option>
								<option value="1879">1879</option>
							</select>
							<xsl:text>through</xsl:text>
							<select id="end_year" class="year_selector" name="end_year">
								<option value="*">Select Year...</option>
								<option value="1871">1871</option>
								<option value="1872">1872</option>
								<option value="1873">1873</option>
								<option value="1874">1874</option>
								<option value="1875">1875</option>
								<option value="1876">1876</option>
								<option value="1877">1877</option>
								<option value="1878">1878</option>
								<option value="1879" selected="selected">1879</option>
							</select>
							<span id="validationField" style="display:inline"></span>
						</p>
						<p id="county"> Search Units from:<br/>
							<input type="radio" name="county" value="all" checked="checked">Both
								Counties</input>
							<input type="radio" name="county" value="augusta">Augusta</input>
							<input type="radio" name="county" value="franklin">Franklin</input>
						</p>
						<p>
							<input type="submit" id="search_button" value="Search"/>
							<input type="reset" id="clear" value="Reset"/>
						</p>
						<hr/>
						<center>
							<a href="/VoS/choosepart.html">
								<img src="/VoS/images/graphics/full7.gif"
									border="0" alt=""/>
							</a>
						</center>
					</div>
						</form>
				</div>
			</body>
		</html>

	</xsl:template>
</xsl:stylesheet>
