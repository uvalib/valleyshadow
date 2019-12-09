<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
	xmlns:cinclude="http://apache.org/cocoon/include/1.0">
	<xsl:param name="q"/>
	<xsl:param name="current-URL"/>
	<xsl:param name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'man_aug')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'man_fr')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="county_frag">
		<xsl:choose>
			<xsl:when test="contains($q, 'man_aug')">
				<xsl:text>man_aug_</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'man_fr')">
				<xsl:text>man_fr_</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="year">
		<xsl:choose>
			<xsl:when test="contains($q, '_60')">
				<xsl:text>1860</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, '_70')">
				<xsl:text>1870</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="year_frag">
		<xsl:choose>
			<xsl:when test="contains($q, '_60')">
				<xsl:text>_60</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, '_70')">
				<xsl:text>_70</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>

	<xsl:template match="/">
		<xsl:apply-templates select="//doc[1]"/>
	</xsl:template>

	<xsl:template match="doc">
		<html>
			<head>
				<title>Valley of the Shadow: Census Search Results</title>
				<style> body { padding:1em; }
					.red-head {color: #990000; font-family: times, serif; font-weight: bold }
					.warning {font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} 
					table.record { padding:2em; width: auto; border:none; } 
					table.record * td { padding: 5px; } 
					table.record * th { background: #ffcc99; vertical-align: top; padding: 10px;}
					td.left { text-align: right; }
					td.right { text-align: left; }
					td.race { color: #990000; }
					td.gender { color: #000099;}
					p.citation-help { padding-left: 3em; padding-right: 3em; border: none;}
				</style>
			</head>
			<body bgcolor="#FFFFFF" link="#CD7F32" vlink="#00009C">
				<center>
					<img src="VoS/redesign/images/vtitle4.gif"/>
				</center>
				<h1>
					<font color="#990000">
						<center><xsl:value-of select="$county"/> County - <xsl:value-of select="$year"/>
							Manufacturing Census</center>
					</font>
				</h1>
				<p class="citation-help">
					<b>Please cite results as coming from:</b>
					<xsl:value-of select="$county"/> County, <xsl:choose>
						<xsl:when test="$county = 'Augusta'">
							<xsl:text>Virginia</xsl:text>
						</xsl:when>
						<xsl:when test="$county = 'Franklin'">
							<xsl:text>Pennsylvania</xsl:text>
						</xsl:when>
					</xsl:choose>, <xsl:value-of select="$year"/> Manufacturing Census, Valley of
					the Shadow: Two Communities in the American Civil War, Virginia Center for
					Digital History, University of Virginia
					<br/>(<xsl:value-of select="$current-URL"/>).</p>
				<table border="0">
					<xsl:variable name="nameResult">
					<xsl:choose>
						<xsl:when test="str[@name='last_name']">
							<xsl:value-of select="str[@name='last_name']"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="str[@name='name']"/>
						</xsl:otherwise>
					</xsl:choose>
					</xsl:variable>
					<tr>
						<td bgcolor="#ffcc99">
							<b>Basic Information</b>
						</td>
						<td/>
					</tr>
					<tr>
						<td>
							<table border="0">
								<tr>
									<td align="right">
										<b>Business Name:</b>
									</td>
									<td align="left">
										<xsl:value-of select="$nameResult"/>
									</td>
								</tr>

								<tr>
									<td align="right">
										<b>Location:</b>
									</td>
									<td align="left">
										<xsl:value-of select="str[@name='location']"/>
									</td>
								</tr>
								<tr>
									<td align="right">
										<b>Business Type:</b>
									</td>
									<td align="left">
										<xsl:value-of select="str[@name='business']"/>
									</td>
								</tr>
								<tr>
									<td align="right">
										<b>Capital Investment:</b>
									</td>
									<td align="left">
										<xsl:value-of select="int[@name='cap_inv']"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffcc99">
							<b>Workers</b>
						</td>
						<td/>
					</tr>

					<tr>
						<td>
							<table border="0">
								<tr>
									<td align="right">
										<b>Number of Male Workers:</b>
									</td>
									<td align="left">
										<xsl:choose>
											<xsl:when test="string(float[@name='male_hands'])">
												<xsl:value-of
												select="substring-before(float[@name='male_hands'], '.0')"
												/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td align="right">
										<b>Number of Female Workers:</b>
									</td>
									<td align="left">
										<xsl:choose>
											<xsl:when test="string(float[@name='female_hands'])">
												<xsl:value-of
												select="substring-before(float[@name='female_hands'], '.0')"
												/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td align="right">
										<b>Number of Children Workers:</b>
									</td>
									<td align="left">
										<xsl:choose>
											<xsl:when test="string(float[@name='children_hands'])">
												<xsl:value-of
												select="substring-before(float[@name='children_hands'], '.0')"
												/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td align="right">
										<b>Total Wages:</b>
									</td>
									<td align="left">
										<xsl:value-of
											select="substring-before(float[@name='total_wages'], '.0')"
										/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffcc99">
							<b>Wages</b>
						</td>
						<td/>
					</tr>
					<tr>
						<td>
							<table border="0">
								<tr>
									<td align="right">
										<b>Male Wages:</b>
									</td>
									<td align="left">
										<xsl:choose>
											<xsl:when test="string(float[@name='male_wage'])">
												<xsl:value-of
												select="substring-before(float[@name='male_wage'], '.0')"
												/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>

								<tr>
									<td align="right">
										<b>Female Wages:</b>
									</td>
									<td align="left">
										<xsl:choose>
											<xsl:when test="string(float[@name='female_wage'])">
												<xsl:value-of
												select="substring-before(float[@name='female_wage'], '.0')"
												/>
											</xsl:when>
											<xsl:otherwise>0</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffcc99">
							<b>Products (Annual)</b>
						</td>
						<td/>
					</tr>

					<tr>
						<td colspan="2">
							<table border="1" cellspacing="0" cellpadding="3">
								<tr>
									<td>
										<b>Kinds of Products</b>
									</td>
									<td>
										<b>Quantity of Products</b>
									</td>
									<td>
										<b>Value of Products</b>
									</td>
								</tr>

								<!-- query man_prod database-->
								<cinclude:include
									src="cocoon:/manu_prod?q=db:{concat($county_frag, 'prod', $year_frag)} AND id_num:{int[@name='id_num']}"
								/>
							</table>

						</td>
					</tr>
					<tr>
						<td bgcolor="#ffcc99">
							<b>Raw Materials (Annual)</b>
						</td>
						<td/>
					</tr>
					<tr>
						<td colspan="2">
							<table border="1" cellspacing="0" cellpadding="3">
								<tr>
									<td>
										<b>Kinds of Raw Materials</b>
									</td>
									<td>
										<b>Quantity of Raw Materials</b>
									</td>
									<td>
										<b>Value of Raw Materials</b>
									</td>
								</tr>
								<!-- query man_mat database-->
								<cinclude:include
									src="cocoon:/manu_mat?q=db:{concat($county_frag, 'mat', $year_frag)} AND id_num:{int[@name='id_num']}"
								/>
							</table>
						</td>
					</tr>

					<tr>
						<td bgcolor="#ffcc99">
							<b>Power</b>
						</td>
						<td/>
					</tr>
					<tr>
						<td>
							<table border="0">
								<tr>
									<td align="right">
										<b>Power Source:</b>
									</td>
									<td align="left">
										<xsl:value-of select="str[@name='power']"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffcc99">
							<b>Census Record Information</b>
						</td>
						<td/>
					</tr>
					<tr>
						<td>
							<table border="0">
								<tr>
									<td align="right">
										<b>Page Number:</b>
									</td>
									<td align="left">
										<xsl:value-of select="int[@name='page_num']"/>
									</td>
								</tr>

								<tr>
									<td align="right">
										<b>Number on Page:</b>
									</td>
									<td align="left">
										<xsl:value-of select="int[@name='num_on_page']"/>
									</td>
								</tr>
								<tr>
									<td align="right">
										<b>Notes:</b>
									</td>
									<td align="left">
										<xsl:value-of select="str[@name='notes']"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<p><a href="javascript:history.go(-1)">go back to search results page</a><br/>
					<a href="manu_census">New Search</a>
				</p>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
