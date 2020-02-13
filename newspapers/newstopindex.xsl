<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:param name="list"></xsl:param>
    <xsl:param name="area"></xsl:param>

    
            
    


    <xsl:variable name="path_html">../VoS/newspapers/</xsl:variable>
    
    <xsl:variable name="edition_path">http://www.vcdh.virginia.edu:8065/saxon/servlet/SaxonServlet?source=/vcdh/xml_docs/valley_news/newspaper_catalog.xml&amp;style=/vcdh/xml_docs/valley_news/news_cat.xsl&amp;level=edition&amp;paper=</xsl:variable>
    
    <xsl:variable name="paper_path">http://www.vcdh.virginia.edu:8065/saxon/servlet/SaxonServlet?source=/vcdh/xml_docs/valley_news/newspaper_catalog.xml&amp;style=/vcdh/xml_docs/valley_news/news_cat.xsl&amp;level=</xsl:variable>
    
    <xsl:variable name="path_other1">http://www.vcdh.virginia.edu:8065/saxon/servlet/SaxonServlet?source=/vcdh/xml_docs/valley_news/other/</xsl:variable>
    
    <xsl:variable name="path_other2">&amp;xsl=/vcdh/xml_docs/valley_news/other/other.xsl</xsl:variable>
    
    <xsl:variable name="path_jeff">http://jefferson.village.virginia.edu/vcdh/xml_docs/valley_news/</xsl:variable>
    
    <xsl:variable name="path">../news-topicitem/</xsl:variable>
    
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
                                            name="href">../newspapers</xsl:attribute> Search the<br/>Newspapers</a>
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
                        <center>
                            <h2 class="title">
                                <xsl:choose>
                                    <xsl:when test="//xml[@n=starts-with(@n, 'eve')]">
                                        <xsl:text>The Eve of War: Fall 1859 to Spring 1861</xsl:text></xsl:when>
                                    <xsl:when test="//xml[@n=starts-with(@n, 'war')]">
                                        <xsl:text>The War Years: Spring 1861 to Spring 1865</xsl:text></xsl:when>
                                    <xsl:otherwise> The Aftermath: Spring 1865 to Fall 1870</xsl:otherwise>
                                </xsl:choose>
                                
                            </h2>
                        </center>
                        
                        <p>
                            <xsl:for-each select="div1[@id=$list]/div2[@n=$area]/div3">
                                <a><xsl:attribute name="href">#<xsl:value-of select="head"/></xsl:attribute><xsl:value-of select="head"/></a>
                                <xsl:if test="position() != last()">
                                    <xsl:text> | </xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </p>
                    </center>
                    
                </td></tr>
        </table>
        
                <hr width="80%"/>
                <table cellpadding="5">
                    <tr>
                        <td></td>
                        <td align="center">Augusta</td>
                        <td align="center">Franklin</td>
                    </tr>
                    <xsl:for-each select="//div1">
                        <tr>
                            <td>
                                <a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute></a>
                                <xsl:value-of select="head"/>
                            </td>
                            <xsl:for-each select="div2">
                                <td align="center"><a><xsl:attribute name="href"><xsl:value-of select="$path"/><xsl:value-of select="substring-before(//xml/@n, 'Topics')"/>/?list=<xsl:value-of select="../@id"/>&amp;area=<xsl:value-of select="@n"/></xsl:attribute><img src="../news/red.gif"><xsl:attribute name="alt"><xsl:value-of select="@n"/><xsl:value-of select="../head"/></xsl:attribute></img></a></td>
                            </xsl:for-each>
                        </tr>
                    </xsl:for-each>
                </table>
            
            </body>
        </html>
</xsl:template>
</xsl:stylesheet>
