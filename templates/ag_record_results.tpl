<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Census Search Results</title><style> body { padding:1em; }
					.red-head {color: #990000; font-family: times, serif; font-weight: bold }
					.warning {font-weight:bold; padding:5px; color:#000099; background-color:#FFFFFF;} 
					table.record { padding:2em; width: auto; border:none; } 
					table.record * td { padding: 5px; } 
					table.record * th { background: #ffcc99; vertical-align: top; padding: 10px;}
					td.left { text-align: right; }
					td.right { text-align: left; }
					td.race { color: #990000; }
					td.gender { color: #000099;} 
				</style>
				      <link rel="stylesheet" type="text/css" href="/VoS/css/valleyshadow.css">

				</head>
   <body vlink="#00009C" link="#CD7F32" bgcolor="#FFFFFF">
      <center><img src="/VoS/images/images/vtitle4.gif" border="0"></center>
      <h1 class="red-head">
         <center>Augusta - 1860
            						Agricultural Census 
         </center>
      </h1><br><p><b>Please cite results as coming from:</b>Augusta County, Virginia, 1860 Agricultural Census, Valley of the
         					Shadow: Two Communities in the American Civil War, Virginia Center for Digital
         					History, University of Virginia
         					(http://valley.lib.virginia.edu/ag_record?q=db:agr_aug_60 AND id_num:127).
      </p>
      <table cellpadding="10" border="0">
         <tr>
            <td valign="top" bgcolor="#ffcc99"><b>Personal Information</b></td>
            <td valign="top" bgcolor="#ffcc99"><b>Farm Land Information</b></td>
         </tr>
            {{range .Docs}}

         <tr>
            <td valign="top" align="left"><b>Name:</b> {{ .first }} {{ .last }}<br><b>Location:</b>{{ .location }}
            </td>
            <td valign="top" align="left"><b>Total Acres Improved:</b> {{ .tot_impr}}<br><b>Total Acres Wood/Other: </b> <br><b>Total Land:</b> {{ .tot_land }}<br><b>Value of Farm:</b> 400
            </td>
         </tr>
         <tr>
            <td valign="top" bgcolor="#ffcc99"><b>Farm Animals Information</b></td>
            <td valign="top" bgcolor="#ffcc99"><b>Farm Crop Information</b></td>
         </tr>
         <tr>
            <td valign="top" align="left"><b>Horses:</b> {{ .horses }}<br><b>Mules:</b> {{ .mules }}<br><b>Cows:</b> {{ .cows }}<br><b>Oxen:</b> {{ .oxen }}<br><b>Other Cattle:</b> <br><b>Sheep:</b> {{ .sheep }} <br><b>Swine:</b> {{ .swine }}<br><b>Animals Slaughtered:</b> {{ .slaut_animals }}<br><b>Total Value of Livestock:</b> {{ .tot_livestock }}<br><b>Total Number of Animals:</b> {{ .tot_animals }}
            </td>
            <td valign="top" align="left"><b>Wheat in Bushels:</b> {{ .wheat }}<br><b>Rye:</b> {{ .rye }}<br><b>Corn:</b> {{ .corn }}<br><b>Oats:</b> {{ .oats }} <br><b>Total Grain Production:</b> {{ .tot_grain }}<br><b>Pounds of Tobacco:</b> {{ .tobacco }}<br><b>Irish Potatos in Bushels:</b> {{ .ir_potatos }} <br><b>Sweet Potatos in Bushels:</b> {{ .sw_potatos}} 
            </td>
         </tr>
         <tr>
            <td valign="top" bgcolor="#ffcc99"><b>Other Farm Production</b></td>
            <td valign="top" bgcolor="#ffcc99"><b>Census Record Information</b></td>
         </tr>
         <tr>
            <td valign="top" align="left"><b>Farming Implements:</b> {{ .farm_impl }}<br><b>Pounds of Wool:</b> {{ .wool }}<br><b>Orchard:</b> {{ .orchard }}<br><b>Butter:</b> {{ .butter }}<br><b>Cheese:</b> {{ .cheese }}<br><b>Hay:</b> {{ .hay }}<br><b>Home Manufacturing:</b> {{ .home_manu }}
            </td>
            <td valign="top" align="left"><b>Page Number:</b> {{ .page_num }}<br><b>Number on Page:</b> {{ .num_on_page }}
            </td>
         </tr>
         {{ end }}
      </table>
      <p><a href="javascript:history.go(-1)">go back to search results page</a><br><a href="ag_census">New Search</a></p>
   <script src="/VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>