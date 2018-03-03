<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

    
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/jquery.validate.js" var="jqueryValidate" />   
<spring:url value="/resources/sprFormValidation.js" var="sprFormValidate" />   
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="<c:url value="/resources/main2.css" />" rel="stylesheet">
	
	<script type="text/javascript" src="${jscript}" ></script>
	<script type="text/javascript" src="${jqueryValidate}" ></script>
	<script type="text/javascript" src="${sprFormValidate}" ></script>
	
	
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
		
			
			$("#dbTypes").on('input', function(){
				var type = $("#dbTypes").val();
				if(type == "clg"){
					$(".clg").show();
					$(".shs").hide();
					$(".bsc").hide();
					
				}
				if(type == "shs"){
					$(".clg").hide();
					$(".shs").show();
					$(".bsc").hide();
					
					
				}
				if(type == "bsc"){
					$(".clg").hide();
					$(".shs").hide();
					$(".bsc").show();
				}
			});		
			
			
			$("#save").click(function() {
		        $("#saveEdited").submit();
		     });
			
			$("#edit").click(function() {
				$("#saveEdited :input").prop("disabled", false);
				$("#saveEdited :input").removeClass("disabledInput");
				$("#save").show();
				$("#cancel").show();
				$("#edit").hide();
				$("#print").hide();
				
			});
		
			$("#cancel").click(function() {
				$("#saveEdited :input").prop("disabled", true);
				$("#saveEdited :input").addClass("disabledInput");
				$("#save").hide();
				$("#cancel").hide();
				$("#print").show();
				$("#edit").show();
			});
			
			$("#saveEdited :input").prop("disabled", true);
			$("#saveEdited :input").addClass("disabledInput");
			$("#save").hide();
			$("#cancel").hide();
			
			$(".clg").show();
			$(".shs").hide();
			$(".bsc").hide();
		
		
		});
		
	

	
	</script>
	
	
</head>
<body>



<jsp:include page="includes/header.jsp" />
<div id="main">
	<jsp:include page="includes/main-left.jsp" />
	<div>
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">New Student</h1>
			<input type="hidden" id="url" value="${pageContext.request.contextPath}/students/student/" />
			<c:if test="${saveType=='saveEdited'}" >
				<div class="floatright">
						<button id="edit" class="linkButton" >Edit</button>   
						<button id="save" class="linkButton"  >Save</button>   
						<button id="cancel" class="linkButton"  >Cancel</button>   
						
						<a href="sprForm" id="print" ><span class="linkButton" >Print</span></a>   
				</div>
			</c:if>
		</div>
		<form:form method="POST" action="${pageContext.request.contextPath}/students/spr/${saveType}${params}" modelAttribute="sprForm" id="${saveType}" >
			<jsp:include page="forms/studentPersonalData.jsp" />
			<jsp:include page="forms/studentFBG.jsp" />
			<c:choose>
				<c:when test="${saveType=='saveNew'}">
					<jsp:include page="forms/collegeProfile.jsp" />
					<jsp:include page="forms/shProfile.jsp" />
					<jsp:include page="forms/basicProfile.jsp" />
					<input type="submit" class="linkButton" style="float:right;" value="Save New"/>
	
				</c:when>
				<c:otherwise>
					<jsp:include page="forms/${profileForm}.jsp" />
					<input type="submit" class="linkButton" style="float:right;" value="Save"/>
				</c:otherwise>
			</c:choose>
			
		</form:form>
	</div>
</div>
<jsp:include page="includes/footer.jsp" />

</body>
</html>
