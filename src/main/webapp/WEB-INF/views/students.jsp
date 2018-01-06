<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/myscript.js" var="myscript" />

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="${css}" rel="stylesheet">
	<script type="text/javascript" src="${jscript}" ></script>
	<script type="text/javascript" src="${myscript}" ></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			var ctx = "${pageContext.request.contextPath}";
			var url = encodeURI(ctx + '/ajax/departmentSelectChanged/?param=');
			departmentSelect($('#deptSelect'), $('#courseSelect'), ctx);
			courseSelect($('#search'), $('#courseSelect'), $('#studview'), ctx);
			searchStudents($('#search'), $('#searchBtn'), $('#courseSelect'), $('#studview'), ctx);	
		});
	</script>
	
</head>
<body>


	<jsp:include page="includes/header.jsp" />
		<div id="main">
			<jsp:include page="includes/main-left.jsp" />
			<div>
				<div>
					<h1 style="display: inline-block; margin-top: 0px;">Students</h1>
					<div class="floatright">
						<a href="${pageContext.request.contextPath}/students/newspr" ><span class="linkButton" >Add New SPR</span></a>   
				    	<a href="sprForm" ><span class="linkButton" >Reports</span></a>   
			    	</div>
		  		</div>
			
				<div style="padding-bottom: 5px;">
					<a id="all" class="linkButton" href="${pageContext.request.contextPath}/students/"> ALL </a> 
			    	<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/students/clg" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/students/sh"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/students/bsc"> BASIC </a> 
			    </div>
			
				<div class="tableContainer">
					<jsp:include page="includes/studentview.jsp"/>
				</div>

	
				
				<div id="horizontalAlign">
			   		<div class="divElements" >
				   		<input type="text" id="search"/>
					    <input type="button" id="searchBtn" value="Search">
				   	</div>
				</div>
			
			</div>
		</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
