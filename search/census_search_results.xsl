<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="county"/>
	<xsl:param name="first"/>
	<xsl:param name="last"/>
	<xsl:param name="year"/>
	<xsl:param name="detailed">no</xsl:param>
	<xsl:param name="column"/>
	<xsl:param name="sort">last asc</xsl:param>
	<xsl:param name="current-pipeline">census_search_results</xsl:param>
	<xsl:param name="current-URL"/>
	<xsl:variable name="numFound">
		<xsl:value-of select="//result[@name='response']/@numFound"/>
	</xsl:variable>
	<xsl:variable name="FullCountyName">
		<xsl:choose>
			<xsl:when test="contains($county, 'aug')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($county, 'fr')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
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
				<title>Valley of the Shadow: Census Search Results</title>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/census-thickbox.js"/>
				<style>td {padding-left:5px;padding-right:5px;}
					.debug {background:yellow;} .citationHelp { text-align: center; padding-left: 2em; padding-right: 2em; }
					a { color: #CD7F32 ;} .searchReturn { float:left;}
					a.visited, a:visited { color: blue!important; }
					a:hover { color: red !important; }
					p.query { font-family: arial; }
					p.no-results { font-family: arial; text-align: center; padding: 3em 0 5em 0;}
					
			 #TB_window { font: 12px
						Arial, Helvetica, sans-serif; color: #333333; }
			 #TB_secondLine { font: 10px
						Arial, Helvetica, sans-serif; color:#666666; }
			 #TB_window a:link { color:
						#666666; }
			 #TB_window a:visited { color: #666666; }
			 #TB_window a:hover {
						color: #000; }
			 #TB_window a:active { color: #666666; }
			 #TB_window a:focus {
						color: #666666; }
			 #TB_overlay { position: absolute; z-index:100; top: 0px;
						left: 0px; }
			 #TB_window { position: absolute; background: #ffffff;
						z-index: 102; color:#000000; display:none; border: 4px solid #525252;
						text-align:left; }
			 #TB_window img { display:block; margin: 15px 0 0 15px;
						border-right: 1px solid #ccc; border-bottom: 1px solid #ccc; border-top: 1px
						solid #666; border-left: 1px solid #666; }
			 #TB_caption { height:25px;
						padding:7px 30px 10px 25px; float:left; }
			 #TB_closeWindow { height:25px;
						padding:11px 25px 10px 0; float:right; }
			 #TB_closeAjaxWindow { padding:5px
						10px 7px 0; margin-bottom:1px; text-align:right; float:right; }

						#TB_ajaxWindowTitle { float:left; padding:7px 0 5px 10px; margin-bottom:1px;
						}
			 #TB_title { background-color:#e8e8e8; height:27px; }
			 #TB_ajaxContent {
						clear:both; padding:2px 15px 15px 15px; overflow:auto; text-align:left;
						line-height:1.4em; }
			 #TB_ajaxContent p { padding:5px 0px 5px 0px; }
			 #TB_load
						{ position: absolute; display:none; height:100px; width:100px; z-index:101;
						}
			 #TB_HideSelect { z-index:99; position:absolute; top: 0; left: 0;
						background-color:#fff; border:none; filter:alpha(opacity=0); -moz-opacity:
						0; opacity: 0; }
			 #TB_iframeContent { clear:both; border:none;
						margin-bottom:-1px; margin-top:1px; margin-bottom:1px; padding-left:5px;
						padding-right:5px; }
				</style>
			</head>
			<body bgcolor="#FFFFFF">
				<xsl:if test="not($detailed = 'both')">
					<div class="census_results" align="center">
					<img src="VoS/redesign/images/vtitle4.gif"/>
						</div>
					<h1 style="color:#990000;text-align:center;"><xsl:value-of select="$FullCountyName"/> County -
							<xsl:value-of select="$year"/> Population</h1>
					<p class="citationHelp"><b>Please cite results as coming from: </b><xsl:value-of select="$FullCountyName"/>
						County, <xsl:choose>
							<xsl:when test="$FullCountyName = 'Augusta'">Virginia</xsl:when>
							<xsl:when test="$FullCountyName = 'Franklin'">Pennsylvania</xsl:when>
						</xsl:choose>, <xsl:value-of select="$year"/> Population Census, Valley of
						the Shadow: Two Communities in the American Civil War, Virginia Center for
						Digital History, University of Virginia<br/>
						( <xsl:value-of select="$current-URL"/> ).</p>
				</xsl:if>
				<p>
					<a class="searchReturn" href="population_census">Start a new search</a>
				</p><br/>
				<xsl:choose>
					<xsl:when test="$numFound &gt; 0">
						
						<center>
						<div style="width:100%;padding-top:10px;padding-bottom:10px;">
							<xsl:call-template name="paging">
								<xsl:with-param name="detailed" select="$detailed"/>
								<xsl:with-param name="pages" select="$pages"/>
								<xsl:with-param name="current" select="1"/>
							</xsl:call-template>
						</div>
						<table style="width:100%" border="1px">
							<xsl:if test="$detailed = 'both'">
								<tr>
									<td colspan="6" style="text-align:center;font-weight:bold;">
										<xsl:choose>
											<xsl:when test="$column = 'search1'">
												<xsl:text>1860</xsl:text>
											</xsl:when>
											<xsl:when test="$column = 'search2'">
												<xsl:text>1870</xsl:text>
											</xsl:when>
										</xsl:choose>
										<xsl:text> </xsl:text>
										<xsl:value-of select="$county"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:choose>
								<xsl:when test="$detailed = 'no' or $detailed = 'both'">
									<tr>
										<xsl:if test="$detailed='no'">
											<td>
												<b>Family Number</b>
											</td>
											<td>
												<b>Order in House</b>
											</td>
										</xsl:if>
										<td>
											<b>Last Name</b>
										</td>
										<td>
											<b>First Name</b>
										</td>
										<td>
											<b>Age</b>
										</td>
										<td>
											<b>Sex</b>
										</td>
										<td>
											<b>Color</b>
										</td>
										<xsl:if test="$detailed='both'">
											<td>
												<b>Birth Place</b>
											</td>
										</xsl:if>
										<xsl:if test="$detailed='no'">
											<td>
												<b>Occupation</b>
											</td>
											<xsl:if test="$year = '1860'">
												<td>
												<b>Township</b>
												</td>
											</xsl:if>
											<xsl:if test="$year = '1870'">
												<td>
												<b>District</b>
												</td>
												<td>
												<b>Post Office</b>
												</td>
											</xsl:if>
										</xsl:if>
									</tr>
								</xsl:when>
								<xsl:when test="$detailed = 'yes'">
									<tr>
										<td>
											<b>Order in House</b>
										</td>
										<td>
											<b>Name</b>
										</td>
										<td>
											<b>Age</b>
										</td>
										<td>
											<b>Sex</b>
										</td>
										<td>
											<b>Color</b>
										</td>
										<td>
											<b>Occupation</b>
										</td>
										<td>
											<b>Real Estate</b>
										</td>
										<td>
											<b>Personal Estate</b>
										</td>
										<td>
											<b>Birth Place</b>
										</td>
										<xsl:if test="$year = '1870'">
											<td>
												<b>Month Born*</b>
											</td>
											<td>
												<b>Month Married*</b>
											</td>
										</xsl:if>
										<xsl:if test="$year = '1860'">
											<td>
												<b>Township</b>
											</td>

											<td>
												<b>Married in Past Year</b>
											</td>
										</xsl:if>
										<td>
											<b>Attended School in Past Year</b>
										</td>
										<xsl:if test="$year = '1860'">
											<td>
												<b>Read/Write</b>
											</td>
										</xsl:if>
										<xsl:if test="$year = '1870'">
											<td>
												<b>Can Read</b>
											</td>
											<td>
												<b>Can Write</b>
											</td>
										</xsl:if>
										<td>
											<b>Handicap</b>
										</td>
										<xsl:if test="$year = '1870'">
											<td>
												<b>Male Over 21</b>
											</td>
											<td>
												<b>Male Vote Denied</b>
											</td>
											<td>
												<b>Foreign Father</b>
											</td>
											<td>
												<b>Foreign Mother</b>
											</td>
											<td>
												<b>County</b>
											</td>
											<td>
												<b>District</b>
											</td>
											<td>
												<b>Post Office</b>
											</td>
										</xsl:if>
										<td>
											<b>Page Number</b>
										</td>
										<td>
											<b>Dwelling Number</b>
										</td>
										<td>
											<b>Family Number</b>
										</td>
										<td>
											<b>Notes</b>
										</td>
									</tr>
								</xsl:when>
							</xsl:choose>
							<xsl:apply-templates select="//doc"/>
						</table>

						<div style="width:100%;padding-top:10px;padding-bottom:10px;">
							<xsl:call-template name="paging">
								<xsl:with-param name="detailed" select="$detailed"/>
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
					<a class="searchReturn" href="population_census">Start a new search</a>
				</p>
				</xsl:if>
				<div id="footer" style="display:block; clear:both; border: none; padding-top: 1em;">
					<center>
						<a href="VoS/choosepart.html" shape="rect">
							<img alt="Return to Full Valley Archive" border="0" src="VoS/graphics/full7.gif"/>
						</a>
					</center>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="doc">
		<xsl:choose>
			<xsl:when test="$detailed = 'no' or $detailed = 'both'">
				<tr>
					<xsl:if test="$detailed='no'">
						<td>
							<xsl:value-of select="int[@name='family_num']"/>
						</td>
						<td>
							<xsl:value-of select="int[@name='head_num']"/>
						</td>
					</xsl:if>
					<td>
						<a
							href="census_results?q=id_num:{int[@name='id_num']} AND db:{str[@name='db']}&amp;TB_iframe=true" class="thickbox">
							<xsl:value-of select="str[@name='last']"/>
						</a>
					</td>
					<td>
						<xsl:value-of select="str[@name='first']"/>
					</td>
					<td>
						<xsl:value-of select="substring-before(float[@name='age'], '.0')"/>
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
						<xsl:choose>
							<xsl:when test="str[@name='color'] = 'b'">
								<xsl:text>Black</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'w'">
								<xsl:text>White</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'm'">
								<xsl:text>Mulatto</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'c'">
								<xsl:text>Chinese</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'i'">
								<xsl:text>Indian</xsl:text>
							</xsl:when>
						</xsl:choose>
					</td>
					<xsl:if test="$detailed='both'">
						<td>
							<xsl:value-of select="str[@name='birth_place']"/>
						</td>
					</xsl:if>
					<xsl:if test="$detailed='no'">
						<td>
							<xsl:value-of select="str[@name='occupation']"/>
						</td>
						<xsl:if test="$year = '1860'">
							<td>
								<xsl:value-of select="str[@name='subdistrict']"/>
							</td>
						</xsl:if>
						<xsl:if test="$year = '1870'">
							<td>
								<xsl:value-of select="str[@name='district']"/>
							</td>
							<td>
								<xsl:value-of select="str[@name='post_office']"/>
							</td>
						</xsl:if>
					</xsl:if>
				</tr>
			</xsl:when>
			<xsl:when test="$detailed = 'yes'">
				<tr>
					<td>
						<xsl:value-of select="int[@name='head_num']"/>
					</td>
					<td>
						<a
							href="census_results?q=id_num:{int[@name='id_num']} AND db:{str[@name='db']}">
							<xsl:value-of select="str[@name='first']"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="str[@name='last']"/>
						</a>
					</td>
					<td>
						<xsl:value-of select="substring-before(float[@name='age'], '.0')"/>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="str[@name='sex'] = 'm' or str[@name='sex'] = 'M'">
								<xsl:text>Male</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='sex'] = 'f' or str[@name='sex'] = 'F'">
								<xsl:text>Female</xsl:text>
							</xsl:when>
						</xsl:choose>
					</td>
					<td>
						<xsl:choose>
							<xsl:when test="str[@name='color'] = 'b'">
								<xsl:text>Black</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'w'">
								<xsl:text>White</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'm'">
								<xsl:text>Mulatto</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'c'">
								<xsl:text>Chinese</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'i'">
								<xsl:text>Indian</xsl:text>
							</xsl:when>
						</xsl:choose>
					</td>
					<td>
						<xsl:value-of select="str[@name='occupation']"/>
					</td>
					<td>
						<xsl:value-of select="int[@name='realest']"/>
					</td>
					<td>
						<xsl:value-of select="int[@name='persest']"/>
					</td>
					<td>
						<xsl:value-of select="str[@name='birth_place']"/>
					</td>
					<xsl:if test="$year = '1860'">
						<td>
							<xsl:value-of select="str[@name='subdistrict']"/>
						</td>
						<td>
							<xsl:value-of select="str[@name='married']"/>
						</td>
					</xsl:if>
					<xsl:if test="$year = '1870'">
						<td>
							<xsl:value-of select="str[@name='birth_month']"/>
						</td>
						<td>
							<xsl:value-of select="str[@name='marr_month']"/>
						</td>
					</xsl:if>
					<td>
						<xsl:choose>
							<xsl:when
								test="str[@name='school'] = 'yes' or str[@name='school'] = '1'">
								<xsl:text>yes</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>no</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<xsl:if test="$year = '1860'">
						<td>
							<xsl:value-of select="str[@name='readwrite']"/>
						</td>
					</xsl:if>
					<xsl:if test="$year = '1870'">
						<td>
							<xsl:choose>
								<xsl:when test="str[@name='read'] = '1'">
									<xsl:text>yes</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>no</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="str[@name='write'] = '1'">
									<xsl:text>yes</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>no</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</xsl:if>
					<td>
						<xsl:value-of select="str[@name='deaf_dumb']"/>
					</td>
					<xsl:if test="$year = '1870'">
						<td>
							<xsl:choose>
								<xsl:when test="str[@name='male_21'] = '1'">
									<xsl:text>yes</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>no</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="str[@name='male_novote'] = '1'">
									<xsl:text>yes</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>no</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="str[@name='for_father'] = '1'">
									<xsl:text>yes</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>no</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td>
							<xsl:choose>
								<xsl:when test="str[@name='for_mother'] = '1'">
									<xsl:text>yes</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>no</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
						<td>
							<xsl:value-of select="$county"/>
						</td>
						<td>
							<xsl:value-of select="str[@name='district']"/>
						</td>
						<td>
							<xsl:value-of select="str[@name='post_office']"/>
						</td>
					</xsl:if>
					<td>
						<xsl:value-of select="int[@name='page_num']"/>
					</td>
					<td>
						<xsl:value-of select="int[@name='dwelling_num']"/>
					</td>
					<td>
						<xsl:value-of select="int[@name='family_num']"/>
					</td>
					<td>
						<xsl:value-of select="str[@name='notes']"/>
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
						href="census_search_results?q={$q}&amp;start={(($this_page - 3) * $rows) + $rows}&amp;rows={$rows}&amp;detailed={$detailed}&amp;county={$county}&amp;year={$year}&amp;column={$column}&amp;sort={$sort}"
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
					href="census_search_results?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;detailed={$detailed}&amp;county={$county}&amp;year={$year}&amp;column={$column}&amp;sort={$sort}">
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
						href="census_search_results?q={$q}&amp;start={(($this_page - 1) * $rows) + $rows}&amp;rows={$rows}&amp;detailed={$detailed}&amp;county={$county}&amp;year={$year}&amp;column={$column}&amp;sort={$sort}"
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
			<xsl:call-template name="detailedLink"/>
		</xsl:if>
		<xsl:if test="$current &lt; $pages">
			<xsl:call-template name="paging">
				<xsl:with-param name="current" select="$current + 1"/>
				<xsl:with-param name="detailed" select="$detailed"/>
				<xsl:with-param name="pages" select="$pages"/>
			</xsl:call-template>
		</xsl:if>

	</xsl:template>
	
	<xsl:template name="detailedLink">
		<xsl:choose>
				<xsl:when test="$detailed = 'no'">
					<p>
						<a
							href="census_search_results?q={$q}&amp;start={$start}&amp;rows={$rows}&amp;detailed=yes&amp;county={$county}&amp;year={$year}&amp;sort={$sort}"
							class="detailed_results">View detailed search on this page of
						results</a>
					</p>
				</xsl:when>
				<xsl:when test="$detailed = 'yes'">
					<p>
						<a
							href="census_search_results?q={$q}&amp;start={$start}&amp;rows={$rows}&amp;detailed=no&amp;county={$county}&amp;year={$year}&amp;sort={$sort}"
							class="detailed_results">View basic search on this page of results</a>
					</p>
				</xsl:when>
			</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
