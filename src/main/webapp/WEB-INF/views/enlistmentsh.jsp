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
			$("#btnSearch").click(function(){
				var searchurl = encodeURI('ajax/ajaxdemo/?param='+$("#search").val());
					
				$.ajax({
					
					url: searchurl,
					type: "GET" ,
					success: function(result){
						$('#studview').html(result);
					},
					error:function(e) {  
					      alert('Error: ' + e);   
					}  
					
				});
			});
			$("#search").on('input', function(){
				
			});
			
			$("#enlist").click(function(){
				$("#offeredTable").submit();
			});
			
			$("#withdraw").click(function(){
				$("#enlistedTable").submit();
			});
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
		<jsp:include page="includes/student-left-menu.jsp" />
		<div>
			<div style="margin-bottom: 20px;">
				<h1 style="display: inline-block; margin-top: 0px;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
				<h3 style="display: inline-block; margin-top: 0px;">${ID}</h3>
				
				<div class="floatright">
					<a href="${pageContext.request.contextPath}/students/newspr" ><span class="linkButton" >View SPR</span></a>   
					<a href="sprForm" ><span class="linkButton" >Reports</span></a>   
			 	</div>
			</div>
			<div id="offeredList" class="tableContainer">
				<jsp:include page="includes/sectionSchedsView.jsp" />
			</div >
			 <div id="horizontalAlign">
	   		<div>
				<button id= "enlist"> Enlist checked</button>
			</div>
   			</div>
			<div id="enlistedList" class="tableContainer">
				<jsp:include page="includes/sectionSchedsView.jsp" />
			</div>
			<div id="horizontalAlign">
	   		<div class="divElements" >
				<button id= "enlist"> Widthdraw checked</button>
			</div>
   		</div>
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
