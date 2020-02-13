<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Civil War Images Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} 
				</style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/images_search.js"/>
				<script type="text/javascript" src="javascript/generic_search_paging.js"/>
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
											<a href="/VoS/reference/tips.html">
												<b>Tips for Searching</b>
											</a>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="VoS/cwimages1.html">
												<b>Return to<br/> Images Home</b>
											</a>

										</td>
									</tr>
								</table>

							</td>
							<td>
								<center>
									<img src="/VoS/images/images/vtitle4.gif"/>
								</center>
								<br/>

								<p>
									<h1 class="red-head">
										<b>
											<center> Search the Civil War Images Database </center>
										</b>
									</h1>
								</p>

								<blockquote> The image database contains over seven hundred
									photographs and magazine illustrations from the Civil War. You
									can use this search page to find photographs of soldiers from
									Augusta and Franklin Counties, scenes from battles that Augusta
									and Franklin units fought in, or magazine illustrations of
									homefront or camp life. The database also contains a large
									collection of photographs and magazine illustrations of African
									American soldiers and civilians during the Civil War years. <br/><br/>
								</blockquote>
								<blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
									substituted for any number of characters at the middle
									or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
									full explanation. </blockquote>
							</td>
						</tr>
					</table>
					<hr/>
					<center>
						<form name="imageSearchForm" action="images_search_results.html" method="get">
						<table cellpadding="10">

							<tr>
								<td align="center" colspan="4">
									<input type="hidden" id="query" name="q"/>
									<input type="hidden" name="rows" value="50"/>
									<input type="hidden" name="start" value="0"/>
									<input type="submit" value="Initiate Search" id="search_button"/>
									<input type="reset" value="Clear"/>
								</td>

							</tr>

							<tr>
								<td align="right">Place or Battlefield:</td>
								<td align="left">
									<select name="place">
										<option>all</option>
										<option>Andersonville</option>
										<option>Antietam</option>
										<option>Appomattox</option>
										<option>Cedar Creek</option>
										<option>Cedar Mountain</option>
										<option>Chambersburg</option>
										<option>Chancellorsville</option>
										<option>Cross Keys</option>
										<option>Fisher's Hill</option>
										<option>Fort Pillow </option>
										<option>Fredericksburg</option>
										<option>Gettysburg</option>
										<option>Harper's Ferry</option>
										<option>Malvern Hill</option>
										<option>Manassas</option>
										<option>Milliken's Bend</option>
										<option>Petersburg</option>
										<option>Port Republic</option>
										<option>Richmond</option>
										<option>Valley</option>
										<option>Wilderness</option>
										<option>Winchester</option>
										<option>other</option>
									</select>
								</td>

								<td align="right">Other Place or Battlefield:<br/>(select 'other' from pulldown menu to left)</td>
								<td align="left">
									<input name="other_place" size="20" disabled="disabled"/>
								</td>
							</tr>

							<tr>
								<td align="right">Subject:</td>
								<td align="left">
									<select name="subject_type">
										<option>all</option>
										<option>African Americans</option>
										<option>Battlefield</option>
										<option>Camp Life</option>
										<option>Homefront</option>
										<option>Hospital</option>
										<option>Political Cartoon</option>
										<option>Political Event</option>
										<option>Prison</option>
										<option>Soldier</option>
										<option>Women</option>
									</select>
								</td>

								<td align="right">Source of Image:</td>
								<td align="left">
									<select name="orig_location">
										<option>all</option>
										<option>Original Photograph</option>
										<option>Harper's Weekly</option>
										<option>Frank Leslie's Illustrated Weekly</option>
										<option>Illustrated London News</option>
										<option>Southern Illustrated News</option>
									</select>
								</td>
							</tr>
							<tr>
								<td align="right">Name of Soldier or Other Person:</td>

								<td align="left">
									<input name="people" size="25"/>
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
			</body>
		</html>


	</xsl:template>
</xsl:stylesheet>
