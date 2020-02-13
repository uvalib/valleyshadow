<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>

	<xsl:variable name="numFound">
		<xsl:value-of select="//result[@name='response']/@numFound"/>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:variable name="next">
			<xsl:value-of select="$start+$rows"/>
		</xsl:variable>

		<xsl:variable name="pages">
			<xsl:value-of select="ceiling($numFound div 50)"/>
		</xsl:variable>
		<xsl:variable name="searchName">Official Records</xsl:variable>
		<html>
		<head>
		<title>Valley of the Shadow: <xsl:copy-of select="$searchName"/> -- Search Results</title>
		<script type="text/javascript" src="/valley/javascript/javascript/jquery-1.2.1.js"/>
		<script type="text/javascript" src="/valley/javascript/javascript/thickbox.js"/>
		<style> body { text-align: center; }
			 div#wrapper { margin-left:auto;
						margin-right:auto; width: 700px; text-align: left; }
			 td {padding:2px;}

						div#husbandInfo { padding: 10px; width: 500px; float: left; }
			 div#wifeInfo {
						padding: 10px; width: 350px; float: left; }
			 div#generalInfo { padding: 30px
						10px 10px 10px; clear: both; width: 600px; }
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
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
		</style>
		</head>
		<body>

		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<center>
					<img src="/VoS/images/images/vtitle4.gif"
						border="0"/>
					<h2>Search the Cohabitation Records</h2>
					<a href="/VoS/freedmen1.html">Return to Bureau Home</a> | <a href="/VoS/newspapers/about.html">About
						the Cohabitation Records</a>
				</center>
				<hr/>
				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				<table style="width:700px;text-align:center;margin-left:auto;margin-right:auto;"
					cellpadding="0" cellspacing="1px">
					<tr class="musterTableHead">
						<td>Report Date</td>
						<td>Husband First Name</td>
						<td>Husband Last Name</td>
						<td>Wife First Name</td>
						<td>Wife Last Name</td>
						<td>Husband Age</td>
						<td>Wife Age</td>
						<td>Husband Birth Place</td>
						<td>Wife Birth Place</td>
						<td>Husband Occupation</td>
						<td>Current Residence</td>
						<td>Originial Remarks</td>
						<td># of Children</td>
					</tr>
					<xsl:apply-templates select="//doc"/>
				</table>

				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				<script type="text/javascript" src="javascript/generic_search_paging.js"/>
				<!-- <script type="text/javascript">TB_init();</script> -->
			</xsl:when>
			<xsl:otherwise>
				<p class="no-results">
					<b>There were no matches for the search you requested</b>
				</p>
				<p class="query">
					<b>Your search terms were <xsl:value-of select="$q"/></b>
				</p>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="$numFound &gt; 0">
		<p>
			<a href="cohabitation">Go back to search page</a>
		</p>
		</xsl:if>
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

	<xsl:template match="doc">
		<tr class="musterTableBody">
			<td>
				<xsl:value-of select="str[@name='cohab_report_date']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_husband_first_name']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_husband_last_name']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_wife_first_name']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_wife_last_name']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_husband_age']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_wife_age']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_husband_birth_place']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_wife_birth_place']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_husband_occupation']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_current_residence']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='cohab_transcriber_notes']"/>
			</td>
			<td>
				<a
					href="cohab_children?q=db:cohabitation_1866_children AND child_family_id:{int[@name='cohab_family_id']}&amp;sort=child_age asc&amp;TB_iframe=true" class="thickbox">
					<xsl:value-of select="int[@name='cohab_num_children']"/>
				</a>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="paging">

		<xsl:param name="pages"/>
		<xsl:param name="current"/>
		<xsl:param name="detailed"/>

		<xsl:variable name="this_start">
			<xsl:value-of select="($current - 1) * 50"/>
		</xsl:variable>
		<xsl:variable name="this_page">
			<xsl:value-of select="($start div 50) + 1"/>
		</xsl:variable>

		<xsl:if test="$current= '1'">
			<xsl:choose>
				<xsl:when test="not($this_page = '1')">
					<a class="pagingBtn"
						href="cohabitation_search_results.html?q={$q}&amp;start={(($this_page - 3) * 50) + 50}&amp;rows={$rows}&amp;sort=last asc, first asc"
						>Previous</a>
					<xsl:text> | </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Previous | </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="not($this_page = $current)">
				<a class="pagingBtn"
					href="cohabitation_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;sort=last asc, first asc">
					<xsl:value-of select="$current"/>
				</a>
				<xsl:text> | </xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$current"/>
				<xsl:text> | </xsl:text>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="$current = $pages">
			<xsl:choose>
				<xsl:when test="$current = $this_page">
					<xsl:text>Next</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<a class="pagingBtn"
						href="cohabitation_search_results.html?q={$q}&amp;start={(($this_page - 1) * 50) + 50}&amp;rows={$rows}&amp;sort=last asc, first asc"
						>Next</a>
				</xsl:otherwise>
			</xsl:choose>

		</xsl:if>

		<xsl:if test="$current = $pages">
			<p>
				<xsl:text>Showing records </xsl:text>
				<xsl:value-of select="(($this_page - 1) * 50) + 1"/>
				<xsl:text> to </xsl:text>
				<xsl:choose>
					<xsl:when test="(($this_page - 1) * 50) + 50 &gt; $numFound">
						<xsl:value-of select="$numFound"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="(($this_page - 1) * 50) + 50"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="$numFound"/>
				<xsl:text> total)</xsl:text>
			</p>
		</xsl:if>
		<xsl:if test="$current &lt; $pages">
			<xsl:call-template name="paging">
				<xsl:with-param name="current" select="$current + 1"/>
				<xsl:with-param name="detailed" select="$detailed"/>
				<xsl:with-param name="pages" select="$pages"/>
			</xsl:call-template>
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>
