<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="${css}" rel="stylesheet">
	<script type="text/javascript" src="${jscript}" ></script>
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/student-left-menu.jsp" />
		<c:set var="ap" value="" />
		<c:set var="ave" value="${0}" />
		<c:set var="count" value="${0}" />
		
		<table class="listTable">
		<tr><th>Code</th><th>Description</th><th>Units</th><th>Prelim</th><th>Midterm</th><th>Final</th><th>Grade Equivalent</th><th>Date Modified</th></tr>
		<c:forEach var="grade" items="${grades}" varStatus="status">
				
				<c:set var="count" value="${count + 1}" />
				<c:set var="ss" value="${grade.schoolYear} ${grade.semester}" />
				
				<c:if test="${ ss ne ap }">
					<c:if test="${ ave gt 0 }">
						<tr><td>GPA: ${ave / count}  </td></tr>
						<tr><th>Code</th><th>Description</th><th>Units</th><th>Prelim</th><th>Midterm</th><th>Final</th><th>Grade Equivalent</th><th>Date Modified</th></tr>	
					</c:if>
					
					<c:set var="ap" value="${ss}" />
					<c:set var="count" value="${0}" />
					<c:set var="ave" value="${0}" />
	
				</c:if>
				
				<c:set var="ave" value="${ave + grade.equivalentGrade}" />
				<tr>
					<td>${grade.subjectCode} </td>
					<td>${grade.subjectDesc} </td>
					<td>${grade.lecUnits + grade.labUnits} </td>
					<td>${grade.prelimGrade} </td>
					<td>${grade.midtermGrade} </td>
					<td>${grade.finalGrade} </td>
					<td>${grade.equivalentGrade} </td>
					<td>${grade.dateModified} </td>
				</tr>
			</c:forEach>
			<tr><td colspan="8">GPA: ${ave / count}  </td></tr>
		</table>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
