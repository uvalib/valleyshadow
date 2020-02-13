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
			.title {color: #990000; font-family: times, serif} 
			.p10 {margin-left: 3em; margin-right: 3em; }
			.p11 {text-align: center; margin-left: 3em; margin-right: 3em; }
			.p12 {margin-left: 5em; margin-right: 5em; font-size: 80%; }
			h4 {text-align: center; margin-left: 3em; margin-right: 3em; }
			
			div#mainResults {
			width: 65%;
			text-align:left;
			}
		</style>
 		<link type="text/css" rel="stylesheet" href="../VoS/css/valleyshadow.css" />		
		</head>
		<body bgcolor="#ffffff" link="#cd7f32" vlink="#00009c" text="#000000">
			<center>
				
				<img src="/VoS/images/images/vtitle4.gif" border="0" />
					
					<br />
						<br />
							<h2>Valley Personal Papers</h2>
							<br /><center>
								<a href="../VoS/personalpapers/browse/index.html"><b>Return to Browse</b></a> | <a href="../VoS/personalpapers/search/intro.html"><b>Return to Search</b></a><br /> <br/><a><xsl:attribute name="href">../head/<xsl:apply-templates select='TEI.2/@id'/></xsl:attribute>Bibliographic Information</a> | <a><xsl:attribute name="href">../papers/<xsl:apply-templates select='TEI.2/@id'/></xsl:attribute>Original Version</a></center>
								<div id="mainResults"><hr align="center" width="75%" />
									<h4>
							
										<xsl:choose>
											<xsl:when test="//TEI.2 [@id=starts-with(@id, 'Br')]">
												<xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title"/><br/>
											</xsl:when><xsl:otherwise>
												<xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title[@type='main']"/><br/></xsl:otherwise>
										</xsl:choose>
							
						</h4>
									<xsl:choose>
										<xsl:when test="//TEI.2 [@id=starts-with(@id, 'AD')]">
											<xsl:call-template name="Diary"></xsl:call-template>
										</xsl:when>
										<xsl:when test="//TEI.2 [@id=starts-with(@id, 'FD')]">
											<xsl:call-template name="Diary"></xsl:call-template>
										</xsl:when>
										<xsl:when test="//TEI.2 [@id=starts-with(@id, 'Em')]">
											<xsl:call-template name="EDiary"></xsl:call-template>
										</xsl:when>
										<xsl:when test="//TEI.2 [@id=starts-with(@id, 'BD')]">
											<xsl:call-template name="Diary"></xsl:call-template>
										</xsl:when>
									
			
<xsl:otherwise>
										<xsl:call-template name="Single"/></xsl:otherwise></xsl:choose></div></center><br/><center>
											<hr align="center" width="50%" /><a href="../VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" alt="Return to Full Valley Archive"/></a>
											
										</center>
		</body>
	</html>
</xsl:template>


