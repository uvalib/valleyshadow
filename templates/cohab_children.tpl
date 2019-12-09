<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"><style> body { text-align: center; } div#wrapper { margin:5px auto; width:
						700px; text-align: left; } div#husbandInfo { padding: 10px; width: 500px;
						float: left; } div#wifeInfo { padding: 10px; width: 350px; float: left; }
						div#generalInfo { padding: 30px 10px 10px 10px; clear: both; width: 600px; }
						.musterTableHead { background-color:#D3D1AC; font-size:12px; }
						.musterTableBody { background-color:#D3D1BC; font-size:12px; } .rowodd {
						width: 450px; height: 25px; margin: 8px; font-family:verdana, arial;
						font-size: 12px; } .roweven { width: 450px; height: 25px; margin: 8px;
						font-family:verdana, arial; font-size: 12px; } .label { float:left;
						text-align: right; width: 225px; padding: 5px; background-color: #CFCFCF; }
						.content { float:right; text-align:left; width: 200px; padding: 5px; } input
						{ font-family:verdana, arial; font-size: 12px; } option {
						font-family:verdana, arial; font-size: 12px; } </style></head>
<body>
   <body vlink="#00009C" link="#CD7F32" bgcolor="#FFFFFF">
      <h3>Children of  </h3>
      <div style="margin:20px">
         <table style="margin-left:auto;margin-right:auto;width:100%;" cellpadding="1px" cellspacing="1" border="0">
            <tr class="musterTableHead">
               <th>Child Name</th>
               <th>Child Age</th>
               <th>Father First Name</th>
               <th>Father Last Name</th>
            </tr>
    
    {{range .Docs}}
     
            <tr class="musterTableBody">
               <td>{{ .child_name}}</td>
               <td>{{ .child_age }}</td>
               <td>{{ .child_father_first_name}}</td>
               <td>{{ .child_father_last_name }}</td>
            </tr>
            
    {{ end }}        
           
         </table>
      </div>
   <script src="http://../VoS/javascript/libtools.js" type="text/javascript"></script></body>
