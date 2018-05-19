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
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'single'
		        },"columnDefs": [
		        	{"title" : "Subject Code"},
		        	{"title" : "Description"},
		        	{"title" : "Pre Requisites"},	
		        	{ "visible" : false, "targets": [2,3]}
		        ]
		 	} );
		
			table.on( 'dblclick', 'tr', function () {
				var subjectCode = table.row( this ).data()[0];
				window.location.href = "${pageContext.request.contextPath}/subjects/bsc/" + subjectCode;
			} );
		});
	</script>
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">Subjects - BSC</h1>  
			<div class="floatright">
					<a href="${pageContext.request.contextPath}/subjects/newSubject/bsc" ><span class="linkButton">Add New Subject</span></a>    
			</div>
			
			<div style="padding-bottom: 5px;">
					<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/subjects/clg" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/subjects/sh"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/subjects/bsc"> BASIC </a> 
					<span class="notifier" >Double click on a record to view more details.</span>
			</div>
	
			<div style="width: 1000px;" >
				<jsp:include page="includes/subjectsview.jsp" />
			</div>
			
    		
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
