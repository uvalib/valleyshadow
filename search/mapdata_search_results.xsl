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
				<title>Valley of the Shadow: Record of Events Database</title>
				<style>
					body { padding: 1em; }
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
						<font color="#990000">Record of Events Database - Results</font>
					</h1>
				</center>
				<br/>
				<p><b>Please cite results as coming from:</b> Record of Events Database, Valley of
					the Shadow: Two Communities in the American Civil War, Virginia Center for
					Digital History, University of Virginia
					(<xsl:value-of select="$current-URL"/>).</p>
				<br/>
				<br/>

				<div style="width:100%;padding-top:10px;padding-bottom:10px;">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>

				<xsl:apply-templates select="//doc"/>

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
			<a href="mapdata">Go back to search page</a>
		</p>
		<br/>
		<hr width="80%"/>
		<center>
			<a href="VoS/choosepart.html">
				<img src="/VoS/images/graphics/full7.gif" border="0"
					alt=""/>
			</a>
		</center>
</body></html>
	</xsl:template>

	<xsl:template match="doc">
		<center>
			<hr width="75%"/>
		</center>
		<br/>
		<div style="width:100%;display:table;">
			<div style="width:33%;float:left;text-align:center;">
				<b>Battle: </b>
				<xsl:value-of select="str[@name='battle']"/>
				<br/>
				<b>Regiment: </b>
				<xsl:value-of select="str[@name='regiment']"/>
				<br/>
				<b>Date: </b>
				<xsl:value-of select="substring-before(str[@name='battle_date'], 'T')"/>
				<xsl:if test="str[@name='battle_date2']">
					<xsl:text> to </xsl:text>
					<xsl:value-of select="substring-before(str[@name='battle_date2'], 'T')"/>
				</xsl:if>
			</div>
			<div style="width:33%;float:left;text-align:center;">
				<b>Commander: </b>
				<xsl:value-of select="str[@name='commander']"/>
				<br/>
				<b>Brigade: </b>
				<xsl:value-of select="str[@name='brigade']"/>
				<br/>
				<b>Division: </b>
				<xsl:value-of select="str[@name='division']"/>
				<br/>
				<b>Corps: </b>
				<xsl:value-of select="str[@name='corps']"/>
			</div>
			<div style="width:33%;float:left;text-align:center;">
				<b>Regiment Strength: </b>
				<xsl:value-of select="str[@name='strength']"/>
				<br/>
				<b>Number Killed: </b>
				<xsl:choose>
					<xsl:when test="string(str[@name='killed'])">
						<xsl:value-of select="str[@name='killed']"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<br/>
				<b>Number Wounded: </b>
				<xsl:choose>
					<xsl:when test="string(str[@name='wounded'])">
						<xsl:value-of select="str[@name='wounded']"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
				<br/>
				<b>Number Missing: </b>
				<xsl:choose>
					<xsl:when test="string(str[@name='missing'])">
						<xsl:value-of select="str[@name='missing']"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>0</xsl:text>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
		<div>
			<p>
				<b>Summary of Events: </b>
				<xsl:value-of select="str[@name='summary']"/>
			</p>
			<p>
				<b>Georgetown Weather Station Report: </b><i>date, temperature (time) </i>
				
				<xsl:value-of select="str[@name='gtown_weather']"/>
			</p>
			<p>
				<b>Local Weather Conditions: </b><i>from soldiers' diaries and letters </i>
				
				<xsl:value-of select="str[@name='local_weather']"/>
			</p>
			<xsl:if test="string(str[@name='or_url'])">
				<p>
					<b>Official Records Link: </b>
					<a href="VoS/OR/{str[@name='or_url']}">Link to Official Records for <xsl:value-of
							select="str[@name='battle']"/>, <xsl:value-of
							select="str[@name='regiment']"/></a>
				</p>
			</xsl:if>
		</div>

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
						href="mapdata_search_results.html?q={$q}&amp;start={(($this_page - 3) * $rows) + $rows}&amp;rows={$rows}"
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
					href="mapdata_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}">
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
						href="mapdata_search_results.html?q={$q}&amp;start={(($this_page - 1) * $rows) + $rows}&amp;rows={$rows}"
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
