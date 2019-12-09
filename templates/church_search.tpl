<!DOCTYPE html >
<html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Valley of the Shadow: Church Records Search</title>
      <style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
       <link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">      
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="../VoS/javascript/church_search.js" type="text/javascript"></script>
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
                        <td align="center"><a href="../VoS/church1.html"><b>Return to<br> Church Home</b></a></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/reference/tips.html"><b>Tips for Searching</b></a><br></td>
                     </tr>
                  </table>
               </td>
               <td>
                  <center><img src="../VoS/images/images/vtitle4.gif"></center><br><br><p>
                     <h1 class="red-head"><b>
                           <center> Search the Church Records </center></b></h1>
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
                     									searchable databases. 
                     <p>You can search the database by name or
                        										church. 
                     </p>
                  </blockquote>
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
            <form method="get" action="/church_search_results.html" name="churchSearchForm"><input name="q" id="query" type="hidden"><input value="50" name="rows" type="hidden"><input value="0" name="start" type="hidden"><input value="last asc, first asc" name="sort" type="hidden"><table cellpadding="10">
                  <tr>
                     <td colspan="4" align="center"><input value="Initiate Search" id="search_button" type="submit"><input value="Clear" type="reset"></td>
                  </tr>
                  <tr>
                     <td align="right">Last Name:</td>
                     <td><input value="" type="text" name="last"></td>
                     <td align="right">First Name:</td>
                     <td><input value="" type="text" name="first"></td>
                  </tr>
                  <tr>
                     <td align="right">Church:</td>
                     <td colspan="3" align="left"><select name="church">
                           <option>Please make a selection</option>
                           <option class="church_aug" value="[* TO *]">Search All
                              												Augusta Churches
                           </option>
                           <option class="church_fr" value="[* TO *]">Search All
                              												Franklin Churches
                           </option>
                           <option></option>
                           <option class="church_aug" value="First Presbyterian Church">First Presbyterian Church -
                              												Augusta
                           </option>
                           <option class="church_aug" value="St. Francis of Assisi Parish">St. Francis of Assisi Parish -
                              												Augusta
                           </option>
                           <option class="church_aug" value="Trinity Episcopal Church">Trinity Episcopal Church -
                              												Augusta
                           </option>
                           <option class="church_aug" value="Saint John\'s German Reformed Lutheran Church">Saint John's German
                              												Reformed/Lutheran Church - Augusta
                           </option>
                           <option></option>
                           <option class="church_fr" value="Burnt Cabins Presbyterian Church">Burnt Cabins Presbyterian Church -
                              												Franklin
                           </option>
                           <option class="church_fr" value="Lower Path Valley Presbyterian Church">Lower Path Valley Presbyterian
                              												Church - Franklin
                           </option>
                           <option class="church_fr" value="Salem Evangelical Lutheran Church">Salem Evangelical Lutheran Church
                              												- Franklin
                           </option>
                           <option class="church_fr" value="Second Evangelical Lutheran Church">Second Evangelical Lutheran Church
                              												- Franklin
                           </option>
                           <option class="church_fr" value="Zion Evangelical Lutheran Church">Zion Evangelical Lutheran Church -
                              												Franklin
                           </option>
                           <option class="church_fr" value="Mount Zion Lutheran Church">Mount Zion Lutheran Church -
                              												Franklin
                           </option>
                           <option class="church_fr" value="Reverend J. Smith Gordon Journal">Reverend J. Smith Gordon Journal -
                              												Franklin
                           </option>
                           <option class="church_fr" value="Falling Spring Presbyterian Church">Falling Spring Presbyterian Church
                              												- Franklin
                           </option>
                           <option class="church_fr" value="Reformed Mennonite Church">Reformed Mennonite Church -
                              												Franklin
                           </option>
                           <option class="church_fr" value="Waynesboro Methodist Episcopal Church">Waynesboro Methodist Episcopal
                              												Church - Franklin
                           </option>
                           <option value="Saint Paul\'s Methodist Episcopal Church - Franklin">Saint Paul's Methodist Episcopal Church -
                              											Franklin
                           </option></select></td>
                  </tr>
               </table>
            </form>
         </center><br><hr width="80%">
         <center><a href="../VoS/choosepart.html"><img alt="" border="0" src="../VoS/images/graphics/full7.gif"></a></center>
      </div>
      <div id="search"></div>
   <script src="http://valley.lib.virginia.edu/javascript/libtools.js" type="text/javascript"></script></body>
</html>