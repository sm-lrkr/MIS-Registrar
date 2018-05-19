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
				$("#unenlisted").submit();
			});
			
			$("#withdraw").click(function(){
				$("#enlisted").submit();
			});
		});
	</script>
	
	
</head>
<body>


	<jsp:include page="includes/header.jsp" />
	<div id="main">
		<jsp:include page="includes/main-left.jsp" />
		<div>
			<div style="margin-bottom: 20px;">
				<h1 style="display: inline-block; margin-top: 0px;">${sectionName} - Enlist Students</h1>
				
				<div class="floatright">
					<a href="${pageContext.request.contextPath}/students/newspr" ><span class="linkButton" >View SPR</span></a>   
					<a href="sprForm" ><span class="linkButton" >Reports</span></a>   
			 	</div>
			</div>
			
			<div id="unEnlistedList" class="tableContainer">
				<form:form id="unenlisted" action="${pageContext.request.contextPath}/sections/bsc/enlist/?sectionID=${section.sectionID}" method="post" modelAttribute="unEnlisted">
					<table id="students" class="display compact listTable">  
						<thead>
							<tr><th></th><th>LRN</th><th>Last Name</th><th>First Name</th><th>Middle Name</th></tr>  
					   	</thead>
				
					   	<tbody>
						   	<c:forEach var="student" items="${unEnlisted.students}" varStatus="status" >   
							   	<tr>  
							   		<td>  
									   	<form:input path="students[${status.index}].empty" type="hidden" />
										<form:input path="students[${status.index}].studentNo" type="hidden" />
										<form:input path="students[${status.index}].strandCode" type="hidden" />
										<form:checkbox path="students[${status.index}].checked"  />
									</td>
							   		<td>${student.studentID}</td>  
								   	<td>${student.lastName}</td>  
								   	<td>${student.firstName}</td>
								   	<td>${student.middleName}</td>
								</tr>  
						   	</c:forEach>  
					   	</tbody>
				   </table>  
				</form:form>   
			</div >
		
			 <div id="horizontalAlign">
	   		<div>
				<button id= "enlist" class="linkButton"> Enlist </button>
			</div>
   			</div>
   	
			<div id="enlistedList" class="tableContainer">
				<form:form id="enlisted" action="${pageContext.request.contextPath}/sections/sh/withdraw/?sectionID=${section.sectionID}" method="post" modelAttribute="enlisted">
					<table id="students" class="display compact listTable">  
						<thead>
							<tr><th></th><th>LRN</th><th>Last Name</th><th>First Name</th><th>Middle Name</th></tr>  
					   	</thead>
					   	
					   	<tbody>
						   	<c:forEach var="student" items="${enlisted.students}" varStatus="status" >   
							   	<tr>  
							   		<td>  
									   	<form:input path="students[${status.index}].empty" type="hidden" />
										<form:input path="students[${status.index}].studentNo" type="hidden" />
										<form:checkbox path="students[${status.index}].checked"  />
									</td>
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
			
			<div id="horizontalAlign">
	   		<div class="divElements" >
				<button id= "withdraw" class="linkButton"> Widthdraw </button>
			</div>
   		</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
