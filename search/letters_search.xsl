<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow Letters</title>
				<style> .highlightme { background-color: yellow; } .noresults { font-size: 16px;
					margin: 10px 0 10px 0; } .currentShowing { width: 100px; text-align: center;
					padding: 0 10px 0 10px; } .previousPage { width: 250px; text-align: right; }
					.nextPage { width: 250px; text-align: left; } #resultSummary { padding: 5px 0
					5px 0; border-top: 1px solid #c6c6c6; border-bottom: 1px solid #c6c6c6; }
					#returnPage { width: 65%; } #topNavig { text-align: center; margin: 5px 0 5px 0;
					} #bottomNavig { text-align: center; margin: 5px 0 5px 0; } #jumpPages {
					padding: 5px 0 5px 0; border-top: 1px solid #c6c6c6; } #resultReturns { clear:
					both; } .warning{font-weight:bold; padding:5px; color:#000099;}
					.red-head {color: #990000; font-family: times, serif; font-weight: bold;}
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/letters_search.js"/>
			</head>
			<body bgcolor="#FFFFFF" link="#cd7f32" vlink="#00009c">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
					<div style="width:90%;text-align:center;">
						<img src="/VoS/images/images/vtitle4.gif"
						style="padding-left:10px;"/>
						<h2 class="red-head">Search the Valley of the Shadow Letters</h2>
						<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
							substituted for any number of characters at the middle
							or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
							full explanation. </blockquote>
					</div>
					<div style="padding: 2em; max-width: 80%;">
					<form name="lettersSearchForm" action="letters_search_results.html" method="get">
						<input type="hidden" readonly="readonly" name="q" id="query"/>
						<input type="hidden" readonly="readonly" name="rows" value="50"/>
						<input type="hidden" readonly="readonly" name="start" value="0"/>
					<hr/><br/> Search for word or phrase: <br/><input name="search_text" size="40"
					value="" /><br/> within <br/>
					<select name="docs">
						<option value="all">All letters</option>
						<option value="augusta">All Augusta County letters</option>
						<option value="franklin">All Franklin County letters</option>
						<option value="bureau">All Freedmen's Bureau letters</option>

					</select><hr width="60%" align="center"/> Further constrain by <a
						href="/VoS/reference/letters_help/authors.html">author</a>: <br/><input name="author"
						size="40"/>
						<br/> and/or <a href="/VoS/reference/letters_help/keywords.html">keyword</a>: <br/><input
						name="keyword" size="40"/>
					<br/> and/or date range [1850-1880]: <br/> begin date: year <input
						name="begin_year" size="4"/><br/>end date: year <input name="end_year" size="4"/><br/>
					<br/>Group results by <select name="grouping">
						<option value="" selected="selected">match</option>
						<option value="title_string">work title</option>
						<option value="year">year</option>
					</select>
					<hr/><input type="submit" value="Submit Query" id="search_button"/>
					<input type="reset" value="Clear"/><br/>
					<hr/>
					</form>
</div>
				</div>
				<center>
					<a href="/VoS/choosepart.html">
						<img src="/VoS/images/graphics/full7.gif" border="0"
							alt=""/>
					</a>
				</center>
			</body>
		</html>

	</xsl:template>
</xsl:stylesheet>
