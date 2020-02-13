<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="sort"/>
	<xsl:param name="current-URL"/>

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
		<title>Valley of the Shadow: Claims Search Results</title>
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
						<center>Pennsylvania Border Commission Claims - Franklin County</center>
					</font>
				</h1>
				<p><b>Please cite results as coming from: </b>Pennsylvania Border Commission
					Claims--Franklin County, Valley of the Shadow: Two Communities in the American
					Civil War, Virginia Center for Digital History, University of Virginia
					(<xsl:value-of select="$current-URL"/>).</p>
				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				<table style="width:100%;text-align:center;" border="1px">
					<tr>
						<td>
							<b>Name</b>
						</td>
						<td>
							<b>Race</b>
						</td>
						<td>
							<b>Gender</b>
						</td>
						<td>
							<b>Total Claim</b>
						</td>
						<td>
							<b>Claim Num - Date</b>
						</td>
						<td>
							<b>Real Property</b>
						</td>
						<td>
							<b>Personal Property</b>
						</td>
						<td>
							<b>Amount Awarded</b>
						</td>
						<td>
							<b>Amount Received</b>
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
			<a href="paclaims">Go back to search page</a>
		</p>
                                <br/>

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
			<td>
				<xsl:value-of select="str[@name='first']"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="str[@name='last']"/>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="str[@name='race'] = 'b'">
						<xsl:text>Black</xsl:text>
					</xsl:when>
					<xsl:when test="str[@name='race'] = 'w'">
						<xsl:text>White</xsl:text>
					</xsl:when>
					<xsl:when test="str[@name='race'] = 'm'">
						<xsl:text>Mulatto</xsl:text>
					</xsl:when>
					<xsl:when test="str[@name='race'] = 'c'">
						<xsl:text>Chinese</xsl:text>
					</xsl:when>
					<xsl:when test="str[@name='race'] = 'i'">
						<xsl:text>Indian</xsl:text>
					</xsl:when>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="str[@name='sex'] = 'm'">
						<xsl:text>Male</xsl:text>
					</xsl:when>
					<xsl:when test="str[@name='sex'] = 'f'">
						<xsl:text>Female</xsl:text>
					</xsl:when>
				</xsl:choose>
			</td>
			<td>
				<xsl:value-of select="float[@name='claim_total']"/>
			</td>
			<td>
				<xsl:value-of select="int[@name='claim_num']"/>
				<xsl:text> - </xsl:text>
				<xsl:value-of select="str[@name='claim_date']"/>
			</td>
			<td>
				<xsl:value-of select="float[@name='real_property']"/>
			</td>
			<td>
				<xsl:value-of select="float[@name='personal_property']"/>
			</td>
			<td>
				<xsl:value-of select="float[@name='amount_award']"/>
			</td>
			<td>
				<xsl:value-of select="float[@name='amount_rec']"/>
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
						href="claims_search_results.html?q={$q}&amp;start={(($this_page - 3) * 50) + 50}&amp;rows={$rows}&amp;sort={$sort}"
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
					href="claims_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;sort={$sort}">
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
						href="claims_search_results.html?q={$q}&amp;start={(($this_page - 1) * 50) + 50}&amp;rows={$rows}&amp;sort={$sort}"
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
