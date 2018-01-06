<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

    
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="<c:url value="/resources/main2.css" />" rel="stylesheet">
	
	<script type="text/javascript" src="${jscript}" ></script>
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
			
			
			$("#submit").click(function() {
				alert("clicked")
		        $.post($("#form1").attr("action"), $("#form1").serialize()+$("#form2").serialize(),
		              function(result) {
		                alert('Saved Record');
		                var url = $("#url").val() + "/" + result;
		                window.location.replace(url);
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
		<jsp:include page="forms/studentPersonalData.jsp" />
		<jsp:include page="forms/studentFBG.jsp" />
		<input type="hidden" id="url" value="${pageContext.request.contextPath}/students/student/" />
		
		<form action="${pageContext.request.contextPath}/students/saveNewSPR" id="submitForm" method="POST" >
		
		</form>
		<button class="linkButton" style="float:right;" id="submit" >Save New</button>   
	</div>
</div>
<jsp:include page="includes/footer.jsp" />

</body>
</html>
