<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <title>Valley of the Shadow: Census Search Results</title>

        <link rel="stylesheet" type="text/css" href="../VoS/css/valleyshadow.css">
        <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
        <script src="../VoS/javascript/census-thickbox.js" type="text/javascript"></script>

				</head>
   <body vlink="#00009C" link="#CD7F32" bgcolor="#FFFFFF">
      <center><img src="/VoS/images/images/vtitle4.gif"></center>
      <h1 class="red-head">
         <center>Augusta County, Virginia, 1860 Slaveowners Census Census </center>
      </h1><br><center><p><b>Please cite results as coming from:</b> Augusta County, Virginia, 1860
         					Slaveowners Census Census</br> Valley of the Shadow: Two Communities in the American
         					Civil War, Virginia Center for Digital History, University of Virginia</br>
         						({{ .QS }}).
      </p></center>
      {{range .Docs}}
      <center>
      <table class="record" border="0">
         <tr>
            <th colspan="4"><b>Slaveowner Information</b></th>
         </tr>
         <tr>
            <td class="left" colspan="2"><b>Slaveowner Name:</b></td>
            <td class="right" colspan="2">{{ .first }} {{ .last }}</td>
         </tr>
         <tr>
            <td class="left" colspan="2"><b>Location:</b></td>
            <td>{{ .location }}</td>
         </tr>
         <tr>
            <th colspan="4"><b>Employer Information</b></th>
         </tr>
         <tr>
            <td class="left" colspan="2"><b>Employer Name:</b></td>
            <td class="right" colspan="2"></td>
         </tr>
         <tr>
            <td class="left" colspan="2"><b>Employer Location:</b></td>
            <td class="right" colspan="2"></td>
         </tr>
         <tr></tr>
         <tr>
            <th colspan="4"><b>Slave Holdings</b></th>
         </tr>
         <tr>
            <td class="left race" colspan="1"><b>Black Slaves:</b></td>
            <td class="right" colspan="1">{{ .black_slaves }}</td>
            <td class="left gender" colspan="1"><b>Male Slaves: </b></td>
            <td class="right" colspan="1">{{ .male_slaves }}</td>
         </tr>
         <tr>
            <td class="left race" colspan="1"><b>Mulatto Slaves:</b></td>
            <td class="right" colspan="1">
            {{ .mulatto_slaves }}</td>
            <td class="left gender" colspan="1"><b>Female Slaves:</b></td>
            <td class="right" colspan="1">{{ .female_slaves}}</td>
         </tr>
         <tr>
            <td class="left" colspan="1"><b>Total Slaves:</b></td>
            <td class="right" colspan="1">{{ .total_slaves }}</td>
            <td colspan="2"></td>
         </tr>
      </table>
    </center>
      {{ end }}
      <p><a href="javascript:history.go(-1)">go back to search results page</a><br><a href="slave_census">New Search</a></p>
      <hr width="80%">
      <center><a href="../VoS/choosepart.html"><img alt="" border="0" src="/VoS/images/graphics/full7.gif"></a></center>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
