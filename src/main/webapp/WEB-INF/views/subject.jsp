<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/myscript.js" var="myscript" />
<spring:url value="/resources/css/dataTable.min.css" var="dtcss" />
<spring:url value="/resources/css/dataTableSelect.min.css" var="dtselectcss" />
<spring:url value="/resources/javascript/dataTable.js" var="dtjs" />
<spring:url value="/resources/javascript/dataTableSelect.min.js" var="dtselectjs" />
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	
	<link href="${dtcss}" rel="stylesheet">
	<link href="${dtselectcss}" rel="stylesheet">
	<link href="${css}" rel="stylesheet">
	
	<script type="text/javascript" src="${jscript}" ></script>
	<script type="text/javascript" src="${myscript}" ></script>
	<script type="text/javascript" src="${dtjs}" ></script>
	<script type="text/javascript" src="${dtselectjs}" ></script>


	<script type = "text/javascript">
		$(document).ready(function(){
			var currics = $('#curricsView').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY": "200px",
		        "scrollCollapse": true,
		        "paging": false,
		        "select": {
		        	style : 'single'
		        }
		 	} );
			
			var scheds = $('#schedsview').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY": "200px",
		        "scrollCollapse": true,
		        "paging": false,
		        "select": {
		        	style : 'single'
		        }
		 	} );
		
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">${subject.subjectCode} - ${subject.subjectDesc}</h1>  
			<div class="floatright">
					<a href="${pageContext.request.contextPath}/subjects/editSubject/clg/${subject.subjectCode}" ><span class="linkButton">Edit</span></a>    
			</div>
			
			<div style="margin-bottom: 100px;">
				<table class="formTable" style="margin-top: 30px;">
					
					<c:if test = "${subjectType == 'clg'}">
						<tr>
							<td>Lec Units</td>
							<td>${subject.lecUnits}</td>
						</tr>
							
						<tr>
							<td>Lab Units</td>
							<td>${subject.labUnits}</td>
						</tr>		         
					</c:if>
					
					<tr>
							<td>Pre Requisites</td>
							<td>${subject.preRequisites}</td>
				</tr>
				</table>
			</div>
		
			<div style="width: 600px; margin-bottom:100px;" >
				 <table id="schedsview"class="display compact listTable">  
				 	
				 	<c:choose>
							<c:when test = "${subjectType == 'clg'}">
								<thead>
										<tr><th>Section</th><th>Units</th><th>Time</th><th>Days</th><th>Room</th></tr>
								</thead>
								
								<tbody>
										<c:forEach var="sched" items="${schedules}">   
											<tr>  
											   	<td> ${sched.section}</td>  
											   	<td> ${sched.lecUnits}</td>  
											   	<td> ${sched.lecTimeStart}-${sched.lecTimeEnd}</td>  
											   	<td> ${sched.lecDays}</td>  
											   	<td> ${sched.lecRoom}</td>  
										   	</tr>
											<c:if test="${sched.labDays ne '' }">			   
											   	<tr>  
													<td> ${sched.subjectCode}-LAB</td>  
													<td> ${sched.section}</td>  
													<td> ${sched.labUnits}</td>  
													<td> ${sched.labTimeStart}-${sched.labTimeEnd}</td>  
													<td> ${sched.labDays}</td>  
													<td> ${sched.labRoom}</td>  
												</tr>    
											</c:if>
								   		</c:forEach>
								</tbody>
							</c:when>
							
							<c:when test = "${subjectType == 'sh'}">
								<thead>
										<tr><th>Subject</th><th>Section</th><th>Time</th><th>Days</th><th>Room</th></tr>
								</thead>
								
								<tbody>
										<c:forEach var="sched" items="${schedules}">   
											<tr>  
											  	<td> ${sched.subjectCode}</td>  
											   	<td> ${sched.section}</td>  
											   	<td> ${sched.lecTimeStart}-${sched.lecTimeEnd}</td>  
											   	<td> ${sched.lecDays}</td>  
											   	<td> ${sched.lecRoom}</td>  
										   	</tr>
								   		</c:forEach>
								</tbody>

							</c:when>
					</c:choose>
				</table> 
			</div>
			
			<div style="width: 400px;" >
				 <table id="curricsView" class="display compact listTable">  
				 	
				 	<c:choose>
							<c:when test = "${subjectType == 'clg'}">
								<thead>
									<tr><th>Course</th><th>Description</th></tr>  
							   	</thead>
								
								<tbody>
									<c:forEach var="curric" items="${currics}">   
									   	<tr>  
										   	<td>${curric.courseID}</td>  
										   	<td>${curric.curriculumDesc}</td>  
										</tr>  
							   		</c:forEach> 
								</tbody>
							</c:when>
							
							<c:when test = "${subjectType == 'sh'}">
								<thead>
									<tr><th>StrandCode</th><th>Track</th><th>Description</th><th>Major</th></tr>  
							   	</thead>
								
								<tbody>
									<c:forEach var="strand" items="${strands}">   
									   	<tr>  
										   	<td>${strand.strandCode}</td>  
										   	<td>${strand.track}</td>  
										   	<td>${strand.strandDesc}</td>  
										   	<td>${strand.major}</td>  
										</tr>  
							   		</c:forEach>
								</tbody>
							</c:when>
					</c:choose>
					</table> 
			</div>
			
			
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
