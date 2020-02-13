<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
<head>
 <title>Valley of the Shadow: Letters</title>
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
 <link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css" />
 <script type="text/javascript" src="../VoS/javascript/jquery-1.2.1.js" ></script>
 <script type="application/javascript" src="../VoS/javascript/letters_search.js" ></script>
</head>

<body bgcolor="#FFFFFF" link="#cd7f32" vlink="#00009c">
  <noscript>JavaScript is off. Please enable to view full site.</noscript>
  <div id="form">
      <div style="text-align:center;">
        <img src="/VoS/images/images/vtitle4.gif" style="padding-left:10px;">
        <h2 class="red-head">Search the Valley of the Shadow Letters</h2>
        <blockquote>
          <b>Note:</b> The wild card character is <b>*</b>. It can be
							substituted for any number of characters at the middle
							or back of a word. Please see <a href="/VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
							full explanation.
        </blockquote>

      <div style="padding: 2em; max-width: 90%;">
        <form name="lettersSearchForm" action="/letters_search_results.html" method="get">
          <input type="hidden" readonly name="q" id="query">
          <input type="hidden" readonly name="rows" value="50">
          <input type="hidden" readonly name="start" value="0"><hr>
          <br> Search for word or phrase: <br><input name="search_text" size="40" value=""><br> within <br>
          <select name="docs">
            <option value="all">All letters</option>
            <option value="augusta">All Augusta County letters</option>
            <option value="franklin">All Franklin County letters</option>
            <option value="bureau">All Freedmen's Bureau letters</option></select><hr width="60%" align="center"> Further constrain by <a href="/VoS/reference/letters_help/authors.html">author</a>: <br><input name="author" size="40"><br> and/or <a href="/VoS/reference/letters_help/keywords.html">keyword</a>: <br><input name="keyword" size="40"><br> and/or date range [1850-1880]: <br> begin date: year <input name="begin_year" size="4"><br>end date: year <input name="end_year" size="4"><br><br>Group results by <select name="grouping"><option value="" selected>match</option>
            <option value="title_string">work title</option>
            <option value="year">year</option></select><hr>
            <input type="submit" value="Submit Query" id="search_button"><input type="reset" value="Clear"><br><hr>
          </form>
        </div>
      </div>
</div>
<center><a href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" border="0" alt=""></a></center>

</body>
</html>
