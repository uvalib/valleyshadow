<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" indent="yes" encoding="iso-8859-1" media-type="text/html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Memory Articles</title>
				<style> div#mainResults { width: 65%; text-align:left; } .psummary {border-bottom:
					3px double #000000; padding-bottom: 8px;} .red-head {color: #990000;
					font-family: times, serif; font-weight: bold; } </style>
	  		<link type="text/css" rel="stylesheet" href="../VoS/css/valleyshadow.css" />   
      		<link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
					
			</head>
			<body bgcolor="#FFFFFF" link="#CD7F32" vlink="#00009C">
				<center>
					<img src="/VoS/images/images/vtitle4.gif" border="0"/>
					<br/>
					<br/>
					<h2 class="red-head">Valley Memory Articles</h2>
					<br/>
					<hr align="center" width="65%"/>
					<div id="mainResults">
						<h3 class="section-head">
							<xsl:value-of select="TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/>
						</h3>
						<xsl:call-template name="Single"/>
					</div>
				</center>
				<hr align="center" width="65%"/>
				<br/>
				<center>
					<a href="/VoS/choosepart.html">
						<img style="border:none;" src="/VoS/images/graphics/full7.gif" alt="Return to Full Valley Archive"/>
					</a>

				</center>
			</body>
		</html>
	</xsl:template>


	<xsl:template name="Single">
		<xsl:if test="TEI.2/text/front/div1[@type='summary']/p">
			<p class="psummary">
				<b>Summary:</b>
				<xsl:text> </xsl:text>
				<xsl:value-of select="TEI.2/text/front/div1[@type='summary']/p"/>
			</p>
		</xsl:if>

		<xsl:for-each select="TEI.2/text/body/div1/p">
			<p>
				<xsl:apply-templates select="."/>
			</p>
		</xsl:for-each>

		<hr width="100%" align="center"/>
		<p>
			<b>Bibliographic Information: </b>
			<i>
				<xsl:value-of
					select="TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/idno"/>
			</i>
		</p>

	</xsl:template>

	<xsl:template match="hi">
		<xsl:choose>
			<xsl:when test="@rend='underline'">
				<u>
					<xsl:apply-templates/>
				</u>
			</xsl:when>
			<xsl:when test="@rend='italics'">
				<i>
					<xsl:apply-templates/>
				</i>
			</xsl:when>
			<xsl:when test="@rend='bold'">
				<b>
					<xsl:apply-templates/>
				</b>
			</xsl:when>
			<xsl:when test="@rend='super'">
				<sup>
					<xsl:apply-templates/>
				</sup>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="lb">
		<br/>
	</xsl:template>

</xsl:stylesheet>
