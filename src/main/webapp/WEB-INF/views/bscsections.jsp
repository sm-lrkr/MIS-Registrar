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
			    window.location.href = "${pageContext.request.contextPath}/sections/bsc/?sectionID=" + sectionID;
			} );
		
		});
	</script>
	
</head>
<body>
	
	<jsp:include page="includes/header.jsp" />
	<div id="main">

		<jsp:include page="includes/main-left.jsp" />
		<div>	
			<h1 style="display: inline-block; margin-top: 0px;">Sections - BSC</h1>  
			<div class="floatright">
						<a href="${pageContext.request.contextPath}/sections/newSection/bsc" class="linkButton">New Section</a>    
			</div>
			
			<div style="padding-bottom: 5px;">
					<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/sections/sh"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/sections/bsc"> BASIC </a> 
					<span class="notifier" >Double click on a record to view more details.</span>
			</div>
	
			<div style="width: 1000px; " >
			   <table id="sectionsview" class="display compact listTable">  
						<thead>
							<tr><th>SectionID</th><th>Section</th><th>Room</th><th>Session</th><th>Grade</th><th>Adviser</th></tr>  
					   	</thead>
					   	
						<tbody>
							<c:forEach var="section" items="${sections}">   
							   	<tr>
								   	<td>${section.sectionID}</td>  
								   	<td>${section.sectionName}</td>  
								   	<td>${section.room}</td>
								   	<td>${section.session}</td>
								   	<td>${section.gradeLevel}</td>
								   	<td>${section.personnelName}</td>
								</tr>  
						   	</c:forEach>  
						</tbody>
					 </table>  
		   </div>
			
			<div id="horizontalAlign">
				<div class="divElements" >
					<input type="text" id="search"/>
					<input type="button" id="btnSearch" value="Search">
				</div>
						
			</div>
			
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