<xsl:template name="Single">
		<xsl:if test="//div1[@type='summary']/p">
			<p class="p10"><b>Summary:<br/></b><xsl:apply-templates select="//div1[@type='summary']/p"/></p>
		</xsl:if>
		<hr width="75%" />
	<xsl:if test="//div1[@type='epigraph']/p">
		<p class="p11"><xsl:apply-templates select="//div1[@type='epigraph']/p"/></p>
	</xsl:if>
	
	<xsl:if test="//div1[@type='letter']/head">
		<p class="p11"><b><xsl:apply-templates select="//div1[@type='letter']/head"/></b></p>
	</xsl:if>
	
	<xsl:if test="//opener/pb[@entity]"><a><xsl:attribute name="href">../papers/images/<xsl:value-of select="//opener/pb/@entity"/>.jpg</xsl:attribute><center><img><xsl:attribute name="src">../papers/images/<xsl:value-of select='//opener/pb/@entity'/>.gif</xsl:attribute></img></center></a></xsl:if>
	
	
	<p class="p10"><xsl:apply-templates select="//name[@type='location']"/></p>
		<!-- <p class="p10"><xsl:apply-templates select="//name[@type='recipient']"/></p> -->
		
		<p class="p10"><xsl:apply-templates select="//opener/dateline/date"/></p>
	<p class="p10"><xsl:apply-templates select="//opener/dateline/name[@type='place']"/></p>
		<p class="p10"><xsl:apply-templates select="//opener/salute"/></p>
		<xsl:for-each select="//body/div1/p">
			<p class="p10"><xsl:apply-templates/></p>
		</xsl:for-each>
	
	<p class="p10"><xsl:apply-templates select="//closer/salute"/></p>
		<p class="p10"><i><xsl:apply-templates select="//closer/signed"/></i></p>
	<p class="p10"><xsl:apply-templates select="//closer/seg[@type='postscript']"/></p>
		
	<xsl:if test="//div1[@type='notes']">
		<hr width="75%" />
		<p class="p11"><b><xsl:apply-templates select="//div1[@type='notes']/head"/></b></p>
		<xsl:for-each select="//div1[@type='notes']/note"><p class="p10"><a><xsl:attribute name="name"><xsl:apply-templates select='@id'/></xsl:attribute><xsl:apply-templates select="seg"/></a><xsl:apply-templates select="p"/></p>
		</xsl:for-each></xsl:if>
	
	<xsl:if test="//div1[@type='bibliography']">
		<hr width="75%" />
		<p class="p11"><b><xsl:apply-templates select="//div1[@type='bibliography']/list/head"/></b></p>
		<xsl:for-each select="//div1[@type='bibliography']/list/item"><p class="p10"><xsl:apply-templates /></p>
		</xsl:for-each></xsl:if>
	
	<!--<hr width="70%" align="center"/>-->
		<!-- <p class="p10"><b>Bibliographic Information : </b>Letter Reproduced from <i><xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title[@type='uniform']"/></i>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/editionStmt/p"/>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/extent"/>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/publisher"/>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/pubPlace"/>, <xsl:value-of select="//teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/date"/>.</p>  -->

</xsl:template>

<xsl:template name="Diary">
	<xsl:if test="//div1[@type='bio']">
		<p class="p10"><b>About <xsl:apply-templates select="//sourceDesc/biblFull/titleStmt/author"></xsl:apply-templates>:<br/></b><xsl:apply-templates select="//div1[@type='bio']/p"/></p>
	</xsl:if>
	<hr width="75%" />
	
	<xsl:if test="//div1[@type='introduction']">
		<p class="p10"><b>Introduction:<br/></b><xsl:apply-templates select="//div1[@type='introduction']/p"/></p>
	</xsl:if>
	<xsl:for-each select="//div1[@type='part']">
		<p class="p11"><b><xsl:value-of select="head"/></b></p>
		<xsl:for-each select="div2"><p class="p11"><b><xsl:value-of select="head"/></b></p>
			<xsl:for-each select="div3"><p class="p11"><b><xsl:value-of select="head"/></b></p><p class="p10"><xsl:apply-templates select="p"/></p><p class="p12"><i><xsl:apply-templates select="q"/></i></p></xsl:for-each></xsl:for-each>
		
	</xsl:for-each>
	
	<xsl:if test="//div1[@type='conclusion']">
		<p class="p10"><b>Conclusion:<br/></b><xsl:apply-templates select="//div1[@type='conclusion']/p"/></p>
	</xsl:if>
	
	<xsl:if test="//div1[@type='notes']">
		<hr width="75%" />
		<p class="p11"><b><xsl:apply-templates select="//div1[@type='notes']/head"/></b></p>
		<xsl:for-each select="//div1[@type='notes']/note"><p class="p10"><a><xsl:attribute name="name"><xsl:apply-templates select='@id'/></xsl:attribute><xsl:apply-templates select="seg"/></a><xsl:apply-templates select="p"/></p>
	</xsl:for-each></xsl:if>
	
