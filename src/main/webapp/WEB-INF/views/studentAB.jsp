<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

    
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/jquery.validate.js" var="jqueryValidate" />   
<spring:url value="/resources/clgProfileForm.js" var="clgProfileForm" />   

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="<c:url value="/resources/main2.css" />" rel="stylesheet">
	
	<script type="text/javascript" src="${jscript}" ></script>
	<script type="text/javascript" src="${jqueryValidate}" ></script>
	<script type="text/javascript" src="${clgProfileForm}" ></script>
	
	
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#db_Course").on('change', function(){
				var ctx = "${pageContext.request.contextPath}";
				var searchurl = encodeURI(ctx+'/ajax/selectValueChanged/?param='+$("#db_Course").val());
				$.ajax({
					
					url: searchurl,
					type: "GET" ,
					success: function(result){
						$("#dbCurriculum").html(result);
						
					},
					error:function(e) {  
					      alert('Error: ' + e);   
					}  
					
				});
			});
			
			$("#db_Strands").on('change', function(){
				alert("canghed");
				var ctx = "${pageContext.request.contextPath}";
				var searchurl = encodeURI(ctx+'/ajax/StrandChanged/?param='+$("#db_Strands").val());
				$.ajax({
					
					url: searchurl,
					type: "GET" ,
					success: function(result){
						$("#dbCurriculum").html(result);
						
					},
					error:function(e) {  
					      alert('Error: ' + e);   
					}  
					
				});
			});
			
			
			$("#submit").click(function() {
				$("#profileForm").submit();
		     });
		});
		
	</script>
	
	
</head>
<body>



<jsp:include page="includes/header.jsp" />
<div id="main">
	<jsp:include page="includes/student-left-menu.jsp" />
	
	
	
	<div >
		<div style="border-bottom: 1px solid grey;">
			<h1 style="display: inline-block; margin-top: 0px;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
			<div class="floatright">
				<a href="${pageContext.request.contextPath}/students/registration/${student.studentNo}" ><span class="linkButton" >Back</span></a>   
				</div>
		</div>
	
		<div>
			<jsp:include page="forms/${form}.jsp" />	
		</div>
	</div>
	
</div>
<jsp:include page="includes/footer.jsp" />

</body>
</html>
