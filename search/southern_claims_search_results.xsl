<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output encoding="UTF-8" method="xml"/>

	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="current-URL"/>
	<xsl:param name="keyword"/>

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
				<title>Valley of the Shadow: Southern Claims Commission -- Search Results</title>
				<style> .highlightme { background-color: yellow; }
					.red-head {color: #990000; font-family: times, serif; font-weight: bold;} 
					p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
					span.pagingNav { padding: 5px 25px 5px 25px; border: none; }
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
			</head>
			<body>
		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<center>
					<img src="VoS/redesign/images/vtitle4.gif"
						border="0"/>

					<h2 class="red-head">Search the Valley Southern Claims Commission</h2>

					<xsl:choose>
						<xsl:when test="$numFound &gt; $rows">
							<div id="resultSummary" style="padding-bottom:1em;"><span class="pagingNav"><xsl:value-of select="$numFound"/> Results Found </span>
								<span class="pagingNav">Showing 1 - <xsl:value-of select="$rows"/>  </span><span class="pagingNav"><a href="soclaims">New Search</a></span></div>
						</xsl:when>
						<xsl:otherwise>
							<div id="resultSummary" style="padding-bottom:1em;"><span class="pagingNav"><xsl:value-of select="$numFound"/> Results Found </span>
								<span class="pagingNav">Showing 1 - <xsl:value-of select="$numFound"/>  </span><span class="pagingNav"><a href="soclaims">New Search</a></span></div>
						</xsl:otherwise>
					</xsl:choose>
					<div id="topNavig" style="width:100%;padding-top:10px;padding-bottom:10px;">
						<xsl:call-template name="paging">
							<xsl:with-param name="pages" select="$pages"/>
							<xsl:with-param name="current" select="1"/>
						</xsl:call-template>
					</div>
					<div id="resultReturns">
						<xsl:apply-templates select="//doc"/>
					</div>
						<div id="bottomNavig" style="width:100%;padding-top:10px;padding-bottom:10px;">
						<xsl:call-template name="paging">
							<xsl:with-param name="pages" select="$pages"/>
							<xsl:with-param name="current" select="1"/>
						</xsl:call-template>
					</div>
					<br/>
				</center>
				<br/>
				<script type="text/javascript" src="javascript/replace_em.js"/>
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
					<a href="soclaims">Go back to search page</a>
				</p>
				<center>
					<a href="VoS/choosepart.html">
						<img src="VoS/graphics/full7.gif"
							border="0" alt=""/>
					</a>
				</center>
</body></html>
	</xsl:template>

	<xsl:template match="doc">
		<div style="padding-bottom:20px;width:80%;text-align:left;">
			<xsl:variable name="position">
				<xsl:value-of select="position()"/>
			</xsl:variable>
			
			<a><xsl:attribute name="href">claims/<xsl:value-of select="str[@name='id']"/></xsl:attribute>
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

			<xsl:choose>
				<xsl:when test="$keyword = 'true'">
					<b>Summary: </b>
					<xsl:value-of select="str[@name='summary']"/>
				</xsl:when>
				<xsl:otherwise>
					<b>Context: </b>
					<xsl:text>...</xsl:text>
					<xsl:apply-templates select="//lst[@name='highlighting']">
						<xsl:with-param name="position">
							<xsl:value-of select="$position"/>
						</xsl:with-param>
					</xsl:apply-templates>
					<xsl:text>...</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

	<xsl:template match="lst[@name='highlighting']">
		<xsl:param name="position"/>
		
		<xsl:choose>
				<xsl:when test="string(descendant::lst[position() = $position]/arr[@name='fulltext'])">
				<span class="context">
					<xsl:apply-templates
							select="descendant::lst[position() = $position]/arr[@name='fulltext']"/>
				</span>
			</xsl:when>
			<xsl:otherwise>Search term does not appear in context.</xsl:otherwise>
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
						href="soclaims_results.html?q={$q}&amp;rows={$rows}&amp;start={(($this_page - 3) * $rows) + $rows}">Previous</a>
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
					href="soclaims_results.html?q={$q}&amp;rows={$rows}&amp;start={$this_start}">
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
						href="soclaims_results.html?q={$q}&amp;rows={$rows}&amp;start={(($this_page - 1) * $rows) + $rows}">Next</a>
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
