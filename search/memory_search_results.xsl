<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output encoding="UTF-8" method="xml"/>

	<xsl:param name="q"/>
	<xsl:param name="start"/>
	<xsl:param name="rows"/>
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
		<xsl:variable name="searchName">Memory</xsl:variable>
		<html>
			<head>
				<title>Valley of the Shadow: <xsl:copy-of select="$searchName"/> -- Search Results</title>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/replace_em.js"/>
				<style> .highlightme { color: inherit; background-color: yellow; } .helpme {color:brown;}
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
					.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
					span.pagingNav { padding: 5px 25px 5px 25px; border: none; }
				</style>
			</head>
			<body>
		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<center>
					<img src="/VoS/images/images/vtitle4.gif"
						border="0"/>

					<h2 class="red-head">Search the Valley of the Shadow Memory Articles</h2>
					
					<xsl:choose>
						<xsl:when test="$numFound &gt; $rows">
							<div id="resultSummary" style="padding-bottom:1em;"><span class="pagingNav"><xsl:value-of select="$numFound"/> Results Found </span>
								<span class="pagingNav">Showing 1 - <xsl:value-of select="$rows"/>  </span><span class="pagingNav"><a href="memory">New Search</a></span></div>
						</xsl:when>
						<xsl:otherwise>
							<div id="resultSummary" style="padding-bottom:1em;"><span class="pagingNav"><xsl:value-of select="$numFound"/> Results Found </span>
								<span class="pagingNav">Showing 1 - <xsl:value-of select="$numFound"/>  </span><span class="pagingNav"><a href="memory">New Search</a></span></div>
						</xsl:otherwise>
					</xsl:choose>
					<div id="topNavig" style="width:90%;padding-top:10px;padding-bottom:10px;">
						<xsl:call-template name="paging">
							<xsl:with-param name="pages" select="$pages"/>
							<xsl:with-param name="current" select="1"/>
						</xsl:call-template>
					</div>
					<div id="resultReturns">
						<xsl:apply-templates select="//doc"/>
					</div>
					<div id="bottomNavig" style="width:90%;padding-top:10px;padding-bottom:10px;">
						<xsl:call-template name="paging">
							<xsl:with-param name="pages" select="$pages"/>
							<xsl:with-param name="current" select="1"/>
						</xsl:call-template>
					</div>
					<br/>
				</center>
				<br/>
				
			</xsl:when>
			<xsl:otherwise>
				<p class="no-results">
					<b>There were no matches for the search you requested</b>
				</p>
				<p class="query">
					<b>Your search terms were <xsl:value-of select="$q"/></b>
				</p>
				<p>
					<a href="memory">Go back to search page</a>
				</p>
			</xsl:otherwise>
		</xsl:choose>
				<center>
					<a href="VoS/choosepart.html">
						<img src="/VoS/images/graphics/full7.gif"
							border="0" alt=""/>
					</a>
				</center>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="doc">
		<div class="document" style="padding-bottom:20px;width:80%;text-align:left;">
			<xsl:variable name="position">
				<xsl:value-of select="position()"/>
			</xsl:variable>
			<a><xsl:attribute name="href">mem/<xsl:value-of select="str[@name='id']"/></xsl:attribute>
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

	<xsl:template match="em">
		<span class="highlightme">
			<xsl:value-of select="text()"/>
		</span>
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
						href="memory_results.html?q={$q}&amp;rows={$rows}&amp;start={(($this_page - 3) * $rows) + $rows}">Previous</a>
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
					href="memory_results.html?q={$q}&amp;rows={$rows}&amp;start={$this_start}">
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
						href="memory_results.html?q={$q}&amp;rows={$rows}&amp;start={(($this_page - 1) * $rows) + $rows}">Next</a>
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
	
	<xsl:template name="paging_old">
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
						href="memory_results.html?q={$q}&amp;rows={$rows}&amp;start={$previous}&amp;hl=true&amp;hl.fl=fulltext&amp;hl.fragsize=200&amp;fl=*,score"
						>« Previous</a>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>« Previous</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span>
		<span class="spacer">
			<xsl:text> </xsl:text>
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
		<span class="spacer">
			<xsl:text> </xsl:text>
		</span>
		<span class="nextPage">
			<xsl:choose>
				<xsl:when test="$numFound &gt; $rows and $next &lt; $numFound">

					<a class="pagingBtn"
						href="memory_results.html?q={$q}&amp;rows={$rows}&amp;start={$next}&amp;hl=true&amp;hl.fl=fulltext&amp;hl.fragsize=200&amp;fl=*,score"
						>Next »</a>

				</xsl:when>
				<xsl:otherwise>
					<xsl:text>Next »</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</span>
	</xsl:template>

	

</xsl:stylesheet>
