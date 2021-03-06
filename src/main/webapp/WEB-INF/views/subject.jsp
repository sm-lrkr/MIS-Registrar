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
			var currics = $('#curricsView').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY": "200px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'single'
		        }
		 	} );
	
			var scheds = $('#schedsview').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY": "250px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'single'
		        },"columnDefs": [
		        	{"targets": 1, "visible" : false }
				 ]
		 	} );

			scheds.on( 'dblclick', 'tr', function () {
				alert("dblclicked");
				var scheduleID = scheds.row( this ).data()[0];
				var subjectCode = "${subject.subjectCode}";
				window.location.href = "${pageContext.request.contextPath}/schedules/clg/"+subjectCode+"/?id=" + scheduleID + "";
	
			} );
			
			$("#subjectForm :input").prop("disabled", true);
			$("#subjectForm :input").addClass("disabledInput");
	
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">${subject.subjectCode} - ${subject.subjectDesc}</h1>  
	
			<div style="display: flex; flex-direction: horizontal; margin-top:30px;">
				<div>
					<form:form id="subjectForm" action="" modelAttribute="subject" >
						<table class="formTable" style="margin-top: 30px;">
							<c:if test = "${subjectType == 'clg'}">
								<tr>
									<td><form:label path="lecUnits">Lec Units</form:label></td>
									<td><form:input path="lecUnits" /></td>
								</tr>
								
								<tr>
									<td><form:label path="labUnits">Lab Units</form:label></td>
									<td><form:input path="labUnits" /></td>
								</tr>		         
							</c:if>
							
							<tr>
								<td><form:label path="preRequisites">Pre Requisites</form:label></td>
								<td><form:input path="preRequisites" /></td>
								
							
							</tr>
						</table>
					</form:form>
					
					<div class="floatright" style="margin-bottom: 20px;" >
							<a href="${pageContext.request.contextPath}/subjects/editSubject/clg/?subjectCode=${subject.subjectCode}" ><span class="linkButton">Edit</span></a>    
					</div>
				</div>
				
				<div style="width: 650px; margin-left: 60px;">
					 <table id="curricsView" class="display compact listTable">  
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
					</table> 
				</div>
			
			</div>

			<div style="width:1000px; margin-top:30px; ">
				 <table id="schedsview"class="display compact listTable">  
				 	
				 	<c:choose>
							<c:when test = "${subjectType == 'clg'}">
								<thead>
										<tr><th>ScheduleID</th><th>Section</th><th>Units</th><th>Time</th><th>Days</th><th>Room</th></tr>
								</thead>
				
								<tbody>
										<c:forEach var="sched" items="${schedules}">   
											<tr>  
											   	<td> ${sched.scheduleID}</td>  
					   						   	<td> ${sched.section}</td>  
											   	<td> ${sched.lecUnits}</td>  
											   	<td> ${sched.lecTimeStart}-${sched.lecTimeEnd}</td>  
											   	<td> ${sched.lecDays}</td>  
											   	<td> ${sched.lecRoom}</td>  
										   	</tr>
											<c:if test="${sched.labDays ne '' }">			   
											   	<tr>  
											   		<td> ${sched.scheduleID}</td>  
					   								<td> ${sched.section}-LAB</td>  
													<td> ${sched.labUnits}</td>  
													<td> ${sched.labTimeStart}-${sched.labTimeEnd}</td>  
													<td> ${sched.labDays}</td>  
													<td> ${sched.labRoom}</td>  
												</tr>    
											</c:if>
								   		</c:forEach>
								</tbody>
							</c:when>
							
							<c:when test = "${subjectType == 'shs'}">
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
				
			</div>
			
			
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
