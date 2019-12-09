<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Manufacturing Census Search</title><style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="../VoS/javascript/manu_census_search.js" type="text/javascript"></script>
      <script src="../VoS/javascript/generic_search_paging.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
	<link rel="icon" type="image/png" href="../VoS/favicon.ico" />
      
  </head>
   <body VLINK="#00009C" LINK="#CD7F32" BGCOLOR="FFFFFF" TEXT="#000000">
      <div id="no-javascript" style="width:100%;text-align:center;">
         <h3 class="warning">This page requires Javascript.  Please ensure that you have enabled Javascript in your browser's preferences</h3>
      </div>
      <div id="form">
         <table>
            <tr>
               <td valign="center">
                  <table cellpadding="10" width="80%" border="0" bgcolor="#ffcc99">
                     <tr>
                        <td align="center"><a href="manu_adv_census"><b>Advanced Search</b></a></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/govdoc/censi/mcensus.html"><b>Information<br>About the Census</b></a></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/reference/tips.html"><b>Tips for Searching</b></a><br></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/govdoc/censi/census_new.html"><b>Return to<br> Census Home</b></a></td>
                     </tr>
                  </table>
               </td>
               <td>
                  <center><img src="../VoS/images/images/vtitle4.gif"></center><br><br><p>
                     <h1 class="red-head"><b>
                           <center> Search the U.S. Manufacturing Census for 1860
                              												and 1870<br> Basic Search 
                           </center></b></h1>
                  </p>
                  <blockquote> This page allows you to search the 1860 and 1870 U.S.
                     									Manufacturing Census in either Augusta County, VA or Franklin
                     									County, PA. This page only allows users to search on basic
                     									information found in the manufacturing census (name of owner,
                     									name of business, location of business, and type of product
                     									produced). If you would like to search on other fields found in
                     									the manufacturing census (such as capital investment,
                     									information on workers, quantity and value of prodects produced,
                     									and page number in the census record) please use the Advanced Search.<br><br> The advanced search can be accessed by following the
                     									appropriate link at the left.<br><br></blockquote>
                  <blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
                     									substituted for any number of characters at the middle
                     									or back of a word. Please see <a href="../VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
                     									full explanation. 
                  </blockquote>
               </td>
            </tr>
         </table>
         <hr>
         <center>
            <form name="manuCensusSearch" method="get" action="/manu_census_search_results.html">
               <table style="width:90%" cellpadding="10">
                  <tr><input value="" id="query" name="q" type="hidden"><input value="50" name="rows" type="hidden"><input value="0" name="start" type="hidden"><input value="" id="db" name="db" type="hidden"><input id="search_button" value="Initiate Search" type="submit"><input value="Clear" type="reset"><td></td>
                     <td id="county_cell" align="right" colspan="1">County: <input checked value="aug" name="county" type="radio">Augusta<input value="fr" name="county" type="radio">Franklin</td>
                     <td colspan="1" id="year_cell" align="center">Year: <input checked value="60" name="year" type="radio">1860<input value="70" name="year" type="radio">1870</td>
                     <td style="padding-right: 1em;" colspan="1" id="sort_options" align="left">Sort results by: <select id="sort" name="sort">
                           <option value="last asc, first asc">Last Name, First Name</option>
                           <option value="business asc">Type of Business</option>
                           <option value="kinds_annual asc">Products</option>
                           <option value="location asc">Location</option></select></td>
                  </tr>
                  <tr>
                     <td style="width:20%;" align="right"><a href="VoS/govdoc/censi/mcensus.html#company"><b>Name of Business<br>(or Owner)</b></a>:
                     </td>
                     <td style="width:30%;"><input name="name" id="name"></td>
                     <td style="width:20%;" align="right"><a href="VoS/govdoc/censi/mcensus.html#page"><b>Type of Business</b></a>:
                     </td>
                     <td style="width:30%;"><select id="business" name="business">
                           <option></option>
                           <option>[?]</option>
                           <option>Agr. Implements</option>
                           <option>Baker</option>
                           <option>Baker &amp; Confectioner</option>
                           <option>Bit Maker</option>
                           <option>Blacksmith Shop</option>
                           <option>Boot and Shoemaker</option>
                           <option>Brewer</option>
                           <option>Brickyard</option>
                           <option>Butcher</option>
                           <option>Cabinet Maker</option>
                           <option>Candles</option>
                           <option>Carriage Maker</option>
                           <option>Cement Mill</option>
                           <option>Chopping &amp; Sawmill</option>
                           <option>Chopping Mill</option>
                           <option>Cigar Manufactory</option>
                           <option>Clover Mill</option>
                           <option>Coach</option>
                           <option>Confectioner</option>
                           <option>Cooper</option>
                           <option>Daguerrotypist</option>
                           <option>Dentist</option>
                           <option>Distillery</option>
                           <option>Edge Tools</option>
                           <option>F. Shop</option>
                           <option>Flour &amp;/or Grist Mill</option>
                           <option>Foundry</option>
                           <option>Foundry &amp; Machine Shop</option>
                           <option>Furniture Manufacturer</option>
                           <option>Harness</option>
                           <option>Hatter</option>
                           <option>Iron Furnace</option>
                           <option>Iron Furnance</option>
                           <option>Lime Kiln</option>
                           <option>Lumber</option>
                           <option>Machine Shop</option>
                           <option>Manufacture of Gas</option>
                           <option>Merchant[?] Tailor</option>
                           <option>Milliner</option>
                           <option>Mining Co.</option>
                           <option>Nursery</option>
                           <option>Paper Mill</option>
                           <option>Planing Mill</option>
                           <option>Plaster Mill</option>
                           <option>Potter</option>
                           <option>Rolling Mill</option>
                           <option>Roofing[?] Mill</option>
                           <option>Rope Manufactory</option>
                           <option>Saddle &amp;/or Harness Shop</option>
                           <option>Sawmill</option>
                           <option>Silver Plate &amp; [?]</option>
                           <option>Slaughterhouse</option>
                           <option>Stone Cutter</option>
                           <option>Sumac Mill</option>
                           <option>Tailor Shop</option>
                           <option>Tannery</option>
                           <option>Tar Manufacturing</option>
                           <option>Tin and Coppersmith</option>
                           <option>Tobbaconist</option>
                           <option>W. M.[?] Shop</option>
                           <option>Wagon Maker</option>
                           <option>Windmill Manufacturer</option>
                           <option>Wool Carding</option>
                           <option>Woolen Factory</option></select></td>
                  </tr>
                  <tr>
                     <td align="right"><a href="../VoS/govdoc/censi/mcensus.html#company"><b>Products</b></a>:
                     </td>
                     <td><input size="25" name="products" id="products"></td>
                     <td align="right"><a href="../VoS/govdoc/censi/mcensus.html#page"><b>Location</b></a>:
                     </td>
                     <td><select id="location" name="location">
                           <option></option>
                           <option value="1st District">Augusta: 1st District</option>
                           <option value="North Subdiv.">Augusta: North Subdiv.</option>
                           <option value="Staunton Dist. 1">Augusta: Staunton Dist. 1</option>
                           <option value="Antrim Tshp.">Franklin: Antrim Tshp.</option>
                           <option value="Bor. of Ch\'burg">Franklin: Bor. of Ch\'burg</option>
                           <option value="Ch\'burg-S.Ward">Franklin: Ch\'burg-S.Ward</option>
                           <option value="Chambersburg">Franklin: Chambersburg</option>
                           <option value="Fannett Tshp.">Franklin: Fannett Tshp.</option>
                           <option value="Greencastle Bor.">Franklin: Greencastle Bor.</option>
                           <option value="Greene Tshp.">Franklin: Greene Tshp.</option>
                           <option value="Guilford Tshp.">Franklin: Guilford Tshp.</option>
                           <option value="Hamiton Tshp.">Franklin: Hamiton Tshp.</option>
                           <option value="LetterkennyTshp.">Franklin: LetterkennyTshp.</option>
                           <option value="Lurgan Tshp.">Franklin: Lurgan Tshp.</option>
                           <option value="Metal Tshp.">Franklin: Metal Tshp.</option>
                           <option value="Montgomery Tshp.">Franklin: Montgomery Tshp.</option>
                           <option value="Peters Tshp.">Franklin: Peters Tshp.</option>
                           <option value="Quincy Tshp.">Franklin: Quincy Tshp.</option>
                           <option value="S\'hampton Tshp.">Franklin: S\'hampton Tshp.</option>
                           <option value="St. Thomas Tshp.">Franklin: St. Thomas Tshp.</option>
                           <option value="Washington Tshp.">Franklin: Washington Tshp.</option>
                           <option value="Waynesboro">Franklin: Waynesboro</option></select></td>
                  </tr>
               </table>
            </form>
         </center><br><hr width="80%">
         <center><a href="../VoS/choosepart.html"><img alt="" border="0" src="../VoS/images/graphics/full7.gif"></a></center>
      </div>
      <div id="search"></div>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>