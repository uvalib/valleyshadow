<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

	<xsl:param name="q"/>
	<xsl:param name="rows" select="50"/>
	<xsl:param name="start" select="0"/>
	<xsl:param name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'dossiers_augusta')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'dossiers_franklin')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="countyCode">
		<xsl:choose>
			<xsl:when test="contains($q, 'dossiers_augusta')">
				<xsl:text>aug</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'dossiers_franklin')">
				<xsl:text>fr</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="censusDb">
		<xsl:choose>
			<xsl:when test="contains($q, 'dossiers_augusta')">
				<xsl:text>pop_aug_60</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'dossiers_franklin')">
				<xsl:text>pop_fr_60</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:param>
	<xsl:param name="current-URL"/>

	<xsl:template match="/">
		<html>
			<head>
				<style type="text/css"> table#dossier * td { color: #990000; } table#dossier tr.data td { color: #000000;  } table#dossier tr.data td p.item { border: none; padding:5px 0 5px 0; margin:0} </style>
				<title>
					<xsl:text>Record for </xsl:text>
					<xsl:value-of select="normalize-space(//str[@name='first'])"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="normalize-space(//str[@name='last'])"/>
				</title>
			</head>
			<body link="#cd7f32" bgcolor="#ffffff" vlink="#00009c">
				<h1>
					<font color="#990000">
						<center>Soldiers Records</center>
					</font>
				</h1>
				<h3>
					<font color="#990000">
						<center>From Compiled Military Service Records at National Archives</center>
					</font>
				</h3>
				<p>Results printed below are the short version of the results of your search. Columns in bold denote columns searched on (beyond the basic returns of Name, service information, and enlistment information. Clicking on the
					last name of each person will allow you to see a full record for that individual</p>
				<p><b>Please cite results as coming from: </b>
					<xsl:value-of select="$county"/> County, <xsl:choose>
						<xsl:when test="$county = 'Augusta'">
							<xsl:text>Virginia</xsl:text>
						</xsl:when>
						<xsl:when test="$county = 'Franklin'">
							<xsl:text>Pennsylvania</xsl:text>
						</xsl:when>
					</xsl:choose>, Soldiers Records, Valley of the Shadow: Two Communities in the American Civil War, Virginia Center for Digital History, University of Virginia (<xsl:value-of select="$current-URL"/>).</p>
				<div class="navigationHeader" style="padding-bottom:1em;">
					<a href="javascript:history.back()" onClick="javascript:history.back()">
						<b>Return to Search Results</b>
					</a>
					<br/>
				</div>
				<table id="dossier" border="0" cellpadding="10">
					<tr class="heading">
						<td bgcolor="#ffcc99" valign="top">
							<b>Personal Information</b>
						</td>
						<td bgcolor="#ffcc99" valign="top">
							<b>Enlistment Records</b>
						</td>
					</tr>

					<tr class="data">
						<td align="left" valign="top">
							<p class="item">
								<b>Name:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='first']"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='last']"/>
								<br/>
							</p>
							<p class="item">
								<b>Birth Place:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='birth_place']"/>
								<br/>
							</p>
							<p class="item">
								<b>Date of Birth:</b>
								<xsl:text> </xsl:text>
								<xsl:if test="//str[@name='birth_month']"><xsl:value-of select="//str[@name='birth_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='birth_day']"><xsl:value-of select="//int[@name='birth_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='birth_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Physical Description:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='phys_desc']"/>
								<br/>
							</p>
							<p class="item">
								<b>Prewar Life:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='prewar']"/>
							</p>
						</td>
						<td align="left" valign="top">
							<p class="item">
								<b>Date of Enlistment:</b>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='month_enl']"><xsl:value-of select="//int[@name='month_enl']"/>/</xsl:if>
								<xsl:if test="//int[@name='day_enl']"><xsl:value-of select="//int[@name='day_enl']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='year_enl']"/>
								<br/>
							</p>
							<p class="item">
								<b>Place of Enlistment:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='place_enl']"/>
								<br/>
							</p>
							<p class="item">
								<b>Age at Enlistment:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//int[@name='age_enl']"/>
								<br/>
							</p>
							<p class="item">
								<b>Occupation at Enlistment:</b>
								<xsl:value-of select="//str[@name='occ_enl']"/>
								<xsl:text> </xsl:text>
								<br/>
							</p>
							<p class="item">
								<b>Conscript or Substitute:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='conscript_sub']"/>
							</p>
						</td>
					</tr>

					<tr class="heading">
						<td bgcolor="#ffcc99" valign="top">
							<b>Service Information</b>
						</td>
						<td bgcolor="#ffcc99" valign="top">
							<b>Military Service Record</b>
						</td>
					</tr>
					<tr class="data">
						<td align="left" valign="top">
							<p class="item">
								<b>Rank:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='rank_enl']"/>
								<br/>
							</p>
							<p class="item">
								<b>Company:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='company']"/>
								<br/>
							</p>
							<p class="item">
								<b>Transfer Company:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='company_transfer']"/>
								<br/>
							</p>
							<p class="item">
								<b>Regiment:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='regiment']"/>
							</p>
						</td>

						<td align="left" valign="top">
							<p class="item">
								<b>Promotions:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='promotions']"/>
								<br/>
							</p>
							<p class="item">
								<b>Transfers and Other Service:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='transfers']"/>
								<br/>
							</p>
							<p class="item">
								<b>Muster Sheet:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='muster_record']"/>
								<br/>
							</p>
							<p class="item">
								<b>Captured:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='capture']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='captured_month']"><xsl:value-of select="//int[@name='captured_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='captured_day']"><xsl:value-of select="//int[@name='captured_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='captured_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Missing In Action:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='mia']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='mia_month']"><xsl:value-of select="//int[@name='mia_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='mia_day']"><xsl:value-of select="//int[@name='mia_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='mia_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Prison:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='prisoner']"/>
								<br/>
							</p>
							<p class="item">
								<b>AWOL:</b>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='awol_month']"><xsl:value-of select="//int[@name='awol_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='awol_day']"><xsl:value-of select="//int[@name='awol_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='awol_year']"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='awol']"/>
								<br/>
							</p>
							<p class="item">
								<b>Deserted:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='desertion']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='desertion_month']"><xsl:value-of select="//int[@name='desertion_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='desertion_day']"><xsl:value-of select="//int[@name='desertion_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='desertion_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Discharge:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='discharge']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='discharge_month']"><xsl:value-of select="//int[@name='discharge_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='discharge_day']"><xsl:value-of select="//int[@name='discharge_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='discharge_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Paroled:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='paroled']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='paroled_month']"><xsl:value-of select="//int[@name='paroled_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='paroled_day']"><xsl:value-of select="//int[@name='paroled_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='paroled_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Notes:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='notes']"/>
							</p>
						</td>
					</tr>

					<tr class="heading">
						<td bgcolor="#ffcc99" valign="top">
							<b>Wounded/Killed Information</b>
						</td>
						<td bgcolor="#ffcc99" valign="top">
							<b>Other Information</b>
						</td>
					</tr>
					<tr class="data">
						<td align="left" valign="top">
							<p class="item">
								<b>Died of Disease:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='dead_disease']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='dod_month']"><xsl:value-of select="//int[@name='dod_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='dod_day']"><xsl:value-of select="//int[@name='dod_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='dod_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Killed in Action:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='kia_place']"/>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='kia_info']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='kia_month']"><xsl:value-of select="//int[@name='kia_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='kia_day']"><xsl:value-of select="//int[@name='kia_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='kia_year']"/>

								<br/>
							</p>
							<p class="item">
								<b>Wounded in Action:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='wia']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='wia_month']"><xsl:value-of select="//int[@name='wia_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='wia_day']"><xsl:value-of select="//int[@name='wia_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='wia_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Hospital:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='hospital_record']"/>
								<br/>
							</p>
							<p class="item">
								<b>Died of Wounds:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='dead_wounds']"/>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='dow_month']"><xsl:value-of select="//int[@name='dow_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='dow_day']"><xsl:value-of select="//int[@name='dow_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='dow_year']"/>
							</p>
						</td>

						<td align="left" valign="top">
							<p class="item">
								<b>Personal Life:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='personal_info']"/>
								<br/>
							</p>
