<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="${css}" rel="stylesheet">
	<script type="text/javascript" src="${jscript}" ></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#btnSearch").click(function(){
				var searchurl = encodeURI('ajax/ajaxdemo/?param='+$("#search").val());
					
				$.ajax({
					
					url: searchurl,
					type: "GET" ,
					success: function(result){
						$('#studview').html(result);
					},
					error:function(e) {  
					      alert('Error: ' + e);   
					}  
					
				});
			});
			$("#search").on('input', function(){
				
			});
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<P>  The time on the server is ${serverTime}. </P>
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<form:form action="${pageContext.request.contextPath}/subjects/newSubject" modelAttribute="subject" >
			<table>
				
				<tr>
					<td><form:label path="subjectCode" >Subject Code</form:label></td>
					<td><form:input path="subjectCode"/></td>
				</tr>
				
				<tr>
					<td><form:label path="subjectDesc" >Description</form:label></td>
					<td><form:input path="subjectDesc"/></td>
				</tr>
				
				<tr>
					<td><form:label path="lecUnits" >Lec Units</form:label></td>
					<td><form:input path="lecUnits"/></td>
				</tr>
				
				<tr>
					<td><form:label path="labUnits" >Lab Units</form:label></td>
					<td><form:input path="labUnits"/></td>
				</tr>
				
			</table>
			<input type="submit" value="Add New">
		</form:form>
	
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
