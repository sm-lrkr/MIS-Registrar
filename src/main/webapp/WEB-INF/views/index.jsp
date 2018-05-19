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
			$("#deptSelect").on('change', function(){
				var ctx = "${pageContext.request.contextPath}";
				var searchurl = encodeURI(ctx+'/ajax/departmentSelectChanged/?param='+$("#deptSelect").val());
				$.ajax({
					
					url: searchurl,
					type: "GET" ,
					success: function(result){
						$("#courseSelect").html(result);
					},
					error:function(e) {  
					      alert('Error: ' + e);   
					}  
					
				});
			});
			
			$("#courseSelect").on('change', function(){
				var ctx = "${pageContext.request.contextPath}";
				var searchurl = encodeURI(ctx+'/ajax/searchstudent/?param='+$("#search").val()+'&courseID='+ $("#courseSelect").val());
				$.ajax({
					
					url: searchurl,
					type: "GET" ,
					success: function(result){
						$("#studview").html(result);
					},
					error:function(e) {  
					      alert('Error: ' + e);   
					}  
					
				});
			});
			
			$("#buttondemo1").click(function(){
				var ctx = "${pageContext.request.contextPath}";
				var searchurl = encodeURI(ctx+'/ajax/searchstudent/?param='+$("#search").val()+'&courseID='+ $("#courseSelect").val());
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
						<a href="newspr" ><span class="linkButton" >Add New SPR</span></a>   
				    	<a href="sprForm" ><span class="linkButton" >Reports</span></a>   
			    	</div>
		  		</div>
			
				<div id="container">
					<jsp:include page="includes/studentview.jsp"/>
				</div>
				
				<div id="horizontalAlign">
			   		<div class="divElements" >
				   		<input type="text" id="search"/>
					    <input type="button" id="buttondemo1" value="Search">
				   	</div>
		   		
		   
			   		<div class="divElements" >
				   		<select id="deptSelect" >
			   			<option value="" label="--Department--"/>
			   				<c:forEach var="dep" items="${departments}">   
								<option value="${dep.departmentCode}" label="${dep.departmentName}" /> 
							</c:forEach>  
				   		</select>
				
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
