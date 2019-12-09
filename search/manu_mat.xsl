<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="//doc">
				<xsl:apply-templates select="//doc"/>
			</xsl:when>
			<xsl:otherwise>
				<tr><td colspan="3" style="text-align: center;">no data available.</td></tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="doc">
		<tr>
			<td>
				<xsl:value-of select="str[@name='kinds_mat']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='qty_mat']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='val_mat']"/>
			</td>
		</tr>
	</xsl:template>
	
</xsl:stylesheet>
