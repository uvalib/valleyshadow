<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="current-URL"/>

	<xsl:variable name="numFound">
		<xsl:value-of select="//result[@name='response']/@numFound"/>
	</xsl:variable>
	<xsl:variable name="numPerPage">
		<xsl:value-of select="50"/>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:variable name="next">
			<xsl:value-of select="$start+$rows"/>
		</xsl:variable>

		<xsl:variable name="pages">
			<xsl:value-of select="ceiling($numFound div 50)"/>
		</xsl:variable>
 <xsl:variable name="searchName">Civil War Images</xsl:variable>
               <html>
               <head>
               <title>Valley of the Shadow: <xsl:copy-of select="$searchName"/> -- Search Results</title>
               <script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
               <script type="text/javascript" src="javascript/replace_em.js"/>
               <style> .highlightme { color: inherit; background-color: yellow; }
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
			p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
			span.pagingNav { padding: 5px 25px 5px 25px; border: none; }
			.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
			#topNavig, #bottomNavig { display:block; padding: 10px; align: center; }
		</style>
               </head>
               <body>

		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<center>
					<img align="center" src="/VoS/images/images/vtitle4.gif"/>
					<h1>
						<font color="#990000">Civil War Images</font>
					</h1>
					<br/>
				<p style="padding: 1em;"><b>Please cite results as coming from:</b> Civil War Image Database, Valley of
					the Shadow: Two Communities in the American Civil War, Virginia Center for
					Digital History, University of Virginia<br/>
					(<xsl:value-of select="$current-URL"/>).</p>
				<div id="topNavig">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				<table style="width:100%;text-align:center;" border="1px">
					<tr>
						<tr>
							<tr>
								<th>Image</th>
								<th>Title</th>
								<th>Source</th>
								<th>Original Location</th>
								<th>Artist</th>
								<th>Image Date</th>
								<th>Image Type</th>
								<th>Subject</th>
								<th>Place Name</th>
								<th>Regiment</th>
								<th>People's Names</th>
								<th>Description</th>
							</tr>

						</tr>

					</tr>
					<xsl:apply-templates select="//doc"/>
				</table>

				<div id="bottomNavig" style="width:90%;padding-top:10px;padding-bottom:10px;">
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
			<a href="images">Go back to search page</a>
		</p>
		<div id="footer" style="display:block; clear:both; border: none; padding-top: 1em;">
                      <center>
                      <a href="/VoS/choosepart.html" shape="rect">
                      <img alt="Return to Full Valley Archive" border="0" src="/VoS/images/graphics/full7.gif"/>
                      </a>
                      </center>
                </div>
</body>
</html>
	</xsl:template>

	<xsl:template match="doc">
		<tr>
			<tr>
				<td> <a target=""><xsl:attribute name="href">VoS/Images/<xsl:value-of select="substring-before(str[@name='image_name'],'.GIF')"/>.html?q=db:images AND image_name:<xsl:value-of select="str[@name='image_name']"/></xsl:attribute>
					<img><xsl:attribute name="src">VoS/Images/<xsl:value-of select="str[@name='image_name']"/></xsl:attribute></img></a> </td>
				<td>
					<xsl:value-of select="str[@name='title']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='source']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='orig_location']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='artist']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='image_date']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='image_type']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='subject_date']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='place_name']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='regiment']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='people_name']"/>
				</td>
				<td>
					<xsl:value-of select="str[@name='description']"/>
				</td>
			</tr>

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
						href="images_search_results.html?q={$q}&amp;start={(($this_page - 3) * 50) + 50}&amp;rows={$rows}&amp;sort=last asc, first asc"
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
					href="images_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;sort=last asc, first asc">
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
						href="images_search_results.html?q={$q}&amp;start={(($this_page - 1) * 50) + 50}&amp;rows={$rows}&amp;sort=last asc, first asc"
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
