<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:param name="q"/>
	<xsl:param name="current-URL"/>
	<xsl:param name="parent-pipeline"/>
	<xsl:param name="ref"></xsl:param>

	<xsl:variable name="year">
		<xsl:choose>
			<xsl:when test="contains($q, '_60')">
				<xsl:text>1860</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, '_70')">
				<xsl:text>1870</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="county">
		<xsl:choose>
			<xsl:when test="contains($q, 'fr')">
				<xsl:text>Franklin</xsl:text>
			</xsl:when>
			<xsl:when test="contains($q, 'aug')">
				<xsl:text>Augusta</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="state">
		<xsl:choose>
			<xsl:when test="$county = 'Franklin'">
				<xsl:text>Pennsylvania</xsl:text>
			</xsl:when>
			<xsl:when test="$county = 'Augusta'">
				<xsl:text>Virginia</xsl:text>
			</xsl:when>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Census Search Results</title>
				<!-- style based on whether this page is called as a thick box inside another page -->
				<xsl:choose>
					<xsl:when test="not(contains($parent-pipeline, 'census_dual'))">
						<style> body{margin: 2em; padding 1em;} ul li {list-style:none;display:table;} ul{padding:0px;}
							div#singleRecordDisplay { display:inline-block; align:center; margin: auto; left:auto; right:0; margin-left:auto; margin-right:auto; min-width: 50%; max-width: 95%; padding: 3px; padding-right:2em; }
							div.recordHeader {width: 100% !important;} </style>
					</xsl:when>
					<xsl:otherwise>
						<style>ul li {list-style:none;display:table;} ul{padding:0px;}</style>
					</xsl:otherwise>
				</xsl:choose>
			</head>
			<body>
				<div id="mainHeader" style="align: center; text-align: center;"><img style="align: center;" src="VoS/redesign/images/vtitle4.gif"/>
				<h1 style="color:#990000;"><xsl:value-of select="$county"/> - <xsl:value-of
					select="$year"/> Population </h1></div>
				<p style="max-width: 90%;"><b>Please cite results as coming from: </b>
					<xsl:value-of select="$county"/> County, <xsl:value-of select="$state"/>,
						<xsl:value-of select="$year"/> Population Census, Valley of the Shadow: Two
					Communities in the American Civil War, Virginia Center for Digital History,
					University of Virginia <br/><span style="display:inline-block; padding-top: 1.5em;" class="recordURL">(<xsl:value-of select="$current-URL"/>).</span></p>
				<!-- <p style="max-width: 50%;">debug: referer: <xsl:value-of select="$parent-pipeline"></xsl:value-of></p> -->
				<xsl:apply-templates select="//doc"/>

				<p>An asterisk (*) at the end of a last name, first name, or middle initial indicates an illegible name on the manuscript census form.</p>

				<p>† Indicates month of birth/marriage if born/married in the past year.</p>
				<!-- unless the output goes to a thickbox inside previous page, provide a link back to the search page -->
				<xsl:if test="not(contains($parent-pipeline, 'census_search') or contains($parent-pipeline, 'census_dual') or contains($ref, 'dualSearchRequest'))">
					<p style="align:left; padding-left: 2em;" class="link" id="mavis"><a href="population_census">New Search</a></p>
				</xsl:if>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="doc">
		<div id="singleRecordDisplay">
		<div class="recordHeader" style="background-color:#ffcc99;width:400px;">
			<b>Personal Information</b>
		</div>
			<div class="recordData">
		<ul>
			<li>
				<div
					style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
					>Name:</div>
				<div style="padding-left:5px;float:left;">
					<xsl:value-of select="str[@name='first']"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="str[@name='last']"/>
				</div>
			</li>
			<xsl:if test="float[@name='age']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Age:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="substring-before(float[@name='age'], '.0')"/>
					</div>

				</li>
			</xsl:if>
			<xsl:if test="int[@name='head_num']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Order in Family:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="int[@name='head_num']"/>
					</div>

				</li>
			</xsl:if>
			<xsl:if test="str[@name='sex']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Sex:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:choose>
							<xsl:when test="str[@name='sex'] = 'm' or str[@name='sex'] = 'M'">
								<xsl:text>Male</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='sex'] = 'f' or str[@name='sex'] = 'F'">
								<xsl:text>Female</xsl:text>
							</xsl:when>
						</xsl:choose>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='color']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Race:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:choose>
							<xsl:when test="str[@name='color'] = 'b'">
								<xsl:text>Black</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'w'">
								<xsl:text>White</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'm'">
								<xsl:text>Mulatto</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'c'">
								<xsl:text>Chinese</xsl:text>
							</xsl:when>
							<xsl:when test="str[@name='color'] = 'i'">
								<xsl:text>Indian</xsl:text>
							</xsl:when>
						</xsl:choose>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='occupation']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Occupation:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='occupation']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="int[@name='realest']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Real Estate Value:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="int[@name='realest']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="int[@name='persest']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Personal Estate Value:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="int[@name='persest']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='birth_place']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Birth Place:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='birth_place']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='married']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Married in Past Year:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='married']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='marr_month']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Month Married†:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='marr_month']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='birth_month']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Month Born†:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='marr_month']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='school'] = '1' or str[@name='school'] = 'yes'">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Attended School in Past Year:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:text>yes</xsl:text>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='readwrite']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Can Read/Write:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='readwrite']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="str[@name='read'] = '1'">
					<li>
						<div
							style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
							>Can Read:</div>
						<div style="padding-left:5px;float:left;">yes</div>
					</li>
				</xsl:when>
				<xsl:otherwise>
					<li>
						<div
							style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
							>Can Read:</div>
						<div style="padding-left:5px;float:left;">no</div>
					</li>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="str[@name='write'] = '1'">
					<li>
						<div
							style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
							>Can Write:</div>
						<div style="padding-left:5px;float:left;">yes</div>
					</li>
				</xsl:when>
				<xsl:otherwise>
					<li>
						<div
							style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
							>Can Write:</div>
						<div style="padding-left:5px;float:left;">no</div>
					</li>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="str[@name='deaf_dumb']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Handicap:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='deaf_dumb']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='male_21']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Handicap:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='deaf_dumb']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='male_novote']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Handicap:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='deaf_dumb']"/>
					</div>
				</li>
			</xsl:if>
		</ul>
			</div>

		<!-- FAMILY INFORMATION -->
		<xsl:if test="$year = '1870'">
			<div class="recordHeader" style="background-color:#ffcc99;width:400px;">
				<b>Family Information</b>
			</div>
			<div class="recordData">
			<ul>
				<xsl:choose>
					<xsl:when test="str[@name='for_father'] = '1'">
						<li>
							<div
								style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
								>Foreign Father:</div>
							<div style="padding-left:5px;float:left;">yes</div>
						</li>
					</xsl:when>
					<xsl:otherwise>
						<li>
							<div
								style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
								>Foreign Father:</div>
							<div style="padding-left:5px;float:left;">no</div>
						</li>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="str[@name='for_mother'] = '1'">
						<li>
							<div
								style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
								>Foreign Mother:</div>
							<div style="padding-left:5px;float:left;">yes</div>
						</li>
					</xsl:when>
					<xsl:otherwise>
						<li>
							<div
								style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
								>Foreign Mother:</div>
							<div style="padding-left:5px;float:left;">no</div>
						</li>
					</xsl:otherwise>
				</xsl:choose>
			</ul>
			</div>
		</xsl:if>

		<!-- LOCATION -->
		<div class="recordHeader" style="background-color:#ffcc99;width:400px;">
			<b>Location</b>
		</div>
			<div class="recordData">
		<ul>
			<li>
				<div
					style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
					>County:</div>
				<div style="padding-left:5px;float:left;">
					<xsl:value-of select="$county"/>
				</div>
			</li>
			<xsl:if test="$year = '1860'">
				<xsl:if test="str[@name='subdistrict']">
					<li>
						<div
							style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
							>District:</div>
						<div style="padding-left:5px;float:left;">
							<xsl:value-of select="str[@name='subdistrict']"/>
						</div>
					</li>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$year = '1870'">
				<xsl:if test="str[@name='district']">
					<li>
						<div
							style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
							>District:</div>
						<div style="padding-left:5px;float:left;">
							<xsl:value-of select="str[@name='district']"/>
						</div>
					</li>
				</xsl:if>
				<xsl:if test="str[@name='post_office']">
					<li>
						<div
							style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
							>Post Office:</div>
						<div style="padding-left:5px;float:left;">
							<xsl:value-of select="str[@name='post_office']"/>
						</div>
					</li>
				</xsl:if>
			</xsl:if>
		</ul>
				</div>



		<div class="recordHeader" style="background-color:#ffcc99;width:400px;">
			<b>Census Record Information</b>
		</div>
		<div class="recordData">
		<ul>
			<xsl:if test="int[@name='page_num']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Page Number:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="int[@name='page_num']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="int[@name='dwelling_num']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Dwelling Number:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="int[@name='dwelling_num']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="int[@name='family_num']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Family Number:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="int[@name='family_num']"/>
					</div>
				</li>
			</xsl:if>
			<xsl:if test="str[@name='note']">
				<li>
					<div
						style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;"
						>Note:</div>
					<div style="padding-left:5px;float:left;">
						<xsl:value-of select="str[@name='note']"/>
					</div>
				</li>
			</xsl:if>
		</ul>
			</div>
		</div>
	</xsl:template>

</xsl:stylesheet>
