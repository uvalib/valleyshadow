<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:param name="list"></xsl:param>
    <xsl:param name="area"></xsl:param>
    
    
            
    
    <xsl:variable name="path">http://www.vcdh.virginia.edu:8065/saxon/servlet/SaxonServlet?source=/vcdh/xml_docs/valley_news/topics_new.xml&amp;style=/vcdh/xml_docs/valley_news/topics.xsl&amp;list=</xsl:variable>
    
    <xsl:variable name="edition_path">../../news/</xsl:variable>
    
    <xsl:variable name="paper_path">http://www.vcdh.virginia.edu:8065/saxon/servlet/SaxonServlet?source=/vcdh/xml_docs/valley_news/newspaper_catalog.xml&amp;style=/vcdh/xml_docs/valley_news/news_cat.xsl&amp;level=</xsl:variable>
    
    <xsl:variable name="path_other1">http://www.vcdh.virginia.edu:8065/saxon/servlet/SaxonServlet?source=/vcdh/xml_docs/valley_news/other/</xsl:variable>
    
    <xsl:variable name="path_other2">&amp;xsl=/vcdh/xml_docs/valley_news/other/other.xsl</xsl:variable>
    
    <xsl:variable name="path_jeff">http://jefferson.village.virginia.edu/vcdh/xml_docs/valley_news/</xsl:variable>
    
    <xsl:variable name="path_html">../../VoS/newspapers/</xsl:variable>
    
    <xsl:variable name="path_images">http://valley.vcdh.virginia.edu/newspaper_images/</xsl:variable>
    
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    .title {color: #990000; font-family: times, serif} 
                    .section-head {color: #003366; font-family: times, serif; font-weight: bold}
                    .p5 {left-margin: 5em}
                </style>
            </head>
            <body bgcolor="#ffffff" link="#cd7f32" vlink="#00009c" text="#000000">
        
        <!-- build the navigation table -->
        <table width="100%" cellpadding="20">
            <tr><td align="left" valign="top">
                <table cellpadding="5" width="200">
                    <tr><td bgcolor="#003366">
                        <center>
                            <table width="100%" cellpadding="10">
                                <tr>
                                    <td bgcolor="#ffffff" align="center">
                                         <a>
                                            <xsl:attribute
                                            name="href">../../newspapers</xsl:attribute>Search the<br/>Newspapers</a> 
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#ffffff" align="center">
                                        <a>
                                            <xsl:attribute
                                                name="href"><xsl:value-of select="$path_html"/>opening.html</xsl:attribute>Browse
                                            Newspapers<br/>by Date</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#ffffff" align="center">
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="$path_html"/>topics.html</xsl:attribute>Articles
                                            Indexed<br/>by Topic</a>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td bgcolor="#ffffff" align="center">
                                        <a>
                                            <xsl:attribute name="href">
                                                <xsl:value-of select="$path_html"/>about.html</xsl:attribute>About the<br/>Newspapers</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#ffffff" align="center">
                                        <a href="/VoS/choosepart.html">Valley of the Shadow<br/>Home</a>
                                    </td>
                                </tr>
                            </table>
                        </center>
                    </td></tr>
                </table>
            </td>
                
                <!-- Put in the content to the right of the navigation -->
                <td align="left">
                    <center>
                        <p><img src="/VoS/images/images/vtitle4.gif"/></p>
                        <img src="/VoS/newspapers/newspaper_head.jpg"/>
                        <h2 class="section-head">Articles Indexed by Topic</h2>
                            <h3 class="section head"><xsl:choose>
                                <xsl:when test="//xml[@n=starts-with(@n, 'eve')]">
                                    <xsl:text>The Eve of War: Fall 1859 to Spring 1861</xsl:text></xsl:when>
                                <xsl:when test="//xml[@n=starts-with(@n, 'war')]">
                                    <xsl:text>The War Years: Spring 1861 to Spring 1865</xsl:text></xsl:when>
                                <xsl:otherwise> The Aftermath: Spring 1865 to Fall 1870</xsl:otherwise>
                            </xsl:choose></h3>
                        <center>
                            <h2 class="title">
                                <xsl:choose>
                                    <xsl:when test="$area='au'">
                                        <xsl:text>Augusta County: </xsl:text>
                                    </xsl:when>
                                    <xsl:when test="$area='fr'">
                                        <xsl:text>Franklin County: </xsl:text>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:value-of select="//xml/div1[@id=$list]/head"/>
                            </h2>
                        </center>
                        
                        <p>
                            <xsl:for-each select="//xml/div1[@id=$list]/div2[@n=$area]/div3">
                                <a><xsl:attribute name="href">#<xsl:value-of select="head"/></xsl:attribute><xsl:value-of select="head"/></a>
                                <xsl:if test="position() != last()">
                                    <xsl:text> | </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </p>
                    </center>
                    <p>Note:  When you select an article from the list below you will be taken to the appropriate <b>page</b> of the newspaper.  You may need to scroll down in order to find the particular article you are interested in reading.</p>
                </td></tr>
        </table>
        
        <hr width="80%"/>
        
       <!-- <xsl:choose>
            <xsl:when test="$list='transform'">
                <xsl:call-template name="Transform"/>
            </xsl:when>
            <xsl:when test="$list='full'">
                <xsl:call-template name="Full"/>
            </xsl:when>
            <xsl:otherwise>-->
                <xsl:call-template name="Lists"/> <!--<xsl:call-template name="test" />-->
           <!-- </xsl:otherwise>
        </xsl:choose>-->
    
    
    </body></html>
    
    
    </xsl:template>
    
    
    <xsl:template name="test">
        
        
        
        <xsl:for-each select="//xml/div1[@id=$list]"><p><xsl:apply-templates select="div2[@n=$area]/div3/entry"/></p></xsl:for-each>
    <!--<xsl:for-each select="div2"><xsl:choose>
        <xsl:when test="@n='au'"><p><b>Augusta Papers</b></p></xsl:when>
        <xsl:when test="@n='fr'"><p><b>Franklin Papers</b></p></xsl:when>
    </xsl:choose>
    </xsl:for-each>--></xsl:template>
    
    
    <xsl:template name="Transform">
        <!--<xsl:element name="eveTopics">-->
            <xsl:for-each select="//xml/div1">
                <xsl:copy>
                    <xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
                    <xsl:element name="head"><xsl:value-of select="head"/></xsl:element>
                    <xsl:for-each select="div2">
                        <xsl:copy>
                            <xsl:attribute name="n"><xsl:value-of select="@n"/></xsl:attribute>
                            <xsl:choose>
                                <xsl:when test="div3">
                                    <xsl:for-each select="div3">
                                        <xsl:copy>
                                            <xsl:element name="head">
                                                <xsl:value-of select="head"/>
                                            </xsl:element>
                                            <xsl:for-each select="entry">
                                                <xsl:copy>
                                                    <xsl:for-each select="xref">
                                                        <xsl:copy>
                                                            <xsl:attribute name="link">
                                                                <xsl:call-template name="Paper"/>
                                                                <xsl:text>18</xsl:text>
                                                                <xsl:value-of select="substring(substring-after(., '18'),1,2)"/>
                                                                <xsl:call-template name="MonthDay"/>  
                                                                <xsl:text>#p</xsl:text>
                                                                <xsl:value-of select="substring(substring-after(.,'p. '), 1, 1)"/>
                                                                <!--											<xsl:text>c</xsl:text>
                                                                    <xsl:value-of select="substring(substring-after(.,'c. '), 1, 1)"/> -->
                                                            </xsl:attribute>
                                                            <xsl:value-of select="."/>
                                                        </xsl:copy>
                                                    </xsl:for-each>
                                                    <xsl:value-of select="./text()"/> 
                                                </xsl:copy>
                                            </xsl:for-each>
                                        </xsl:copy>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="entry">
                                        <xsl:copy>
                                            <xsl:for-each select="xref">
                                                <xsl:copy>
                                                    <xsl:attribute name="link">
                                                        <xsl:call-template name="Paper"/>
                                                        <xsl:text>18</xsl:text>
                                                        <xsl:value-of select="substring(substring-after(., '18'),1,2)"/>
                                                        <xsl:call-template name="MonthDay"/>  
                                                        <xsl:text>#p</xsl:text>
                                                        <xsl:value-of select="substring(substring-after(.,'p. '), 1, 1)"/>
                                                        <!--								<xsl:text>c</xsl:text>
                                                            <xsl:value-of select="substring(substring-after(.,'c. '), 1, 1)"/>  -->
                                                    </xsl:attribute>
                                                    <xsl:value-of select="."/>
                                                </xsl:copy>
                                            </xsl:for-each>
                                            <xsl:value-of select="./text()"/> 
                                        </xsl:copy>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:copy>
                    </xsl:for-each>
                </xsl:copy>
            </xsl:for-each>
        <!--</xsl:element>-->
    </xsl:template>
  
  
    <xsl:template name="Paper">
        <xsl:choose>
            <xsl:when test="contains(., 'Vindicator')">
                <xsl:text>va.au.rv.</xsl:text>
            </xsl:when>
            <xsl:when test="contains(., 'Spectator')">
                <xsl:text>va.au.ss.</xsl:text>
            </xsl:when>
            <xsl:when test="contains(., 'Spirit')">
                <xsl:text>pa.fr.vs.</xsl:text>
            </xsl:when>
            <xsl:when test="contains(., 'Franklin')">
                <xsl:text>pa.fr.fr.</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="MonthDay">
        <xsl:choose>
            <xsl:when test="contains(., 'January')">
                <xsl:text>.01.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'January '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'January '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'January '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'February')">
                <xsl:text>.02.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'February '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'February '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'February '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'March')">
                <xsl:text>.03.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'March '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'March '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'March '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'April')">
                <xsl:text>.04.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'April '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'April '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'April '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'May')">
                <xsl:text>.05.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'May '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'May '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'May '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'June')">
                <xsl:text>.06.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'June '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'June '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'June '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'July')">
                <xsl:text>.07.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'July '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'July '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'July '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'August')">
                <xsl:text>.08.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'August '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'August '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'August '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'September')">
                <xsl:text>.09.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'September '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'September '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'September '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'October')">
                <xsl:text>.10.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'October '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'October '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'October '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'November')">
                <xsl:text>.11.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'November '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'November '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'November '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains(., 'December')">
                <xsl:text>.12.</xsl:text>
                <xsl:choose>
                    <xsl:when test="substring(substring(substring-after(.,'December '),1,3),2,1)=','">
                        <xsl:text>0</xsl:text>
                        <xsl:value-of select="substring(substring-after(.,'December '),1,2)"/>
                        
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring(substring-after(.,'December '),1,3)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when> 
        </xsl:choose>  
    </xsl:template>  
    
    <xsl:template name="Full">
        <table cellpadding="5">
            <tr>
                <td></td>
                <td align="center">Augusta</td>
                <td align="center">Franklin</td>
            </tr>
            <xsl:for-each select="div1">
                <tr>
                    <td>
                        <a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute></a>
                        <xsl:value-of select="head"/>
                    </td>
                    <xsl:for-each select="div2">
                        <td align="center"><a><xsl:attribute name="href"><xsl:value-of select="$path"/><xsl:value-of select="../@id"/>&amp;area=<xsl:value-of select="@n"/></xsl:attribute><img src="../red.gif"><xsl:attribute name="alt"><xsl:value-of select="@n"/><xsl:value-of select="../head"/></xsl:attribute></img></a></td>
                    </xsl:for-each>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
    
    <xsl:template name="Lists">
        <xsl:for-each select="//xml/div1[@id=$list]">
            <xsl:for-each select="div2[@n=$area]">
                <xsl:choose>
                    <xsl:when test="div3">
                        <xsl:for-each select="div3">
                            <a><xsl:attribute name="name"><xsl:value-of select="head"/></xsl:attribute></a>
                            <h3><xsl:value-of select="head"/></h3>
                            <xsl:for-each select="entry">
                                <p>
                                    <xsl:apply-templates/>
                                </p>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:for-each select="entry">
                            <p>
                                <xsl:apply-templates/>
                            </p>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>	
    </xsl:template>
    
    <xsl:template match="xref">
        <a><xsl:attribute name="href"><xsl:value-of select="$edition_path"/><xsl:value-of select="substring(@link,7,2)"/><xsl:value-of select="substring(@link,10,4)"/><xsl:text>/</xsl:text><xsl:value-of select="substring(@link,1,19)"/><xsl:text>.xml</xsl:text><xsl:value-of select="substring(@link,21,3)"/></xsl:attribute><xsl:value-of select="."/></a><br/>
    </xsl:template>
  
  <!--<xsl:template match="//xml/div1/div2/entry"><xsl:apply-templates /><br></br><br></br></xsl:template>-->
  
</xsl:stylesheet>
