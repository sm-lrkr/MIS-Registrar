<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    

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
					error: function (jqXHR, exception) {
				        var msg = '';
				        if (jqXHR.status === 0) {
				            msg = 'Not connect.\n Verify Network.';
				        } else if (jqXHR.status == 404) {
				            msg = 'Requested page not found. [404]';
				        } else if (jqXHR.status == 500) {
				            msg = 'Internal Server Error [500].';
				        } else if (exception === 'parsererror') {
				            msg = 'Requested JSON parse failed.';
				        } else if (exception === 'timeout') {
				            msg = 'Time out error.';
				        } else if (exception === 'abort') {
				            msg = 'Ajax request aborted.';
				        } else {
				            msg = 'Uncaught Error.\n' + jqXHR.responseText;
				        }
				       	alert(msg);
				    }			
					
				});
			});
			
			$("#btn").click(function(){
				alert("Submit Clicked")
				$("#schedForm").submit(function(result){
					alert("result")
									
				});
			});
	
			$("#btnSubmit").click(function() {
				var submitURL = encodeURI('${pageContext.request.contextPath}/schedules/saveNew/${dept}');
				$.ajax({
					url: submitURL,
					type: "POST" ,
					data: $("#schedForm").serialize() ,
					success: function(result){
						$('#result').html(result)
						if(result=="success")
				        {
				        	window.location.replace("${pageContext.request.contextPath}/schedules/");
						}	
					},
					error: function (jqXHR, exception) {
				        var msg = '';
				        if (jqXHR.status === 0) {
				            msg = 'Not connect.\n Verify Network.';
				        } else if (jqXHR.status == 404) {
				            msg = 'Requested page not found. [404]';
				        } else if (jqXHR.status == 500) {
				            msg = 'Internal Server Error [500].';
				        } else if (exception === 'parsererror') {
				            msg = 'Requested JSON parse failed.';
				        } else if (exception === 'timeout') {
				            msg = 'Time out error.';
				        } else if (exception === 'abort') {
				            msg = 'Ajax request aborted.';
				        } else {
				            msg = 'Uncaught Error.\n' + jqXHR.responseText;
				        }
				       	alert(msg);
				    }			
				});
		     });
			
			var department = "${department}";
			if(department!='clg'){
				$("#lab").hide();
			}
			
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<div>
			<div>
				<h1 style="display: inline-block; margin-top: 0px;">Create Schedule</h1>  
			
				<div class="floatright">
							<a href="newSchedule" class="linkButton">New Schedule</a>    
				</div>
			</div>
			<div>
				<div style="display: inline-block;">
					<form:form id="schedForm" action="${pageContext.request.contextPath}/schedules/saveNew/${dept}" method="POST" modelAttribute="scheduleForm" >
						<table class="formTable">
							<tr>
								<td><form:label path="schedule.subjectCode" >Subject Code</form:label></td>
								<td>
									<form:select  style="width:170px;" path="schedule.subjectCode" id="dbTypes" value="${subj.subjectCode}" >
										<form:option value="" label=""/>
										<c:forEach var="subj" items="${subjects}">   
											<form:option value="${subj.subjectCode}" label="${subj.subjectCode}" /> 
									   	</c:forEach>  
									</form:select>
								</td>
							</tr>
						
							<tr>
								<td><form:label path="schedule.section" >Section</form:label></td>
								<td>
									<c:if test="${dept == 'clg'}">
										<form:input path="schedule.section"/>
									</c:if>
									<c:if test="${dept == 'shs'}">
										<form:select style="width: 170px;" path="schedule.section" id="dbSections" value="${schedule.section}" >
											<c:forEach var="section" items="${sections}">
												<form:option value="${section.sectionID}" label="${section.sectionName}" /> 
									   		</c:forEach>
										</form:select>
									</c:if>
								</td>
							</tr>
	
							<tr>
								<td><form:label path="schedule.section" >Teacher</form:label></td>
								<td>
									<form:select style="width: 170px;" path="schedule.personnelID" id="dbPersonnel" value="${schedule.personnelID}" >
										<form:option value="-1" label=""/>
										<c:forEach var="teacher" items="${teachers}">   
											<form:option value="${teacher.personnelID}" label="${teacher.first_name}-${teacher.last_name}" /> 
									   	</c:forEach>  
									</form:select>
								</td>
							</tr>
						</table>
					
						<h3>Lecture</h3>
					
						<table class="formTable">
							<tr>
								<td><form:label path="schedule.lecTimeStart" >Time Start</form:label></td>
								<td> <form:select path = "schedule.lecTimeStart">
								        <c:forEach var="time" items="${times}">
								        	<form:option value = "${time}" label = "${time}" />
								        </c:forEach>
							    	 </form:select>     	
								</td>
							</tr>
							
							<tr>
								<td><form:label path="schedule.lecTimeEnd" >Time End</form:label></td>
								<td> <form:select path = "schedule.lecTimeEnd">
								        <c:forEach var="time" items="${times}">
								        	<form:option value = "${time}" label = "${time}" />
								        </c:forEach>
							    	 </form:select>     	
								</td>
							</tr>
						
							<tr>
								<td><form:label path="schedule.lecRoom" >Room</form:label></td>
								<td>
									<form:select style="width: 170px;" path = "schedule.lecRoom">
								       <c:forEach var="room" items="${rooms}">   
											<form:option value="${room.facil_name}" label="${room.facil_name}" /> 
									   	</c:forEach> 
							    	 </form:select> 
								</td>
							</tr>
				
							<tr>
								<td><form:label path="lecDays" >Days</form:label></td>
								<td>
									<form:checkbox class="cbox" path="lecDays.days[0]" value="M"  label="M" />
								    <form:checkbox class="cbox" path="lecDays.days[1]" value="T"  label="T"/>
									<form:checkbox class="cbox" path="lecDays.days[2]" value="W"  label="W"/>
									<form:checkbox class="cbox" path="lecDays.days[3]" value="Th" label="Th"/>
									<form:checkbox class="cbox" path="lecDays.days[4]" value="F"  label="F"/>
									<form:checkbox class="cbox" path="lecDays.days[5]" value="S"  label="S"/>
									<form:checkbox class="cbox" path="lecDays.days[6]" value="Su" label="Su"/>
								</td>			
							</tr>
						</table>
						
						<c:if test="${department == 'clg'}" >
							<h3>Lab</h3>
							<table class="formTable">
								<tr>
									<td><form:label path="schedule.labTimeStart" >Time Start</form:label></td>
									<td> 
										<form:select path = "schedule.labTimeStart">
									        <c:forEach var="time" items="${times}">
									        	<form:option value = "${time}" label = "${time}" />
									        </c:forEach>
								    	</form:select>     	
									</td>
								</tr>
					
								<tr>
									<td><form:label path="schedule.labTimeEnd" >Time End</form:label></td>
									<td> 
										<form:select path = "schedule.labTimeEnd">
									     	<c:forEach var="time" items="${times}">
									        	<form:option value = "${time}" label = "${time}" />
									    	</c:forEach>
									    </form:select>     	
									</td>
								</tr>
							
								<tr>
									<td><form:label path="schedule.labRoom" >Room</form:label></td>
									<td>
										<form:select style="width: 170px;" path = "schedule.labRoom">
									       <c:forEach var="room" items="${rooms}">   
												<form:option value="${room.facil_name}" label="${room.facil_name}" /> 
										   	</c:forEach> 
								    	 </form:select>
									</td>
								</tr>
						
								<tr>
									<td><form:label path="labDays" >Days</form:label></td>
									<td>
										<form:checkbox class="cbox" path="labDays.days[0]" value="M"  label="M" />
									    <form:checkbox class="cbox" path="labDays.days[1]" value="T"  label="T"/>
										<form:checkbox class="cbox" path="labDays.days[2]" value="W"  label="W"/>
										<form:checkbox class="cbox" path="labDays.days[3]" value="Th" label="Th"/>
										<form:checkbox class="cbox" path="labDays.days[4]" value="F"  label="F"/>
										<form:checkbox class="cbox" path="labDays.days[5]" value="S"  label="S"/>
										<form:checkbox class="cbox" path="labDays.days[6]" value="Su" label="Su"/>
									</td>
									
								</tr>
							</table>
						</c:if>	
					</form:form>
				</div>
		
				<div style="display: inline-block; vertical-align: top; margin-left: 50px;">
					<div style="padding-top: 40px;">
						<div style="padding-top: 10px;"><input type="button" id="btnSubmit" value="Save"/></div>
						<div style="padding-top: 10px;"><input type="button" id="btnClear" value="Clear"/></div>
					</div> 
				
					<p id="result"></p>
					
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />
</body>
</html>
