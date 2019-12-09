<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:variable name="path">../news/</xsl:variable>
    <xsl:param name="paper"/>
    <xsl:variable name="pname">
        <xsl:value-of select="$paper"/>
    </xsl:variable>
    <xsl:template match="/">
        
        
        
        <html>
            <head><style>
                .title {color: #990000; font-family: times, serif} 
                .section-head {color: #003366; font-family: times, serif; font-weight: bold}
                .p5 {left-margin: 5em}
            </style></head>
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
                                                    
                                                    <td bgcolor="#ffffff" align="center"><a href="../VoS/newspapers/opening.html">Browse
                                                        Newspapers<br/>by Date</a></td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#ffffff" align="center"><a href="../VoS/newspapers/topics.html">Articles
                                                        Indexed<br/>by Topic</a></td>
                                                </tr>
                                                
                                                <tr>
                                                    <td bgcolor="#ffffff" align="center"><a href="../VoS/newspapers/about.html">About the<br/>Newspapers</a></td>
                                                </tr>
                                                <tr>
                                                    <td bgcolor="#ffffff" align="center"><a href="../VoS/choosepart.html">Valley of the Shadow<br/>Home</a></td>
                                                </tr>
                                                
                                            </table>
                                        </center>
                                    </td>
                                </tr>
                            </table>
                            
                            
                            
                        </td>
                        <td align="left">
                            <center>
                                <p><img src="../VoS/redesign/images/vtitle4.gif"/></p><img src="../VoS/newspapers/newspaper_head.jpg"/></center>
                          
                              
                          
                            
                            <center>
                                <h2 class="section-head">
                                    <xsl:value-of select="//newspaper/div1[@n=$pname]/head"/> </h2><b>Go To Year : </b>
                                
                                
                                <xsl:for-each select="//newspaper/div1[@n=$pname]/div2">
                                    <a><xsl:attribute name="href">#<xsl:value-of select="@n"/></xsl:attribute><xsl:value-of select="@n"/></a> <xsl:text> | </xsl:text> <xsl:if test="position()!=last()">
                                        <xsl:text>  </xsl:text>
                                    </xsl:if></xsl:for-each>
                                
                            </center>
                        </td>
                    </tr>
                </table>
                
                
                <hr width="80%"/>
                <center>
                <h1 class="title">
                    <xsl:value-of select="//newspaper/div1[@n=$pname]/head"/> </h1>
                
                    <xsl:for-each select="//newspaper/div1[@n=$pname]/div2">
                        <a>
                            <xsl:attribute name="name">
                                <xsl:value-of select="@n"/>
                            </xsl:attribute>
                        </a>
                        <center>
                            <table cellspacing="5">
                                <tr bgcolor="#dddddd">
                                    <td width="75" align="center">
                                        <b class="title">
                                            <xsl:value-of select="@n"/>
                                        </b>
                                    </td>
                                </tr>
                                <xsl:for-each select="div3">
                                    <tr>
                                        <td align="right">
                                            <b class="section-head">
                                                <xsl:value-of select="head"/>
                                            </b>
                                        </td>
                                        <xsl:for-each select="div4">
                                            <td width="40" align="right">
                                                <xsl:variable name="tens" select="@n mod 100"/>
                                                <xsl:variable name="ones" select="@n mod 10"/>
                                                <a>
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="$path"/><!--edition&amp;paper=<xsl:value-of
                                                            select="../../../@n"/>&amp;year=<xsl:value-of
                                                                select="../../@n"/>&amp;month=<xsl:value-of
                                                                    select="../@n"/>&amp;day=<xsl:value-of
                                                                        select="@n"/>&amp;edition=--><xsl:value-of select="hwp/@id"/>
                                                    </xsl:attribute>
						    <xsl:choose>
							<xsl:when test="starts-with(head, '0')">
								<xsl:value-of select="substring-after(head, '0')"/>
							</xsl:when>
							<xsl:otherwise><xsl:value-of select="head"/></xsl:otherwise>
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
                        </center>
                    </xsl:for-each>
                    <hr align="center" width="80%" /><a href="../VoS/choosepart.html"><img src="../VoS/graphics/full7.gif" alt="Return to Full Valley Archive"/></a>
                </center>
                
            </body></html>
            
            
            
    </xsl:template>
</xsl:stylesheet>
