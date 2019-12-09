<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start"/>
	<xsl:param name="rows"/>
	<xsl:param name="current-URL"/>

	<xsl:param name="db">
		<xsl:value-of select="substring-after(substring-before($q, ' AND'), 'db:')"/>
	</xsl:param>

	<xsl:param name="year">
		<xsl:choose>
			<xsl:when test="contains($db, '60')">
				<xsl:text>1860</xsl:text>
			</xsl:when>
			<xsl:when test="contains($db, '70')">
				<xsl:text>1870</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>

	<xsl:template match="/">
		<xsl:apply-templates select="//doc"/>
	</xsl:template>

	<xsl:template match="doc">
		<html>
			<head>
				<title>Valley of the Shadow: Census Search Results</title>
				<style> body { padding:1em; }
					.red-head {color: #990000; font-family: times, serif; font-weight: bold }
					.warning {font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} 
					table.record { padding:2em; width: auto; border:none; } 
					table.record * td { padding: 5px; } 
					table.record * th { background: #ffcc99; vertical-align: top; padding: 10px;}
					td.left { text-align: right; }
					td.right { text-align: left; }
					td.race { color: #990000; }
					td.gender { color: #000099;} 
				</style>
			</head>
			<body bgcolor="#FFFFFF" link="#CD7F32" vlink="#00009C">
				<center>
					<img src="VoS/redesign/images/vtitle4.gif"/>
				</center>
				<h1 class="red-head">
					<center>Augusta County, Virginia, 1860 Slaveowners Census Census </center>
				</h1>
				<br/>
				<p><b>Please cite results as coming from:</b> Augusta County, Virginia, 1860
					Slaveowners Census Census, Valley of the Shadow: Two Communities in the American
					Civil War, Virginia Center for Digital History, University of Virginia
						(<xsl:value-of select="$current-URL"/>).</p>
				<table border="0" class="record">
					<tr>
						<th colspan="4">
							<b>Slaveowner Information</b>
						</th>
					</tr>
					<tr>
						<td colspan="2" class="left">
							<b>Slaveowner Name:</b>
						</td>
						<td colspan="2" class="right">
							<xsl:value-of select="str[@name='first']"/>
							<xsl:if test="string(str[@name='middle'])">
								<xsl:text> </xsl:text>
								<xsl:value-of select="str[@name='middle']"/>
							</xsl:if>
							<xsl:text> </xsl:text>
							<xsl:value-of select="str[@name='last']"/>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="left">
							<b>Location:</b>
						</td>
						<td>
							<xsl:value-of select="str[@name='location']"/>
						</td>
					</tr>
					<tr>
						<th colspan="4">
							<b>Employer Information</b>
						</th>
					</tr>
					<tr>
						<td colspan="2" class="left">
							<b>Employer Name:</b>
						</td>
						<td colspan="2" class="right">
							<xsl:value-of select="str[@name='emp_name']"/>
							</td></tr><tr><td colspan="2" class="left">
							<b>Employer Location:</b>
							</td><td colspan="2" class="right">
							<xsl:value-of select="str[@name='emp_location']"/>
						</td>
					</tr>
					<tr/>
					<tr>
						<th colspan="4">
							<b>Slave Holdings</b>
						</th>
					</tr>
					<tr>
						<td colspan="1" class="left race">
							<b>Black Slaves:</b>
						</td><td colspan="1" class="right">
							<xsl:value-of select="int[@name='black_slaves']"/>
						</td>
						<td colspan="1" class="left gender">
							<b>Male Slaves: </b>
						</td><td colspan="1" class="right">
							<xsl:value-of select="int[@name='male_slaves']"/>
						</td>
					</tr>
					<tr>
						<td colspan="1" class="left race">
							<b>Mulatto Slaves:</b>
						</td><td colspan="1" class="right">
							<xsl:value-of select="int[@name='mulatto_slaves']"/>
						</td>
						<td colspan="1" class="left gender">
							<b>Female Slaves:</b>
						</td><td colspan="1" class="right">
							<xsl:value-of select="int[@name='female_slaves']"/>
						</td>
					</tr>
					<xsl:if test="int[@name='total_slaves']">
						<tr>
							<td colspan="1" class="left">
								<b>Total Slaves:</b>
							</td><td colspan="1" class="right">
								<xsl:value-of select="int[@name='total_slaves']"/>
							</td>
							<td colspan="2"> </td>
						</tr>
					</xsl:if>
				</table>
				<p><a href="javascript:history.go(-1)">go back to search results page</a><br/>
					<a href="slave_census">New Search</a>
				</p>
				<hr width="80%"/>
				<center>
					<a href="VoS/choosepart.html">
						<img src="VoS/graphics/full7.gif" border="0"
							alt=""/>
					</a>
				</center>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
