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
			var ctx = "${pageContext.request.contextPath}";
			var url = encodeURI(ctx + '/ajax/departmentSelectChanged/?param=');
			departmentSelect($('#deptSelect'), $('#courseSelect'), ctx);
			courseSelect($('#search'), $('#courseSelect'), $('#studview'), ctx);
			searchStudents($('#search'), $('#searchBtn'), $('#courseSelect'), $('#studview'), ctx);	
	
		
			$("#profileForm :input").prop("disabled", true);
			$("#profileForm :input").addClass("disabledInput");
		
			var table1 = $('#enlisted').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY":        "300px",
		        "scrollCollapse": false,
		        "select": {
		        	style : 'multi'
		        },
		        "columnDefs": [
		        	{	"targets": [2,5,6],  
		        		"orderable" : false
		        	}
		        ],
		        'order': [[1, 'asc']]
		 	} );
		
		});
	</script>

</head>
<body>


	<jsp:include page="includes/header.jsp" />
		<div id="main">
			<jsp:include page="includes/student-left-menu.jsp" />
			<div style="width: 70%">
				<div>
					<h1 style="display: inline-block; margin-top: 0px;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
					<div class="floatright">
						<a href="${pageContext.request.contextPath}/students/spr/info/${student.studentNo}" ><span class="linkButton" >View SPR</span></a>   
				    </div>
		  		</div>
		  		<hr>
			    <div style="display: flex; flex-direction: horizontal; margin-top:30px;">
					<div>
						<form:form id="profileForm" action="" modelAttribute="profile" >
							<table class="formTable" style="margin-top: 0px;">
								
								<tr>
									<c:choose>
		         					     <c:when test = "${profileType == 'college'}">
		         					     	<td><form:label path="studentID" >ID</form:label></td>
											<td><form:input path="studentID" /></td>
		         					     </c:when>
		         					    <c:otherwise>
		         					     	<td><form:label path="LRN" >LRN</form:label></td>
											<td><form:input path="LRN" /></td>
		         					    </c:otherwise>	 
		         					 </c:choose>    
								</tr>
							
								<tr>
									<c:choose>
		         					     <c:when test = "${profileType == 'college'}">
		         					     	<td><form:label path="courseID" >Course</form:label></td>
											<td><form:input path="courseID" /></td>
		         					     </c:when>
		         					     <c:when test = "${profileType == 'shs'}" >
		         					     	<td><form:label path="strandCode" >Strand</form:label></td>
											<td><form:input path="strandCode" /></td>
		         					     </c:when>
		         					</c:choose>
								</tr>
								
								<tr>
									<td><form:label path="studentStatus" >Status</form:label></td>
									<td><form:input path="studentStatus" /></td>
								</tr>
		
								<tr>
									<td><form:label path="enrolled" >Enrollment Status</form:label></td>
									<td>
										 <form:select path="enrolled" id="db_Personnel" value="${profile.enrolled}" style="width:170px;" >
											<form:option value="1" label="Enrolled"/>
											<form:option value="0" label="NOt Enrolled"/>
																					
										</form:select>	
									</td>
								</tr>
								
								<tr>
									<td><form:label path="yearEntry" >Year Entry</form:label></td>
									<td><form:input path="yearEntry" /></td>
								</tr>
							
							</table>
							<br><br>
						</form:form>
	
					</div>
	
					<div style="width: 650px; margin-left: 60px;">
					
					</div>
				</div>
				<div style="width:1000px; margin-top:30px; ">
					<form:form id="enlistedTable" action="${pageContext.request.contextPath}/schedules/withdraw/college/${student.studentNo}" method="post" modelAttribute="enlisted">
						<table id="enlisted"  class="display compact listTable">  
							<thead>
								<tr><th>Subject</th><th>Section</th><th>Units</th><th>Time Start</th><th>Time End</th><th>Days</th><th>Room</th></tr>  
						   	</thead>
						   	
						   	<tbody>
							   	<c:forEach var="sched" items="${enlisted.schedules}" varStatus="status">   
								   	<tr>  
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
				
				
			</div>
		</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
