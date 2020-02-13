<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="current-URL"/>
	<xsl:param name="db">
		<xsl:choose>
			<xsl:when test="contains($q, 'dossiers_augusta')">
				<xsl:text>dossiers_augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'dossiers_franklin')">
				<xsl:text>dossiers_franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>

	<xsl:variable name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'dossiers_augusta')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'dossiers_franklin')">
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
		<xsl:variable name="searchName">Soldiers' Records</xsl:variable>
		<html>
		<head>
		<title>Valley of the Shadow: <xsl:copy-of select="$searchName"/> -- Search Results</title>
		<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
		<script type="text/javascript" src="javascript/replace_em.js"/>
		<style> .highlightme { color: inherit; background-color: yellow; } 
			p.query { font-family: arial; }
			p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
			#topNavig, #bottomNavig { display:block; padding: 10px; align: center; }
			.red-head {color: #990000; font-family: times, serif; font-weight: bold; }
		</style>
		</head>
		<body style="padding: 1em;">

		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<h1>
					<font color="#990000">
						<center>Soldiers' Records</center>
					</font>
				</h1>
				<h3>
					<font color="#990000">
						<center>From Compiled Military Service Records at National Archives</center>
					</font>
				</h3>
				<p>Results printed below are the short version of the results of your search.
					Columns in bold denote columns searched on (beyond the basic returns of Name,
					service information, and enlistment information. Clicking on the last name of
					each person will allow you to see a full record for that individual</p>
				<p><b>Please cite results as coming from: </b>
					<xsl:value-of select="$county"/> County, <xsl:choose>
						<xsl:when test="$county = 'Augusta'">
							<xsl:text>Virginia</xsl:text>
						</xsl:when>
						<xsl:when test="$county = 'Franklin'">
							<xsl:text>Pennsylvania</xsl:text>
						</xsl:when>
					</xsl:choose>, Soldiers Records, Valley of the Shadow: Two Communities in the
					American Civil War, Virginia Center for Digital History, University of Virginia
					(<xsl:value-of select="$current-URL"/>).</p>
				<center>
				<div id="topNavig">
					<xsl:call-template name="paging">
						<xsl:with-param name="pages" select="$pages"/>
						<xsl:with-param name="current" select="1"/>
					</xsl:call-template>
				</div>
				</center>
				<table style="width:100%;text-align:center;" border="1px">
					<tr>
						<td>
							<b>Last</b>
						</td>
						<td>
							<b>First</b>
						</td>
						<td>
							<b>Rank</b>
						</td>
						<td>
							<b>Company</b>
						</td>
						<td>
							<b>Regiment</b>
						</td>
						<td>
							<b>Place Enlisted</b>
						</td>
						<td>
							<b>Year Enlisted</b>
						</td>
						<xsl:if test="contains($q, 'dead_wounds')">
							<td>
								<b>Died of Wounds</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'dead_disease')">
							<td>
								<b>Died of Disease</b>
							</td>
						</xsl:if>

						<xsl:if test="contains($q, 'mia:')">
							<td>
								<b>Missing in Action</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'wia:')">
							<td>
								<b>Wounded in Action</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'kia_place')">
							<td>
								<b>Killed in Action - Place</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'desertion')">
							<td>
								<b>Deserted</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'awol')">
							<td>
								<b>AWOL</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'capture')">
							<td>
								<b>Captured</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'prisoner')">
							<td>
								<b>Prison</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'hospital_record')">
							<td>
								<b>Hospital Record</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'promotions')">
							<td>
								<b>Promotions</b>
							</td>
						</xsl:if>
						<xsl:if test="contains($q, 'transfers')">
							<td>
								<b>Transfers</b>
							</td>
						</xsl:if>
					</tr>
					<xsl:apply-templates select="//doc"/>
				</table>

				<center>
					<div id="bottomNavig">
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
			<a href="dossiers">Go back to search page</a>
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
			<td>
				<a href="dossier_record?q=db:{$db} AND id_num:{int[@name='id_num']}">
					<xsl:value-of select="normalize-space(str[@name='last'])"/>
				</a>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='first'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='rank_enl'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='company'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='regiment'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(str[@name='place_enl'])"/>
			</td>
			<td>
				<xsl:value-of select="normalize-space(int[@name='year_enl'])"/>
			</td>
			<xsl:if test="contains($q, 'dead_wounds')">
				<td>
					<xsl:value-of select="//str[@name='dead_wounds']"/>
					<xsl:text> </xsl:text>
					<xsl:if test="int[@name='dow_month']"><xsl:value-of
						select="int[@name='dow_month']"/>/</xsl:if>
					<xsl:if test="int[@name='dow_day']"><xsl:value-of
						select="int[@name='dow_day']"/>/</xsl:if>
					<xsl:value-of select="int[@name='dow_year']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'dead_disease')">
				<td>
					<xsl:value-of select="str[@name='dead_disease']"/>
					<xsl:text> </xsl:text>
					<xsl:if test="int[@name='dod_month']"><xsl:value-of
						select="int[@name='dod_month']"/>/</xsl:if>
					<xsl:if test="int[@name='dod_day']"><xsl:value-of
						select="int[@name='dod_day']"/>/</xsl:if>
					<xsl:value-of select="int[@name='dod_year']"/>
				</td>
			</xsl:if>
			
			<xsl:if test="contains($q, 'mia:')">
				<td>
					<xsl:value-of select="str[@name='mia']"/>
					<xsl:text> </xsl:text>
					<xsl:if test="int[@name='mia_month']"><xsl:value-of
						select="int[@name='mia_month']"/>/</xsl:if>
					<xsl:if test="int[@name='mia_day']"><xsl:value-of
						select="int[@name='mia_day']"/>/</xsl:if>
					<xsl:value-of select="int[@name='mia_year']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'wia:')">
				<td>
					<xsl:value-of select="str[@name='wia']"/>
					<xsl:text> </xsl:text>
					<xsl:if test="int[@name='wia_month']"><xsl:value-of
						select="int[@name='wia_month']"/>/</xsl:if>
					<xsl:if test="int[@name='wia_day']"><xsl:value-of
						select="int[@name='wia_day']"/>/</xsl:if>
					<xsl:value-of select="int[@name='wia_year']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'kia_place')">
				<td>
					<xsl:value-of select="str[@name='kia_place']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'desertion')">
				<td>
					<xsl:value-of select="str[@name='desertion']"/>
					<xsl:text> </xsl:text>
					<xsl:if test="int[@name='desertion_month']"><xsl:value-of
						select="int[@name='desertion_month']"/>/</xsl:if>
					<xsl:if test="int[@name='desertion_day']"><xsl:value-of
						select="int[@name='desertion_day']"/>/</xsl:if>
					<xsl:value-of select="int[@name='desertion_year']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'awol')">
				<td>
					<xsl:if test="int[@name='awol_month']"><xsl:value-of
						select="int[@name='awol_month']"/>/</xsl:if>
					<xsl:if test="int[@name='awol_day']"><xsl:value-of
						select="int[@name='awol_day']"/>/</xsl:if>
					<xsl:value-of select="int[@name='awol_year']"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="str[@name='awol']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'capture')">
				<td>
					<xsl:value-of select="str[@name='capture']"/>
					<xsl:text> </xsl:text>
					<xsl:if test="int[@name='captured_month']"><xsl:value-of
						select="int[@name='captured_month']"/>/</xsl:if>
					<xsl:if test="int[@name='captured_day']"><xsl:value-of
						select="int[@name='captured_day']"/>/</xsl:if>
					<xsl:value-of select="int[@name='captured_year']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'prisoner')">
				<td>
					<xsl:value-of select="str[@name='prisoner']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'hospital_record')">
				<td>
					<xsl:value-of select="str[@name='hospital_record']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'promotions')">
				<td>
					<xsl:value-of select="str[@name='promotions']"/>
				</td>
			</xsl:if>
			<xsl:if test="contains($q, 'transfers')">
				<td>
					<xsl:value-of select="str[@name='transfers']"/>
				</td>
			</xsl:if>
		</tr>
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
						href="dossiers_search_results.html?q={$q}&amp;start={(($this_page - 3) * $rows) + $rows}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc"
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
					href="dossiers_search_results.html?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc">
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
						href="dossiers_search_results.html?q={$q}&amp;start={(($this_page - 1) * $rows) + $rows}&amp;rows={$rows}&amp;county={$county}&amp;sort=last asc, first asc"
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
