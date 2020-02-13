<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html"
        indent="yes"
        encoding="iso-8859-1"
        media-type="text/html"
        doctype-public="-//W3C//DTD HTML 4.0//EN"/>

    <xsl:template match="/">
        <html>
            <head>
                <style>
                    .title {color: #990000; font-family: times, serif} 
                    .p10 {margin-left: 3em; margin-right: 3em; }
                    .p11 {text-align: center; margin-left: 3em; margin-right: 3em; }
                    h3 {text-align: center; }
                    
                    div#mainResults {
                    width: 65%;
                    text-align:left;
                    }
                </style>
     	  		<link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />
             
            </head>
            <body bgcolor="#ffffff" link="#cd7f32" vlink="#00009c" text="#000000">
                <center>
                    
                    <img src="/VoS/images/images/vtitle4.gif" border="0" /></center>
                    
                    <br />
                    <br />
                <h3>Bibliographic Information<br/><xsl:value-of select="TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/></h3>
                    <br /><center>
                        <a><xsl:attribute name="href">../papers/<xsl:apply-templates select='TEI.2/@id'/></xsl:attribute><b>Return to Document</b></a> | <a href="../VoS/personalpapers/browse/index.html"><b>Return to Browse</b></a> | <a href="../VoS/personalpapers/search/intro.html"><b>Return to Search</b></a></center>
                    <hr></hr>
                    <h4>About the Electronic Version:</h4>
                    <p><i><xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/title[@type='main']"/></i><br/>
                        <xsl:value-of select="TEI.2/teiHeader/fileDesc/titleStmt/author"/></p>
                 <p><xsl:apply-templates select="TEI.2/teiHeader/fileDesc/titleStmt/respStmt"></xsl:apply-templates></p>  
                 <!--<p><xsl:apply-templates select="TEI.2/teiHeader/fileDesc/titleStmt/respStmt/name"></xsl:apply-templates></p>-->
                 
                <p>Text ID number: <xsl:value-of select="TEI.2/teiHeader/fileDesc/publicationStmt/idno"/></p>
                <p>Size: <xsl:value-of select="TEI.2/teiHeader/fileDesc/extent"/></p>  
                <p>Created: <xsl:value-of select="TEI.2/teiHeader/fileDesc/publicationStmt/date"/></p>
                <xsl:call-template name="avail"></xsl:call-template>
                <xsl:if test="TEI.2/teiHeader/fileDesc/notesStmt/note/p"><p>Note: <xsl:value-of select="TEI.2/teiHeader/fileDesc/notesStmt/note/p"></xsl:value-of></p></xsl:if>
                
                <p><i>Revisions to the electronic version: </i>  <xsl:for-each select="TEI.2/teiHeader/revisionDesc/change"><xsl:value-of select="date"></xsl:value-of>:  <xsl:value-of select="respStmt/name"></xsl:value-of>,
                    <br/><xsl:value-of select="item"></xsl:value-of><br/></xsl:for-each></p>
                
                <hr></hr>
                <h4>About the Print Version:</h4>
                <p><i><xsl:value-of select="TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/title"/></i><br/>
                    <xsl:value-of select="TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/titleStmt/author"/></p>
                <p><xsl:value-of select="TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/publicationStmt/idno"/></p>
                <p><xsl:value-of select="TEI.2/teiHeader/fileDesc/sourceDesc/biblFull/seriesStmt/p"/></p>
                <p><xsl:value-of select="TEI.2/teiHeader/encodingDesc/projectDesc/p"/></p>
                <p><b>Originally Created: </b><xsl:if test="TEI.2/teiHeader/profileDesc/creation/dateRange"> <xsl:apply-templates select="TEI.2/teiHeader/profileDesc/creation/dateRange" /></xsl:if>
                    <xsl:apply-templates select="TEI.2/teiHeader/profileDesc/creation/date" /></p>
                
                
                <br/><hr></hr><center>
                    <a href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" alt="Return to Full Valley Archive"/></a>
                    
                </center>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="TEI.2/teiHeader/fileDesc/titleStmt/respStmt/name"><xsl:apply-templates /><br/></xsl:template>
    <xsl:template name="avail"><p><xsl:apply-templates select="TEI.2/teiHeader/fileDesc/publicationStmt/availability"/></p></xsl:template>
    <xsl:template match="TEI.2/teiHeader/fileDesc/publicationStmt/availability/p"><p><xsl:apply-templates></xsl:apply-templates></p></xsl:template>
    <xsl:template match="resp"><xsl:apply-templates/><br/> </xsl:template>
    <xsl:template name="name"> <i><xsl:value-of select="//respStmt/name"/></i></xsl:template>
</xsl:stylesheet>
