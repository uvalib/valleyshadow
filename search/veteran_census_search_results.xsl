<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="current-URL"/>
	<xsl:variable name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'vet_census_aug_90')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'vet_census_90')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="numFound">
		<xsl:value-of select="//result[@name='response']/@numFound"/>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:variable name="next">
			<xsl:value-of select="$start+$rows"/>
		</xsl:variable>

		<xsl:variable name="pages">
			<xsl:value-of select="ceiling($numFound div $rows)"/>
		</xsl:variable>
		<html>
			<head>
				<title>Valley of the Shadow: <xsl:value-of select="$county"/> County 1890 Veteran Census -- Search Results</title>
				<style>
					p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
				</style>
			</head>
			<body>
		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<h1>
					<font color="#990000">
						<center>1890 <xsl:value-of select="$county"/> County Veterans
						Census</center>
					</font>
				</h1>
				<p><b>Please cite results as coming from: </b>
					<xsl:value-of select="$county"/> County, <xsl:choose>
						<xsl:when test="$county = 'Augusta'">
							<xsl:text>Virginia</xsl:text>
						</xsl:when>
						<xsl:when test="$county = 'Franklin'">
							<xsl:text>Pennsylvania</xsl:text>
						</xsl:when>
					</xsl:choose>, 1890 Veterans Census, Valley of the Shadow: Two Communities in
					the American Civil War, Virginia Center for Digital History, University of
					Virginia (<xsl:value-of select="$current-URL"/>).</p>
				<table style="width:100%;text-align:center;" border="1px">
					<tr>
						<td>
							<b>Name</b>
						</td>
						<td>
							<b>Widow Name/Other Info</b>
						</td>
						<td>
							<b>Location</b>
						</td>
						<td>
							<b>House Number</b>
						</td>
						<td>
							<b>Family Number</b>
						</td>
						<td>
							<b>Rank</b>
						</td>
						<td>
							<b>Company</b>
						</td>
						<td>
							<b>Regiment or Vessel</b>
						</td>
						<td>
							<b>Enlistment Date</b>
						</td>
						<td>
							<b>Discharge Date</b>
						</td>
						<td>
							<b>Length of Service</b>
						</td>
						<td>
							<b>Disability Incurred</b>
						</td>
						<td>
							<b>Remarks</b>
						</td>
					</tr>
					<xsl:apply-templates select="//doc"/>
				</table>

				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/generic_search_paging.js"/>
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
		<p>
			<a href="veteran">Go back to search page</a>
		</p>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="doc">
		<tr>
			<td>
				<xsl:value-of select="normalize-space(str[@name='first'])"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="normalize-space(str[@name='last'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='other_info'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='location'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='house_num'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='family_num'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='rank'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='company'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='regiment'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='enl_date'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='discharge_date'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='service_length'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='disability'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='remarks'])"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="paging">

		<xsl:param name="pages"/>
		<xsl:param name="current"/>
		<xsl:param name="detailed"/>

		<xsl:variable name="this_start">
			<xsl:value-of select="($current - 1) * $rows"/>
		</xsl:variable>
		<xsl:variable name="this_page">
			<xsl:value-of select="($start div $rows) + 1"/>
		</xsl:variable>

		<xsl:if test="$current= '1'">
			<xsl:choose>
				<xsl:when test="not($this_page = '1')">
					<a class="pagingBtn"
						href="veteran_search_results?q={$q}&amp;start={(($this_page - 3) * $rows) + $rows}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc"
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
					href="veteran_search_results?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc">
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
						href="veteran_search_results?q={$q}&amp;start={(($this_page - 1) * $rows) + $rows}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc"
						>Next</a>
				</xsl:otherwise>
			</xsl:choose>

		</xsl:if>

		<xsl:if test="$current = $pages">
			<p>
				<xsl:text>Showing records </xsl:text>
				<xsl:value-of select="(($this_page - 1) * $rows) + 1"/>
				<xsl:text> to </xsl:text>
				<xsl:choose>
					<xsl:when test="(($this_page - 1) * $rows) + $rows &gt; $numFound">
						<xsl:value-of select="$numFound"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="(($this_page - 1) * $rows) + $rows"/>
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
