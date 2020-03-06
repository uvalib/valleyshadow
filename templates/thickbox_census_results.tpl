<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Census Search Results</title>
				<link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">
				<link rel="icon" type="image/png" href="/VoS/images/favicon.ico" />

							</head>
   <body>
      <div style="align: center; text-align: center;" id="mainHeader"><img src="/VoS/images/images/vtitle4.gif" style="align: center;"><h1 style="color:#990000;">{{ getcounty .County }} - {{ getyear .Year }} Population </h1>

      <p style="max-width: 90%;"><b>Please cite results as coming from: </b>{{ getcounty .County }} County, {{ getstate .County }},
         						{{ getyear .Year }} Population Census</br> Valley of the Shadow: Two
         					Communities in the American Civil War, Virginia Center for Digital History,
         					University of Virginia <br><span class="recordURL" style="display:inline-block; padding-top: 1.5em;">({{ .FURL }}?{{ .QS }}).</span></p>
      </div>
     {{ range .Docs }}
      <div id="singleRecordDisplay">
         <div style="background-color:#ffcc99;width:400px;" class="recordHeader"><b>Personal Information</b></div>
         <div class="recordData">
            <ul>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Name:</div>
                  <div style="padding-left:5px;float:left;">{{ .first }} {{ .middle }} {{ .last }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Age:</div>
                  <div style="padding-left:5px;float:left;">{{ .age }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Order in Family:</div>
                  <div style="padding-left:5px;float:left;">{{ .head_num }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Sex:</div>
                  <div style="padding-left:5px;float:left;">{{ .sex }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Race:</div>
                  <div style="padding-left:5px;float:left;">{{ .color}}</div>
               </li>
              <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Occupation:</div>
                  <div style="padding-left:5px;float:left;">{{ .occupation }}</div>
               </li>
              <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Real Estate Value:</div>
                  <div style="padding-left:5px;float:left;">{{ .realest }}</div>
               </li>
              <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Personal Estate Value:</div>
                  <div style="padding-left:5px;float:left;">{{ .persest }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Birth Place:</div>
                  <div style="padding-left:5px;float:left;">{{ .birth_place }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Can Read:</div>
                  <div style="padding-left:5px;float:left;">{{ .read }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Can Write:</div>
                  <div style="padding-left:5px;float:left;">{{ .write }}</div>
               </li>
            </ul>
         </div>
         <div style="background-color:#ffcc99;width:400px;" class="recordHeader"><b>Location</b></div>
         <div class="recordData">
            <ul>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">County:</div>
                  <div style="padding-left:5px;float:left;">{{ .county }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">District:</div>
                  <div style="padding-left:5px;float:left;">{{ .district_text}}</div>
               </li>
            </ul>
         </div>
         <div style="background-color:#ffcc99;width:400px;" class="recordHeader"><b>Census Record Information</b></div>
         <div class="recordData">
            <ul>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Page Number:</div>
                  <div style="padding-left:5px;float:left;">{{ .page_num}}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Dwelling Number:</div>
                  <div style="padding-left:5px;float:left;">{{ .dwelling_num }}</div>
               </li>
               <li>
                  <div style="width:300px;font-weight:bold;padding-right:5px;text-align:right;float:left;">Family Number:</div>
                  <div style="padding-left:5px;float:left;">{{ .family_num }}</div>
               </li>
            </ul>
            {{ end }}
         </div>
      </div>
      <p>An asterisk (*) at the end of a last name, first name, or middle initial indicates an illegible name on the manuscript census
         form.
      </p>
      <p>&#8224; Indicates month of birth/marriage if born/married in the past year.</p>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
