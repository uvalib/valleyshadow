<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><style type="text/css"> table#dossier * td { color: #990000; } table#dossier tr.data td { color: #000000;  } table#dossier tr.data td p.item { border: none; padding:5px 0 5px 0; margin:0} </style><title>Record for Wllliam George Abney</title>
  <link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />
  <link type="text/css" rel="stylesheet" href="/VoS/css/valleyshadow.css" />

   </head>
   <body vlink="#00009c" bgcolor="#ffffff" link="#cd7f32">
      <h1><font color="#990000">
            <center>Soldiers Records</center></font></h1>
      <h3><font color="#990000">
            <center>From Compiled Military Service Records at National Archives</center></font></h3>
      <center><p>Results printed below are the short version of the results of your search. Columns in bold denote columns searched on (beyond
         the basic returns of Name, service information, and enlistment information.</br> Clicking on the
         					last name of each person will allow you to see a full record for that individual.</center>
      </p>
      <center><p><b>Please cite results as coming from: </b>{{ getcounty .County }} County, {{ getstate .County }}, Soldiers Records</br> Valley of the Shadow: Two Communities in the American Civil War, Virginia Center
         for Digital History, University of Virginia </br>({{ .FURL }}?{{ .QS }}).
      </p></center>
      <div style="padding-bottom:1em;text-align:center;" class="navigationHeader">
        <a onClick="javascript:history.back()" href="javascript:history.back()"><b>Return to Search Results</b></a><br></div>
           {{range .Docs}}

      <table cellpadding="10" border="0" id="dossier">
         <tr class="heading">
            <td valign="top" bgcolor="#ffcc99"><b>Personal Information</b></td>
            <td valign="top" bgcolor="#ffcc99"><b>Enlistment Records</b></td>
         </tr>
         <tr class="data">
            <td valign="top" align="left">
               <p class="item"><b>Name:</b> {{ .first }} {{ .last }} <br></p>
               <p class="item"><b>Birth Place:</b> {{ .birth_place }}<br></p>
               <p class="item"><b>Date of Birth:</b> 8/31/1840<br></p>
               <p class="item"><b>Physical Description:</b> <br></p>
               <p class="item"><b>Prewar Life:</b>{{ .prewar }}
               </p>
            </td>
            <td valign="top" align="left">
               <p class="item"><b>Date of Enlistment:</b> {{ .month_enl }}/{{ .day_enl }}/{{ .year_enl }}<br></p>
               <p class="item"><b>Place of Enlistment:</b> {{ .place_enl}}<br></p>
               <p class="item"><b>Age at Enlistment:</b> <br></p>
               <p class="item"><b>Occupation at Enlistment:</b>Farmer <br></p>
               <p class="item"><b>Conscript or Substitute:</b>
               </p>
            </td>
         </tr>
         <tr class="heading">
            <td valign="top" bgcolor="#ffcc99"><b>Service Information</b></td>
            <td valign="top" bgcolor="#ffcc99"><b>Military Service Record</b></td>
         </tr>
         <tr class="data">
            <td valign="top" align="left">
               <p class="item"><b>Rank:</b> {{ .rank_enl }}<br></p>
               <p class="item"><b>Company:</b> {{ .company }}<br></p>
               <p class="item"><b>Transfer Company:</b> <br></p>
               <p class="item"><b>Regiment:</b> {{ .regiment }}
               </p>
            </td>
            <td valign="top" align="left">
               <p class="item"><b>Promotions:</b> {{ .promotions }}<br></p>
               <p class="item"><b>Transfers and Other Service:</b>{{ .transfers }} <br></p>
               <p class="item"><b>Muster Sheet:</b> {{ .muster_record }}<br></p>
               <p class="item"><b>Captured:</b>  <br></p>
               <p class="item"><b>Missing In Action:</b>  <br></p>
               <p class="item"><b>Prison:</b> <br></p>
               <p class="item"><b>AWOL:</b>  <br></p>
               <p class="item"><b>Deserted:</b>  <br></p>
               <p class="item"><b>Discharge:</b>  <br></p>
               <p class="item"><b>Paroled:</b> {{ .paroled_month}}/{{ .paroled_day }}/{{ .paroled_year }}<br></p>
               <p class="item"><b>Notes:</b> {{ .notes }}
               </p>
            </td>
         </tr>
         <tr class="heading">
            <td valign="top" bgcolor="#ffcc99"><b>Wounded/Killed Information</b></td>
            <td valign="top" bgcolor="#ffcc99"><b>Other Information</b></td>
         </tr>
         <tr class="data">
            <td valign="top" align="left">
               <p class="item"><b>Died of Disease:</b>  <br></p>
               <p class="item"><b>Killed in Action:</b>   <br></p>
               <p class="item"><b>Wounded in Action:</b> {{ .wia }} - {{ .wia_month }}/{{ .wia_day }}/{{ .wia_year }}<br></p>
               <p class="item"><b>Hospital:</b> {{ .hospital_record }}<br></p>
               <p class="item"><b>Died of Wounds:</b>
               </p>
            </td>
            <td valign="top" align="left">
               <p class="item"><b>Personal Life:</b> Brother of Ovid L. Abney<br></p>
               <p class="item"><b>Family Number from 1860 census:</b> <a href="census_search_results?q=db:pop_aug_60 AND family_num:{{ .family_1860 }} AND page_num:574&amp;sort=last asc, first asc&amp;county=aug&amp;year=1860&amp;rows=50&amp;start=0&amp;detailed=yes">{{ .family_1860 }}</a> (Click on number to see the 1860 census record) <br></p>
               <p class="item"><b>Dwelling Number from 1860 census:</b> <a href="census_search_results?q=db:pop_aug_60 AND dwelling_num:{{ .dwelling_1860 }} AND page_num:574&amp;sort=last asc, first asc&amp;county=aug&amp;year=1860&amp;rows=50&amp;start=0&amp;detailed=yes">{{ .dwelling_1860 }}</a> (Click on number to see the 1860 census record) <br></p>
               <p class="item"><b>Postwar Life:</b> {{ .postwar_life }}
                  obituary states he was a sharpshooter<br></p>
               <p class="item"><b>Death Place:</b> {{ .death_place}}<br></p>
               <p class="item"><b>Date of Death:</b> {{ .death_month }}/{{ .death_day }}/{{ .death_year }}<br></p>
               <p class="item"><b>Cause of Death:</b> <br></p>
               <p class="item"><b>Burial Place:</b> {{ .burial_place }}<br></p>
               <p class="item"><b>Epitaph:</b>
               </p>
            </td>
         </tr>
      </table>
      {{ end }}
      <div class="navigationFooter" style="text-align:center;">
        <a onClick="javascript:history.back()" href="javascript:history.back()"><b>Return to Search Results</b></a><br>
      </div>
      <div class="navigationFooter" style="text-align:center;"><br><a href="dossiers">Start a New Search</a><br></div>
    </br>
      <center><a href="/VoS/choosepart.html"><img src="/VoS/images/graphics/full7.gif" border="0" alt=""></a></center>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
