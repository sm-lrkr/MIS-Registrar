<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

    
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
			var table = $('#subjectsview').DataTable( {
			 	"sDom" : 'rtf',
		        "scrollY":        "300px",
		        "scrollCollapse": false,
		        "paging" : false,
		        "select": {
		        	style : 'single'
		        }
		 	} );
			
			table.on( 'dblclick', 'tr', function () {
				var subjectCode = table.row( this ).data()[0];
				var current = $("#preReq").val();
				if(current !== "")
				{
					current = current.concat(", ");	
				}	
				
				if(current.indexOf(subjectCode) == -1)
				{
					$("#preReq").val(current.concat(subjectCode));
				}
				
				
			});
			
			$("#submit").click(function() {
				$("#sectionForm").submit();
				
		     });

		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">

		<jsp:include page="includes/main-left.jsp" />
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">${pageTitle}</h1>  
		
			<form:form id="sectionForm" action="${pageContext.request.contextPath}/sections/${formType}/${sectionType}/save" modelAttribute="section" >
				<table class="formTable" style="margin-top: 30px;">
					<c:if test="${sectionType == 'sh'}">
						<tr>
							<td><form:label path="strandCode" >Strand Code</form:label></td>
							<td>
							<form:select style="width: 165px;"  path="strandCode" id="dbStrands" value="${section.strandCode}" >
								<form:option value="" label=""/>
								<c:forEach var="strand" items="${strands}">   
									<form:option value="${strand.strandCode}" label="${strand.strandCode}" /> 
							   	</c:forEach>  
							</form:select>
							</td>
						</tr>
					</c:if>

					<tr>
						<td><form:label path="sectionName" >Name</form:label></td>
						<td><form:input path="sectionName"/></td>
					</tr>
					
					<tr>
						<td><form:label path="room" > Room</form:label></td>
						<td>
							<form:select style="width: 165px;" path="room" id="dbPersonnel" value="${section.room}" >
								<form:option value="" label=""/>
								<c:forEach var="rm" items="${rooms}">   
									<form:option value="${rm.facil_name}" label="${rm.facil_name}" /> 
							   	</c:forEach>  
							</form:select>
						</td>
					</tr>
		
					<tr>
						<td><form:label path="session" >Session</form:label></td>
						<td>
							<form:select style="width: 165px;" path="session"  value="${section.session}" >
								<form:option value="" label="" />
								<form:option value="Day" label="Day" />
								<form:option value="Night" label="Night" />
								
							</form:select>
						</td>
					</tr>
			
					<tr>
						<td><form:label path="gradeLevel" >Grade Level</form:label></td>
						<td>
							<form:select style="width: 165px;" path="gradeLevel" id="dbPersonnel" >
								<form:option value="0" label="" />
								<c:choose>
									<c:when test="${sectionType == 'sh'}">
										<form:option value="11" label="Grade 11" />
										<form:option value="12" label="Grade 12" />
									</c:when>
									<c:when test="${sectionType == 'bsc'}">
										<form:option value="10" label="Grade 10" />
										<form:option value="9" label="Grade 9" />
										<form:option value="8" label="Grade 8" />
										<form:option value="7" label="Grade 7" />
										<form:option value="6" label="Grade 6" />
										<form:option value="5" label="Grade 5" />
										<form:option value="4" label="Grade 4" />
										<form:option value="3" label="Grade 3" />
										<form:option value="2" label="Grade 2" />
										<form:option value="1" label="Grade 1" />	
										<form:option value="-1" label="Kinder" />	
									</c:when>
									
								</c:choose>
							</form:select>
						</td>
					</tr>
			
					<tr>
						<td><form:label path="personnelID" >Adviser</form:label></td>
						<td>
							<form:select style="width: 165px;" path="personnelID" id="dbPersonnel" value="${section.personnelID}" >
								<form:option value="-1" label=""/>
								<c:forEach var="teacher" items="${teachers}">   
									<form:option value="${teacher.personnelID}" label="${teacher.first_name}-${teacher.last_name}" /> 
							   	</c:forEach>  
							</form:select>
						</td>
					</tr>
				</table>
				<br><br>
			</form:form>

			<div style="float: right;">
				<input type="button" class="linkButton" value="Cancel" >	
				<input id="submit" type="button" class="linkButton" value="Save" >	
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
