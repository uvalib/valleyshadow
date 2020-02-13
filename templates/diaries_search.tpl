<html>
<head>
 <title>Valley of the Shadow: Diaries</title>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta content="The Valley of the Shadow is an electronic archive of two communities
 in the American Civil War--Augusta County, Virginia, and Franklin County, Pennyslvania.
 The Valley Web site includes searchable newspapers, population census data, agricultural
 census data, manufacturing census data, slaveowner census data, and tax records.
 The Valley Web site also contains letters and diaries, images, maps, church records,
 and military rosters. The Valley project is a University ofVirginia research project
 funded in part by the National Endowment of the Humanities."
 name="description" />
 <!--   The Valley of the Shadow is an electronic archive of two communities
 in the American Civil War==Augusta County, Virginia, and Franklin County, Pennyslvania.  The
 Valley Web site includes searchable newspapers, population census data,
 agricultural census data, manufacturing census data, slaveowner census
 data, and tax records.  The Valley Web site also contains letters and
 diaries, images, maps, church records, and military rosters.  The Valley Project is a
 University of Virginia research project funded in part by the National
 Endowment for the Humanities. -->
 <meta content="United States Civil War American history Virginia Pennsylvania military
 geneology archive" name="keywords" />

 <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
 <link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css" />
 <script type="text/javascript" src="../VoS/javascript/jquery-1.2.1.js" ></script>
 <script type="text/javascript" src="../VoS/javascript/diaries_search.js"></script>
 <script type="text/javascript" src="../VoS/javascript/generic_search_paging.js"></script>

</head>
<body bgcolor="#FFFFFF" link="#cd7f32" vlink="#00009c">
	<div style="text-align:center;" id="no-javascript">
    <h3 class="warning">This page requires Javascript. Please ensure that you have enabled Javascript in your browser's preferences</h3>
  </div>
	<div id="form">
		<form name="diariesSearchForm" action="/diaries_search_results.html" method="get">
			<input type="hidden" id="query" name="q"><input type="hidden" name="rows" value="10">
			<input type="hidden" name="start" value="0"><div style="width:80%;text-align:center;">
			<img src="/VoS/images/images/vtitle4.gif" style="padding-left:10px;"><h2 class="red-head">Search the Valley of the Shadow Diaries</h2>
      <blockquote>
        <b>Note:</b> The wild card character is <b>*</b>. It can be substituted for any number of characters at the middle or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a full explanation.
      </blockquote>
      <hr>
      <p> Search for word or phrase: <br><input name="search_text" size="40"></p>
      <p> within </p>
      <p><select id="docs" name="docs">
        <optgroup label="region">
          <option value="">All Diaries</option>
          <option value="augusta">All Augusta County Entries</option>
          <option value="franklin">All Franklin County Entries</option>
        </optgroup>
        <optgroup label="keyword">
          <option value="African Americans">Entries including keyword:: African-Americans</option>
          <option value="Agriculture">Entries including keyword:: Agriculture</option>
          <option value="Arts/Leisure">Entries including keyword:: Arts and Leisure</option>
          <option value="Battle Description">Entries including keyword:: Battle Description</option>
          <option value="Camp Life">Entries including keyword:: Camp Life</option>
          <option value="Church/Religious Activity">Entries including keyword:: Church and Religious Activity</option>
          <option value="Death/Casualties">Entries including keyword:: Death and Casualties</option>
          <option value="Desertion/Leave">Entries including keyword:: Desertion or Leave</option>
          <option value="Family">Entries including keyword:: Family</option>
          <option value="HomeFront">Entries including keyword:: Home Front</option>
          <option value="Medicine/Hospitals">Entries including keyword:: Medicine and Hospitals</option>
          <option value="Military">Entries including keyword:: Military</option>
          <option value="Military Authority">Entries including keyword:: Military Authority</option>
          <option value="National/Government">Entries including keyword:: National Government</option>
          <option value="Prisons/Prisoners">Entries including keyword:: Prisons and Prisoners</option>
          <option value="Slavery">Entries including keyword:: Slavery</option>
          <option value="Troop Movement">Entries including keyword:: Troop Movement</option>
          <option value="Women">Entries including keyword:: Women</option>
        </optgroup>
      </select></p>
      <p><span>begin date: year <input name="begin_year" size="4"> end date: year <input name="end_year" size="4"></span></p>
      <br>Group results by
      <select id="sort" name="sort">
        <option value="">closest match</option>
        <option value="title_string asc">document title</option>
      </select>
      <div style="padding: 2em;">
        <input type="submit" value="Submit Query" id="search_button"><input type="reset" value="Clear"><br>
      </div>
      <hr>
      <center>
        <a href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" border="0" alt=""></a>
      </center>
</div>
</form>
</div>
</body>
</html>
