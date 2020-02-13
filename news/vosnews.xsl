<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="/">
		<xsl:variable name="paper_id">
			<xsl:choose>
				<xsl:when test="/hwp/@id">
					<xsl:value-of select="/hwp/@id"/>
				</xsl:when>
				<xsl:otherwise>
					[no id found in root element]
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="title">
			<xsl:choose>
				<xsl:when test="not(//hwp/header/title/text())">
					[Newspaper Title]
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//hwp/header/title"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="year">
			<xsl:choose>
				<xsl:when test="not(//hwp/header/date/year/text()) and /hwp/@id">
					<xsl:value-of select="substring($paper_id, 17, 4)"/>
				</xsl:when>
				<xsl:when test="not(//hwp/header/date/year)">
					[Year not found]
				</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="//hwp/header/date/year/text()"/>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="month">
			<xsl:choose>
			<xsl:when test="not(//hwp/header/date/month/text()) and //hwp/header/date/month/@norm">
				<xsl:value-of select="//hwp/header/date/month/@norm"/>
			</xsl:when>
			<xsl:when test="not(//hwp/header/date/month/text()) and not(//hwp/header/date/month/@norm)">
				<xsl:value-of select="substring($paper_id, 22, 2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="//hwp/header/date/month"/>
			</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>
		<xsl:variable name="day">
			<xsl:choose>
				<xsl:when test="not(//hwp/header/date/day/text()) and //hwp/header/date/day/@norm">
					<xsl:value-of select="//hwp/header/date/day/@norm"/>
				</xsl:when>
				<xsl:when test="not(//hwp/header/date/day) and not(//hwp/header/date/day/@norm)">
					<xsl:value-of select="substring($paper_id, 25, 2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="//hwp/header/date/day"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
    <html>
        <head><style>
            .title {color: #990000; font-family: times, serif} 
            .section-head {color: #003366; font-family: times, serif; font-weight: bold}
            .p5 {left-margin: 5em}
        </style>
        	<title>Valley of the Shadow: Civil War-Era Newspapers</title>
		    <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
    	    <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
        	
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
                                                    <a href="../../newspapers">Search the<br/>Newspapers</a>
                                                        
                                                </td>
                                            </tr>
                                            <tr>
                                                
                                                <td bgcolor="#ffffff" align="center"><a href="/VoS/newspapers/opening.html">Browse
                                                    Newspapers<br/>by Date</a></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#ffffff" align="center"><a href="/VoS/newspapers/topics.html">Articles
                                                    Indexed<br/>by Topic</a></td>
                                            </tr>
                                            
                                            <tr>
                                                <td bgcolor="#ffffff" align="center"><a href="/VoS/newspapers/about.html">About the<br/>Newspapers</a></td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#ffffff" align="center"><a href="/VoS/choosepart.html">Valley of the Shadow<br/>Home</a></td>
                                            </tr>
                                            
                                        </table>
                                    </center>
                                </td>
                            </tr>
                        </table>
                    
                    
                    
                    </td>
                    <td align="left">
                        <center>
                            <p><img src="/VoS/images/images/vtitle4.gif"/></p><img src="/VoS/newspapers/newspaper_head.jpg"/></center>
                        
                        <center>
                            <h2 class="section-head">
                                <xsl:value-of select="$title"/>: <xsl:value-of select="$month"/><xsl:text> </xsl:text><xsl:value-of select="$day"/>, <xsl:value-of select="$year"/>
                            </h2><b>Go To Page : </b>
                            
                            
                            <xsl:for-each select="//hwp/paperBody/page">
                            <a><xsl:attribute name="href">#<xsl:value-of select="@n"/></xsl:attribute><xsl:value-of select="substring(@n,2,1)"/></a> <xsl:text> | </xsl:text> </xsl:for-each>
                            
                            </center>
                        
                    </td>
                </tr>
            </table>
            
            <hr width="80%"/>
            <xsl:for-each select="//hwp/paperBody/page"><a><xsl:attribute name="name"><xsl:value-of select="@n"/></xsl:attribute></a><table cellspacing="5">
                <tr bgcolor="#dddddd">
                    <td width="100" align="center"><p class="title"><b>-Page <xsl:apply-templates select="@n"/>-</b></p></td>
                        <xsl:if test="boolean(pageNote/text())">
                         <td>   <p>
                                <font class="section-head">
                                    <xsl:text>Description of Page: </xsl:text>
                                </font>
                                <xsl:value-of select="pageNote"/>
                            </p></td>
                        </xsl:if>
                      
                    </tr></table>
                <blockquote><xsl:for-each select="div">
                    <xsl:choose>
                        <xsl:when test="boolean(head/text())">
                            <b>
                                <xsl:value-of select="head"/>
                            </b>
                            <br/>
                            <xsl:text> (Column </xsl:text>
                            <xsl:value-of select="column"/>
                            <xsl:text>)</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <b>
                                <xsl:text>[No Title]</xsl:text>
                            </b>
                            <br/>
                            <xsl:text> (Column </xsl:text>
                            <xsl:value-of select="column"/>
                            <xsl:text>)</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:if test="boolean(summary/text())">
                        <blockquote>
                            <font class="section-head">
                                <xsl:text>Summary: </xsl:text>
                            </font>
                            <xsl:value-of select="summary"/>
                            <br/>
                            <xsl:if test="boolean(names/name)">
                                <xsl:text>(Names in announcement: </xsl:text>
                                <xsl:for-each select="names/name">
                                    <xsl:apply-templates select="pf"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="fn"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:apply-templates select="ln"/>
                                    <xsl:text></xsl:text>
                                    <xsl:apply-templates select="sf"/>
                                    <xsl:if test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:text>)</xsl:text>
                            </xsl:if>
                        </blockquote>
                    </xsl:if>
                    <xsl:if test="boolean(origin/text())">
                        <blockquote>
                            <font class="section-head">
                                <xsl:text>Origin of Article: </xsl:text>
                            </font>
                            <xsl:value-of select="origin"/>
                        </blockquote>
                    </xsl:if>
                    <xsl:if test="boolean(commentary/text())">
                        <blockquote>
                            <font class="section-head">
                                <xsl:text>Editorial Comment: </xsl:text>
                            </font>
                            <xsl:value-of select="commentary"/>
                            <br/>
                        </blockquote>
                    </xsl:if>
                    <xsl:if test="boolean(transcript/p/text())">
                        <blockquote>
                            <font class="section-head">
                                <xsl:text>Full Text of Article: </xsl:text>
                            </font>
                            <xsl:apply-templates select="transcript"/>
                            <br/>
                        </blockquote>
                    </xsl:if>
                    <xsl:if test="boolean(trailer/text())">
                        <blockquote>
                            <font class="section-head">
                                <xsl:text>Trailer: </xsl:text>
                            </font>
                            <xsl:value-of select="trailer"/>
                            <br/>
                        </blockquote>
                    </xsl:if>
                    
                </xsl:for-each></blockquote>
            </xsl:for-each>
            
            
        </body>
    </html>
    
</xsl:template>

<xsl:template match="//transcript/p">
<p><xsl:apply-templates/></p>
</xsl:template>


<xsl:template match="//lb">
<br/>
</xsl:template>

</xsl:stylesheet>
