<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:param name="solr-query-string"/>
	<xsl:param name="current-URL"/>
	<xsl:param name="q"/>
	<xsl:param name="db" select="concat('db',':','pop_fr_60')"/>
	<xsl:param name="start"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="county"/>
	<xsl:param name="first"/>
	<xsl:param name="last"/>
	<xsl:param name="year"/>
	<xsl:param name="detailed">both</xsl:param>
	<xsl:param name="column"/>
	<xsl:param name="sort"/>
	<xsl:param name="parent-pipeline"/>
	<xsl:param name="current-pipeline"/>
	<xsl:variable name="numFound">
		<xsl:value-of select="number(//result[@name='response']/@numFound)"/>
	</xsl:variable>
	<xsl:variable name="pagingPipeline">solr_fragment</xsl:variable>
	<xsl:variable name="window">
		<xsl:choose>
			<xsl:when test="starts-with($q ,'db:pop_aug_60') or starts-with($q, 'db:pop_fr_60')">search1860</xsl:when>
			<xsl:otherwise>search1870</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<!-- hard coded for testing only -->
	<xsl:variable name="ref">dualSearchResults</xsl:variable>
	<xsl:variable name="ResultsTitle">
		<xsl:choose>
			<xsl:when test="starts-with($q ,'db:pop_aug_60')">Augusta County: 1860</xsl:when>
			<xsl:when test="starts-with($q ,'db:pop_aug_70')">Augusta County: 1870</xsl:when>
			<xsl:when test="starts-with($q ,'db:pop_fr_60')">Franklin County: 1860</xsl:when>
			<xsl:when test="starts-with($q ,'db:[pop_fr_70')">Franklin County: 1870</xsl:when>
			<xsl:otherwise>Census Search Result</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:template match="/">
		<xsl:variable name="next">
			<xsl:value-of select="$start+$rows"/>
		</xsl:variable>

		<xsl:variable name="pages">
			<xsl:value-of select="ceiling($numFound div $rows)"/>
		</xsl:variable>
		<xsl:variable name="windowStatus">
			<xsl:choose>
				<xsl:when test="contains($parent-pipeline, 'census')">dualSearchWindow</xsl:when>
				<xsl:otherwise>soloSearchWindow</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<!-- variable styling here in case the URL for a single window is requested as a standalone page -->
		<xsl:element name="div">
			<xsl:choose>
				<xsl:when test="contains($parent-pipeline, 'census')">
					<xsl:attribute name="class"><xsl:value-of select="$windowStatus"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="class"><xsl:value-of select="$windowStatus"/></xsl:attribute> 
					<xsl:attribute name="style">padding: 3em; border-left: thin solid rgb(205, 127, 50); border-right: thin solid rgb(205, 127, 50); border-top: thin solid rgb(205, 127, 50); color: rgb(205, 127, 50); text-align: center;</xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		<h3 class="description"><xsl:value-of select="$ResultsTitle"/> Census</h3>
			
		<h4 class="hideme">URL: <xsl:value-of select="$current-URL"/></h4>
			<!-- 
			<p>debug: param solr-query-string is currently = <b><xsl:value-of select="$solr-query-string"/></b></p>
			<p>debug: param q is currently = <xsl:value-of select="$q"/></p>
			<p>debug: param db is currently = <xsl:value-of select="$db"/></p>
			<p>numFound = <xsl:value-of select="$numFound"/></p>
			<p>window = "<xsl:value-of select="$window"/>"</p>
			<p>debug: detailed: <xsl:value-of select="$detailed"/></p>
			<p>debug: param rows is currently = <xsl:value-of select="$rows"/></p>
			<p>debug: param county is currently = <xsl:value-of select="$county"/></p>
			<p>debug: param column is currently = <xsl:value-of select="$column"/></p>
			<p>debug: param current-pipeline is currently = <xsl:value-of select="$current-pipeline"/></p>
			<p>debug: param parent-pipeline is currently = <xsl:value-of select="$parent-pipeline"/></p>
			<p style="color:green;">debug: param pagingPipeline is currently = <xsl:value-of select="$pagingPipeline"/></p>
			 -->
		</xsl:element>
		
		<!-- variable styling here in case the URL for a single window is requested as a standalone page -->
		<xsl:element name="div">
			<xsl:choose>
				<xsl:when test="contains($parent-pipeline, 'census')">
					<xsl:attribute name="class"><xsl:value-of select="$windowStatus"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="class"><xsl:value-of select="$windowStatus"/></xsl:attribute> 
					<xsl:attribute name="style">padding: 3em; border-left: thin solid rgb(205, 127, 50); border-right: thin solid rgb(205, 127, 50); border-bottom: thin solid rgb(205, 127, 50); </xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
		<xsl:choose>
					<xsl:when test="$numFound &gt; 0">
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
										<xsl:value-of select="$ResultsTitle"/>
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
							<xsl:apply-templates select="//doc"><xsl:with-param name="detailed" select="$detailed"/></xsl:apply-templates>
						</table>

						<div style="width:100%;padding-top:10px;padding-bottom:10px;" class="pagingDiv">
							<script type="text/javascript" src="javascript/census_search_results.js"/>
							<xsl:call-template name="paging">
								<xsl:with-param name="detailed" select="$detailed"/>
								<xsl:with-param name="pages" select="$pages"/>
								<xsl:with-param name="current" select="1"/>
								<xsl:with-param name="db" select="$db"/>
							</xsl:call-template>
						</div>
						
					</xsl:when>
					<xsl:otherwise>
						<p>
							<b>There were no matches for the search you requested</b>
						</p>
					</xsl:otherwise>
		</xsl:choose>
		</xsl:element>
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
					<td class="{$window}">
						<xsl:variable name="singleRequestURL">census_results?q=id_num:<xsl:value-of select="int[@name='id_num']"/> AND db:<xsl:value-of select="str[@name='db']"/>
							<xsl:if test="contains($parent-pipeline, 'census') or $ref='dualSearchRequest'">&amp;TB_iframe=true</xsl:if></xsl:variable>
						<a style="color: #CD7F32;" class="singleRecord thickbox"
							href="{$singleRequestURL}">
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
						<a style="color: #CD7F32;" 
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
		<xsl:param name="db">default</xsl:param>

		<xsl:variable name="this_start">
			<xsl:value-of select="($current - 1) * $rows"/>
		</xsl:variable>
		<xsl:variable name="this_page">
			<xsl:value-of select="($start div $rows) + 1"/>
		</xsl:variable>
	
		<xsl:if test="$current= '1'">
			<xsl:choose>
				<xsl:when test="not($this_page = '1')">
					<a class="pagingBtn {$window}" style="color: #CD7F32;" 
						href="{$pagingPipeline}?q={$q}&amp;start={(($this_page - 3) * $rows) + $rows}&amp;rows={$rows}&amp;detailed={$detailed}&amp;county={$county}&amp;year={$year}&amp;column={$column}&amp;sort={$sort}&amp;db={$db}"
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
				<a class="pagingBtn {$window}" style="color: #CD7F32;" 
					href="{$pagingPipeline}?q={$q}&amp;start={$this_start}&amp;rows={$rows}&amp;detailed={$detailed}&amp;county={$county}&amp;year={$year}&amp;column={$column}&amp;sort={$sort}&amp;db={$db}">
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
					<a class="pagingBtn {$window}" style="color: #CD7F32;" 
						href="{$pagingPipeline}?q={$q}&amp;start={(($this_page - 1) * $rows) + $rows}&amp;rows={$rows}&amp;detailed={$detailed}&amp;county={$county}&amp;year={$year}&amp;column={$column}&amp;sort={$sort}&amp;db={$db}"
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
			<xsl:choose>
				<xsl:when test="$detailed = 'no'">
					<p>
						<a style="color: #CD7F32;" 
							href="{$pagingPipeline}?q={$q}&amp;start={$start}&amp;rows={$rows}&amp;detailed=yes&amp;county={$county}&amp;year={$year}&amp;sort={$sort}"
							class="detailed_results" target="_top">View detailed search on this page of
						results</a>
					</p>
				</xsl:when>
				<xsl:when test="$detailed = 'yes'">
					<p>
						<a style="color: #CD7F32;"
							href="javascript:history.go(-1)"
							class="detailed_results">Return to basic view of results</a>
					</p>
				</xsl:when>
			</xsl:choose>
		</xsl:if>
		<xsl:if test="$current &lt; $pages">
			<xsl:call-template name="paging">
				<xsl:with-param name="current" select="$current + 1"/>
				<xsl:with-param name="detailed" select="$detailed"/>
				<xsl:with-param name="pages" select="$pages"/>
				<xsl:with-param name="db" select="$db"/>
			</xsl:call-template>
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>
