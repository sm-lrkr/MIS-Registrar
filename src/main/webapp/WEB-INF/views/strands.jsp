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
			var table = $('#strandsview').DataTable( {
			 	"sDom" : 'rtf',
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "select": {
		        	style : 'single'
		        }
		 	} );
			
			table.on( 'dblclick', 'tr', function () {
				var strandCode = table.row( this ).data()[0];
				window.location.href = encodeURI("${pageContext.request.contextPath}/courses/strands/" + strandCode+"/?curricID=");
			} );
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		<div>	
			<h1 style="display: inline-block; margin-top: 0px;">Strands</h1>  
			<div class="floatright">
						<a href="${pageContext.request.contextPath}/courses/newStrand" class="linkButton">New Strand</a>    
			</div>
			
			<div style="padding-bottom: 5px;" class="buttons" >
					<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/courses/" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/courses/strands	"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/courses/bsc/?curricID="> BASIC </a> 
			</div>
		
			<div style="width: 1000px; " >
				<table id="strandsview"class="display compact listTable">  
					<thead>
						<tr><th>StrandCode</th><th>Track</th><th>Description</th><th>Major</th></tr>  
				   	</thead>
				
					<tbody>
						<c:forEach var="strand" items="${strands}">   
						   	<tr>  
							   	<td>${strand.strandCode}</td>  
							   	<td>${strand.track}</td>  
							   	<td>${strand.strandDesc}</td>  
							   	<td>${strand.major}</td>  
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