<xsl:if test="//int[@name='family_1860']">
<xsl:variable name="censusLink">census_search_results?q=db:<xsl:value-of select="$censusDb"/> AND family_num:<xsl:value-of select="//int[@name='family_1860']"/> AND page_num:<xsl:value-of select="//int[@name='page_1860']"/>&amp;sort=last asc, first asc&amp;county=<xsl:value-of select="$countyCode"/>&amp;year=1860&amp;rows=<xsl:value-of select="$rows"/>&amp;start=<xsl:value-of select="$start"/>&amp;detailed=yes</xsl:variable>
							<p class="item">
								<b>Family Number from 1860 census:</b>
								<xsl:text> </xsl:text><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="$censusLink"/></xsl:attribute>
								<xsl:value-of select="//int[@name='family_1860']"/></xsl:element>
								<xsl:text> (Click on number to see the 1860 census record) </xsl:text>
								<br/>
							</p>
</xsl:if>
<xsl:if test="//int[@name='dwelling_1860']">
<xsl:variable name="censusLink">census_search_results?q=db:<xsl:value-of select="$censusDb"/> AND dwelling_num:<xsl:value-of select="//int[@name='dwelling_1860']"/> AND page_num:<xsl:value-of select="//int[@name='page_1860']"/>&amp;sort=last asc, first asc&amp;county=<xsl:value-of select="$countyCode"/>&amp;year=1860&amp;rows=<xsl:value-of select="$rows"/>&amp;start=<xsl:value-of select="$start"/>&amp;detailed=yes</xsl:variable>
							<p class="item">
								<b>Dwelling Number from 1860 census:</b>
								<xsl:text> </xsl:text><xsl:element name="a"><xsl:attribute name="href"><xsl:value-of select="$censusLink"/></xsl:attribute>
								<xsl:value-of select="//int[@name='dwelling_1860']"/></xsl:element>
								<xsl:text> (Click on number to see the 1860 census record) </xsl:text>
								<br/>
							</p>
