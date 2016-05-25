<%
/**
 * Copyright (c) 2000-2011 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
%>

<%@ page import="com.liferay.portal.kernel.util.WebKeys" %>
<%@ page import="com.liferay.portal.util.PortalUtil" %>
<%@ page import="com.liferay.portal.model.Company" %>
<%@ page import="javax.portlet.*" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<portlet:defineObjects />
<%//
  // GATE 6.0.0 Submission Form
  //
  // The form has 3 input textareas respectively for:
  //    * Macro file
  //    * Material DB
  //    * ROOT Analysis C file
  // Beside each text area a upolad button takes as input the 
  // file name related to one of the above fields.
  // The forth submission buttons is related to the file 'phsp.root' file
  // A default phsp.root file will be used if no files will be uploaded by the user.
  // The ohter three buttons of the form are used for:
  //    o Demo:          Used to fill with demo values the text areas
  //    o SUBMIT:        Used to execute the job on the eInfrastructure
  //    o Reset values:  Used to reset input fields
  //  
%>

<%
// Below the descriptive area of the GATE web form 
%>
<form enctype="multipart/form-data" action="<portlet:actionURL portletMode="view">
<portlet:param name="PortletStatus" value="ACTION_SUBMIT"/></portlet:actionURL>" method="post">
<table>
<tr>
<td valign="top">
<img align="left" style="padding:10px 10px;" src="<%=renderRequest.getContextPath()%>/images/AppLogo.png" />
</td>
<td>
<center>
<h2>G-HMMER </h2>
</center>
<p>Available Data Base</p>
<input type="radio" name="group" value="secuenciah.hmm" checked> Amino acids<br>
<input type="radio" name="group" value="niente"> Not available in demo version<br>
<input type="radio" name="group" value="niente"> Not available in demo version<br>
<input type="radio" name="group" value="niente"> Not available in demo version<br>
<center>
<p>Chain of proteins</p>
<textarea id="hmmerChain" rows="1" cols="60%" name="hmmerChain">GTTCAGCGGGAGCGCCAACTGCTCGACCACCGGCTCAAT</textarea>
<p><input type="submit" value="Send Job"  onClick="preSubmit()"><input type="reset" value="Reset" onClick="resetForm()"></p>
<!-- <p>Cargar HMMER <input type="file" name="file_inputFile" id="upload_inputFileId" accept="*.*" onchange="uploadInputFile()"/></p> -->
</center>
</td>
</tr>
</table align="center">
</form>
<center>
   <tr>
        <form action="<portlet:actionURL portletMode="HELP"> /></portlet:actionURL>" method="post">
<!--        <td><input type="submit" value="About"></td>-->
        </form>        
   </tr>
</table>
</center>

<%
// Below the javascript functions used by the GATE web form 
%>
<script type="text/javascript">


function preSubmit() {  
    document.forms[0].submit();
}


function resetForm() {
	var currentTime = new Date();
	var inputFileName=document.getElementById('hmmerChain');

	// Reset the job identifier
    jobIdentifier.value="";
}


</script>
