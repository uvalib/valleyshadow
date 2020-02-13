<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:cinclude="http://apache.org/cocoon/include/1.0" version="2.0">

	<xsl:param name="current-URL"/>
	<xsl:param name="q"/>
	<xsl:param name="db1"/>
	<xsl:param name="db2"/>
	<xsl:param name="start"/>
	<xsl:param name="rows"/>
	<xsl:param name="county"/>
	<xsl:param name="year"/>
	<xsl:param name="detailed"/>
	<xsl:param name="column"/>
	<xsl:param name="sort"/>
	<xsl:param name="r-header"/>
	<xsl:param name="sender">foo</xsl:param>
	<xsl:param name="current-pipeline"/>
	<xsl:variable name="numFound">
		<xsl:value-of select="//result[@name='response']/@numFound"/>
	</xsl:variable>
	<xsl:variable name="FullCountyName">
		<xsl:choose>
			<xsl:when test="contains($db1, '_aug_')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($db1, '_fr_')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="yearString">
		<xsl:choose>
			<xsl:when test="$year='both'">1860 and 1870</xsl:when>
			<xsl:when test="$year='1860'">1860</xsl:when>
			<xsl:otherwise>1870</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="query1"><xsl:value-of select="$db1"/> AND <xsl:value-of select="$q"/></xsl:variable>
	<xsl:variable name="query2"><xsl:value-of select="$db2"/> AND <xsl:value-of select="$q"/></xsl:variable>

	<xsl:template match="/">
		<xsl:variable name="next">
			<xsl:value-of select="$start+$rows"/>
		</xsl:variable>

		<xsl:variable name="pages">
			<xsl:value-of select="ceiling($numFound div 50)"/>
		</xsl:variable>
		<html>
			<head>
				<title>Valley of the Shadow: Dual Census Search Results</title>
				<style>td {padding-left:5px;padding-right:5px;} body { border: none; } 
					.blue { background: blue; } .searchReturn { align:right;text-align:right;padding-right:1em;}
	            	.debug {background:yellow;} .citationHelp { text-align: center; padding-left: 2em; padding-right: 2em; }
	            	div#footer { width: 100%; } div#searchContainer { border: none; background-color: #FFFFFF; margin-bottom: 2px; padding-bottom: 20px; overflow:hidden;}
	            	div#search1 { height: inherit; width:49%; padding: 2px; margin-left: 1px; margin-top:20px; margin-bottom:20px; margin-right: 1px;  
	            	background-color: rgb(252, 252, 255); position:relative; margin-bottom: -2000px; padding-bottom: 2000px;}
	            	div#search2 {display: inline-block; height: inherit; width:49%; padding: 2px; float:right; margin-right: 1px; margin-top:20px; margin-bottom:20px; margin-right: 2px;  
	            	background: rgb(255, 252, 252); position:relative; margin-bottom: -2000px; padding-bottom: 2000px;}
			 .musterTableHead {
						background-color:#D3D1AC; font-size:12px;font-weight:bold; }

						.musterTableBody { background-color:#D3D1BC; font-size:12px; }
			 .rowodd {
						width: 450px; height: 25px; margin: 8px; font-family:verdana, arial;
						font-size: 12px; }
			 .roweven { width: 450px; height: 25px; margin: 8px;
						font-family:verdana, arial; font-size: 12px; }
			 .label { float:left;
						text-align: right; width: 225px; padding: 5px; background-color: #CFCFCF; }

						.content { float:right; text-align:left; width: 200px; padding: 5px; }
						#search1 h3, #search2 h3 { text-align: center; padding: 5px; }
			 a.visited { color: blue !important; }
			 #search1 h3.description { color: rgb(0, 0, 153); } #search2 h3.description { color: rgb(153, 0, 0); }
			 #search1 *.hideme { display:none; color: rgb(252, 252, 255); background-color: inherit; } #search2 *.hideme { display:none; color: rgb(255, 252, 252); background-color: inherit; }
			 input
						{ font-family:verdana, arial; font-size: 12px; }
			 option {
						font-family:verdana, arial; font-size: 12px; }
			 #TB_window { font: 12px
						Arial, Helvetica, sans-serif; color: #333333; }
			 #TB_secondLine { font: 10px
						Arial, Helvetica, sans-serif; color:#666666; }
			 #TB_window a:link { color:
						#666666; }
			 #TB_window a:visited { color: #666666; }
			 #TB_window a:hover {
						color: #000; }
			 #TB_window a:active { color: #666666; }
			 #TB_window a:focus {
						color: #666666; }
			 #TB_overlay { position: absolute; z-index:100; top: 0px;
						left: 0px; }
			 #TB_window { position: absolute; background: #ffffff;
						z-index: 102; color:#000000; display:none; border: 4px solid #525252;
						text-align:left; }
			 #TB_window img { display:block; margin: 15px 0 0 15px;
						border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; border-top: 1px
						solid #666; border-left: 1px solid #666; }
			 #TB_caption { height:25px;
						padding:7px 30px 10px 25px; float:left; }
			 #TB_closeWindow { height:25px;
						padding:11px 25px 10px 0; float:right; }
			 #TB_closeAjaxWindow { padding:5px
						10px 7px 0; margin-bottom:1px; text-align:right; float:right; }

						#TB_ajaxWindowTitle { float:left; padding:7px 0 5px 10px; margin-bottom:1px;
						}
			 #TB_title { background-color:#e8e8e8; height:27px; }
			 #TB_ajaxContent {
						clear:both; padding:2px 15px 15px 15px; overflow:auto; text-align:left;
						line-height:1.4em; }
			 #TB_ajaxContent p { padding:5px 0px 5px 0px; }
			 #TB_load
						{ position: absolute; display:none; height:100px; width:100px; z-index:101;
						}
			 #TB_HideSelect { z-index:99; position:absolute; top: 0; left: 0;
						background-color:#fff; border:none; filter:alpha(opacity=0); -moz-opacity:
						0; opacity: 0; }
			 #TB_iframeContent { clear:both; border:none;
						margin-bottom:-1px; margin-top:1px; margin-bottom:1px; padding-left:5px;
						padding-right:5px; }

			.highlightme { color: inherit; background-color: yellow; }
			
		</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<!-- <script type="text/javascript" src="javascript/census_search_results.js"/> -->
				<script type="text/javascript" src="javascript/census-thickbox.js"/>
			</head>
			<body bgcolor="#FFFFFF" link="#CD7F32" vlink="#00009C">
				<!-- two debug lines below -->
				<!-- <h2>q is:<xsl:value-of select="$q"/></h2>
				<h3>pipeline :<xsl:value-of select="$current-pipeline"/></h3> -->
				<div align="center">
				<img src="/VoS/images/images/vtitle4.gif"/>
				<h1 style="color: rgb(153, 0, 0); text-align: center;"><xsl:value-of
						select="$FullCountyName"/> County: Results from Searching Both Censuses </h1>
				<p class="citationHelp"><b>Please cite results as coming from: </b><xsl:value-of select="$FullCountyName"/>
	                County, <xsl:choose>
						<xsl:when test="$FullCountyName = 'Augusta'">Virginia</xsl:when>
						<xsl:when test="$FullCountyName = 'Franklin'">Pennsylvania</xsl:when>
					</xsl:choose>, <xsl:value-of select="$yearString"
						/> Population Census, Valley of
	                the Shadow: Two Communities in the American Civil War, Virginia Center for
	                Digital History, University of Virginia
	                (<xsl:value-of
	                select="$current-URL"/>).</p>
					<p class="searchReturn"><a href="population_census">Start a new search</a></p>
				
				<!-- 
				<xsl:element name="div">
					<xsl:attribute name="class">dualResultsDisplay</xsl:attribute>
					<xsl:attribute name="special">
						<xsl:value-of select="$column"/>
					</xsl:attribute>
					<h3>
						<xsl:value-of select="$current-pipeline"/>
					</h3>
					<p>debug: param q is currently=<xsl:value-of select="$q"/></p>
					<p>debug: param db1 is currently=<xsl:value-of select="$db1"/></p>
					<p>debug: param db2 is currently=<xsl:value-of select="$db2"/></p>
					<p>debug: param rows is currently=<xsl:value-of select="$rows"/></p>
					<p>debug: param year is currently=<xsl:value-of select="$year"/></p>
					<p>debug: param sender is currently=<xsl:value-of select="$sender"/></p>
					<p>debug: param r-header is currently=<xsl:value-of select="$r-header"/></p>
					
				</xsl:element>
				
				<p>new query 1 string:"<xsl:value-of select="$query1"/>"</p>
				<p>new query 2 string:"<xsl:value-of select="$query2"/>"</p>
				-->
				</div>
			<div id="searchContainer">
				
				<div class="solr_fragment census_results" id="search2">
					 <cinclude:include src="cocoon:/solr_fragment?q={$query2}"/> 
				</div>
				<div class="solr_fragment census_results" id="search1">
					 <cinclude:include src="cocoon:/solr_fragment?q={$query1}"/>
				</div>
			</div>
				
				<div id="footer" style="display:block; clear:both; border: none; padding-top: 1em;">
					<center>
						<a href="/VoS/choosepart.html" shape="rect">
							<img alt="Return to Full Valley Archive" border="0" src="/VoS/images/graphics/full7.gif"/>
						</a>
					</center>
				</div>
			
			</body>
		</html>
	</xsl:template>





</xsl:stylesheet>