</xsl:template>
	
	
	<xsl:template name="EDiary">
		<xsl:if test="//div1[@type='bio']">
			<p class="p10"><b>About <xsl:apply-templates select="//sourceDesc/biblFull/titleStmt/author"></xsl:apply-templates>:<br/></b><xsl:apply-templates select="//div1[@type='bio']/p"/></p>
		</xsl:if>
		<hr width="75%" />
		
		<xsl:if test="//div1[@type='introduction']">
			<p class="p10"><b>Introduction:<br/></b><xsl:apply-templates select="//div1[@type='introduction']/p"/></p>
		</xsl:if>
		<xsl:for-each select="//div1[@type='part']">
			<p class="p11"><b><xsl:value-of select="head"/></b></p>
			<xsl:for-each select="div2"><p class="p11"><b><xsl:value-of select="head"/></b></p><p class="p10"><xsl:apply-templates select="opener/dateline/date"/></p><p class="p10"><xsl:apply-templates select="p"/></p></xsl:for-each>
			
			
		</xsl:for-each>
		
		<xsl:if test="//div1[@type='conclusion']">
			<p class="p10"><b>Conclusion:<br/></b><xsl:apply-templates select="//div1[@type='conclusion']/p"/></p>
		</xsl:if>
		
		<xsl:if test="//div1[@type='notes']">
			<hr width="75%" />
			<p class="p11"><b><xsl:apply-templates select="//div1[@type='notes']/head"/></b></p>
			<xsl:for-each select="//div1[@type='notes']/note"><p class="p10"><a><xsl:attribute name="name"><xsl:apply-templates select='@id'/></xsl:attribute><xsl:apply-templates select="seg"/></a><xsl:apply-templates select="p"/></p>
			</xsl:for-each></xsl:if>
		
	</xsl:template>
	
<xsl:template match="lb">
	<br/>

</xsl:template>
	
	<xsl:template match="ref"> <a><xsl:attribute name="href">#<xsl:apply-templates select='@target'/></xsl:attribute><xsl:apply-templates/></a></xsl:template>
	
	<xsl:template match="figure"><xsl:apply-templates></xsl:apply-templates><br></br><br></br>
		<!--	<xsl:choose><xsl:when test="@rend='block'"><p><xsl:apply-templates></xsl:apply-templates></p></xsl:when>
			<xsl:otherwise>
			<a><xsl:attribute name="href">file:///Volumes/IMAGE3/valley_of_the_shadow/etext/lv14/letters/images/<xsl:apply-templates select='@entity'/>.jpg</xsl:attribute><br></br><br></br><center><img><xsl:attribute name="src">/Volumes/IMAGE3/valley_of_the_shadow/etext/lv14/letters/images/<xsl:value-of select='@entity'/>.gif</xsl:attribute></img></center></a><br/><br/>
			</xsl:otherwise></xsl:choose>-->
	</xsl:template>
	<xsl:template match="hi">
		<xsl:choose>
			<xsl:when test="@rend='underline'">
				<u><xsl:apply-templates/></u>
			</xsl:when>
			<xsl:when test="@rend='italic'">
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
	
	<xsl:template match="//body/div1/p/unclear">
		<i>[unclear: <xsl:apply-templates/>]</i>
		
	</xsl:template>
	
	<xsl:template match="del">
		<xsl:choose>
			<xsl:when test="@rend='none'">
				<i>[illeg.]</i>
			</xsl:when>
			<xsl:otherwise>
		<i>[deleted: <xsl:apply-templates/>]</i></xsl:otherwise></xsl:choose>
		
	</xsl:template>
	
	<xsl:template match="add">
		<i>[added: <xsl:apply-templates/>]</i>
		
	</xsl:template>
	
	
	<xsl:template match="q"><p class="p12"><i><xsl:apply-templates/></i></p></xsl:template>
	
	
	<xsl:template match="orig">
		<xsl:apply-templates select="@reg"/>
	</xsl:template>
	
	<xsl:template match="abbr">
		<xsl:apply-templates select="@expan"/>
	</xsl:template>

	<xsl:template match="//body/div1/div2/div3/p"><p class="p10"><xsl:apply-templates/></p></xsl:template>
	
	<xsl:template match="pb">
		<xsl:choose><xsl:when test="@entity"><br/><br/>[<i>page <xsl:apply-templates select="@n"/></i>]<a><xsl:attribute name="href">../papers/images/<xsl:apply-templates select='@entity'/>.jpg</xsl:attribute><center><img><xsl:attribute name="src">../papers/images/<xsl:value-of select='@entity'/>.gif</xsl:attribute></img></center></a><br/><br/>
		</xsl:when>
			
			<xsl:otherwise><br/><br/>[<i>page <xsl:apply-templates select="@n"/></i>]<br/></xsl:otherwise></xsl:choose>
	</xsl:template>

</xsl:stylesheet>