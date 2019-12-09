<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output byte-order-mark="no" encoding="UTF-8" media-type="text/xml" xml:space="default" indent="yes"/>

	<xsl:template match="hwp">
		<xsl:variable name="region">
			<xsl:value-of select="substring(parent::div4/parent::div3/parent::div2/parent::div1/@area, 1, 2)"></xsl:value-of>
		</xsl:variable>
		<xsl:variable name="state">
			<xsl:choose>
				<xsl:when test="$region='au'">
					<xsl:text>va</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>pa</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="filename"><xsl:value-of select="$state"/>.<xsl:value-of select="$region"/>.<xsl:value-of select="parent::div4/parent::div3/parent::div2/parent::div1/@n"
				/>.<xsl:value-of select="parent::div4/parent::div3/parent::div2/@n"/>.<xsl:value-of
				select="parent::div4/parent::div3/@n"/>.<xsl:value-of select="parent::div4/@n"/>.pdf</xsl:variable>
		<xsl:element name="hwp">
			<xsl:attribute name="type" select="current()/@type"/>
			<xsl:attribute name="id"><xsl:value-of select="$filename"/></xsl:attribute>
		</xsl:element>
	</xsl:template>

	<xsl:template match="newspaper|div1|div2|div3|div4|head">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@*">
		<xsl:copy/>
	</xsl:template>

</xsl:stylesheet>
