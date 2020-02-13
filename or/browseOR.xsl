<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="html"
            indent="yes"
            encoding="iso-8859-1"
            media-type="text/html"
            doctype-public="-//W3C//DTD HTML 4.0//EN"/>

<xsl:param name="section"/>
<xsl:param name="year"/>
<xsl:param name="author"/>
<xsl:param name="place"/>
<xsl:param name="id"/>
<xsl:param name="string"/>
<xsl:param name="paper"/>
	<xsl:param name="page"/>
	<xsl:param name="folder"/>
<xsl:variable name="path">http://www.vcdh.virginia.edu:8065/saxon/servlet/SaxonServlet?source=/vcdh/xml_docs/valley_or/Index.xml&amp;style=/vcdh/xml_docs/valley_or/valley_or.xsl&amp;section=</xsl:variable>
<xsl:variable name="path_html">http://www.vcdh.virginia.edu/xml_docs/valley_or/</xsl:variable>
<xsl:variable name="path_images">http://valley.vcdh.virginia.edu/OR/</xsl:variable>

<xsl:key name="year_fr" match="//div1[@id='fr']/file" use="substring(./date/@n, 1,4)"/>
<xsl:key name="sender_fr" match="//div1[@id='fr']/file" use="./sender/@n"/>
<xsl:key name="year_au" match="//div1[@id='au']/file" use="substring(./date/@n, 1,4)"/>
<xsl:key name="sender_au" match="//div1[@id='au']/file" use="./sender/@n"/>
<xsl:key name="send_alpha" match="//keywords/sender" use="substring(@n, 1,1)"/>

<xsl:template match="/">
	<html>
		<head>
		<style> 
			.section-head {color: #003366; font-family: times, serif; font-weight: bold}
			.p10 {margin-left: 5em; margin-right: 5em; }
			.grey{background-color: #cccccc; padding: 5px; }
			.white{background-color: #ffffff; padding: 5px; }
			h2{color: #990000;}
			
			div#mainResults {
			width: 65%;
			text-align:left;
			}
		</style>
		<link type="text/css" rel="stylesheet" href="../VoS/css/valleyshadow.css" />   
        <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

		</head>
		<body bgcolor="#ffffff" link="#cd7f32" vlink="#00009c" text="#000000">
			<center>
				
				<img src="../VoS/images/or/ortitle.gif" border="0" />
					
					<br />
						<br />
							<h2>Records Related to 
				<xsl:choose>
					<xsl:when test="//TEI.2 [@n='au']">
						<xsl:text>Augusta County Regiments</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text>Franklin County Regiments</xsl:text>
					</xsl:otherwise>
				</xsl:choose></h2>
							<br />
								<hr align="center" width="50%" />
									<h3 class="section-head">
							<xsl:text>From: </xsl:text>
							<xsl:value-of select="//text/body/div1/closer/signed"/><br/>
							<xsl:choose>
								<xsl:when test="boolean(//text/body/div1/opener/dateline/date/text())">
									<xsl:value-of select="//text/body/div1/opener/dateline/date"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>Undated</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</h3>
									<div id="mainResults">
										
									
			

										<xsl:call-template name="Single"/></div></center> <center>
											<hr width="45%" align="center"/><a href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" alt="Return to Full Valley Archive"/></a>
											
										</center>
		</body>
	</html>
</xsl:template>


<xsl:template name="Single">
		<xsl:if test="//div1[@type='summary']/p">
			<p><b>Summary:<br/></b><xsl:apply-templates select="//div1[@type='summary']/p"/></p>
		</xsl:if>
		<hr width="75%" />
	<p><xsl:apply-templates select="//name[@type='location']"/></p>
		<p><xsl:apply-templates select="//name[@type='recipient']"/></p>
		<p><xsl:apply-templates select="//name[@type='place']"/></p>
		<p><xsl:apply-templates select="//opener/dateline/date"/></p>
		<p><xsl:apply-templates select="//opener/salute"/></p>
		<xsl:for-each select="//body/div1/p">
			<p><xsl:apply-templates select="."/></p>
		</xsl:for-each>
		<p><xsl:apply-templates select="//closer/salute"/></p>
		<p><xsl:apply-templates select="//closer/signed"/></p>
		<hr width="70%" align="center"/>
		<p><b>Bibliographic Information : </b>Letter Reproduced from <i><xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title[@type='uniform']"/></i>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/editionStmt/p"/>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/extent"/>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/publisher"/>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace"/>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date"/>.</p>  

</xsl:template>
	<xsl:template match="hi">
		<xsl:choose>
			<xsl:when test="@rend='underline'">
				<u><xsl:apply-templates/></u>
			</xsl:when>
			<xsl:when test="@rend='italics'">
				<i><xsl:apply-templates/></i>
			</xsl:when>
			<xsl:when test="@rend='bold'">
				<b><xsl:apply-templates/></b>
			</xsl:when>
			<xsl:when test="@rend='super'">
				<sup><xsl:apply-templates/></sup>
			</xsl:when>
		</xsl:choose>
	</xsl:template>

<xsl:template match="lb">
	<br/>
</xsl:template>

</xsl:stylesheet>