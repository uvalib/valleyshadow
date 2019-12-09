<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output encoding="UTF-8" method="xml"/>
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
			<xsl:value-of select="ceiling($numFound div $rows)"/>
		</xsl:variable>
		<html>
			<head>
				<style> .highlightme { background-color: yellow; }
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/replace_em.js"/>
			</head>
			<body>
		
		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<center>
					<img src="VoS/redesign/images/vtitle4.gif"
						border="0"/>

					<h2>Search the Valley of the Shadow Diaries</h2>

					<xsl:choose>
						<xsl:when test="$numFound &gt; $rows">
							<div id="resultSummary" style="padding-bottom:1em;"><xsl:value-of select="$numFound"/> Results Found |
								Showing 1 - <xsl:value-of select="$rows"/> | <a href="diaries_search">New Search</a></div>
						</xsl:when>
						<xsl:otherwise>
							<div id="resultSummary" style="padding-bottom:1em;"><xsl:value-of select="$numFound"/> Results Found |
								Showing 1 - <xsl:value-of select="$numFound"/> | <a href="diaries_search">New Search</a></div>
						</xsl:otherwise>
					</xsl:choose>
					<div id="topNavig">
						<xsl:call-template name="paging"/>
					</div>
					<div id="resultReturns">
						<xsl:apply-templates select="//doc"/>
					</div>
					<div id="bottomNavig">
						<xsl:call-template name="paging"/>
					</div>
					<br/>
					<div id="jumpPages">Jump to page: <xsl:call-template name="jump_to_pages">
							<xsl:with-param name="pages" select="$pages"/>
							<xsl:with-param name="current" select="1"/>
						</xsl:call-template>
					</div>
				</center>
				<br/>

				<center>
					<a href="VoS/choosepart.html">
						<img src="VoS/graphics/full7.gif" border="0"
							alt=""/>
					</a>
				</center>
				
			</xsl:when>
			<xsl:otherwise>
				<p class="no-results">
					<b>There were no matches for the search you requested</b>
				</p>
				<p class="query">
					<b>Your search terms were <xsl:value-of select="$q"/></b>
				</p>
				<p>
					<a href="diaries_search">Go back to search page</a>
				</p>
			</xsl:otherwise>
		</xsl:choose>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="doc">
		<div style="padding-bottom:20px;width:80%;text-align:left;">
			<xsl:variable name="position">
				<xsl:value-of select="position()"/>
			</xsl:variable>
			<a><xsl:attribute name="href">papers/<xsl:value-of select="str[@name='id']"/></xsl:attribute>
				<xsl:choose>
					<xsl:when test="string(normalize-space(str[@name='title']))">
						<xsl:value-of select="str[@name='title']"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="str[@name='id']"/>
					</xsl:otherwise>
				</xsl:choose>
			</a>
			<br/>
			<b>Context: </b>
			<xsl:text>...</xsl:text>
			<xsl:apply-templates select="//lst[@name='highlighting']">
				<xsl:with-param name="position">
					<xsl:value-of select="$position"/>
				</xsl:with-param>
			</xsl:apply-templates>
			<xsl:text>...</xsl:text>
		</div>
	</xsl:template>

	<xsl:template match="lst[@name='highlighting']">
		<xsl:param name="position"/>

		<span class="context">
				<xsl:apply-templates select="descendant::lst[position() = $position]/arr[@name='fulltext']"
			/>
		</span>
	</xsl:template>

	<xsl:template name="paging">
		<xsl:variable name="this_page">
			<xsl:value-of select="($start div $rows) + 1"/>
		</xsl:variable>
		<xsl:variable name="next">
			<xsl:value-of select="$start+$rows"/>
		</xsl:variable>

		<xsl:variable name="previous">
			<xsl:choose>
				<xsl:when test="$start &gt;= $rows">
					<xsl:value-of select="$start - $rows"/>
				</xsl:when>
				<xsl:otherwise>0</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<span class="previousPage">
			<xsl:choose>
				<xsl:when test="$numFound &gt; $rows and $start &gt; $previous">
					<a class="pagingBtn"
						href="diaries_search_results.html?q={$q}&amp;rows={$rows}&amp;start={$previous}&amp;hl=true&amp;hl.fl=fulltext&amp;hl.fragsize=200&amp;fl=*,score"
						>« Previous</a><xsl:text> </xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>« Previous </xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span>
		<span class="currentShowing">
			<xsl:value-of select="(($this_page - 1) * $rows) + 1"/>
			<xsl:text> - </xsl:text>
			<xsl:choose>
				<xsl:when test="(($this_page - 1) * $rows) + $rows &gt; $numFound">
					<xsl:value-of select="$numFound"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="(($this_page - 1) * $rows) + $rows"/>
				</xsl:otherwise>
			</xsl:choose>
		</span>
		<span class="nextPage">
			<xsl:choose>
				<xsl:when test="$numFound &gt; $rows and $next &lt; $numFound">
					<xsl:text> </xsl:text>
					<a class="pagingBtn"
						href="diaries_search_results.html?q={$q}&amp;rows={$rows}&amp;start={$next}&amp;hl=true&amp;hl.fl=fulltext&amp;hl.fragsize=200&amp;fl=*,score"
						>Next »</a>

				</xsl:when>
				<xsl:otherwise>
					<xsl:text> Next »</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span>
	</xsl:template>

	<xsl:template name="jump_to_pages">
		<xsl:param name="pages"/>
		<xsl:param name="current"/>

		<xsl:variable name="this_start">
			<xsl:value-of select="($current - 1) * $rows"/>
		</xsl:variable>
		<xsl:variable name="this_page">
			<xsl:value-of select="($start div $rows) + 1"/>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="not($this_page = $current)">
				<a class="pagingBtn"
					href="diaries_search_results?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;hl=true&amp;hl.fl=fulltext&amp;hl.fragsize=200&amp;fl=*,score">
					<xsl:value-of select="$current"/>
				</a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$current"/>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="$current &lt; $pages">
			<xsl:text> | </xsl:text>
			<xsl:call-template name="jump_to_pages">
				<xsl:with-param name="current" select="$current + 1"/>
				<xsl:with-param name="pages" select="$pages"/>
			</xsl:call-template>
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>
