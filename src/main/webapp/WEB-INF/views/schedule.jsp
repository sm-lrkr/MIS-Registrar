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

	
			var table = $('#studview').DataTable( {
			 	"sDom" : 'rtf',
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'multiple'
		        },"columnDefs": [
		        	{"targets": 0, "visible" : false }
		        ]
		 	} );
				
			table.on( 'dblclick', 'tr', function () {
				var stdNo = table.row( this ).data()[0];
				window.location.href = ctx+"/students/student/" + stdNo;
			} );
			
		
			
			$(".cbox").on('click', function(){
				var searchurl = encodeURI('ajax/schedSearch/?param='+$("#search").val());
				
				$.ajax({
					url: searchurl,
					data: $("#daysPanel").serialize(),
					type: "POST" ,
					success: function(result){
						$('#schedsView').html(result);
					},
					
					error: function (jqXHR, exception) {
				        var msg = '';
				        if (jqXHR.status === 0) {
				            msg = 'Not connect.\n Verify Network.';
				        } else if (jqXHR.status == 404) {
				            msg = 'Requested page not found. [404]';
				        } else if (jqXHR.status == 500) {
				            msg = 'Internal Server Error [500].';
				        } else if (exception === 'parsererror') {
				            msg = 'Requested JSON parse failed.';
				        } else if (exception === 'timeout') {
				            msg = 'Time out error.';
				        } else if (exception === 'abort') {
				            msg = 'Ajax request aborted.';
				        } else {
				            msg = 'Uncaught Error.\n' + jqXHR.responseText;
				        }
				       	alert(msg);
				    }  
					
				});
			});
			
			
			
			
			
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">${subjectCode}</h1>  
			<div class="floatright">
						<a href="newSchedule" class="linkButton">New Schedule</a>    
			</div>
			
			<div style="margin-bottom: 100px;">
				<table class="formTable" style="margin-top: 30px;">
					<tr>
						<td>Section</td>
						<td>${schedule.section}</td>
					</tr>
						
					
					<c:if test = "${classType == 'LEC'}">
						<tr>
							<td>Units</td>
							<td>${schedule.lecUnits}</td>
						</tr>
						
						<tr>
							<td>Time</td>
							<td>${schedule.lecTimeStart} - ${schedule.lecTimeEnd} </td>
						</tr>		
						
						<tr>
							<td>Days</td>
							<td>${schedule.lecDays}</td>
						</tr>		
						
						<tr>
							<td>Room</td>
							<td>${schedule.lecRoom}</td>
						</tr>				         
					</c:if>
			
				</table>
			</div>
		
			
			<div style="width: 1000px; " >
					<jsp:include page="includes/studentview.jsp"/>
			</div>
		
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
