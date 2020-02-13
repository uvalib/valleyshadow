<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="sort"/>
	<xsl:param name="current-URL"/>
	<xsl:param name="db"/>
	<xsl:variable name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'man_aug')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'man_fr')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="year">
		<xsl:choose>
			<xsl:when test="contains($q, '_60')">
				<xsl:text>1860</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, '_70')">
				<xsl:text>1870</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="state">
		<xsl:choose>
			<xsl:when test="$county = 'Augusta'">
				<xsl:text>Virginia</xsl:text>
			</xsl:when>
			<xsl:when test="$county = 'Franklin'">
				<xsl:text>Pennsylvania</xsl:text>
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
			<xsl:value-of select="ceiling($numFound div 50)"/>
		</xsl:variable>
<html>
	<head>
		<title>Valley of the Shadow: Manufacturing Census -- Search Results</title>
		<style>
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
		</style>
	</head>
	<body style="padding: 1em;">
		
		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<h1>
					<font color="#990000">
						<center><xsl:value-of select="$county"/> County, <xsl:value-of select="$state"></xsl:value-of> - <xsl:value-of select="$year"/>
							Manufacturing Census</center>
					</font>
				</h1>
				<p>
					<b>Please cite results as coming from:</b>
					<xsl:value-of select="$county"/> County, <xsl:value-of select="$state"/>, <xsl:value-of select="$year"/> Manufacturing Census, Valley of
					the Shadow: Two Communities in the American Civil War, Virginia Center for
					Digital History, University of Virginia
					(<xsl:value-of select="$current-URL"/>).</p>
				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				<table style="width:100%;text-align:center;" border="1px">
					<tr>
						<tr>
							<th>Name</th>
							<th>Business</th>
							<th>Location</th>
							<th>Capital</th>
							<th>Male Workers</th>
							<th>Female Workers</th>
							<th>Male Wages</th>
							<th>Female Wages</th>
						</tr>

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
			<a href="javascript:history.go(-1)">Go back to search page</a>
		</p>
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
		<xsl:variable name="PersonalName">
			<xsl:choose>
				<xsl:when test="not(str[@name='name']) and str[@name='last_name'] and not(str[@name='first_name'])">
					<xsl:value-of select="str[@name='last_name']"/>
				</xsl:when>
				<xsl:when test="not(str[@name='name']) and str[@name='last_name'] and str[@name='first_name']">
					<xsl:value-of select="str[@name='last_name']"/>, <xsl:value-of select="str[@name='first_name']"/>
				</xsl:when>
				<xsl:when test="str[@name='name']">
					<xsl:value-of select="str[@name='name']"/>
				</xsl:when>
				<xsl:otherwise>
					[Record]
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="id_num">
			<xsl:choose>
				<xsl:when test="int[@name='id_num']">
					<xsl:value-of select="int[@name='id_num']"></xsl:value-of>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
			
		</xsl:variable>
		<tr>
			<td>
				<a href="manu_record?q={$q} AND id_num:{$id_num}"><xsl:value-of select="$PersonalName"/></a>
			</td>
			<td>
				<xsl:value-of select="str[@name='business']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='location']"/>
			</td>
			<td>
				<xsl:value-of select="int[@name='cap_inv']"/>
			</td>
			<td>
				<xsl:value-of select="substring-before(float[@name='male_hands'], '.0')"/>
			</td>
			<td>
				<xsl:value-of select="substring-before(float[@name='female_hands'], '.0')"/>
			</td>
			<td>
				<xsl:value-of select="substring-before(float[@name='male_wage'], '.0')"/>
			</td>
			<td>
				<xsl:value-of select="substring-before(float[@name='female_wage'], '.0')"/>
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
						href="manu_adv_census_search_results.html?q={$q}&amp;start={(($this_page - 3) * 50) + 50}&amp;rows={$rows}&amp;county={$county}&amp;sort={$sort}"
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
					href="manu_adv_census_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;county={$county}&amp;sort={$sort}">
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
						href="manu_adv_census_search_results.html?q={$q}&amp;start={(($this_page - 1) * 50) + 50}&amp;rows={$rows}&amp;county={$county}&amp;sort={$sort}"
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
