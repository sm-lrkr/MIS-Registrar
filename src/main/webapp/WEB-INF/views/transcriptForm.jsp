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
			var table = $('#allsubjects').DataTable( {
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
			
			$("#db_Option").on('input', function(){
				var lvl = $("#db_Option").val();
				window.location.href = "${pageContext.request.contextPath}/subjects/newSubject/" + lvl;
			
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
				<h1 style="display: inline-block;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
				<div class="floatright">
					<a href="${pageContext.request.contextPath}/grades/${dept}/tor/print/?studentNo=${student.studentNo}" id="print" ><span class="linkButton" >Print TOR</span></a>   
				 </div>
			</div>			
			<form:form id="subjectForm" action="${pageContext.request.contextPath}/subjects/${formType}/${subjectType}/Add" modelAttribute="subject" >
				<table class="formTable" style="margin-top: 30px;">
				
					<tr>
						<td>Subject Code</td>
						<td><form:input id="subjectCode" path="subjectCode"/></td>
					</tr>
					
					<tr>
						<td><form:label path="subjectDesc" >Description</form:label></td>
						<td><form:input path="subjectDesc"/></td>
					</tr>
		     		
		     		<tr>
						<td><form:label path="subjectCode" >Grade</form:label></td>
						<td><form:input id="subjectCode" path="subjectCode"/></td>
					</tr>
					
					<tr>
						<td><form:label path="subjectDesc" >Credits</form:label></td>
						<td><form:input path="subjectDesc"/></td>
					</tr>
							     		
					
					<tr>
						<td><form:label path="preRequisites" > School Year</form:label></td>
						<td><form:input id="preReq"   path="preRequisites" /></td>
					</tr>
					
					<tr>
						<td><form:label path="preRequisites" > Semester</form:label></td>
						<td><form:input id="preReq"   path="preRequisites" /></td>
					</tr>
					
					<tr>
						<td><form:label path="preRequisites" > School</form:label></td>
						<td><form:input id="preReq"   path="preRequisites" /></td>
					</tr>
					
				</table>
				<br><br>
			</form:form>
	
			<div style="float: right;">
					<input id="submit" type="button" class="linkButton" value="add" >	
			</div>
		</div>
		<div style="margin-left: 100px; width: 700px">
			<table id="allsubjects" class="display compact listTable">  
				<thead>
					<tr>
						<th>Subject Code</th>
						<th>Description</th>
						<th>Grades</th>
						<th>Credit/s</th>
						<th>School Year</th>
						<th>Semester</th>
						<th>School</th>
						
										
					</tr>  
			   	</thead>
		
				<tbody>
					<c:forEach var="subj" items="${credited}">   
					   	<tr>  
						   	<td>${subj.subjectCode}</td>  
						   	<td>${subj.subjectDesc}</td>  
						   	<td>${subj.finalGrade}</td>  
						   	<td>${subj.lecUnits + subj.labUnits}</td>
						   	<td>${subj.schoolYear}</td>
						   	<td>${sems[subj.semester]}</td>
						   	<td>Benedicto College</td>
						   </tr>  
			   		</c:forEach>
				</tbody>
				  
		  	 </table>  
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
