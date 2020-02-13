<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Search the Southern Claims Commission</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } 
					.highlightme { background-color: yellow; } .noresults { font-size: 16px;
					margin: 10px 0 10px 0; } .currentShowing { width: 100px; text-align: center;
					padding: 0 10px 0 10px; } .previousPage { width: 250px; text-align: right; }
					.nextPage { width: 250px; text-align: left; } #resultSummary { padding: 5px 0
					5px 0; border-top: 1px solid #c6c6c6; border-bottom: 1px solid #c6c6c6; }
					#returnPage { width: 65%; } #topNavig { text-align: center; margin: 5px 0 5px 0;
					} #bottomNavig { text-align: center; margin: 5px 0 5px 0; } #jumpPages {
					padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; } #resultReturns { clear:
					both; } select{margin:2px;} input{margin:2px;} .warning{font-weight:bold; padding:5px; color:#000099;} .header{ vertial-align:center;background:#FFCC99;padding:5px;}</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/southern_claims_search.js"/>
			</head>
			<body bgcolor="#FFFFFF" link="#cd7f32" vlink="#00009c">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
					<div style="width:100%;text-align:center;">

						<img src="/VoS/images/images/vtitle4.gif"
						style="padding-left:10px;"/>
						
						<h1 class="red-head">Search the Valley Southern Claims Commission</h1>
					</div>


					<form name="soclaimsSearchForm" action="soclaims_results.html" method="get">
						<input type="hidden" id="query" name="q" value="db:xml_claims AND fulltext:"/>
						<input type="hidden" name="rows" value="50"/>
						<input type="hidden" name="start" value="0"/>
					<div style="width:65%;margin-left:auto;margin-right:auto;">
						<br/>
						<p class="header" style="color:#000099;">
							<b>Search Claims:</b>
						</p>
						<p>
							<label>Search for: <input name="search_text" type="text"/>
							</label>
						</p>
						<p>
							<label>Date Range:</label>
							<select name="start_year">
								<option value="">Select Year...</option>
								<option value="1871">1871</option>
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
							<select name="end_year">
								<option value="">Select Year...</option>
								<option value="1871">1871</option>
								<option value="1872">1872</option>
								<option value="1873">1873</option>
								<option value="1874">1874</option>
								<option value="1875">1875</option>
								<option value="1876">1876</option>
								<option value="1877">1877</option>
								<option value="1878">1878</option>
								<option value="1879">1879</option>
							</select>
							<p>
								<input type="submit" id="search_button" value="Search"/>
								<input type="reset" id="clear" value="Reset"/>
							</p>

						</p>
						<br/>
					</div>
					</form>
						<div style="width:65%;margin-left:auto;margin-right:auto;">
						<form name="soclaimsBrowseForm" action="soclaims_results.html" method="get">
							<input type="hidden" id="query" name="q" value="db:xml_claims AND keyword:"/>
							<input type="hidden" id="browse_rows" name="rows" value="50"/>
							<input type="hidden" id="browse_start" name="start" value="0"/>
							<p  class="header" style="color:#990000;">
							<b>Or Browse By:</b>
						</p>
						<p> Keyword: <select name="keyword">
								<option value="">Select Keyword...</option>
								<option>African Americans</option>
								<option>Agriculture</option>
								<option>Church/Religious Activity</option>
								<option>Economy</option>
								<option>Enlistment</option>
								<option>Family</option>
								<option>Home Front</option>
								<option>Military Authority</option>
								<option>National Government</option>
								<option>Patriotism</option>
								<option>Prisons/Prisoners</option>
								<option>Race Relations</option>
								<option>Reunification</option>
								<option>Slavery</option>
								<option>Troop Movement</option>
								<option>Women</option>
						</select><input type="submit" id="browse_button" value="Go!"/></p>
							
						<hr/>
						<center>
							<a href="/VoS/choosepart.html">
								<img src="/VoS/images/graphics/full7.gif"
									border="0" alt=""/>
							</a>
						</center>
					
						</form>
					</div>
				</div>
			</body>
		</html>

	</xsl:template>
</xsl:stylesheet>
