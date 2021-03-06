<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	
	<jsp:include page="includes/includes.jsp" />
	
	<script type = "text/javascript">
		$(document).ready(function(){
			var table = $('#coursesview').DataTable( {
			 	"sDom" : 'rtf',
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'single'
		        }
		 	} );
			
			table.on( 'dblclick', 'tr', function () {
				var courseID = table.row( this ).data()[0];
				window.location.href = encodeURI("${pageContext.request.contextPath}/courses/" + courseID+"/?curricID=");
			} );
		});
	</script>
	
	
</head>
<body>

	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		<div>	
			<h1 style="display: inline-block; margin-top: 0px;">Programs - College</h1>  
			<div class="floatright">
						<a href="${pageContext.request.contextPath}/courses/newCourse" class="linkButton">New Program</a>    
			</div>
			
			<div style="padding-bottom: 5px;" class="buttons" >
					<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/courses/" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/courses/strands	"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/courses/bsc/?curricID="> BASIC </a> 
					<span class="notifier" >Double click on a record to view more details.</span>
			</div>
		
			<div style="width: 1000px; " >
				<table id="coursesview" class="display compact listTable" >  
					<thead>
						<tr><th>CourseId</th><th>Description</th><th>Department</th></tr>  
				   	</thead>
					
					<tbody>
						<c:forEach var="course" items="${list}">   
						   	<tr>  
							   	<td>${course.courseID}</td>  
							   	<td>${course.courseDesc}</td>  
							   	<td>${course.departmentCode}</td>  
							</tr>  
				   		</c:forEach> 
					</tbody>
			 </table>  
			</div>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />
</body>
</html>
