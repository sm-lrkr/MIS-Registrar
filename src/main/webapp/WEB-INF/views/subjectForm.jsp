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
	
		<jsp:include page="includes/main-left.jsp" />
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">${pageTitle}</h1>  
	
			<form:form method="POST" id="subjectForm" action="${pageContext.request.contextPath}/subjects/${formType}/${subjectType}/save${subjectCode}" modelAttribute="subject" >
				<table class="formTable" style="margin-top: 30px;">
			
					<tr>
						<td><form:label path="subjectCode" >Subject Code</form:label></td>
						<td><form:input id="subjectCode" path="subjectCode"/></td>
					</tr>
					
					<tr>
						<td><form:label path="subjectDesc" >Description</form:label></td>
						<td><form:input path="subjectDesc"/></td>
					</tr>
		     		<c:if test = "${subjectType == 'clg'}">
						<tr>
							<td><form:label path="lecUnits" >Lec Units</form:label></td>
							<td><form:input path="lecUnits"/></td>
						</tr>
							
						<tr>
							<td><form:label path="labUnits" >Lab Units</form:label></td>
							<td><form:input path="labUnits"/></td>
						</tr>		         
					</c:if>
					
				
					<c:if test = "${subjectType ne 'bsc'}">
						<tr>
							<td><form:label path="preRequisites" > Pre Requisites</form:label></td>
							<td><form:input id="preReq"   path="preRequisites" /></td>
						</tr>
					</c:if>
	
					<c:if test = "${subjectType == 'sh'}">
						<tr>
							<td><form:label path="type" >Type</form:label></td>
							<td><form:select  path="type" id="dbTypes" value="${subject.type}" >
									<form:option value="CORE" label="CORE"/>
									 <form:option value="APPLIED" label="APPLIED"/>
									 <form:option value="SPECIALIZATION" label="SPECIALIZATION"/>
									
								</form:select>
							</td>
						</tr>
					</c:if>
					
				</table>
				<br><br>
			</form:form>
		
			<div style="float: right;">
					<input id="submit" type="button" class="linkButton" value="Save" >	
			</div>
		</div>
		<div style="margin-left: 100px; width: 700px">
			<table id="subjectsview" class="display compact listTable">  
				<thead>
					<tr>
						<th>Subject Code</th>
						<th>Description</th>
						<c:if test = "${subjectType == 'clg'}">
							<th>Lecture Units</th>
							<th>Lab Units</th>
						</c:if>
						<th>Pre Requisites</th>
					</tr>  
			   	</thead>
				
				<tbody>
					<c:forEach var="subj" items="${subjects}">   
					   	<tr>  
						   	<td>${subj.subjectCode}</td>  
						   	<td>${subj.subjectDesc}</td>  
						   	<c:if test = "${subjectType == 'clg'}">
								<td>${subj.lecUnits}</td>  
							   	<td>${subj.labUnits}</td>  
							</c:if>
						   	<td>${subj.preRequisites}</td>  
						   	
					   	</tr>  
			   		</c:forEach>
				</tbody>
				  
		  	 </table>  
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
