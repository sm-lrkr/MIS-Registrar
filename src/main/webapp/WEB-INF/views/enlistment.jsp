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
			
			$("#enlist").click(function(){
				$("#offeredTable").submit();
			});
			
			$("#withdraw").click(function(){
				$("#enlistedTable").submit();
			});
			
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
		<jsp:include page="includes/student-left-menu.jsp" />
		<div>
			<div style="margin-bottom: 20px;">
				<h1 style="display: inline-block; margin-top: 0px;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
				
				<div class="floatright">
				
				</div>
			</div>
			
			<div id="offeredList" class="tableContainer">
				<form:form id="offeredTable" action="${pageContext.request.contextPath}/schedules/enlist/college/${student.studentNo}" method="post" modelAttribute="offered">
					<table id="offered" class="listTable">  
						<tr><th></th><th>Subject</th><th>Section</th><th>Units</th><th>Time Start</th><th>Time End</th><th>Days</th><th>Room</th></tr>
					   	<c:forEach var="sched" items="${offered.schedules}" varStatus="status">   
						   <tr>  
							   	<td>  
								   	<form:input path="schedules[${status.index}].scheduleID" type="hidden" />
								   	<form:input path="schedules[${status.index}].subjectCode" type="hidden" />
								   	<form:input path="schedules[${status.index}].personnelID" type="hidden" />
								   	<form:checkbox path="schedules[${status.index}].checked" />
							   	</td>
							   	<td> ${sched.subjectCode}</td>  
							   	<td>${sched.section}</td>  
							   	<td>${sched.lecUnits}</td>  
							   	<td><form:input type="hidden" path="schedules[${status.index}].lecTimeStart"/> ${sched.lecTimeStart}</td>  
							   	<td><form:input type="hidden" path="schedules[${status.index}].lecTimeEnd"/> ${sched.lecTimeEnd}</td>  
							   	<td><form:input type="hidden" path="schedules[${status.index}].lecDays"/> ${sched.lecDays}</td>  
							   	<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.lecRoom}</td>  
						   	</tr>
							<c:if test="${sched.labDays ne '' }">			   
							   	<tr>  
							   		<td></td>
									<td>${sched.subjectCode}-LAB</td>  
									<td>${sched.section}</td>  
									<td>${sched.labUnits}</td>  
									<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.labTimeStart}</td>  
									<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.labTimeEnd}</td>  
									<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.labDays}</td>  
									<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.labRoom}</td>  
								</tr>    
							</c:if>
						</c:forEach>  
			   		</table>  
			   </form:form>	
			</div >
			
			 <div id="horizontalAlign">
		   		<div>
					<button id= "enlist"> Enlist checked</button>
				</div>
   			</div>
   			
			<div id="enlistedList" class="tableContainer">
				<form:form id="enlistedTable" action="${pageContext.request.contextPath}/schedules/withdraw/college/${student.studentNo}" method="post" modelAttribute="enlisted">
						<table id="enlisted"  class="listTable">  
							<thead>
								<tr><th></th><th>Subject</th><th>Section</th><th>Units</th><th>Time Start</th><th>Time End</th><th>Days</th><th>Room</th></tr>  
						   	</thead>
						   
						   	<tbody>
							   	<c:forEach var="sched" items="${enlisted.schedules}" varStatus="status">   
								   	<tr>  
									   	<td>  
										   	<form:input path="schedules[${status.index}].scheduleID" type="hidden" />
										   	<form:input path="schedules[${status.index}].subjectCode" type="hidden" />
										   	<form:checkbox path="schedules[${status.index}].checked" />
										</td>
									   	<td> ${sched.subjectCode}</td>  
									   	<td> ${sched.section}</td>  
									   	<td> ${sched.lecUnits}</td>  
									   	<td> ${sched.lecTimeStart}</td>  
									   	<td> ${sched.lecTimeEnd}</td>  
									   	<td> ${sched.lecDays}</td>  
									   	<td> ${sched.lecRoom}</td>  
								   	</tr>
								   		<c:if test="${sched.labDays ne '' }">	
									   	   	<tr>  
									   	   		<td></td>
											   	<td> ${sched.subjectCode}-LAB</td>  
											   	<td> ${sched.section}</td>  
											   	<td> ${sched.labUnits}</td>  
											   	<td> ${sched.labTimeStart}</td>  
											   	<td> ${sched.labTimeEnd}</td>  
											   	<td> ${sched.labDays}</td>  
											   	<td> ${sched.labRoom}</td>  
										   	</tr>    
									   	</c:if>
								</c:forEach>  
							</tbody>
				   		</table>  
				</form:form>
			</div>
			<div id="horizontalAlign">
	   		<div class="divElements" >
				<button id= "withdraw"> Widthdraw checked</button>
			</div>
   		</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />
</body>
</html>
