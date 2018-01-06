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
			
			$("#btn").click(function(){
				alert("Submit Clicked")
				$("#schedForm").submit(function(result){
					alert("result")
									
				});
			});
			

			$("#btnSubmit").click(function() {
		        $.post($("#schedForm").attr("action"), $("#schedForm").serialize(),
		              function() {
		                alert('Saved Record');
		                window.location.replace("${pageContext.request.contextPath}/schedules/");
		              });
		      });
			
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
				<form:form id="schedForm" action="${pageContext.request.contextPath}/schedules/saveNew" method="POST" modelAttribute="scheduleForm" >
					<table class="formTable">
						<tr>
							<td><form:label path="schedule.subjectCode" >Subject Code</form:label></td>
							<td><form:input path="schedule.subjectCode"/></td>
							
							 	
						</tr>
						
						<tr>
							<td><form:label path="schedule.section" >Section</form:label></td>
							<td><form:input path="schedule.section"/></td>
						</tr>
					</table>
					<h3>Lecture</h3>
					<table class="formTable">
						<tr>
							<td><form:label path="schedule.lecTimeStart" >Time Start</form:label></td>
							<td> <form:select path = "schedule.lecTimeStart">
							        <form:option value = "1" label = "1:00 AM" />
							        <form:option value = "1.5" label = "1:30 AM" />
							        <form:option value = "2" label = "2:00 AM" />
						    	 </form:select>     	
							</td>

						</tr>
						
						<tr>
							<td><form:label path="schedule.lecTimeEnd" >Time End</form:label></td>
							<td> <form:select path = "schedule.lecTimeEnd">
							        <form:option value = "1" label = "1:00 AM" />
							        <form:option value = "1.5" label = "1:30 AM" />
							        <form:option value = "2" label = "2:00 AM" />
						    	 </form:select>     	
							</td>
						</tr>
						
						<tr>
							<td><form:label path="schedule.lecRoom" >Room</form:label></td>
							<td><form:input path="schedule.lecRoom"/></td>
						</tr>
						
	
						
						<tr>
							<td><form:label path="schedule.lecDays" >Days</form:label></td>
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
						<h3>Lab</h3>
						<table class="formTable">
						<tr>
							<td><form:label path="schedule.labTimeStart" >Time Start</form:label></td>
							<td> <form:select path = "schedule.labTimeStart">
							        <form:option value = "1" label = "1:00 AM" />
							        <form:option value = "1.5" label = "1:30 AM" />
							        <form:option value = "2" label = "2:00 AM" />
						    	 </form:select>     	
							</td>
						</tr>
						
						<tr>
							<td><form:label path="schedule.labTimeEnd" >Time End</form:label></td>
							<td> <form:select path = "schedule.labTimeEnd">
							        <form:option value = "1" label = "1:00 AM" />
							        <form:option value = "1.5" label = "1:30 AM" />
							        <form:option value = "2" label = "2:00 AM" />
						    	 </form:select>     	
							</td>
						</tr>
						
						<tr>
							<td><form:label path="schedule.labRoom" >Room</form:label></td>
							<td><form:input path="schedule.labRoom"/></td>
						</tr>
						
					
						
						<tr>
							<td><form:label path="schedule.labDays" >Days</form:label></td>
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

				</form:form>
				</div>
				
				<div style="display: inline-block; vertical-align: top; margin-left: 150px;">
					
					<div id="horizontalAlign">
					   	<div class="divElements" >
						   	<input type="text" id="search"/>
							<input type="button" id="btnSearch" value="Search">
						</div>    
				    </div>
				    	
				    <div class="tableContainer" style=" width: 600px; height: 300px;">
						<jsp:include page="includes/subjectsview.jsp" />
	
					</div>
					
					<div style="padding-top: 40px;">
							<div style="padding-top: 10px;"><input type="button" id="btnSubmit" value="Create"/></div>
							<div style="padding-top: 10px;"><input type="button" id="btnClear" value="Clear"/></div>
					</div> 
				</div>
			</div>
			
			
			
			
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />
</body>
</html>
