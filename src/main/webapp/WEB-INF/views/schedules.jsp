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
			var table = $('#schedsview').DataTable( {
			 	"sDom" : 'rtf',
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "paging" : false,
		        "select": {
		        	style : 'multiple'
		        },"columnDefs": [
		        	{"targets": 0, "visible" : false }
			    ]
		 	} );
			
			table.on( 'dblclick', 'tr', function () {
				var scheduleID = table.row( this ).data()[0];
				var subjectCode = table.row( this ).data()[1];
				window.location.href = ctx+"/schedules/clg/"+subjectCode+"/?id=" + scheduleID + "";
			} );
	
			$("#print").click(function(){
				  window.open( encodeURI(ctx+"/schedules/clg/printByCourse/?courseID=none&year=0"),'_blank');
			});
				
			
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
			
			<h1 style="display: inline-block; margin-top: 0px;">
				<c:if test="${schedsView == 'schedsViewCLG' }">		
					Schedules - College
				</c:if>
				<c:if test="${schedsView == 'schedsViewSH' }">		
					Schedules - SH
				</c:if>
				<c:if test="${schedsView == 'schedsViewBSC' }">		
					Schedules - Basic Education
				</c:if>
			</h1>  

			<div class="floatright">
				<a href="${pageContext.request.contextPath}/schedules/newSchedule/${dept}" class="linkButton" >Scheduler</a>
				<button id="print" class="linkButton">Print</button>   
			</div>

			<div style="padding-bottom: 5px;">
					<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/schedules/clg" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/schedules/sh"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/schedules/bsc"> BASIC </a> 
					<span class="notifier" >Double click on a record to view more details.</span>
			</div>
		
			
			<div style="width: 1000px; " >
				<jsp:include page="includes/${schedsView}.jsp" />
			</div>
		
			
			
			<div id="horizontalAlign">
			   	<div class="divElements" >
				   	<form:form id="daysPanel" action="" modelAttribute="daysCollector" >
				   		<form:checkbox class="cbox" path="days[0]" value="M"  label="M" />
			    		<form:checkbox class="cbox" path="days[1]" value="T"  label="T"/>
						<form:checkbox class="cbox" path="days[2]" value="W"  label="W"/>
						<form:checkbox class="cbox" path="days[3]" value="Th" label="Th"/>
						<form:checkbox class="cbox" path="days[4]" value="F"  label="F"/>
						<form:checkbox class="cbox" path="days[5]" value="S"  label="S"/>
						<form:checkbox class="cbox" path="days[6]" value="Su" label="Su"/>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
