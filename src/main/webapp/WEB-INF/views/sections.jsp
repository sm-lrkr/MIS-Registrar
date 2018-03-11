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
			var table = $('#sectionsview').DataTable( {
			 	"sDom" : 'rtf',
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'multiple'
		        },
		        "columnDefs": [
		        	{"title" : "SectionID", "visible" : false, "targets": 0 },
		        ],
		        'order': [[1, 'asc']]
		 	} );
			
			$('#sectionsview tbody').on( 'dblclick', 'tr', function () {
				var sectionID = table.row( this ).data()[0];
			    window.location.href = "${pageContext.request.contextPath}/sections/sh/?sectionID=" + sectionID;
			} );
			
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		<div>	
			<h1 style="display: inline-block; margin-top: 0px;">Sections</h1>  
		
			<div class="floatright">
						<a href="${pageContext.request.contextPath}/sections/newSection/sh" class="linkButton">New Section</a>    
			</div>
			
			<div style="padding-bottom: 5px;">
					<a id="all" class="linkButton" href="${pageContext.request.contextPath}/sections/"> ALL </a> 
			    	<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/sections/clg" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/sections/sh"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/sections/bsc"> BASIC </a> 
			</div>
			
			<div style="width: 1000px; " >
					<table id="sectionsview" class="display compact listTable">  
						<thead>
							<tr><th>SectionID</th><th>Section</th><th>Strand</th><th>Room</th><th>Session</th><th>Grade</th><th>Adviser</th></tr>  
					   	</thead>
					   	
						<tbody>
							<c:forEach var="section" items="${sections}">   
							   	<tr>
								   	<td>${section.sectionID}</td>  
								   	<td>${section.sectionName}</td>  
								   	<td>${section.strandCode}</td>  
								   	<td>${section.room}</td>
								   	<td>${section.session}</td>
								   	<td>${section.gradeLevel}</td>
								   	<td>${section.personnelName}</td>
								</tr>  
						   	</c:forEach>  
						</tbody>
					 </table>  
			</div>
			
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
