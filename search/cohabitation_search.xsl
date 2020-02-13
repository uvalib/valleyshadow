<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:template match="/">
		<html>
			<head>
				<title>Valley of the Shadow: Cohabitation Records 1866</title>
				<link type="text/css" rel="stylesheet" href="search.css"/>
				<script type="text/javascript" src="javascript/jquery-1.2.1.js"/>
				<script type="text/javascript" src="javascript/cohabitation_search.js"/>
				<script type="text/javascript" src="javascript/thickbox.js"/>
				<style> body { text-align: center; } div#wrapper { margin:5px auto; width: 700px;
					text-align: left; } div#husbandInfo { padding: 10px; width: 500px; float: left;
					} div#wifeInfo { padding: 10px; width: 350px; float: left; } div#generalInfo {
					padding: 30px 10px 10px 10px; clear: both; width: 600px; } .musterTableHead {
					background-color:#D3D1AC; font-size:12px; } .musterTableBody {
					background-color:#D3D1BC; font-size:12px; } .rowodd { width: 450px; height:
					25px; margin: 8px; font-family:verdana, arial; font-size: 12px; } .roweven {
					width: 450px; height: 25px; margin: 8px; font-family:verdana, arial; font-size:
					12px; } .label { float:left; text-align: right; width: 225px; padding: 5px;
					background-color: #CFCFCF; } .content { float:right; text-align:left; width:
					200px; padding: 5px; } input { font-family:verdana, arial; font-size: 12px; }
					option { font-family:verdana, arial; font-size: 12px; } 
					.red-head {color: #990000; font-family: times, serif; font-weight: bold } 
					.warning{font-weight:bold; padding:5px; color:#000099;} </style>
			</head>

			<body bgcolor="#FFFFFF" link="#CD7F32" vlink="#00009C">
				<div style="width:100%;text-align:center;" id="no-javascript">
				<h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
				</div>
				<div id="form">
				<form name="cohabitationSearchForm" action="cohabitation_search_results.html" method="GET">
					<input type="hidden" id="query" name="q"/>
					<input type="hidden" name="rows" value="50"/>
					<input type="hidden" name="start" value="0"/>
					<div id="wrapper">
						<center>
							<img src="/VoS/images/images/vtitle4.gif"
								border="0"/>
							<h2 class="red-head">Search the Cohabitation Records</h2>
							<a href="VoS/freedmen1.html">Return to Bureau Home</a> | <a
								href="VoS/fbureau/aboutcohab.html">About the Cohabitation Records</a>
						</center>
						<hr/>
						<div id="husbandInfo">
							<div class="rowodd">
								<div class="label">Husband's Last Name Starts with:</div>

								<div class="content">
									<select name="cohab_husband_last_name">
										<option value="">Select One...</option>
										<option value="A*">A - 24</option>
										<option value="B*">B - 112</option>
										<option value="C*">C - 65</option>
										<option value="D*">D - 25</option>
										<option value="E*">E - 6</option>
										<option value="F*">F - 24</option>
										<option value="G*">G - 36</option>
										<option value="H*">H - 65</option>
										<option value="I*">I - 5</option>
										<option value="J*">J - 81</option>
										<option value="K*">K - 13</option>
										<option value="L*">L - 31</option>
										<option value="M*">M - 66</option>
										<option value="N*">N - 13</option>
										<option value="O*">O - 8</option>
										<option value="P*">P - 43</option>
										<option value="Q*">Q - 1</option>
										<option value="R*">R - 42</option>
										<option value="S*">S - 74</option>
										<option value="T*">T - 43</option>
										<option value="U*">U - 0</option>
										<option value="V*">V - 12</option>
										<option value="W*">W - 104</option>
										<option value="X*">X - 0</option>
										<option value="Y*">Y - 0</option>
										<option value="Z*">Z - 0</option>
									</select>
								</div>
							</div>

							<div class="roweven">
								<div class="label">Husband's Occupation:</div>
								<div class="content">
									<select name="cohab_husband_occupation">
										<option value="">Select One...</option>
										<option>Baker</option>
										<option>Bar Keeper</option>
										<option>Barber</option>
										<option>Blacksmith</option>
										<option>Brick Layer</option>
										<option>Brick Maker</option>
										<option>Brick Moulder</option>
										<option>Butcher</option>
										<option>Carpenter</option>
										<option>Carriage Maker</option>
										<option>Chair Maker</option>
										<option>Cook</option>
										<option>Cooper</option>
										<option>Farmer</option>
										<option>"Farmer*Laborer"</option>
										<option>Forgeman</option>
										<option>Furnace</option>
										<option>Gardner</option>
										<option>Hostler</option>
										<option>Hotel Servant</option>

										<option>Iron Works</option>
										<option>Laborer</option>
										<option>Lime Burner</option>
										<option>Mason</option>
										<option>Musician</option>
										<option>Porter</option>

										<option>Potter</option>
										<option>Preacher</option>
										<option>Railroad</option>
										<option>Saddler</option>
										<option>Saloon Keeper</option>
										<option>Saw Mill</option>

										<option>Servant</option>
										<option>Shoe Master</option>
										<option>Shoemaker</option>
										<option>Silversmith</option>
										<option>Soapmaker</option>
										<option>Stable Keeper</option>

										<option>Stage Driver</option>
										<option>Steward</option>
										<option>Tanner</option>
										<option>Teamster</option>
										<option>Wagon Maker</option>
										<option>Wagoner</option>

										<option>Waiter</option>
										<option>Whitewasher</option>
									</select>
								</div>
							</div>
							<div class="rowodd">
								<div class="label">Husband's Birth Place:</div>

								<div class="content">
									<select name="cohab_husband_birth_place">
										<option value="">Select One...</option>
										<option>Albemarle Co., VA</option>
										<option>Alleghany Co., VA</option>
										<option>Amherst Co., VA</option>

										<option>Augusta Co., VA</option>
										<option>Bath Co., VA</option>
										<option>Bedford Co., VA</option>
										<option>Berkeley Co., WV</option>
										<option>Bertie Co., NC</option>
										<option>Botetourt Co., VA</option>

										<option>Buckingham Co., VA</option>
										<option>Campbell Co., VA</option>
										<option>Caroline Co., VA</option>
										<option>Charles Co., MO</option>
										<option>Charlotte Co., VA</option>
										<option>Chesterfield Co., VA</option>

										<option>Clarke Co., VA</option>
										<option>Culpeper Co., VA</option>
										<option>Danville, VA</option>
										<option>Eastport, VA</option>
										<option>Fauquier Co., VA</option>
										<option>Florida</option>

										<option>Fluvanna Co., VA</option>
										<option>Franklin Co., VA</option>
										<option>Frederick Co., VA</option>
										<option>Georgia</option>
										<option>Gilford, NC</option>
										<option>Glenville, WV</option>

										<option>Gloucester Co., VA</option>
										<option>Goochland Co., VA</option>
										<option>Grayson Co., VA</option>
										<option>Greenbrier Co. WV</option>
										<option>Greene Co., VA</option>
										<option>Greensville Co., VA</option>

										<option>Hanover Co., VA</option>
										<option>Henrico Co., VA</option>
										<option>Highland Co., VA</option>
										<option>Jefferson Co., WV</option>
										<option>Kentucky</option>
										<option>King &amp; Queen Co., VA</option>

										<option>King William Co., VA</option>
										<option>Loudoun Co., VA</option>
										<option>Louisa Co., VA</option>
										<option>Louisburg, VA</option>
										<option>Madison Co., VA</option>
										<option>Maryland</option>

										<option>McGraw, (VA?)</option>
										<option>Mecklenburg Co., NC</option>
										<option>Monroe Co., WV</option>
										<option>Montgomery Co., VA</option>
										<option>Morefield, VA</option>
										<option>Nashville, TN</option>

										<option>Nelson Co., KY</option>
										<option>Nelson Co., VA</option>
										<option>New Kent Co., VA</option>
										<option>New Market, VA</option>
										<option>Norfolk, VA</option>
										<option>Northampton Co., VA</option>

										<option>Northumberland Co., VA</option>
										<option>Nottoway Co., VA</option>
										<option>Orange Co., VA</option>
										<option>Page Co., VA</option>
										<option>Pennsylvania</option>
										<option>Point Pleasant, WV</option>
										<option>Powhatan Co., VA</option>

										<option>Prince Edward Co., VA</option>
										<option>Prince George Co., VA</option>
										<option>Randolph Co., WV</option>
										<option>Rappahannock Co., VA</option>
										<option>Richmond, VA</option>
										<option>Rockbridge Co., VA</option>

										<option>Rockingham Co., VA</option>
										<option>Shenandoah Co., VA</option>
										<option>Smithfield, VA</option>
										<option>Spotsylvania Co., VA</option>
										<option>Staunton, VA</option>
										<option>Sussex Co., VA</option>

										<option>Virginia</option>
										<option>Warren Co., VA</option>
										<option>Washington Co., VA</option>
										<option>Wayne, WV</option>
										<option>Westmoreland Co., VA</option>

									</select>

								</div>
							</div>
							<div class="roweven">
								<div class="label">Husband's Age:</div>
								<div class="content"> Min<input type="text"
										name="cohab_husband_age_min" size="4"/> Max<input type="text"
										name="cohab_husband_age_max" size="4"/>
								</div>

							</div>
							<div class="rowodd">
								<div class="label">Wife's Last Name Starts with:</div>
								<div class="content">
									<select name="cohab_wife_last_name">
										<option value="">Select One...</option>
										<option value="A*">A - 24</option>
										<option value="B*">B - 108</option>
										<option value="C*">C - 64</option>
										<option value="D*">D - 34</option>
										<option value="E*">E - 5</option>
										<option value="F*">F - 27</option>
										<option value="G*">G - 39</option>
										<option value="H*">H - 59</option>
										<option value="I*">I - 1</option>
										<option value="J*">J - 53</option>
										<option value="K*">K - 19</option>
										<option value="L*">L - 30</option>
										<option value="M*">M - 53</option>
										<option value="N*">N - 5</option>
										<option value="O*">O - 5</option>
										<option value="P*">P - 42</option>
										<option value="Q*">Q - 1</option>
										<option value="R*">R - 43</option>
										<option value="S*">S - 70</option>
										<option value="T*">T - 41</option>
										<option value="U*">U - 1</option>
										<option value="V*">V - 11</option>
										<option value="W*">W - 90</option>
										<option value="X*">X - 0</option>
										<option value="Y*">Y - 4</option>
										<option value="Z*">Z - 0</option>
									</select>
								</div>
							</div>
							<div class="roweven">
								<div class="label">Wife's Birth Place:</div>
								<div class="content">
									<select name="cohab_wife_birth_place">
										<option value="">Select One...</option>
										<option>Alabama</option>
										<option>Albemarle Co., VA</option>
										<option>Alleghany Co., VA</option>
										<option>Amelia Co., VA</option>
										<option>Amherst Co., VA</option>
										<option>Augusta Co., VA</option>

										<option>Bath Co., VA</option>
										<option>Bedford Co., VA</option>
										<option>Berkeley Co., WV</option>
										<option>Botetourt Co., VA</option>
										<option>Brunswick Co., VA</option>
										<option>Buckingham Co., VA</option>

										<option>Campbell Co., VA</option>
										<option>Caroline Co., VA</option>
										<option>Charlestown, WV</option>
										<option>Chesterfield Co., VA</option>
										<option>Clarke Co., VA</option>
										<option>Culpeper Co., VA</option>

										<option>Cumberland Co., VA</option>
										<option>Deerfield, VA</option>
										<option>Dinwiddie Co., VA</option>
										<option>Essex Co., VA</option>
										<option>Fairfax Co., VA</option>
										<option>Fauquier Co., VA</option>

										<option>Fluvanna Co., VA</option>
										<option>Frederick Co., VA</option>
										<option>Georgetown, DC</option>
										<option>Georgia</option>
										<option>Gloucester Co., VA</option>
										<option>Goochland Co., VA</option>

										<option>Greenbrier Co., WV</option>
										<option>Greene Co., VA</option>
										<option>Greensville Co., VA</option>
										<option>Halifax Co., VA</option>
										<option>Hampshire Co., VA</option>
										<option>Hanover Co., VA</option>

										<option>Hardy Co., WV</option>
										<option>Henrico Co., VA</option>
										<option>Highland Co., VA</option>
										<option>Jefferson Co., WV</option>
										<option>Kentucky</option>
										<option>King William Co., VA</option>

										<option>Loudoun Co., VA</option>
										<option>Louisa Co., VA</option>
										<option>Lynchburg, VA</option>
										<option>Madison Co., VA</option>
										<option>Maryland</option>
										<option>Monroe Co., WV</option>

										<option>Mt. Seller, Georgia</option>
										<option>Mt. Sidney, VA</option>
										<option>Nelson Co., VA</option>
										<option>North Carolina</option>
										<option>Northampton Co., VA</option>
										<option>Orange Co., VA</option>

										<option>Page Co., VA</option>
										<option>Pendleton Co., WV</option>
										<option>Pocahontas Co., WV</option>
										<option>Prince Edward Co., VA</option>
										<option>Prince William Co., VA</option>
										<option>Rappahannock Co., VA</option>

										<option>Rockbridge Co., VA</option>
										<option>Rockingham Co., VA</option>
										<option>Savannah, GA</option>
										<option>Shenandoah Co., VA</option>
										<option>Snow Hill, NC</option>
										<option>Spotsylvania Co., VA</option>

										<option>Stafford Co., VA</option>
										<option>Staunton, VA</option>
										<option>Surry Co., VA</option>
										<option>Tuckahoe, VA</option>
										<option>Virginia</option>
										<option>Washington Co., VA</option>

										<option>Washington, DC</option>
										<option>Wellsboro, VA</option>
										<option>West Virginia</option>
										<option>Winchester, VA</option>
									</select>
								</div>
							</div>

							<div class="rowodd">
								<div class="label">Wife's Age:</div>
								<div class="content">Min<input name="cohab_wife_age_min" type="text"
										size="4"/> Max<input name="cohab_wife_age_max" type="text"
										size="4"/></div>
							</div>

							<div class="roweven">
								<div class="label">Current Residence:</div>

								<div class="content">
									<select name="cohab_current_residence">
										<option value="">Select One...</option>
										<option>[No entry]</option>
										<option>17 miles East</option>
										<option>Antioch Church</option>
										<option>Augusta County</option>

										<option>Augusta Springs</option>
										<option>Barter Brook</option>
										<option>Blackburns Furnace</option>
										<option>Body Brook</option>
										<option>Bostleburg</option>
										<option>Bridgewater</option>

										<option>Brownsburg</option>
										<option>Buffalo Gap</option>
										<option>Bunkertown</option>
										<option>Burketown</option>
										<option>Centresville</option>
										<option>Christies Creek</option>

										<option>Churchville</option>
										<option>Connly's Sham</option>
										<option>Conrads Store</option>
										<option>Coopers Mountain</option>
										<option>Craigsville</option>
										<option>Crawford Springs</option>

										<option>Crystal Creek</option>
										<option>Deerfield</option>
										<option>Ela Ran Church</option>
										<option>Elizabeth Furnace</option>
										<option>Elk Run Church</option>
										<option>Elk Widow Cridlys*</option>

										<option>Esterline Furnace</option>
										<option>Fairfield, Rockbridge Co.</option>
										<option>Fellowship Church</option>
										<option>Fenriers' Furnace, Rockingham Co.</option>
										<option>Fishersville</option>
										<option>Fords Furnace</option>

										<option>Free ------- *</option>
										<option>Fridens Church</option>
										<option>Fulriers Township*</option>
										<option>Greenville</option>
										<option>Harbor Hill</option>
										<option>Harrisonburg</option>

										<option>Inrleytown</option>
										<option>James' Gap</option>
										<option>Jennings Gap</option>
										<option>Jones Gap</option>
										<option>Lacey Spring</option>
										<option>Lindlis Green</option>

										<option>Macgahesville</option>
										<option>McDowell</option>
										<option>Medway</option>
										<option>Megagesville *</option>
										<option>Middlebook</option>
										<option>Midway</option>

										<option>Millbrook</option>
										<option>Mint Spring</option>
										<option>Moscow</option>
										<option>Moss Creek</option>
										<option>Mount Clinton, Rockingham Co.</option>
										<option>Mount Crawford</option>

										<option>Mount Meridian</option>
										<option>Mount Sidney</option>
										<option>Mount Solon</option>
										<option>Mount Vernon</option>
										<option>Muddy Creek</option>
										<option>New Hope</option>

										<option>New Market, Rockingham Co.</option>
										<option>New Meghaghesin</option>
										<option>New Port</option>
										<option>Newport</option>
										<option>Newtown</option>
										<option>North Mountain</option>

										<option>Parnassas</option>
										<option>Port Republic, Rockingham Co.</option>
										<option>Posfern Pottery</option>
										<option>Postal Hill</option>
										<option>Rock Spring</option>
										<option>Saugersville</option>

										<option>Sellers, West View</option>
										<option>Spring Hill</option>
										<option>Staunton</option>
										<option>Stribling Springs</option>
										<option>Summer Dean</option>
										<option>Suranda</option>

										<option>Swopes Depot</option>
										<option>Tinkling Spring</option>
										<option>Valley Mill</option>
										<option>War Branch</option>
										<option>Warm Springs</option>
										<option>Waynesboro</option>

										<option>West View</option>
										<option>Westfield</option>
										<option>Westview</option>
										<option>Willow Spout</option>

									</select>
								</div>

							</div>
							<div class="rowodd">
								<div class="label">Number of Children:</div>
								<div class="content">
									<xsl:text>Min</xsl:text>
									<input name="cohab_num_children_min" type="text" size="4"/>
									<xsl:text>Max</xsl:text>
									<input name="cohab_num_children_max" type="text" size="4"/>
								</div>
							</div>

							<div class="roweven">
								<div class="label">Sort the Records By:</div>
								<div class="content">
									<select name="sort">
										<option value="cohab_report_date asc">Report Date</option>
										<option value="cohab_husband_last_name asc">Husband Last Name</option>
										<option value="cohab_wife_last_name asc">Wife Last Name</option>
										<option value="cohab_husband_birth_place asc">Husband Birth
											Place</option>
										<option value="cohab_wife_birth_place asc">Wife Birth Place</option>
										<option value="cohab_husband_occupation asc">Husband Occupation</option>
										<option value="cohab_current_residence asc">Current Residence</option>
										<option value="cohab_num_children asc">Number of
										Children</option>
									</select>
								</div>
							</div>

							<input type="submit" id="search_button" value="Submit"/>
							<input id="Reset" type="reset" value="Reset"/>
						</div>

						<br clear="all"/>
						<hr/>
					</div>

					<center>
						<a href="VoS/choosepart.html">
							<img src="/VoS/images/graphics/full7.gif" border="0"
								alt=""/>
						</a>
					</center>
				</form>
				</div>
				<div id="search"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
