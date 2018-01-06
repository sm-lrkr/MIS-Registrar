<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/myscript.js" var="myscript" />

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="${css}" rel="stylesheet">
	<script type="text/javascript" src="${jscript}" ></script>
	<script type="text/javascript" src="${myscript}" ></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			var ctx = "${pageContext.request.contextPath}";
			var url = encodeURI(ctx + '/ajax/departmentSelectChanged/?param=');
			departmentSelect($('#deptSelect'), $('#courseSelect'), ctx);
			courseSelect($('#search'), $('#courseSelect'), $('#studview'), ctx);
			searchStudents($('#search'), $('#searchBtn'), $('#courseSelect'), $('#studview'), ctx);	
		});
	</script>
	
</head>
<body>


	<jsp:include page="includes/header.jsp" />
		<div id="main">
			<jsp:include page="includes/student-left-menu.jsp" />
			<div style="width: 60%">
				<div>
					<h1 style="display: inline-block; margin-top: 0px;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
					<div class="floatright">
						<a href="${pageContext.request.contextPath}/students/spr/info/${student.studentNo}" ><span class="linkButton" >View SPR</span></a>   
				    </div>
		  		</div>
		  		<hr>
				
				<div style="padding-bottom: 5px;">
					
					<table style="width: 500px; margin-top:40px; padding-left: 20px;" >
						<tr>
							<c:choose>
         					     <c:when test = "${profileType == 'college'}">
         					     	<td><h4>ID: </h4></td>
									<td>${profile.studentID}</td>
         					     </c:when>
         					    <c:otherwise>
         					     	<td><h4>LRN </h4></td>
									<td>${profile.LRN}</td>
         					    </c:otherwise>	 
         					 </c:choose>    
						</tr>
					
						<tr>
							<c:choose>
         					     <c:when test = "${profileType == 'college'}">
         					     	<td><h4>Course: </h4></td>
									<td>${profile.courseID}</td>
         					     </c:when>
         					     <c:when test = "${profileType == 'shs'}" >
         					     	<td><h4>Strand: </h4></td>
									<td>${profile.strandCode}</td>
         					     </c:when>
         					</c:choose>
						</tr>
						
						<tr>
							<td><h4>Status</h4></td>
							<td>${profile.studentStatus}</td>
						</tr>
						
						<tr>
							<td><h4>Enrollment Status</h4></td>
							<c:choose>
         					     <c:when test = "${profile.enrollmentStatus == true}">
         					    	<td>Enrolled</td>
         					     </c:when>
         					     <c:otherwise>
         					     	<td>Not Enrolled</td>
         					     </c:otherwise>
         					</c:choose>
							
							
						</tr>
							
						<tr>
							<td><h4>Year Entry</h4></td>
							<td>${profile.yearEntry}</td>
						</tr>
						
					
						
					
					</table>
			    </div>
			
			
			</div>
		</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
