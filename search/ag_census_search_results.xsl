<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="current-URL"/>

	<xsl:variable name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'agr_aug')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'agr_fr')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:param name="db">
		<xsl:choose>
			<xsl:when test="substring-after(substring-before($q, ' AND'), 'db:') != ''">
				<xsl:value-of select="substring-after(substring-before($q, ' AND'), 'db:')"/>
			</xsl:when>
			<xsl:when test="substring-after($q, 'db:') != ''">
				<xsl:value-of select="substring-after($q, 'db:')"/>
			</xsl:when>
			<xsl:otherwise>agr_*</xsl:otherwise>
		</xsl:choose>
	</xsl:param>

	<xsl:param name="year">
		<xsl:choose>
			<xsl:when test="contains($db, '60')">
				<xsl:text>1860</xsl:text>
			</xsl:when>
			<xsl:when test="contains($db, '70')">
				<xsl:text>1870</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>

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
				<title>Valley of the Shadow: <xsl:value-of select="$county"/> County - <xsl:value-of select="$year"/> Agricultural Census -- Search Results</title>
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
							<center><xsl:value-of select="$county"/> County - <xsl:value-of select="$year"
								/> Agricultural Census </center>
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
					</xsl:choose>, <xsl:value-of select="$year"/> Agricultural Census, Valley of the
					Shadow: Two Communities in the American Civil War, Virginia Center for Digital
					History, University of Virginia
					(<xsl:value-of select="$current-URL"/>).</p>
				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div></center>
				<p style="align:left; padding-left: 2em;">
					<a href="ag_census">Go back to search page</a>
				</p>
				<center>
				<table style="width:100%;text-align:center;" border="1px">
					<tr>
						<td>
							<b>Last Name</b>
						</td>
						<td>
							<b>First Name</b>
						</td>
						<td>
							<b>Location</b>
						</td>
						<td>
							<b>Farm Value</b>
						</td>
						<td>
							<b>Total Value of Livestock</b>
						</td>
						<td>
							<b>Pounds of Tobacco</b>
						</td>
						<td>
							<b>Value of Home Manufacturing</b>
						</td>
						<td>
							<b>Total Land</b>
						</td>
						<td>
							<b>Total Animals</b>
						</td>
						<td>
							<b>Total Grain</b>
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
			</center>
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
					<a href="ag_census">Go back to search page</a>
				</p>
				<div id="footer" style="display:block; clear:both; border: none; padding-top: 1em;">
					<center>
						<a href="VoS/choosepart.html" shape="rect">
							<img alt="Return to Full Valley Archive" border="0" src="/VoS/images/graphics/full7.gif"/>
						</a>
					</center>
				</div>
			</body>
	</html>
	</xsl:template>

	<xsl:template match="doc">
		<tr>
			<td>
				<a href="ag_record?q=db:{$db} AND id_num:{int[@name='id_num']}">
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
				<xsl:choose>
					<xsl:when test="string(int[@name='farm_val'])">
						<xsl:value-of select="int[@name='farm_val']"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(int[@name='tot_livestock'])">
						<xsl:value-of select="int[@name='tot_livestock']"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(int[@name='tobacco'])">
						<xsl:value-of select="int[@name='tobacco']"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(int[@name='home_manu'])">
						<xsl:value-of select="int[@name='home_manu']"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(int[@name='tot_land'])">
						<xsl:value-of select="int[@name='tot_land']"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(int[@name='tot_animals'])">
						<xsl:value-of select="int[@name='tot_animals']"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(int[@name='tot_grain'])">
						<xsl:value-of select="int[@name='tot_grain']"/>
					</xsl:when>
					<xsl:otherwise>0</xsl:otherwise>
				</xsl:choose>
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
						href="ag_census_search_results.html?q={$q}&amp;start={(($this_page - 3) * 50) + 50}&amp;rows={$rows}&amp;sort=last asc, first asc"
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
					href="ag_census_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;sort=last asc, first asc">
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
						href="ag_census_search_results.html?q={$q}&amp;start={(($this_page - 1) * 50) + 50}&amp;rows={$rows}&amp;sort=last asc, first asc"
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
