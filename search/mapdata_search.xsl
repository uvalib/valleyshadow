<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Record of Events Search</title>
				<style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/mapdata_search.js"/>
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
											<a href="VoS/reference/tips.html">
												<b>Tips for Searching</b>
											</a>
											<br/>
										</td>
									</tr>
									<tr>
										<td align="center">
											<a href="VoS/cwmaps1.html">
												<b>Return to<br/> Civil War Maps Home</b>
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
											<center> Search the Record of Events Database </center>
										</b>
									</h1>
								</p>
								<blockquote> This database offers detailed information about the
									movements of regiments from Franklin and Augusta counties. From
									this search page you may access information about specific
									battles, including the start and end dates, numbers killed and
									wounded, and weather conditions. <br/><br/> To visualize a
									regiment's movement from battle to battle, go to the <a
										href="VoS/MAPDEMO/theaterintro.html">animated theater maps of
										Franklin and Augusta units.</a> 
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
					<form name="mapdataSearchForm" action="mapdata_search_results.html" method="get">
						<input type="hidden" id="query" name="q"/>
						<input type="hidden" name="rows" value="50"/>
						<input type="hidden" name="start" value="0"/>
						<table>
						<tr>
							<td>
								<b>Battle</b>
							</td>
							<td>
								<b>Regiment</b>
							</td>
							<td>
								<b>Brigade</b>
							</td>
						</tr>
						<tr>
							<td rowspan="3">
								<select name="battle" size="5">
									<option/>
									<option value="Abraham's Creek">Abraham's Creek</option>
									<option value="Addlen, Va.">Addlen, Va.</option>
									<option value="Aenon Church">Aenon Church</option>
									<option value="Aldie">Aldie</option>
									<option value="Allock">Allock</option>
									<option value="Amelia Court House">Amelia Court House</option>
									<option value="Amelia Springs">Amelia Springs</option>
									<option value="Amelia Springs, Jetersville, Deatonsville">
										Amelia Springs, Jetersville, Deatonsville</option>
									<option value="Amissville">Amissville</option>
									<option value="Antietam">Antietam</option>
									<option value="Appomattox Court House">Appomattox Court House</option>
									<option value="Arlington Heights">Arlington Heights</option>
									<option value="Ashby's Gap">Ashby's Gap</option>
									<option value="Ashland">Ashland</option>
									<option value="Ashland, Va.">Ashland, Va.</option>
									<option value="Auburn">Auburn</option>
									<option value="Avery's Church Road">Avery's Church Road</option>
									<option value="Aylett">Aylett</option>
									<option value="B and W Station">B and W Station</option>
									<option value="Barboursville Junction">Barboursville Junction</option>
									<option value="Barnett's Ford on the Rapidan">Barnett's Ford on
										the Rapidan</option>
									<option value="Bast River">Bast River</option>
									<option value="Battery Creek Station">Battery Creek Station</option>
									<option value="Bealeton Station">Bealeton Station</option>
									<option value="Beaver Dam Station">Beaver Dam Station</option>
									<option value="Belfield">Belfield</option>
									<option value="Berryville">Berryville</option>
									<option value="Berryville Turnpike">Berryville Turnpike</option>
									<option value="Beslin">Beslin</option>
									<option value="Bethesda Church">Bethesda Church</option>
									<option value="Beverly Ford">Beverly Ford</option>
									<option value="Blackwater">Blackwater</option>
									<option value="Boonsborough">Boonsborough</option>
									<option value="Bottom's Bridge">Bottom's Bridge</option>
									<option value="Boydton Plank Road">Boydton Plank Road</option>
									<option value="Brandy Station">Brandy Station</option>
									<option value="Brandy Station, Beverly Ford">Brandy Station,
										Beverly Ford</option>
									<option value="Bratton's Farm">Bratton's Farm</option>
									<option value="Bridgewater">Bridgewater</option>
									<option value="Bristoe">Bristoe</option>
									<option value="Bristoe Station">Bristoe Station</option>
									<option value="Brown's Gap">Brown's Gap</option>
									<option value="Brucetown">Brucetown</option>
									<option value="Buckland's Bridge, Broad Run">Buckland's Bridge,
										Broad Run</option>
									<option value="Buckland's Mills">Buckland's Mills</option>
									<option value="Bull Run Bridge">Bull Run Bridge</option>
									<option value="Bunker Hill">Bunker Hill</option>
									<option value="Bunkers Hill">Bunkers Hill</option>
									<option value="Burnside's 'Mud March'">Burnside's "Mud March"</option>
									<option value="Burton's Ford, Rapidan River">Burton's Ford,
										Rapidan River</option>
									<option value="C and O Canal">C and O Canal</option>
									<option value="Camp Allegheny">Camp Allegheny</option>
									<option value="Camp Casey">Camp Casey</option>
									<option value="Camp Near Falmouth">Camp Near Falmouth</option>
									<option value="Camp near Sharpsburg">Camp near Sharpsburg</option>
									<option value="Carlisle">Carlisle</option>
									<option value="Carter's Store">Carter's Store</option>
									<option value="Cat Tail Creek">Cat Tail Creek</option>
									<option value="Catlett Station">Catlett Station</option>
									<option value="Catlett's Station">Catlett's Station</option>
									<option value="Catoctin Creek">Catoctin Creek</option>
									<option value="Cedar Creek">Cedar Creek</option>
									<option value="Cedar Mountain">Cedar Mountain</option>
									<option value="Cedarville">Cedarville</option>
									<option value="Centreville">Centreville</option>
									<option value="Chaffin's Farm">Chaffin's Farm</option>
									<option value="Chambersburg">Chambersburg</option>
									<option value="Chancellorsville"> Chancellorsville</option>
									<option value="Chantilly">Chantilly</option>
									<option value="Charles City Courthouse">Charles City Courthouse</option>
									<option value="Charlottesville"> Charlottesville</option>
									<option value="Coal Landing">Coal Landing</option>
									<option value="Cold Harbor">Cold Harbor</option>
									<option value="Cold Mountain">Cold Mountain</option>
									<option value="Concord">Concord</option>
									<option value="Covington">Covington</option>
									<option value="Crater">Crater</option>
									<option value="Cross Keys">Cross Keys</option>
									<option value="Cross Keys, Port Republic">Cross Keys, Port
										Republic</option>
									<option value="Crump's Creek">Crump's Creek</option>
									<option value="Culpeper">Culpeper</option>
									<option value="Culpeper C.H.">Culpeper C.H.</option>
									<option value="Culpeper Court House">Culpeper Court House</option>
									<option value="Dabney's Mills">Dabney's Mills</option>
									<option value="Dams">Dams</option>
									<option value="Danville">Danville</option>
									<option value="Darbytown">Darbytown</option>
									<option value="Deep Bottom">Deep Bottom</option>
									<option value="Deep Run Swamp">Deep Run Swamp</option>
									<option value="Dinwiddie Court House">Dinwiddie Court House</option>
									<option value="Dix's Peninsula">Dix's Peninsula</option>
									<option value="Dranesville">Dranesville</option>
									<option value="Droop Mountain">Droop Mountain</option>
									<option value="Dumfries">Dumfries</option>
									<option value="Edenburg">Edenburg</option>
									<option value="Ellis' Ford on the Rapidan">Ellis' Ford on the
										Rapidan</option>
									<option value="Ely's Ford">Ely's Ford</option>
									<option value="Fair Oaks">Fair Oaks</option>
									<option value="Fairfax">Fairfax</option>
									<option value="Fairfax Court House">Fairfax Court House</option>
									<option value="Falling Waters">Falling Waters</option>
									<option value="Falls Church Road">Falls Church Road</option>
									<option value="Falmouth">Falmouth</option>
									<option value="Farmville">Farmville</option>
									<option value="Fauquier, White Sulphur Springs"> Fauquier, White
										Sulphur Springs</option>
									<option value="First Kernstown">First Kernstown</option>
									<option value="First Manassas">First Manassas</option>
									<option value="First Ream's Station">First Ream's Station</option>
									<option value="First Winchester">First Winchester</option>
									<option value="Fisher's Hill">Fisher's Hill</option>
									<option value="Fisher's Hill, Woodstock">Fisher's Hill,
										Woodstock</option>
									<option value="Fitzhugh's Crossing">Fitzhugh's Crossing</option>
									<option value="Five Forks">Five Forks</option>
									<option value="Flat Creek">Flat Creek</option>
									<option value="Forde's Station">Forde's Station</option>
									<option value="Fort Albany">Fort Albany</option>
									<option value="Fort Clifton, Petersburg">Fort Clifton,
										Petersburg</option>
									<option value="Fort McKebbin">Fort McKebbin</option>
									<option value="Fort Powhatan">Fort Powhatan</option>
									<option value="Fortress Monroe">Fortress Monroe</option>
									<option value="Foxes Mountain">Foxes Mountain</option>
									<option value="Franklin">Franklin</option>
									<option value="Franklin Station">Franklin Station</option>
									<option value="Frederick">Frederick</option>
									<option value="Frederick Junction">Frederick Junction</option>
									<option value="Fredericksburg">Fredericksburg</option>
									<option value="Front Royal">Front Royal</option>
									<option value="Ft. Stedman">Ft. Stedman</option>
									<option value="Gaines Mill, Cold Harbor, Chickahominy"> Gaines
										Mill, Cold Harbor, Chickahominy</option>
									<option value="Gaines Mill, Seven Days Battles">Gaines Mill,
										Seven Days Battles</option>
									<option value="Gaines' Mill">Gaines' Mill</option>
									<option value="Gainesville">Gainesville</option>
									<option value="Garrisonville">Garrisonville</option>
									<option value="Germanna Plank Road">Germanna Plank Road</option>
									<option value="Gettysburg">Gettysburg</option>
									<option value="Gidde Tavern">Gidde Tavern</option>
									<option value="Glendale, Seven Days Battles">Glendale, Seven
										Days Battles</option>
									<option value="Gordonsville">Gordonsville</option>
									<option value="Gore Church">Gore Church</option>
									<option value="Grand Station near Skipper's Ferry"> Grand
										Station near Skipper's Ferry</option>
									<option value="Grange Court House">Grange Court House</option>
									<option value="Grinnel's Farm">Grinnel's Farm</option>
									<option value="Grinnell's Farm near Dranesville"> Grinnell's
										Farm near Dranesville</option>
									<option value="Grove Church">Grove Church</option>
									<option value="Groveton">Groveton</option>
									<option value="Hagerstown">Hagerstown</option>
									<option value="Halifax Road">Halifax Road</option>
									<option value="Hanging Rock Pass">Hanging Rock Pass</option>
									<option value="Hanover">Hanover</option>
									<option value="Hanover Court House">Hanover Court House</option>
									<option value="Hanovertown">Hanovertown</option>
									<option value="Hanovertown Ferry">Hanovertown Ferry</option>
									<option value="Hanovertown and New Castle Ferry"> Hanovertown
										and New Castle Ferry</option>
									<option value="Harper's Ferry">Harper's Ferry</option>
									<option value="Harpers Ferry">Harpers Ferry</option>
									<option value="Harrington">Harrington</option>
									<option value="Harris Farm">Harris Farm</option>
									<option value="Harrisburg">Harrisburg</option>
									<option value="Harrison's Landing">Harrison's Landing</option>
									<option value="Harrow">Harrow</option>
									<option value="Hartaway River">Hartaway River</option>
									<option value="Hartwood Church">Hartwood Church</option>
									<option value="Hatcher's Run">Hatcher's Run</option>
									<option value="Haw's Shop">Haw's Shop</option>
									<option value="Haymarket">Haymarket</option>
									<option value="Heason River">Heason River</option>
									<option value="Hedgesville and Martinsburg">Hedgesville and
										Martinsburg</option>
									<option value="Henry Creek">Henry Creek</option>
									<option value="Hicksford">Hicksford</option>
									<option value="High Bridge">High Bridge</option>
									<option value="Holley Landing near Winfield">Holley Landing near
										Winfield</option>
									<option value="Hungary Station">Hungary Station</option>
									<option value="Hunterstown">Hunterstown</option>
									<option value="Jarratt's Station">Jarratt's Station</option>
									<option value="Jefferson">Jefferson</option>
									<option value="Jericho Ford">Jericho Ford</option>
									<option value="Jerusalem Plank Road">Jerusalem Plank Road</option>
									<option value="Jones' Bridge">Jones' Bridge</option>
									<option value="Katherine Creek">Katherine Creek</option>
									<option value="Kearneysville">Kearneysville</option>
									<option value="Kelly's Ford">Kelly's Ford</option>
									<option value="Kenton River at Markey's Ferry">Kenton River at
										Markey's Ferry</option>
									<option value="Kernstown">Kernstown</option>
									<option value="King George">King George</option>
									<option value="King George County">King George County</option>
									<option value="Kingston">Kingston</option>
									<option value="Lacey's Springs">Lacey's Springs</option>
									<option value="Lee's Mills">Lee's Mills</option>
									<option value="Leesburg">Leesburg</option>
									<option value="Leetown">Leetown</option>
									<option value="Leetown and Smithfield">Leetown and Smithfield</option>
									<option value="Lewinsville">Lewinsville</option>
									<option value="Lewis' Farm (Gravelly Run)">Lewis' Farm (Gravelly
										Run)</option>
									<option value="Lexington and Lynchburg">Lexington and Lynchburg</option>
									<option value="Liberty">Liberty</option>
									<option value="Light House Point">Light House Point</option>
									<option value="Light Junction">Light Junction</option>
									<option value="Little River">Little River</option>
									<option value="Little River Turnpike">Little River Turnpike</option>
									<option value="Little River Turnpike, Lewinsville"> Little River
										Turnpike, Lewinsville</option>
									<option value="Loudon, Fauquier and Rappahannock Counties">
										Loudon, Fauquier and Rappahannock Counties</option>
									<option value="Loudon, Fauquier, and Rappahannock Counties">
										Loudon, Fauquier, and Rappahannock Counties</option>
									<option value="Lovettsville">Lovettsville</option>
									<option value="Lower fords of Rapidan">Lower fords of Rapidan</option>
									<option value="Luray">Luray</option>
									<option value="Luray Valley">Luray Valley</option>
									<option value="Lynchburg">Lynchburg</option>
									<option value="Lynchburg Court House">Lynchburg Court House</option>
									<option value="Madison Court House">Madison Court House</option>
									<option value="Mahone's Bridge">Mahone's Bridge</option>
									<option value="Malvern Hill">Malvern Hill</option>
									<option value="Malvern Hill, Seven Days Battles"> Malvern Hill,
										Seven Days Battles</option>
									<option value="Manassas Gap">Manassas Gap</option>
									<option value="Manassas Junction">Manassas Junction</option>
									<option value="Markham Station">Markham Station</option>
									<option value="Martin's Ford">Martin's Ford</option>
									<option value="Martinsburg">Martinsburg</option>
									<option value="Maryland">Maryland</option>
									<option value="Maryland Heights">Maryland Heights</option>
									<option value="Maryland and Pennsylvania">Maryland and
										Pennsylvania</option>
									<option value="Matadequin Creek">Matadequin Creek</option>
									<option value="McClellan's Bridge">McClellan's Bridge</option>
									<option value="McConnelsburg">McConnelsburg</option>
									<option value="McDowell">McDowell</option>
									<option value="Mechanicsburg">Mechanicsburg</option>
									<option value="Mechanicsville">Mechanicsville</option>
									<option value="Mechanicsville, Beaver Dam Creek">
										Mechanicsville, Beaver Dam Creek</option>
									<option value="Mechanicsville, Seven Days Battles">
										Mechanicsville, Seven Days Battles</option>
									<option value="Middleburg">Middleburg</option>
									<option value="Middleburg and Aldie">Middleburg and Aldie</option>
									<option value="Middletown">Middletown</option>
									<option value="Middletown and Strasburg">Middletown and
										Strasburg</option>
									<option value="Milford">Milford</option>
									<option value="Mine Run">Mine Run</option>
									<option value="Monocacy">Monocacy</option>
									<option value="Moorefield">Moorefield</option>
									<option value="Moorefield Junction">Moorefield Junction</option>
									<option value="Morton's Ford">Morton's Ford</option>
									<option value="Mount Crawford">Mount Crawford</option>
									<option value="Mount Jackson">Mount Jackson</option>
									<option value="Mount Olive">Mount Olive</option>
									<option value="Mt. Erin">Mt. Erin</option>
									<option value="Mt. Sinai Church">Mt. Sinai Church</option>
									<option value="Namozine Church">Namozine Church</option>
									<option value="Namozine Creek">Namozine Creek</option>
									<option value="Nattoway Court House">Nattoway Court House</option>
									<option value="Neuse River">Neuse River</option>
									<option value="New Berne">New Berne</option>
									<option value="New Creek">New Creek</option>
									<option value="New Hope Church">New Hope Church</option>
									<option value="New Market">New Market</option>
									<option value="Newtown">Newtown</option>
									<option value="North Anna">North Anna</option>
									<option value="North Anna River">North Anna River</option>
									<option value="Northern Virginia">Northern Virginia</option>
									<option value="Nottoway Station">Nottoway Station</option>
									<option value="Ny River">Ny River</option>
									<option value="Occoquan">Occoquan</option>
									<option value="Occoquan Village">Occoquan Village</option>
									<option value="Offcut's Cross Roads and Seneca"> Offcut's Cross
										Roads and Seneca</option>
									<option value="Old Church and Haw's Shop">Old Church and Haw's
										Shop</option>
									<option value="Old Shop Church">Old Shop Church</option>
									<option value="Opequon">Opequon</option>
									<option value="Orange Court House">Orange Court House</option>
									<option value="Orange and Alexandria Railroad">Orange and
										Alexandria Railroad</option>
									<option value="Page County">Page County</option>
									<option value="Pamunkey River">Pamunkey River</option>
									<option value="Panther's Station">Panther's Station</option>
									<option value="Paoli Mills">Paoli Mills</option>
									<option value="Parkersburg Turnpike">Parkersburg Turnpike</option>
									<option value="Payne's Farm">Payne's Farm</option>
									<option value="Petersburg">Petersburg</option>
									<option value="Point of Rocks">Point of Rocks</option>
									<option value="Polack's and White's Station">Polack's and
										White's Station</option>
									<option value="Pollocksville">Pollocksville</option>
									<option value="Pony Mountain">Pony Mountain</option>
									<option value="Poolesville">Poolesville</option>
									<option value="Poplar Springs Church">Poplar Springs Church</option>
									<option value="Port Republic">Port Republic</option>
									<option value="Port Royal">Port Royal</option>
									<option value="Potomac Bridge">Potomac Bridge</option>
									<option value="Potomac River">Potomac River</option>
									<option value="Potomac Station">Potomac Station</option>
									<option value="Prince George Court House">Prince George Court
										House</option>
									<option value="Prooped Station">Prooped Station</option>
									<option value="Raccoon Ford">Raccoon Ford</option>
									<option value="Rapidan">Rapidan</option>
									<option value="Rappahannock Bridge">Rappahannock Bridge</option>
									<option value="Rappahannock Crossing">Rappahannock Crossing</option>
									<option value="Rappahannock Station">Rappahannock Station</option>
									<option value="Raweton House">Raweton House</option>
									<option value="Reams' Station">Reams' Station</option>
									<option value="Richmond">Richmond</option>
									<option value="Richmond Campaign">Richmond Campaign</option>
									<option value="Robertson's River">Robertson's River</option>
									<option value="Robinson's Mill Beaver Creek">Robinson's Mill
										Beaver Creek</option>
									<option value="Rockfish Gap">Rockfish Gap</option>
									<option value="Rockville">Rockville</option>
									<option value="Romee Gap Court House">Romee Gap Court House</option>
									<option value="Romney">Romney</option>
									<option value="Romney Road">Romney Road</option>
									<option value="Rude's Hill">Rude's Hill</option>
									<option value="Rutherford's Farm">Rutherford's Farm</option>
									<option value="Sailor's Creek">Sailor's Creek</option>
									<option value="Salem Church">Salem Church</option>
									<option value="Sandybrook">Sandybrook</option>
									<option value="Second Fredericksburg">Second Fredericksburg</option>
									<option value="Second Kernstown">Second Kernstown</option>
									<option value="Second Manassas">Second Manassas</option>
									<option value="Second Winchester">Second Winchester</option>
									<option value="Seven Pines">Seven Pines</option>
									<option value="Sharpsburg">Sharpsburg</option>
									<option value="Shepherdstown">Shepherdstown</option>
									<option value="Sheridan's Shenandoah Campaign"> Sheridan's
										Shenandoah Campaign</option>
									<option value="Smithfield">Smithfield</option>
									<option value="Smithfield Crossing">Smithfield Crossing</option>
									<option value="Snicker's Gap">Snicker's Gap</option>
									<option value="Snicker's Gap, Loudon Co.">Snicker's Gap, Loudon
										Co.</option>
									<option value="South Anna Bridge">South Anna Bridge</option>
									<option value="South Anna River">South Anna River</option>
									<option value="South Boston">South Boston</option>
									<option value="South Mountain">South Mountain</option>
									<option value="South Side of the Trent River">South Side of the
										Trent River</option>
									<option value="Southside Railroad">Southside Railroad</option>
									<option value="Spotsylvania Court House">Spotsylvania Court
										House</option>
									<option value="St. Peter's Church">St. Peter's Church</option>
									<option value="Stafford Court House">Stafford Court House</option>
									<option value="Stanardsville">Stanardsville</option>
									<option value="Stephenson's Depot">Stephenson's Depot</option>
									<option value="Steven's Furnace">Steven's Furnace</option>
									<option value="Stevensburg">Stevensburg</option>
									<option value="Stevensburg and Kelly's Ford"> Stevensburg and
										Kelly's Ford</option>
									<option value="Stevensburg, Raccoon Ford, Brandy Station">
										Stevensburg, Raccoon Ford, Brandy Station</option>
									<option value="Stony Creek">Stony Creek</option>
									<option value="Stony Creek Station, Weldon Railroad"> Stony
										Creek Station, Weldon Railroad</option>
									<option value="Strasburg">Strasburg</option>
									<option value="Suffolk">Suffolk</option>
									<option value="Sulphur Springs">Sulphur Springs</option>
									<option value="Sussex Court House">Sussex Court House</option>
									<option value="Sutherland Station">Sutherland Station</option>
									<option value="Swift Creek near Washington">Swift Creek near
										Washington</option>
									<option value="Tabernacle Church">Tabernacle Church</option>
									<option value="Templeton's">Templeton's</option>
									<option value="Third Winchester">Third Winchester</option>
									<option value="Thornburg">Thornburg</option>
									<option value="Thoroughfare Gap">Thoroughfare Gap</option>
									<option value="Todd's Tavern">Todd's Tavern</option>
									<option value="Toll Gate near White Post">Toll Gate near White
										Post</option>
									<option value="Tom's Brook">Tom's Brook</option>
									<option value="Totopotomoy Creek (Bethesda Church)"> Totopotomoy
										Creek (Bethesda Church)</option>
									<option value="Totopotomoy River">Totopotomoy River</option>
									<option value="Trent River">Trent River</option>
									<option value="Trevilian Station">Trevilian Station</option>
									<option value="Tunstall Station">Tunstall Station</option>
									<option value="Tunstall's Station">Tunstall's Station</option>
									<option value="Upperville">Upperville</option>
									<option value="Vernon">Vernon</option>
									<option value="Warrenton">Warrenton</option>
									<option value="Warrenton Junction">Warrenton Junction</option>
									<option value="Warrenton Junction Railroad">Warrenton Junction
										Railroad</option>
									<option value="Washington">Washington</option>
									<option value="Washington DC">Washington DC</option>
									<option value="Washington, DC">Washington, DC</option>
									<option value="Waynesboro">Waynesboro</option>
									<option value="Weldon Railroad">Weldon Railroad</option>
									<option value="Westminster">Westminster</option>
									<option value="Weyer's Cave">Weyer's Cave</option>
									<option value="White House">White House</option>
									<option value="White House Landing">White House Landing</option>
									<option value="White House, Pamunkey River">White House,
										Pamunkey River</option>
									<option value="White Oak Church">White Oak Church</option>
									<option value="White Oak Ferry">White Oak Ferry</option>
									<option value="White Oak Road">White Oak Road</option>
									<option value="White Oak Swamp">White Oak Swamp</option>
									<option value="White Post">White Post</option>
									<option value="White Post, Bunker Hill, Martinsburg"> White
										Post, Bunker Hill, Martinsburg</option>
									<option value="Wiggins Mill">Wiggins Mill</option>
									<option value="Wilderness">Wilderness</option>
									<option value="Will Homes">Will Homes</option>
									<option value="Williamsport">Williamsport</option>
									<option value="Wilson's Wharf">Wilson's Wharf</option>
									<option value="Winchester and Middletown Roads"> Winchester and
										Middletown Roads</option>
									<option value="Winchester and Newtown">Winchester and Newtown</option>
									<option value="Woodstock">Woodstock</option>
									<option value="Yellow House">Yellow House</option>
									<option value="Yellow Tavern">Yellow Tavern</option>
								</select>
							</td>
							<td>
								<select name="regiment">
									<option/>
									<option value="107th Pa. Inf.">107th Pennsylvania Infantry</option>
									<option value="126th Pa. Inf.">126th Pennsylvania Infantry</option>
									<option value="14th Va. Cav.">14th Virginia Cavalry</option>
									<option value="158th Pa. Inf.">158th Pennsylvania Infantry</option>
									<option value="16th Pa. Cav.">16th Pennsylvania Cavalry</option>
									<option value="17th Pa. Cav">17th Pennsylvania Cavalry</option>
									<option value="1st Pa. Light Art. Co. A">1st Pennsylvania Light
										Artillery Co. A</option>
									<option value="1st Va. Cav.">1st Virginia Cavalry</option>
									<option value="21st Pa. Cav.">21st Pennsylvania Cavalry</option>
									<option value="52nd Va. Inf.">52nd Virginia Infantry</option>
									<option value="5th Va. Inf.">5th Virginia Infantry</option>
									<option value="6th Pa.">6th Pennsylvania</option>
									<option value="87th Pa. Inf.">87th Pennsylvania Infantry</option>
									<option value="Staunton Arty.">Staunton Artillery</option>
								</select>
							</td>
							<td>
								<select name="brigade">
									<option/>
									<option value="Artillery">Artillery</option>
									<option value="Cavalry">Cavalry</option>
									<option value="Cutshaw's">Cutshaw's</option>
									<option value="Early's">Early's</option>
									<option value="First">First</option>
									<option value="Fitzhugh Lee's">Fitzhugh Lee's</option>
									<option value="Fourth">Fourth</option>
									<option value="Garnett's">Garnett's</option>
									<option value="Jenkins'">Jenkins'</option>
									<option value="Jones'">Jones'</option>
									<option value="Latimer (Artillery)">Latimer (Artillery)</option>
									<option value="Lawton's">Lawton's</option>
									<option value="McCausland's">McCausland's</option>
									<option value="Munford's">Munford's</option>
									<option value="Paxton's">Paxton's</option>
									<option value="Pegram's">Pegram's</option>
									<option value="Pegram's (Hoffman's)">Pegram's (Hoffman's)</option>
									<option value="Second">Second</option>
									<option value="Smith's">Smith's</option>
									<option value="Spinola's">Spinola's</option>
									<option value="Steuart's">Steuart's</option>
									<option value="Stonewall">Stonewall</option>
									<option value="Stonewall (Paxton's)">Stonewall (Paxton's)</option>
									<option value="Stonewall (Walker's)">Stonewall (Walker's)</option>
									<option value="Terry's">Terry's</option>
									<option value="Third">Third</option>
									<option value="Walker's">Walker's</option>
									<option value="Walker's (Early's)">Walker's (Early's)</option>
									<option value="Wickham's">Wickham's</option>
									<option value="Williams C. Wickham's">Williams C. Wickham's</option>
									<option value="Winder's">Winder's</option>
									<option value="n.a.">n.a.</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<b>Division</b>
							</td>
							<td>
								<b>Corps</b>
							</td>
						</tr>
						<tr>
							<td>
								<select name="division">
									<option/>
									<option value="Cavalry">Cavalry</option>
									<option value="Early's">Early's</option>
									<option value="Early's (Ewell's)">Early's (Ewell's)</option>
									<option value="Ewell's">Ewell's</option>
									<option value="Ferry's">Ferry's</option>
									<option value="First">First</option>
									<option value="Fitzhugh Lee's">Fitzhugh Lee's</option>
									<option value="Fourth">Fourth</option>
									<option value="Gordon's">Gordon's</option>
									<option value="Independent">Independent</option>
									<option value="Jackson's">Jackson's</option>
									<option value="Johnson's">Johnson's</option>
									<option value="Lee's">Lee's</option>
									<option value="Lomax's">Lomax's</option>
									<option value="McCall's">McCall's</option>
									<option value="Pegram's (Early's)">Pegram's (Early's)</option>
									<option value="Reynold's">Reynold's</option>
									<option value="Rosser's">Rosser's</option>
									<option value="Second">Second</option>
									<option value="Stuart's">Stuart's</option>
									<option value="Taliaferro's (Jackson's)">Taliaferro's
										(Jackson's)</option>
									<option value="Third">Third</option>
									<option value="Trimble's">Trimble's</option>
									<option value="Trimble's (Colston's)">Trimble's (Colston's)</option>
									<option value="Walker's">Walker's</option>
									<option value="Whiting's">Whiting's</option>
									<option value="n.a.">n.a.</option>
								</select>
							</td>
							<td>
								<select name="corps">
									<option/>
									<option value="Army of the Potomac">Army of the Potomac</option>
									<option value="Cavalry">Cavalry</option>
									<option value="Eleventh">Eleventh</option>
									<option value="Fifth">Fifth</option>
									<option value="First">First</option>
									<option value="Jackson's">Jackson's</option>
									<option value="Ninth">Ninth</option>
									<option value="Second">Second</option>
									<option value="Seventh">Seventh</option>
									<option value="Sixth">Sixth</option>
									<option value="Tenth">Tenth</option>
									<option value="Third">Third</option>
									<option value="Twenty-Fourth">Twenty-Fourth</option>
									<option value="n.a.">n.a.</option>
								</select>
							</td>
						</tr>
						</table>
						
					<b>Date of Battle ( DD-Month-YYYY )</b>
					<br/>

					beginning: <select name="start_month">
						<option/>
						<option value="01">Jan.</option>
						<option value="02">Feb.</option>
						<option value="03">Mar.</option>
						<option value="04">Apr.</option>
						<option value="05">May.</option>
						<option value="06">Jun.</option>
						<option value="07">Jul.</option>
						<option value="08">Aug.</option>
						<option value="09">Sep.</option>
						<option value="10">Oct.</option>
						<option value="11">Nov.</option>
						<option value="12">Dec.</option>
					</select>
					<xsl:text>-</xsl:text>
					<select name="start_day" disabled="disabled">
						<option/>
					</select>
					<xsl:text> - </xsl:text>
					<select name="start_year">
						<option value="" selected="selected"> </option>
						<option value="1861">1861</option>
						<option value="1862">1862</option>
						<option value="1863">1863</option>
						<option value="1864">1864</option>
						<option value="1865">1865</option>
					</select>
					<xsl:text>––</xsl:text>
					<select name="end_month">
						<option/>
						<option value="01">Jan.</option>
						<option value="02">Feb.</option>
						<option value="03">Mar.</option>
						<option value="04">Apr.</option>
						<option value="05">May.</option>
						<option value="06">Jun.</option>
						<option value="07">Jul.</option>
						<option value="08">Aug.</option>
						<option value="09">Sep.</option>
						<option value="10">Oct.</option>
						<option value="11">Nov.</option>
						<option value="12">Dec.</option>
					</select>
					<xsl:text>-</xsl:text>
					<select name="end_day" disabled="disabled">
						<option/>
					</select>
					<xsl:text>-</xsl:text>
					<select name="end_year">
						<option/>
						<option value="1861">1861</option>
						<option value="1862">1862</option>
						<option value="1863">1863</option>
						<option value="1864">1864</option>
						<option value="1865">1865</option>
					</select> concluding <span id="validationField"/>
					<br/>
					<br/>
					<b>State</b>
					<br/>
					<select name="state">
						<option/>
						<option value="Md.">Maryland</option>
						<option value="N.C.">North Carolina</option>
						<option value="Pa.">Pennsylvania</option>
						<option value="Va.">Virginia</option>
						<option value="D.C.">Washington, D.C.</option>
						<option value="W.Va.">West Virginia</option>
					</select>
					<br/>
					<br/>
					<b>Commander</b>
					<br/>
					<select name="commander" size="5">
						<option/>
						<option value="Capt. A. W. Garber">Capt. A. W. Garber</option>
						<option value="Capt. Asher W. Garber">Capt. Asher W. Garber</option>
						<option value="Capt. Bouldin">Capt. Bouldin</option>
						<option value="Capt. Hezekiah Easton">Capt. Hezekiah Easton</option>
						<option value="Capt. Irving (commanding a detachment)">Capt. Irving
							(commanding a detachment)</option>
						<option value="Capt. J.D. McFarland">Capt. J.D. McFarland</option>
						<option value="Capt. James MacThompson">Capt. James MacThompson</option>
						<option value="Capt. James MacThomson">Capt. James MacThomson</option>
						<option value="Capt. John Daniel Imboden">Capt. John Daniel Imboden</option>
						<option value="Capt. John G. Simpson">Capt. John G. Simpson</option>
						<option value="Capt. John M. Humphreys">Capt. John M. Humphreys</option>
						<option value="Capt. John M. Humphries">Capt. John M. Humphries</option>
						<option value="Capt. Samuel W. Paxton">Capt. Samuel W. Paxton</option>
						<option value="Capt. W. L. Balthis">Capt. W. L. Balthis</option>
						<option value="Capt. William L. Balthis">Capt. William L. Balthis</option>
						<option value="Capt. William Stitt">Capt. William Stitt</option>
						<option value="Col. Abraham Spengler">Col. Abraham Spengler</option>
						<option value="Col. Charles E. Thorburn">Col. Charles E. Thorburn</option>
						<option value="Col. David B. M'Kibbin">Col. David B. M'Kibbin</option>
						<option value="Col. Fitzhugh Lee">Col. Fitzhugh Lee</option>
						<option value="Col. J. H. Kellogg">Col. J. H. Kellogg</option>
						<option value="Col. J. H. S. Funk or Lt. Maj. H. J. Williams">Col. J. H. S.
							Funk or Lt. Maj. H. J. Williams</option>
						<option value="Col. J. Irvin Gregg">Col. J. Irvin Gregg</option>
						<option value="Col. J.E.B. Stuart">Col. J.E.B. Stuart</option>
						<option value="Col. James Cochran">Col. James Cochran</option>
						<option value="Col. James G. Elder">Col. James G. Elder</option>
						<option value="Col. James G. Elder, Lt. Col. David W. Rowe"> Col. James G.
							Elder, Lt. Col. David W. Rowe</option>
						<option value="Col. James H. Drake">Col. James H. Drake</option>
						<option value="Col. James H. Skinner">Col. James H. Skinner</option>
						<option value="Col. James Henry Drake">Col. James Henry Drake</option>
						<option value="Col. John H. S. Funk">Col. John H. S. Funk</option>
						<option value="Col. John H.S. Funk">Col. John H.S. Funk</option>
						<option value="Col. John W. Schall">Col. John W. Schall</option>
						<option value="Col. Josiah H. Kellogg">Col. Josiah H. Kellogg</option>
						<option value="Col. Kenton Harper">Col. Kenton Harper</option>
						<option value="Col. Luke Tiernan Brien">Col. Luke Tiernan Brien</option>
						<option value="Col. M.G. Harman">Col. M.G. Harman</option>
						<option value="Col. Richard Welby Carter">Col. Richard Welby Carter</option>
						<option value="Col. Thomas F. McCoy">Col. Thomas F. McCoy</option>
						<option value="Col. Thomas F. McCoy and Maj. Henry J. Sheafer">Col. Thomas
							F. McCoy and Maj. Henry J. Sheafer</option>
						<option value="Col. Wellington H. Ent">Col. Wellington H. Ent</option>
						<option value="Col. William E. Jones">Col. William E. Jones</option>
						<option value="Col. William H. S. Baylor">Col. William H. S. Baylor</option>
						<option value="Col. William Sinclair">Col. William Sinclair</option>
						<option value="First Lt. A.H. Fultz">First Lt. A.H. Fultz</option>
						<option value="Lieut Col J. Irvin Gregg">Lieut Col J. Irvin Gregg</option>
						<option value="Lt. A. W. Garber">Lt. A. W. Garber</option>
						<option value="Lt. Asher W. Garber">Lt. Asher W. Garber</option>
						<option value="Lt. Col. Anderson">Lt. Col. Anderson</option>
						<option value="Lt. Col. Charles L. Haynes">Lt. Col. Charles L. Haynes</option>
						<option value="Lt. Col. Coe Durland">Lt. Col. Coe Durland</option>
						<option value="Lt. Col. David W. Rowe">Lt. Col. David W. Rowe</option>
						<option value="Lt. Col. Elias S. Troxell">Lt. Col. Elias S. Troxell</option>
						<option value="Lt. Col. Frederick G. Skinner">Lt. Col. Frederick G. Skinner</option>
						<option value="Lt. Col. J. H. Skinner">Lt. Col. J. H. Skinner</option>
						<option value="Lt. Col. J. MacThompson- Capt. Emanuel D. Roath">Lt. Col. J.
							MacThompson- Capt. Emanuel D. Roath</option>
						<option value="Lt. Col. James H. Skinner">Lt. Col. James H. Skinner</option>
						<option value="Lt. Col. James Q. Anderson">Lt. Col. James Q. Anderson</option>
						<option value="Lt. Col. John D. Lilley">Lt. Col. John D. Lilley</option>
						<option value="Lt. Col. John H.S. Funk">Lt. Col. John H.S. Funk</option>
						<option value="Lt. Col. John K. Robinson">Lt. Col. John K. Robinson</option>
						<option value="Lt. Col. John K. Robison">Lt. Col. John K. Robison</option>
						<option value="Lt. Col. L. Tiernan Brien">Lt. Col. L. Tiernan Brien</option>
						<option value="Lt. Col. Lorenzo D. Rogers">Lt. Col. Lorenzo D. Rogers</option>
						<option value="Lt. Col. W. Wallace Ricketts">Lt. Col. W. Wallace Ricketts</option>
						<option value="Lt. Col. Wellington H. Ent">Lt. Col. Wellington H. Ent</option>
						<option value="Lt. Col. William Augustine Morgan">Lt. Col. William Augustine
							Morgan</option>
						<option value="Lt. William Stitt">Lt. William Stitt</option>
						<option value="Maj. Coe Durland">Maj. Coe Durland</option>
						<option value="Maj. H. J. Williams">Maj. H. J. Williams</option>
						<option value="Maj. H.J. Williams">Maj. H.J. Williams</option>
						<option value="Maj. James Henry Drake">Maj. James Henry Drake</option>
						<option value="Maj. John D. Lilley">Maj. John D. Lilley</option>
						<option value="Maj. Oliver B. Knowles">Maj. Oliver B. Knowles</option>
						<option value="Maj. Reuben Reinhold">Maj. Reuben Reinhold</option>
						<option value="Maj. Seth T. Kennedy">Maj. Seth T. Kennedy</option>
						<option value="Maj. Wellington H. Ent">Maj. Wellington H. Ent</option>
						<option value="Maj. William A. West">Maj. William A. West</option>
						<option value="Maj. William H. Fry">Maj. William H. Fry</option>
						<option value="n.a.">n.a.</option>
					</select>
					<br/>
					<br/>
					<input type="submit" value="Start Search" id="search_button"/>
					<input type="reset" value="Clear Form"/>
					<br/>
					<br/>
					<br/>
					<hr width="80%"/>
					<center>
						<a href="/VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0"
								alt=""/>
						</a>
					</center>
					</form>
</center>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
