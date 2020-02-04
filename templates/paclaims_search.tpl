<!DOCTYPE html
  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Valley of the Shadow: Chambersburg Claims Search</title>
      <style> .red-head {color: #990000; font-family: times, serif; font-weight: bold } .warning{font-weight:bold; padding:5px; color:#000099;} </style>
      <script src="../VoS/javascript/jquery-1.2.1.js" type="text/javascript"></script>
      <script src="../VoS/javascript/claims_search.js" type="text/javascript"></script>
      <script src="../VoS/javascript/replace_em.js" type="text/javascript"></script>
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
                        <td align="center"><a href="../VoS/reference/tips.html"><b>Tips for Searching</b></a><br></td>
                     </tr>
                     <tr>
                        <td align="center"><a href="../VoS/paclaims.html"><b>Return to<br> Claims Home</b></a></td>
                     </tr>
                  </table>
               </td>
               <td>
                  <center><img src="../VoS/images/images/vtitle4.gif"></center><br><p>
                     <h1 class="red-head"><b>
                           <center> Search the Chambersburg Claims Database

                           </center></b></h1>
                  </p>
                  <blockquote> After the war Pennsylvania established a claims
                     									commission to review petitions for reimbursement for damages
                     									sustained during the war by communities along the border. A
                     									great majority of the claims came from Franklin County, largely
                     									because of the burning of Chamberburg. This database is a
                     									searchable set of the 594 Chambersburg claims. <br><br></blockquote>
                  <blockquote><b>Note:</b> The wild card character is <b>*</b>. It can be
                     									substituted for any number of characters at the middle
                     									or back of a word. Please see <a href="VoS/reference/tips.html"><b>Tips for Searching</b></a> for a
                     									full explanation.
                  </blockquote>
               </td>
            </tr>
         </table>
         <hr>
         <center>
            <form method="get" action="/claims_search_results.html" name="claimsSearchForm">
               <table cellpadding="10">
                  <tr>
                     <td colspan="4" align="center"><input name="q" id="query" type="hidden"><input value="50" name="rows" type="hidden"><input value="0" name="start" type="hidden"><input id="search_button" value="Initiate Search" type="submit"><input value="Clear" type="reset"><span> Sort records by: </span><select name="sort">
                           <option value="last asc, first asc">Last name</option>
                           <option value="amount_award asc">Amount Awarded</option>
                           <option value="amount_rec asc">Amount Received</option>
                           <option value="claim_total asc">Total Claim</option>
                           <option value="real_property asc">Real Property Value</option>
                           <option value="race asc">Race of Claimant</option>
                           <option value="gender asc">Gender of Claimant</option></select></td>
                  </tr>
                  <tr>
                     <td align="right">Last name:</td>
                     <td align="left"><input name="last_name"></td>
                     <td align="right">First name:</td>
                     <td align="left"><input name="first_name"></td>
                  </tr>
                  <tr>
                     <td align="right">Sex:</td>
                     <td id="sex_cell" align="left"><input value="m" type="radio" name="sex">Male<input value="f" type="radio" name="sex">Female</td>
                     <td align="right">Color:</td>
                     <td id="race_cell" align="left"><input value="b" type="radio" name="race">Black<input value="w" type="radio" name="race">White<input value="m" type="radio" name="race">Mulatto</td>
                  </tr>
                  <tr>
                     <td align="right">Total Amount Claimed:</td>
                     <td align="left"><select id="claim_total-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="claim_total"></td>
                  </tr>
                  <tr>
                     <td align="right">Personal Property Claim:</td>
                     <td align="left"><select id="pers_prop-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="pers_prop"></td>
                     <td align="right">Real Property Claim:</td>
                     <td align="left"><select id="real_prop-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="real_prop"></td>
                  </tr>
                  <tr>
                     <td align="right">Amount Awarded:</td>
                     <td align="left"><select id="amount_award-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="amount_award"></td>
                     <td align="right">Amount Received:</td>
                     <td align="left"><select id="amount_rec-op">
                           <option value="gt">&gt;</option>
                           <option value="equal">=</option>
                           <option value="lt">&lt;</option>
                           <option value="not">&lt;&gt;</option></select><input size="6" name="amount_rec"></td>
                  </tr>
               </table>
            </form>
         </center><br><hr width="80%">
         <center><a href="../VoS/choosepart.html"><img alt="" border="0" src="../VoS/images/graphics/full7.gif"></a></center>
      </div>
      <div id="search"></div>
   <script src="../VoS/javascript/libtools.js" type="text/javascript"></script></body>
</html>
