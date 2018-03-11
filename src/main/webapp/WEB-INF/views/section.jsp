<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/css/dataTable.min.css" var="dtcss" />
<spring:url value="/resources/css/dataTableSelect.min.css" var="dtselectcss" />

<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/myscript.js" var="myscript" />
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
			var table = $('#schedules').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY":        "250px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'single'
		        },
		        'order': [[1, 'asc']]
		 	} );
		
			var table2 = $('#students').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY":        "200px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'single'
		        },
		        "columnDefs": [
		        	{"title" : "SectionID", "visible" : false, "targets": 0 },
		        ],
		        'order': [[1, 'asc']]
		 	} );
			
			$("#sectionForm :input").prop("disabled", true);
			$("#sectionForm :input").addClass("disabledInput");
		
			
		});
	</script>
	
	
</head>
<body>
	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		<div>	
			<h1 style="display: inline-block; margin-top: 0px;">${sectionName}</h1>  
			<div class="floatright">
					<a href="newspr" ><span class="linkButton" >Add New SPR</span></a>   
					<button type="button" id="print" class="linkButton" >Export</button>   
			</div>
		

			<div style="display: flex; flex-direction: horizontal; margin-top:30px;">
				<div>
					<form:form id="sectionForm" action="" modelAttribute="section" >
						<table class="formTable" style="margin-top: 0px;">
						
							<tr>
								<td><form:label path="strandCode" >Strand Code</form:label></td>
								<td><form:input id="strandCode" path="strandCode"/></td>
							</tr>
							
							<tr>
								<td><form:label path="sectionName" >Name</form:label></td>
								<td><form:input path="sectionName"/></td>
							</tr>
							
							<tr>
								<td><form:label path="room" > Room</form:label></td>
								<td><form:input id="room"   path="room" /></td>
							</tr>
						
							<tr>
								<td><form:label path="session" >Session</form:label></td>
								<td><form:input id="session"   path="session" /></td>
							</tr>
						
							<tr>
			
								<td><form:label path="personnelID" >Adviser</form:label></td>
								<td>
									 <form:select path="personnelID" id="db_Personnel" value="${section.personnelID}" style="width:170px;" >
										<form:option value="" label=""/>
										<c:forEach var="teacher" items="${teachers}">   
											<form:option value="${teacher.personnelID}" label="${teacher.firstName} ${teacher.lastName}" /> 
									   	</c:forEach>  
									</form:select>	
								</td>
								
							</tr>
						</table>
						<br><br>
					</form:form>
			
					<div class="floatright" style="margin-bottom: 20px;" >
						<button type="button" class="linkButton"> Edit</button>    
					</div>
				</div>

				<div style="width: 650px; margin-left: 60px;">
					<table id="schedules" class="display compact listTable">  
						<thead>
							<tr><th>Code</th><th>Time </th><th>Room</th><th>Days</th><th>Teacher</th></tr>  
					   	</thead>
					   	 
					   	<tbody>
						   	<c:forEach var="schedule" items="${schedulesForm.schedules}">   
							   	<tr>  
								   	<td>${schedule.subjectCode}</td>  
								   	<td>${schedule.lecTimeStart} - ${schedule.lecTimeEnd}</td>  
								   	<td>${schedule.lecRoom}</td>
								   	<td>${schedule.lecDays}</td>
								   	<td>${schedule.personnelName}</td>
								   	
								</tr>  
						   	</c:forEach>  
					   	</tbody>
				   </table>  
				</div>
			</div>
	
			<div style="width:1000px; margin-top:30px; ">
				<div  style="margin-bottom: 20px;" >
					<a href="${pageContext.request.contextPath}/sections/${sectionType}/enlistment/?sectionID=${section.sectionID}" class="linkButton"> Enlistment</a>    
				</div>
		
		
				<form:form id="secStudents" action="${pageContext.request.contextPath}/sections/${formType}/${sectionType}/save" method="post" modelAttribute="enlisted">
					<table id="students" class="display compact listTable">  
						<thead>
							<tr><th>StudentNo</th><th>LRN</th><th>Last Name</th><th>First Name</th><th>Middle Name</th></tr>  
					   	</thead>
					   
					   	<tbody>
						   	<c:forEach var="student" items="${enlisted.students}" varStatus="status" >   
							   	<tr>  
							   		<td>${student.studentNo}</td>  
								   	<td>${student.studentID}</td>  
								   	<td>${student.lastName}</td>  
								   	<td>${student.firstName}</td>
								   	<td>${student.middleName}</td>
								</tr>  
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
