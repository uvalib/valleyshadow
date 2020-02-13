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

<xsl:template match="/">
	<html>
		<head>
		<style>
			.title {color: #990000; font-family: times, serif} 
			.section-head {color: #003366; font-family: times, serif; font-weight: bold}
			.p10 {margin-left: 5em; margin-right: 5em; }
			.grey{background-color: #cccccc; padding: 5px; }
			.white{background-color: #ffffff; padding: 5px; }
			.psummary {border-bottom: 3px double #000000; padding-bottom: 8px;}
			.red-head {color: #990000; font-family: times, serif; font-weight: bold;} 
			div#mainResults {
			width: 65%;
			text-align:left;
			}
		</style>
	 <link type="text/css" rel="stylesheet" href="../VoS/css/valleyshadow.css" />	
		</head>
		<body bgcolor="#ffffff" link="#cd7f32" vlink="#00009c" text="#000000"><center>
			
			<img src="/VoS/images/images/vtitle4.gif" border="0"/>
			
			<br/>
			<br/>
			<h2 class="red-head">Valley Southern Claims Commission Papers</h2>
			<br /><hr align="center" width="65%" />
<h3><xsl:value-of select="TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/></h3>
			<div id="mainResults">
			<xsl:call-template name="summary"/>
			
			<xsl:call-template name="claimitems"/>
			<hr width="100%" />
			<xsl:call-template name="claimsummary"/>
			<hr width="100%" />
			<xsl:call-template name="testimony"/>
			<hr width="100%" />
			<xsl:call-template name="biblio"/>
			
		</div>
			
		</center>
			<hr align="center" width="65%"/>
			<br/>
			<center>
				<a href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" alt="Return to Full Valley Archive"/></a>
				
			</center>
		</body>
	</html>
</xsl:template>


<xsl:template name="summary">
<xsl:for-each select="/TEI.2/text/front/div1">
			<p class="psummary"><b>Summary:</b><xsl:text> </xsl:text><xsl:value-of select="."/></p>
		</xsl:for-each>
</xsl:template>

<xsl:template name="claimitems">
<xsl:for-each select="/TEI.2/text/body/div1[@type='claim_items']">
			<p><b>Items Claimed:</b><xsl:apply-templates/></p>
		</xsl:for-each>
</xsl:template>

<xsl:template name="claimsummary">
<xsl:for-each select="/TEI.2/text/body/div1[@type='claim_summary']">
			<p><b>Claims Summary:</b><xsl:apply-templates/></p>
		</xsl:for-each>
</xsl:template>


<xsl:template name="testimony">
<xsl:for-each select="/TEI.2/text/body/div1[@type='testimony']">
			<p><b>Testimony:</b><xsl:apply-templates/></p>
			<xsl:if test="position()!=last()">
						<hr width="100%" />
	</xsl:if>
		</xsl:for-each>
</xsl:template>

<xsl:template name="biblio">
<p><b>Bibliographic Information : </b> <i><xsl:value-of select="/TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title[@type='main']"/></i>, <xsl:value-of select="/TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/idno"/>.</p>  

</xsl:template>






<xsl:template match="p">
	<p><xsl:apply-templates/></p>
</xsl:template>


<xsl:template match="lb">
	<br/>
</xsl:template>

<xsl:template match="byline">
	<b><xsl:apply-templates/></b>
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

<xsl:template match="table">
		<table cellpadding="5">
			<xsl:for-each select="row">
				<tr>
					<xsl:for-each select="cell">
						<td>
							<xsl:apply-templates/>
						</td>
					</xsl:for-each>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
</xsl:stylesheet>