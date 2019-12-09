<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="current-URL"/>
	<xsl:param name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'church_aug')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'church_fr')">
				<xsl:text>Franklin</xsl:text>
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
		<xsl:variable name="searchName">Church Records</xsl:variable>
		<html>
		<head>
		<title>Valley of the Shadow: <xsl:copy-of select="$searchName"/> -- Search Results</title>
		<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
		<script type="text/javascript" src="javascript/replace_em.js"/>
		<style> 
			.highlightme { color: inherit; background-color: yellow; }
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
			p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
		</style>
		</head>
		<body>
			<center>
				<img align="center" src="VoS/redesign/images/vtitle4.gif"/>
			</center>

		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
			<center>
				<h1>
					<font color="#990000">
						<center><xsl:value-of select="$county"/> County – Church Records</center>
					</font>
				</h1>
				<p class="citation-help"><b>Please cite results as coming from: </b>
					<xsl:value-of select="$county"/> County, <xsl:choose>
						<xsl:when test="$county = 'Augusta'">
							<xsl:text>Virginia</xsl:text>
						</xsl:when>
						<xsl:when test="$county = 'Franklin'">
							<xsl:text>Pennsylvania</xsl:text>
						</xsl:when>
					</xsl:choose>, Church Records, Valley of the Shadow: Two Communities in the
					American Civil War, Virginia Center for Digital History, University of Virginia.<br/>
					(<xsl:value-of select="$current-URL"/>).</p>
				</center>
				<p style="align:left; padding-left: 2em;">
					<a href="church">Go back to search page</a>
				</p>
				<center>
				<div style="width:90%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				<table style="width:100%;text-align:center;" border="1px">
					<tr>
						<td>
							<b>Church/Congregation</b>
						</td>
						<td>
							<b>Location</b>
						</td>
						<td>
							<b>Name</b>
						</td>
						<td>
							<b>Type of Record</b>
						</td>
						<td>
							<b>Age or D.O.B.</b>
						</td>
						<td>
							<b>Date of Confirmation</b>
						</td>
						<td>
							<b>Date of Baptism</b>
						</td>
						<td>
							<b>Date of Communion</b>
						</td>
						<td>
							<b>Date of Marriage</b>
						</td>
						<td>
							<b>Date of Death</b>
						</td>
						<td>
							<b>Sex</b>
						</td>
						<td>
							<b>Race</b>
						</td>
						<td>
							<b>Officiating Clergy</b>
						</td>
						<td>
							<b>Familial Relations</b>
						</td>
						<td>
							<b>Witnesses or Sponsors</b>
						</td>
						<td>
							<b>Misc. Notes</b>
						</td>
					</tr>
					<xsl:apply-templates select="//doc"/>
				</table>

				<div style="width:90%;padding-top:10px;padding-bottom:10px;">
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
		<xsl:if test="$numFound &gt; 0">
		<p>
			<a href="church">Go back to search page</a>
		</p>
		</xsl:if>
			<center>
				<a href="VoS/choosepart.html">
					<img src="VoS/graphics/full7.gif"
						border="0" alt=""/>
				</a>
			</center>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="doc">
		<tr>
			<td>
				<xsl:value-of select="str[@name='church']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='location']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='first']"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="str[@name='last']"/>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='record_type']))">
						<xsl:choose>
							<xsl:when test="str[@name='record_type'] = 'B'">
								<xsl:text>Baptism/Birth</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='record_type'] = 'C'">
								<xsl:text>Confirmation</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='record_type'] = 'Ct'">
								<xsl:text>Communion</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='record_type'] = 'D'">
								<xsl:text>Death</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='record_type'] = 'M'">
								<xsl:text>Marriage</xsl:text>
							</xsl:when>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='dob']))">
						<xsl:value-of select="normalize-space(str[@name='dob'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='confirmation']))">
						<xsl:value-of select="normalize-space(str[@name='confirmation'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='baptism']))">
						<xsl:value-of select="normalize-space(str[@name='baptism'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='communion']))">
						<xsl:value-of select="normalize-space(str[@name='communion'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='marriage']))">
						<xsl:value-of select="normalize-space(str[@name='marriage'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='death']))">
						<xsl:value-of select="normalize-space(str[@name='death'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='sex']))">
						<xsl:value-of select="normalize-space(str[@name='sex'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='race']))">
						<xsl:value-of select="normalize-space(str[@name='race'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='clergy']))">
						<xsl:value-of select="normalize-space(str[@name='clergy'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='family']))">
						<xsl:value-of select="normalize-space(str[@name='family'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='witness']))">
						<xsl:value-of select="normalize-space(str[@name='witness'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='notes']))">
						<xsl:value-of select="normalize-space(str[@name='notes'])"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>NA</xsl:text>
					</xsl:otherwise>
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
						href="church_search_results.html?q={$q}&amp;start={(($this_page - 3) * 50) + 50}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc"
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
					href="church_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc">
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
						href="church_search_results.html?q={$q}&amp;start={(($this_page - 1) * 50) + 50}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc"
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
