<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:variable name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'tax_staunton_60')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'tax_chburg_60')">
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
		<!-- <p>DEBUG:
			<br/>q:<xsl:value-of select="$q"/>
			<br/>start:<xsl:value-of select="$start"/>
			<br/>rows:<xsl:value-of select="$rows"/>
			<br/>county:<xsl:value-of select="$county"/>
			<br/>numFound:<xsl:value-of select="$numFound"/>
		</p> -->
		<html>
			<head>
				<title>Valley of the Shadow: <xsl:value-of select="$county"/> County 1860 Tax Records -- Search Results</title>
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
						<center><xsl:choose>
								<xsl:when test="$county = 'Augusta'">Staunton, VA</xsl:when>
								<xsl:when test="$county = 'Franklin'">Chambersburg, PA</xsl:when>
							</xsl:choose> -1860 Tax Records</center>
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
					</xsl:choose>, 1860 Tax Records, Valley of the Shadow: Two Communities in the
					American Civil War, Virginia Center for Digital History, University of Virginia.</p>
				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				<table style="width:100%;text-align:center;" border="1px">
					<xsl:choose>
						<xsl:when test="$county = 'Augusta'">
							<tr>
								<td>
									<b>Name</b>
								</td>
								<td>
									<b>Residence</b>
								</td>
								<td>
									<b>Estate</b>
								</td>
								<td>
									<b>Lot Number</b>
								</td>
								<td>
									<b>Building Value</b>
								</td>
								<td>
									<b>Lot-Building Value</b>
								</td>
								<td>
									<b>Tax Amount</b>
								</td>
								<td>
									<b>City Tax Amount</b>
								</td>
							</tr>
						</xsl:when>
						<xsl:when test="$county = 'Franklin'">
							<tr>
								<td>
									<b>Name</b>
								</td>
								<td>
									<b>Occupation</b>
								</td>
								<td>
									<b>Ward</b>
								</td>
								<td>
									<b>County Tax Amount</b>
								</td>
								<td>
									<b>State Tax Amount</b>
								</td>
								<td>
									<b>State Personal Tax Amount</b>
								</td>
							</tr>
						</xsl:when>
					</xsl:choose>
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
			<a href="tax">Go back to search page</a>
		</p>
				<center>
					<a href="/VoS/choosepart.html">
						<img src="/VoS/images/graphics/full7.gif"
							border="0" alt=""/>
					</a>
				</center>
</body></html>
	</xsl:template>

	<xsl:template match="doc">
		<xsl:choose>
			<xsl:when test="$county = 'Augusta'">
				<tr>
					<td>
						<xsl:value-of select="normalize-space(str[@name='first'])"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="normalize-space(str[@name='last'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(str[@name='residence'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(str[@name='estate'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(str[@name='lot_num'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(float[@name='building_val'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(float[@name='lot_building_val'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(float[@name='tax_amt'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(float[@name='city_tax_amt'])"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="$county = 'Franklin'">
				<tr>
					<td>
						<xsl:value-of select="normalize-space(str[@name='first'])"/>
						<xsl:text> </xsl:text>
						<xsl:value-of select="normalize-space(str[@name='last'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(str[@name='occupation'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(str[@name='ward'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(float[@name='county_tax'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(float[@name='state_tax'])"/>
					</td>
					<td>
						<xsl:value-of select="normalize-space(float[@name='state_personal_tax'])"/>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
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
						href="tax_search_results.html?q={$q}&amp;start={(($this_page - 3) * $rows) + $rows}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc"
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
					href="tax_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc">
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
						href="tax_search_results.html?q={$q}&amp;start={(($this_page - 1) * $rows) + $rows}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc"
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
