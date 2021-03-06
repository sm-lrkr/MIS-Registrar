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


			var table = $('#studview').DataTable( {
			 	"sDom" : 'rt<"courses">f',
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "paging" : false,
		        "select": {
		        	style : 'multiple'
		        },
		        "columnDefs": [
		        	{"title" : "StudentNo", "visible" : false, "targets": 0 },
		        	{"title" : "ID"},
		        	{"title" : "Last Name"},
		        	{"title" : "First Name"},
		        	{"title" : "Middle Name"},
		        ]
		 	} );
			
			$("#print").click(function(){
				 var courseID = $("#courseSelect").val();
                 var filter = table.search();
                 window.open( encodeURI(ctx+"/students/clg/printByCourse/?courseID="+courseID+"&filter="+filter+""),'_blank');
			});
			
			$('#studview tbody').on( 'dblclick', 'tr', function () {
				//alert();
			    //alert( table.row( this ).data()[0] );
			    var stdNo = table.row( this ).data()[0];
			    window.location.href = ctx+"/students/student/" + stdNo;
			} );
			
			departmentSelect($('#deptSelect'), $('#courseSelect'), ctx);
			courseSelect(table.search(), $('#courseSelect'), $('#studview'), ctx);
			searchStudents(table.search(), $('#searchBtn'), $('#courseSelect'), $('#studview'), ctx);	
		
		});
	</script>
	
</head>
<body>


	<jsp:include page="includes/header.jsp" />
		<div id="main">
			<jsp:include page="includes/main-left.jsp" />
			<div>
				<div>
					<h1 style="display: inline-block; margin-top: 0px;">Students - College</h1>
					<div class="floatright">
						<a href="newspr" ><span class="linkButton" >Add New SPR</span></a>   
				    	<button type="button" id="print" class="linkButton" >Print</button>   
			    	</div>
		  		</div>

				<div style="padding-bottom: 5px;">
					<a id="all" class="linkButton" href="${pageContext.request.contextPath}/students/"> ALL </a> 
			    	<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/students/clg" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/students/sh"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/students/bsc"> BASIC </a> 
			   		<span class="notifier" >Double click on a record to view more details.</span>
			    </div>
	
				<div style="width: 1000px; " >
					<jsp:include page="includes/studentview.jsp"/>
			
					<div id="courses"  class="courses" style="margin-top:-30px;">
				   		<select id="courseSelect">
				   			<option value="" label="--- Course ---"/>
				   			<c:forEach var="crs" items="${courses}">   
								<option value="${crs.courseID}" label="${crs.courseDesc}" /> 
							</c:forEach>  
				   		</select>
					</div>
				</div>

				
			</div>
		</div>
	<jsp:include page="includes/footer.jsp" />

</body>
</html>
