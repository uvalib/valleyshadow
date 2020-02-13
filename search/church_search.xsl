<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Church Records Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/church_search.js"/>
			</head>
			<body TEXT="#000000" BGCOLOR="FFFFFF" LINK="#CD7F32" VLINK="#00009C">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
					<!-- Table which contains navigation table and intro material -->
					<table>

						<tr>
							<td valign="center">

								<!-- Table containing navigation tools -->
								<table bgcolor="#ffcc99" border="0" width="80%" cellpadding="10">
									<tr>
										<td align="center">
											<a href="VoS/church1.html">
												<b>Return to<br/> Church Home</b>
											</a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="VoS/reference/tips.html">
												<b>Tips for Searching</b>
											</a>
											<br/>

										</td>
									</tr>
								</table>

							</td>
							<td>
								<center>
									<img src="/VoS/images/images/vtitle4.gif"/>
								</center>
								<br/>
								<br/>

								<p>
									<h1 class="red-head">
										<b>
											<center> Search the Church Records </center>
										</b>
									</h1>
								</p>

								<blockquote> Church records tell us about the spiritual life of a
									community, its connections and dissonances. Many churches kept
									careful records of their members, making notes of their
									marriages, births, baptisms, and deaths. Some churches detailed
									excommunications and other extraordinary events in the lives of
									their parishioners. Other churches did not keep records of
									parishioners. Some churches did not own a dedicated building but
									instead gathered when an itinerant preacher came into their
									area. In 1995-1996 the Valley project staff searched the
									churches of Franklin and Augusta counties for record books,
									often finding them with the help of the clergy. The staff then
									meticulously transcribed the record books of several churches
									from Augusta and Franklin Counties, converting them into
									searchable databases. <p>You can search the database by name or
										church. </p>
								</blockquote>
								<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle
									or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
									full explanation. </blockquote>
							</td>
						</tr>
					</table>

					<hr/>
					
						<center>
							<form name="churchSearchForm" action="church_search_results.html" method="get">
								<input type="hidden" id="query" name="q"/>
								<input type="hidden" name="rows" value="50"/>
								<input type="hidden" name="start" value="0"/>
								<input type="hidden" name="sort" value="last asc, first asc"/>
							<table cellpadding="10">
								<tr>
									<td align="center" colspan="4">
										<input type="submit" id="search_button"
											value="Initiate Search"/>
										<input type="reset" value="Clear"/>
									</td>

								</tr>

								<tr>
									<td align="right">Last Name:</td>
									<td>
										<input name="last" type="text" value=""/>
									</td>
									<td align="right">First Name:</td>
									<td>
										<input name="first" type="text" value=""/>
									</td>
								</tr>

								<tr>
									<td align="right">Church:</td>

									<td align="left" colspan="3">
										<select name="church">
											<option>Please make a selection</option>
											<option value="[* TO *]" class="church_aug">Search All
												Augusta Churches</option>
											<option value="[* TO *]" class="church_fr">Search All
												Franklin Churches</option>
											<option/>
											<option value="First Presbyterian Church"
												class="church_aug">First Presbyterian Church -
												Augusta</option>
											<option value="St. Francis of Assisi Parish"
												class="church_aug">St. Francis of Assisi Parish -
												Augusta</option>
											<option value="Trinity Episcopal Church"
												class="church_aug">Trinity Episcopal Church -
												Augusta</option>
											<option
												value="Saint John\'s German Reformed Lutheran Church"
												class="church_aug">Saint John's German
												Reformed/Lutheran Church - Augusta</option>
											<option/>
											<option value="Burnt Cabins Presbyterian Church"
												class="church_fr">Burnt Cabins Presbyterian Church -
												Franklin</option>
											<option value="Lower Path Valley Presbyterian Church"
												class="church_fr">Lower Path Valley Presbyterian
												Church - Franklin</option>
											<option value="Salem Evangelical Lutheran Church"
												class="church_fr">Salem Evangelical Lutheran Church
												- Franklin</option>
											<option value="Second Evangelical Lutheran Church"
												class="church_fr">Second Evangelical Lutheran Church
												- Franklin</option>
											<option value="Zion Evangelical Lutheran Church"
												class="church_fr">Zion Evangelical Lutheran Church -
												Franklin</option>
											<option value="Mount Zion Lutheran Church"
												class="church_fr">Mount Zion Lutheran Church -
												Franklin</option>
											<option value="Reverend J. Smith Gordon Journal"
												class="church_fr">Reverend J. Smith Gordon Journal -
												Franklin</option>
											<option value="Falling Spring Presbyterian Church"
												class="church_fr">Falling Spring Presbyterian Church
												- Franklin</option>
											<option value="Reformed Mennonite Church"
												class="church_fr">Reformed Mennonite Church -
												Franklin</option>
											<option value="Waynesboro Methodist Episcopal Church"
												class="church_fr">Waynesboro Methodist Episcopal
												Church - Franklin</option>
											<option
												value="Saint Paul\'s Methodist Episcopal Church - Franklin"
												>Saint Paul's Methodist Episcopal Church -
											Franklin</option>
										</select>
									</td>
								</tr>
							</table>
								</form>
						</center>
					
					<br/>
					<hr width="80%"/>
					<center>
						<a href="/VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0"
								alt=""/>
						</a>
					</center>
				</div>
				<div id="search"/>
			</body>
		</html>


	</xsl:template>
</xsl:stylesheet>
