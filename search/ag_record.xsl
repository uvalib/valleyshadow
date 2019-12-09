<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="start"/>
	<xsl:param name="rows"/>
	<xsl:param name="current-URL"/>

	<xsl:param name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'agr_aug')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'agr_fr')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>

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
					<center><xsl:value-of select="$county"/> - <xsl:value-of select="$year"/>
						Agricultural Census </center>
				</h1>
				<br/>
				<p><b>Please cite results as coming from:</b>
					<xsl:value-of select="$county"/> County, <xsl:choose>
						<xsl:when test="$county = 'Augusta'">
							<xsl:text>Virginia</xsl:text>
						</xsl:when>
						<xsl:when test="$county = 'Franklin'">
							<xsl:text>Pennsylvania</xsl:text>
						</xsl:when>
					</xsl:choose>, <xsl:value-of select="$year"/> Agricultural Census, Valley of the
					Shadow: Two Communities in the American Civil War, Virginia Center for Digital
					History, University of Virginia
					(<xsl:value-of select="$current-URL"/>).</p>
				<table border="0" cellpadding="10">
					<tr>
						<td bgcolor="#ffcc99" valign="top">
							<b>Personal Information</b>
						</td>
						<td bgcolor="#ffcc99" valign="top">
							<b>Farm Land Information</b>
						</td>
					</tr>
					<tr>
						<td align="left" valign="top">
							<b>Name:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="str[@name='first']"/>
							<xsl:if test="string(str[@name='middle'])">
								<xsl:text> </xsl:text>
								<xsl:value-of select="str[@name='middle']"/>
							</xsl:if>
							<xsl:text> </xsl:text>
							<xsl:value-of select="str[@name='last']"/>
							<br/>
							<b>Location:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="str[@name='location']"/>
						</td>

						<td align="left" valign="top">
							<b>Total Acres Improved:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='tot_impr']"/>
							<br/>
							<b>Total Acres Wood/Other: </b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='woodland']"/>
							<br/>
							<b>Total Land:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='tot_land']"/>
							<br/>
							<b>Value of Farm:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='farm_val']"/>
						</td>
					</tr>
					<tr>
						<td bgcolor="#ffcc99" valign="top">
							<b>Farm Animals Information</b>
						</td>
						<td bgcolor="#ffcc99" valign="top">
							<b>Farm Crop Information</b>
						</td>
					</tr>

					<tr>
						<td align="left" valign="top">
							<b>Horses:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='horses']"/>
							<br/>
							<b>Mules:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='mules']"/>
							<br/>
							<b>Cows:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='cows']"/>
							<br/>
							<b>Oxen:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='oxen']"/>
							<br/>
							<b>Other Cattle:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='other_cattle']"/>
							<br/>
							<b>Sheep:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='sheep']"/>
							<br/>
							<b>Swine:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='swine']"/>
							<br/>
							<b>Animals Slaughtered:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='slaut_animals']"/>
							<br/>
							<b>Total Value of Livestock:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='tot_livestock']"/>
							<br/>
							<b>Total Number of Animals:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='tot_animals']"/>
						</td>
						<td align="left" valign="top">
							<b>Wheat in Bushels:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='wheat']"/>
							<br/>
							<b>Rye:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='rye']"/>
							<br/>
							<b>Corn:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='corn']"/>
							<br/>
							<b>Oats:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='oats']"/>
							<br/>
							<b>Total Grain Production:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='tot_grain']"/>
							<br/>
							<b>Pounds of Tobacco:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='tobacco']"/>
							<br/>
							<b>Irish Potatos in Bushels:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='ir_potatoes']"/>
							<br/>
							<b>Sweet Potatos in Bushels:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='sw_potatoes']"/>
						</td>
					</tr>

					<tr>
						<td bgcolor="#ffcc99" valign="top">
							<b>Other Farm Production</b>
						</td>
						<td bgcolor="#ffcc99" valign="top">
							<b>Census Record Information</b>
						</td>
					</tr>
					<tr>
						<td align="left" valign="top">
							<b>Farming Implements:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='farm_impl']"/>
							<br/>
							<b>Pounds of Wool:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='wool']"/>
							<br/>
							<b>Orchard:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='orchard']"/>
							<br/>
							<b>Butter:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='butter']"/>
							<br/>
							<b>Cheese:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='cheese']"/>
							<br/>
							<b>Hay:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='hay']"/>
							<br/>
							<b>Home Manufacturing:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='home_manu']"/>
						</td>
						<td align="left" valign="top">
							<b>Page Number:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='page_num']"/>
							<br/>
							<b>Number on Page:</b>
							<xsl:text> </xsl:text>
							<xsl:value-of select="int[@name='num_on_page']"/>
						</td>
					</tr>
				</table>
				<p><a href="javascript:history.go(-1)">go back to search results page</a><br/>
					<a href="ag_census">New Search</a>
				</p>
			</body>
		</html>
	</xsl:template>

</xsl:stylesheet>
