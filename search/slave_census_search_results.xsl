<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="current-URL"/>

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
		<title>Valley of the Shadow: Augusta County - 1860 Slaveowners Census -- Search Results</title>
		<style>
			p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
		</style>
	</head>
	<body>
		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<center>
					<img src="/VoS/images/images/vtitle4.gif"/>
					<h1>
						<font color="#990000">
							<center>Augusta County - 1860 Slaveowners Census</center>
						</font>
					</h1>
				</center>
				<p class="citation-help">
					<b>Please cite results as coming from:</b> Augusta County, Virginia, 1860
					Slaveowners Census, Valley of the Shadow: Two Communities in the American Civil
					War, Virginia Center for Digital History, University of Virginia
					(<xsl:value-of select="$current-URL"/>).</p>
				<center>
				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				</center>
				<table style="width:100%;text-align:center;" border="1px">
					<tr>
						<tr>
							<th>Last Name</th>
							<th>First Name</th>
							<th>Location</th>
							<th>Employer Name</th>
							<th>Employer Location</th>
							<th>Total Slaves</th>
							<th>Male Slaves</th>
							<th>Female Slaves</th>
							<th>Black Slaves</th>
							<th>Mulatto Slaves</th>
						</tr>

					</tr>
					<xsl:apply-templates select="//doc"/>
				</table>
				<center>
				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				</center>
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
			<a href="slave_census">Go back to search page</a>
		</p>
		<hr width="80%"/>
		<center>
			<a href="VoS/choosepart.html">
				<img src="/VoS/images/graphics/full7.gif" border="0"
					alt=""/>
			</a>
		</center>
	</body>
</html>
		
	</xsl:template>

	<xsl:template match="doc">
		<tr>
			<tr>
				<td>
					<a href="sc_record?q=db:slave_aug_60 AND id_num:{int[@name='id_num']}">
						<xsl:value-of select="str[@name='last']"/>
					</a>
				</td>
				<td>
					<xsl:value-of select="str[@name='first']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='location']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='emp_name']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='emp_location']"/>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="string(int[@name='total_slaves'])">
							<xsl:value-of select="int[@name='total_slaves']"/>
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="string(int[@name='male_slaves'])">
							<xsl:value-of select="int[@name='male_slaves']"/>
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="string(int[@name='female_slaves'])">
							<xsl:value-of select="int[@name='female_slaves']"/>
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="string(int[@name='black_slaves'])">
							<xsl:value-of select="int[@name='black_slaves']"/>
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</td>
				<td>
					<xsl:choose>
						<xsl:when test="string(int[@name='mulatto_slaves'])">
							<xsl:value-of select="int[@name='mulatto_slaves']"/>
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>

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
						href="slave_census_search_results.html?q={$q}&amp;start={(($this_page - 3) * $rows) + $rows}&amp;rows={$rows}&amp;sort=last asc, first asc"
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
					href="slave_census_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;sort=last asc, first asc">
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
						href="slave_census_search_results.html?q={$q}&amp;start={(($this_page - 1) * $rows) + $rows}&amp;rows={$rows}&amp;sort=last asc, first asc"
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
