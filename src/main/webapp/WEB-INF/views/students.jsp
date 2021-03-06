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
			var ctx = "${pageContext.request.contextPath}";
			var url = encodeURI(ctx + '/ajax/departmentSelectChanged/?param=');
			departmentSelect($('#deptSelect'), $('#courseSelect'), ctx);
			courseSelect($('#search'), $('#courseSelect'), $('#studview'), ctx);
			searchStudents($('#search'), $('#searchBtn'), $('#courseSelect'), $('#studview'), ctx);	
		
			
			 var table = $('#studview').DataTable( {
				 	"dom" : 'rtf',
			        "scrollY":        "350px",
			        "paging" : false,
			        "scrollCollapse": false,
			        "columnDefs": [
			        	{"title" : "StudentNo", "visible" : false, "targets": 0 },
			        	{"title" : "ID/LRN"},
			        	{"title" : "Last Name"},
			        	{"title" : "First Name"},
			        	{"title" : "Middle Name"},
			        	{"title" : "Status"}
			        ]
			 } );
	
			table.on( 'dblclick', 'tr', function () {
				var stdNo = table.row( this ).data()[0];
				window.location.href = ctx+"/students/student/" + stdNo;
			} );
				
			$("#print").click(function(){
				var filter = table.search();
                window.open( encodeURI(ctx+"/students/printAll/?filter="+filter+""),'_blank');
			});
		
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
				    	<button id="print" class="linkButton">Print</button>   
			    	</div>
		  		</div>
		
				<div style="padding-bottom: 5px;" class="buttons" >
					<a id="all" class="linkButton" href="${pageContext.request.contextPath}/students/"> ALL </a> 
			    	<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/students/clg" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/students/sh"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/students/bsc"> BASIC </a> 
			   		<span class="notifier" >Double click on a record to view more details.</span>
			    </div>

				<div style="width: 1000px; " >
					<jsp:include page="includes/studentview.jsp"/>
				</div>
				
			
			</div>
		</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
