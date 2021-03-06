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
				$("#courseForm").submit();
		     });

		});
	</script>

	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">New Program</h1>  
			<form:form method="POST" id="courseForm" action="${pageContext.request.contextPath}/courses/${saveType}/${id}" modelAttribute="course" >
				<table class="formTable" style="margin-top: 30px;">
					<tr>
						<td><form:label path="courseID" >Program</form:label></td>
						<td><form:input path="courseID"/></td>
					</tr>

					<tr>
						<td><form:label path="courseDesc" >Description</form:label></td>
						<td><form:input path="courseDesc"/></td>
					</tr>
					<tr>
						<td><form:label path="departmentCode" >Departments</form:label></td>
						<td>
							<form:select  style="width:160px;" path="departmentCode" id="dbTypes" value="${department.departmentCode}" >
								<form:option value="" label=""/>
								<c:forEach var="dept" items="${departments}">   
									<form:option value="${dept.departmentCode}" label="${dept.departmentCode}" /> 
							   	</c:forEach>  
							</form:select>
						</td>
					</tr>
				</table>
				<br><br>
			</form:form>
			
			<div style="float: right;">
				<a class="linkButton" href="${pageContext.request.contextPath}/">Cancel</a>
				<input id="submit" type="button" class="linkButton" value="Save" >	
			</div>
		</div>
	</div>

	<jsp:include page="includes/footer.jsp" />


</body>
</html>
