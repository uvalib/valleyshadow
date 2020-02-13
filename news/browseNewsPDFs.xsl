<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:variable name="path">../newspapers_pdfs/</xsl:variable>
	<xsl:param name="paper"/>
	<xsl:variable name="pname">
		<xsl:value-of select="$paper"/>
	</xsl:variable>
	<xsl:template match="/">



		<html>
			<head>
				<style> .title {color: #990000; font-family: times, serif} .section-head {color: #003366; font-family:
					times, serif; font-weight: bold} .p5 {left-margin: 5em} </style>
			</head>
			<body bgcolor="#ffffff" link="#cd7f32" vlink="#00009c" text="#000000">
				<table width="100%" cellpadding="20">
					<tr>
						<td align="left" valign="top">
							<table cellpadding="5" width="200">
								<tr>

									<td bgcolor="#003366">
										<center>
											<table width="100%" cellpadding="10">
												<tr>
													<td bgcolor="#ffffff" align="center">
														<a href="../newspapers">Search the<br/>Newspapers</a>

													</td>
												</tr>
												<tr>

													<td bgcolor="#ffffff" align="center">
														<a href="/VoS/newspapers/opening.html">Browse Newspapers<br/>by Date</a>
													</td>
												</tr>
												<tr>
													<td bgcolor="#ffffff" align="center">
														<a href="/VoS/newspapers/topics.html">Articles Indexed<br/>by Topic</a>
													</td>
												</tr>

												<tr>
													<td bgcolor="#ffffff" align="center">
														<a href="/VoS/newspapers/about.html">About the<br/>Newspapers</a>
													</td>
												</tr>
												<tr>
													<td bgcolor="#ffffff" align="center">
														<a href="/VoS/choosepart.html">Valley of the Shadow<br/>Home</a>
													</td>
												</tr>

											</table>
										</center>
									</td>
								</tr>
							</table>



						</td>
						<td align="left">
							<center>
								<p>
									<img src="/VoS/images/images/vtitle4.gif"/>
								</p>
								<img src="/VoS/newspapers/newspaper_head.jpg"/>
							</center>




							<center>
								<h2 class="section-head">
									<xsl:value-of select="//newspaper/div1[@n=$pname]/head"/>
								</h2>
								<b>Go To Year : </b>


								<xsl:for-each select="//newspaper/div1[@n=$pname]/div2">
									<a>
										<xsl:attribute name="href">#<xsl:value-of select="@n"/></xsl:attribute>
										<xsl:value-of select="@n"/>
									</a>
									<xsl:text> | </xsl:text>
									<xsl:if test="position()!=last()">
										<xsl:text>  </xsl:text>
									</xsl:if>
								</xsl:for-each>

							</center>
						</td>
					</tr>
				</table>


				<hr width="80%"/>
				<center>
					<h1 class="title">
						<xsl:value-of select="//newspaper/div1[@n=$pname]/head"/>
					</h1>

					<xsl:for-each select="//newspaper/div1[@n=$pname]/div2">
						<a>
							<xsl:attribute name="name">
								<xsl:value-of select="@n"/>
							</xsl:attribute>
						</a>
						<div style="min-width: 200px; max-width: 40%; width:auto; align:center;">
							<table cellspacing="5" style="border:none; display: block; width: auto;">
								<tr bgcolor="#dddddd">
									<td width="75" style="text-align:center;" colspan="10">
										<b class="title">
											<xsl:value-of select="@n"/>
										</b>
									</td>
								</tr>
								<xsl:for-each select="div3">
									<tr>
										<td align="right">
											<b class="section-head">
												<xsl:call-template name="makeMonthName">
													<xsl:with-param name="n" select="@n"/>
												</xsl:call-template>
											</b>
										</td>
										<xsl:for-each select="div4">
											<td width="40" align="right">
												<xsl:variable name="tens" select="@n mod 100"/>
												<xsl:variable name="ones" select="@n mod 10"/>
												<xsl:variable name="subdir"><xsl:value-of select="parent::div3/parent::div2/parent::div1/@n"/><xsl:value-of select="parent::div3/parent::div2/@n"/></xsl:variable>
												<a>
													<xsl:attribute name="href">
														<xsl:value-of select="$path"/><xsl:value-of select="$subdir"/>/<xsl:value-of select="hwp/@id"/>
													</xsl:attribute>
													<xsl:choose>
														<xsl:when test="starts-with(@n, '0')">
															<xsl:value-of select="substring-after(@n, '0')"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="@n"/>
														</xsl:otherwise>
													</xsl:choose>
													<xsl:choose>
														<xsl:when test="$tens=11 or $tens=12 or $tens=13">
															<xsl:text>th</xsl:text>
														</xsl:when>
														<xsl:when test="$ones=1">
															<xsl:text>st</xsl:text>
														</xsl:when>
														<xsl:when test="$ones=2">
															<xsl:text>nd</xsl:text>
														</xsl:when>
														<xsl:when test="$ones=3">
															<xsl:text>rd</xsl:text>
														</xsl:when>
														<xsl:otherwise>th</xsl:otherwise>
													</xsl:choose>
												</a>
												<!-- 							<xsl:if test="position() != last()">
													<xsl:text>, </xsl:text>
													</xsl:if> -->
											</td>
										</xsl:for-each>
									</tr>
								</xsl:for-each>
							</table>
						</div>
					</xsl:for-each>
					<hr align="center" width="80%"/>
					<a href="/VoS/choosepart.html" style="border:none;">
						<img style="border:none;" src="/VoS/images/graphics/full7.gif" alt="Return to Full Valley Archive"/>
					</a>
				</center>

			</body>
		</html>
	</xsl:template>
	<xsl:template name="makeMonthName">
		<xsl:param name="n">0</xsl:param>
		<xsl:choose>
			<xsl:when test="$n = '01' or $n='1'">
				<xsl:text>January</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '02' or $n='2'">
				<xsl:text>February</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '03' or $n='3'">
				<xsl:text>March</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '04' or $n='4'">
				<xsl:text>April</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '05' or $n='5'">
				<xsl:text>May</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '06' or $n='6'">
				<xsl:text>June</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '07' or $n='7'">
				<xsl:text>July</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '08' or $n='8'">
				<xsl:text>August</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '09' or $n='9'">
				<xsl:text>September</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '10'">
				<xsl:text>October</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '11'">
				<xsl:text>November</xsl:text>
			</xsl:when>
			<xsl:when test="$n = '12'">
				<xsl:text>December</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>unknown month</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