</xsl:if>
							<p class="item">
								<b>Postwar Life:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='postwar_life']"/>
								<br/>
							</p>
							<p class="item">
								<b>Death Place:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='death_place']"/>
								<br/>
							</p>
							<p class="item">
								<b>Date of Death:</b>
								<xsl:text> </xsl:text>
								<xsl:if test="//int[@name='death_month']"><xsl:value-of select="//int[@name='death_month']"/>/</xsl:if>
								<xsl:if test="//int[@name='death_day']"><xsl:value-of select="//int[@name='death_day']"/>/</xsl:if>
								<xsl:value-of select="//int[@name='death_year']"/>
								<br/>
							</p>
							<p class="item">
								<b>Cause of Death:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='cause_of_death']"/>
								<br/>
							</p>
							<p class="item">
								<b>Burial Place:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='burial_place']"/>
								<br/>
							</p>
							<p class="item">
								<b>Epitaph:</b>
								<xsl:text> </xsl:text>
								<xsl:value-of select="//str[@name='epitaph']"/>
							</p>
						</td>
					</tr>

				</table>
				<div class="navigationFooter">
					<a href="javascript:history.back()" onClick="javascript:history.back()">
						<b>Return to Search Results</b>
					</a>
					<br/>
				</div>
				<div class="navigationFooter">
					<br/>
					<a href="dossiers">Start a New Search</a>
					<br/>
				</div>
				<center>
					<a href="VoS/choosepart.html">
						<img alt="" border="0" src="VoS/graphics/full7.gif"/>
					</a>
				</center>

			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
