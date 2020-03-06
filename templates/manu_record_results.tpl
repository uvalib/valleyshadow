<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:cinclude="http://apache.org/cocoon/include/1.0">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Census Search Results</title>
				<link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">
				<link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

				</head>
   <body vlink="#00009C" link="#CD7F32" bgcolor="#FFFFFF">
      <center><img src="/VoS/images/images/vtitle4.gif"></center>
      <h1><font color="#990000">
            <center>Augusta County - 1860
               							Manufacturing Census
            </center></font></h1>
      <p class="citation-help"><b>Please cite results as coming from:</b>Augusta County, Virginia, 1860 Manufacturing Census</br> Valley of
         					the Shadow: Two Communities in the American Civil War, Virginia Center for
         					Digital History, University of Virginia
         					<br>({{ .FURL }}?{{ .QS }}).
      </p>
      <p class="citation-help"><b>Please cite results as coming from:</b>{{ getcounty .County }} County, {{ getyear .Year}}, {{ getyear .Year }} Manufacturing Census, Valley of
         					the Shadow: Two Communities in the American Civil War, Virginia Center for
         					Digital History, University of Virginia</br>
         					(/{{ .QS }}).</p>
      <table border="0">
            {{range .Docs}}

         <tr>
            <td bgcolor="#ffcc99"><b>Basic Information</b></td>
            <td></td>
         </tr>
         <tr>
            <td>
               <table border="0">
                  <tr>
                     <td align="right"><b>Business Name:</b></td>
                     <td align="left">{{ .name }}</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Location:</b></td>
                     <td align="left">{{ .location}}</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Business Type:</b></td>
                     <td align="left">{{ .business }}</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Capital Investment:</b></td>
                     <td align="left">{{ .cap_inv }}</td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td bgcolor="#ffcc99"><b>Workers</b></td>
            <td></td>
         </tr>
         <tr>
            <td>
               <table border="0">
                  <tr>
                     <td align="right"><b>Number of Male Workers:</b></td>
                     <td align="left">{{ .male_hands }}</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Number of Female Workers:</b></td>
                     <td align="left">{{ .female_hands }}</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Number of Children Workers:</b></td>
                     <td align="left">0</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Total Wages:</b></td>
                     <td align="left"></td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td bgcolor="#ffcc99"><b>Wages</b></td>
            <td></td>
         </tr>
         <tr>
            <td>
               <table border="0">
                  <tr>
                     <td align="right"><b>Male Wages:</b></td>
                     <td align="left">{{ .male_wage }}</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Female Wages:</b></td>
                     <td align="left">{{ .femnale_wage }}</td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td bgcolor="#ffcc99"><b>Products (Annual)</b></td>
            <td></td>
         </tr>
         <tr>
            <td colspan="2">
               <table cellpadding="3" cellspacing="0" border="1">
                  <tr>
                     <td><b>Kinds of Products</b></td>
                     <td><b>Quantity of Products</b></td>
                     <td><b>Value of Products</b></td>
                  </tr>
                  <tr>
                     <td>{{ .kinds_annual }} </td>
                     <td>{{ .qty_annual }}</td>
                     <td>{{ .val_annual }}</td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td bgcolor="#ffcc99"><b>Raw Materials (Annual)</b></td>
            <td></td>
         </tr>
         <tr>
            <td colspan="2">
               <table cellpadding="3" cellspacing="0" border="1">
                  <tr>
                     <td><b>Kinds of Raw Materials</b></td>
                     <td><b>Quantity of Raw Materials</b></td>
                     <td><b>Value of Raw Materials</b></td>
                  </tr>
                  <tr>
                     <td>{{ .kinds_raw }}</td>
                     <td>4000 lbs.</td>
                     <td>1000</td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td bgcolor="#ffcc99"><b>Power</b></td>
            <td></td>
         </tr>
         <tr>
            <td>
               <table border="0">
                  <tr>
                     <td align="right"><b>Power Source:</b></td>
                     <td align="left">{{ .power }}</td>
                  </tr>
               </table>
            </td>
         </tr>
         <tr>
            <td bgcolor="#ffcc99"><b>Census Record Information</b></td>
            <td></td>
         </tr>
         <tr>
            <td>
               <table border="0">
                  <tr>
                     <td align="right"><b>Page Number:</b></td>
                     <td align="left">{{ .page_num }}</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Number on Page:</b></td>
                     <td align="left">{{ .num_on_page }}</td>
                  </tr>
                  <tr>
                     <td align="right"><b>Notes:</b></td>
                     <td align="left">{{ .notes }}</td>
                  </tr>
               </table>
            </td>
         </tr>
         {{ end }}
      </table>
      <p><a href="javascript:history.go(-1)">go back to search results page</a><br><a href="manu_census">New Search</a></p>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
