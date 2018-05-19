<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

   
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/css/dataTable.min.css" var="dtcss" />
<spring:url value="/resources/css/dataTableSelect.min.css" var="dtselectcss" />
<spring:url value="/resources/css/buttons.dataTables.min.css" var="dtbuttonscss" />
<spring:url value="/resources/css/dataTables.checkboxes.css" var="dtcheckboxescss" />


<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/myscript.js" var="myscript" />
<spring:url value="/resources/javascript/dataTable.js" var="dtjs" />
<spring:url value="/resources/javascript/dataTableSelect.min.js" var="dtselectjs" />
<spring:url value="/resources/javascript/printThis.js" var="printThis" />
<spring:url value="/resources/javascript/dataTables.checkboxes.min.js" var="dtcbjs" />


<spring:url value="/resources/javascript/dataTables.buttons.min.js" var="dtbuttonsjs" />
<spring:url value="/resources/javascript/buttons.flash.min.js" var="flashButtons" />
<spring:url value="/resources/javascript/jszip.min.js" var="jszip" />
<spring:url value="/resources/javascript/pdfmake.min.js" var="pdfmake" />
<spring:url value="/resources/javascript/vfs_fonts.js" var="vfs_fonts" />
<spring:url value="/resources/javascript/buttons.html5.min.js" var="html5Buttons" />
<spring:url value="/resources/javascript/buttons.print.min.js" var="printButton" />

<link href="${dtcss}" rel="stylesheet">
<link href="${dtselectcss}" rel="stylesheet">
<link href="${dtbuttonscss}" rel="stylesheet">
<link href="${css}" rel="stylesheet">
<link href="${dtcheckboxescss}" rel="stylesheet">
		
<script type="text/javascript" src="${jscript}" ></script>
<script type="text/javascript" src="${myscript}" ></script>
<script type="text/javascript" src="${dtjs}" ></script>
<script type="text/javascript" src="${dtselectjs}" ></script>
<script type="text/javascript" src="${printThis}" ></script>
<script type="text/javascript" src="${dtcbjs}" ></script>
	
	
<script type="text/javascript" src="${dtbuttonsjs}" ></script>
<script type="text/javascript" src="${flashButtons}" ></script>
<script type="text/javascript" src="${jszip}" ></script>
<script type="text/javascript" src="${pdfmake}" ></script>
<script type="text/javascript" src="${vfs_fonts}" ></script>
<script type="text/javascript" src="${html5Buttons}" ></script>
<script type="text/javascript" src="${printButton}" ></script>
	

