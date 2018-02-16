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
				var data = table.rows().data();
				var subjectCode = $("#subjectCode").val();
				var count = 0;
				
				data.each(function (value, index) {
				    if(subjectCode.toUpperCase() == value[0].toUpperCase())
				    {
				    	 count += 1;
				    }
				});

				if(count == 0)
				{
					$("#subjectForm").submit();	
				}
				else
				{
					alert("Subject already exists.");	
				}
				
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
						<td><form:label path="teacher" >Adviser</form:label></td>
						<td><form:input id="teacher"   path="teacher" /></td>
					</tr>
				</table>
				<br><br>
			</form:form>
			
			<div style="float: right;">
				<input id="submit" type="button" class="linkButton" value="Save" >	
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
