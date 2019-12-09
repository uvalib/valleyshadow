<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:param name="q"/>
	<xsl:param name="start"/>
	<xsl:param name="rows"/>
	<xsl:param name="TB_iframe"/>

	<xsl:variable name="numFound">
		<xsl:value-of select="//result[@name='response']/@numFound"/>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$numFound &gt; 0">
				<head>
					<style> body { text-align: center; } div#wrapper { margin:5px auto; width:
						700px; text-align: left; } div#husbandInfo { padding: 10px; width: 500px;
						float: left; } div#wifeInfo { padding: 10px; width: 350px; float: left; }
						div#generalInfo { padding: 30px 10px 10px 10px; clear: both; width: 600px; }
						.musterTableHead { background-color:#D3D1AC; font-size:12px; }
						.musterTableBody { background-color:#D3D1BC; font-size:12px; } .rowodd {
						width: 450px; height: 25px; margin: 8px; font-family:verdana, arial;
						font-size: 12px; } .roweven { width: 450px; height: 25px; margin: 8px;
						font-family:verdana, arial; font-size: 12px; } .label { float:left;
						text-align: right; width: 225px; padding: 5px; background-color: #CFCFCF; }
						.content { float:right; text-align:left; width: 200px; padding: 5px; } input
						{ font-family:verdana, arial; font-size: 12px; } option {
						font-family:verdana, arial; font-size: 12px; } </style>
				</head>
				<body>
					<body bgcolor="#FFFFFF" link="#CD7F32" vlink="#00009C">
						<h3>Children of <xsl:value-of select="//doc[1]/str[@name='child_father_first_name']"
								/><xsl:text> </xsl:text><xsl:value-of
									select="//doc[1]/str[@name='child_father_last_name']"/></h3>
						<div style="margin:20px">
							<table border="0" cellspacing="1" cellpadding="1px"
								style="margin-left:auto;margin-right:auto;width:100%;">
								<tr class="musterTableHead">
									<th>Child Name</th>
									<th>Child Age</th>
									<th>Father First Name</th>
									<th>Father Last Name</th>
								</tr>
								<xsl:apply-templates select="//doc"/>
							</table>
						</div>
					</body>

				</body>
			</xsl:when>
			<xsl:otherwise>
				<p>No results found</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="doc">
		<tr class="musterTableBody">
			<td>
				<xsl:value-of select="str[@name='child_name']"/>
			</td>
			<td>
				<xsl:choose>
					<xsl:when test="contains(float[@name='child_age'], '.0')">
						<xsl:value-of select="substring-before(float[@name='child_age'], '.0')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="float[@name='child_age']"/>
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td>
				<xsl:value-of select="str[@name='child_father_first_name']"/>
			</td>
			<td>
				<xsl:value-of select="str[@name='child_father_last_name']"/>
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>
