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
			$("#dbCurriculum").on('change', function(){
				alert($("#dbCurriculum").val());
			});
			
			$("#submit").click(function() {
				alert("clicked");	
				var ctx = "${pageContext.request.contextPath}";
					var id = "";
					//alert("clgid"+$("#clgid").val());
					if($("#clgid").val()!="")
					{
					
						id = $("#clgid").val(); 
					}
					else if($("#shid").val()!=""){
						id = $("#shid").val();
					}
					else if($("#bscid").val() !=""){
						id = $("#bscid").val();
					}	
					alert(id);
					var searchurl = encodeURI(ctx+'/ajax/studentIDExists/?studentID='+id);
					$.ajax({
					
						url: searchurl,
						type: "GET" ,
						success: function(result){
							if(result==""){
								alert("ID is unique: "+ result);
								$("form").submit();
							}
							else{
								alert("ID exists: "+ result);
								return false;
							}
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
		
			var shiftee = $(".db_clgshiftee").val();
			if(shiftee == "true"){
				$(".db_clgshiftCourse").show();			
			}else{
				$(".db_clgshiftCourse").hide();
			}
			
			var shiftee1 = $(".db_shsshiftee").val();
			if(shiftee1 == "true"){
				$(".db_shshiftCourse").show();			
			}else{
				$(".db_shsshiftCourse").hide();
			}
			
			$(".db_clgshiftee").on('change', function(){
				var shiftee = $(".db_clgshiftee").val();
				if(shiftee == "true"){
					$(".db_clgshiftCourse").show();			
				}else{
					$(".db_clgshiftCourse").hide();
				}
			});
		
			$(".db_shsshiftee").on('change', function(){
				var shiftee = $(".db_shsshiftee").val();
				if(shiftee == "true"){
					$(".db_shsshiftCourse").show();			
				}else{
					$(".db_shsshiftCourse").hide();
				}
			});
			
		
			var type = $(".db_prevSchool").val();
			if(type == "public"){
				$(".db_esc").hide();			
			}else{
				$(".db_esc").show();
			}
			$(".db_prevSchool").on('change', function(){
				var type = $(".db_prevSchool").val();
				if(type == "public"){
					$(".db_esc").hide();			
				}else{
					$(".db_esc").show();
				}
			});

	
			$("#dbTypes").on('input', function(){
				var type = $("#dbTypes").val();
				if(type == "clg"){
					$(".clg").show();
					$(".shs").hide();
					$(".bsc").hide();
					$("input[class*='shs']").val('');
					$("input[class*='bsc']").val('');
					$('.shs').find('select').each(function(){this.selectedIndex = 0;});
					$('.bsc').find('select').each(function(){this.selectedIndex = 0;});
					
				}
				if(type == "shs"){
					
					$(".clg").hide();
					$(".shs").show();
					$(".bsc").hide();
					$("input[class*='clg']").val('');
					$("input[class*='bsc']").val('');
					$('.clg').find('select').each(function(){this.selectedIndex = 0;});
					$('.bsc').find('select').each(function(){this.selectedIndex = 0;});
				
				}
				if(type == "bsc"){
					$(".clg").hide();
					$(".shs").hide();
					$(".bsc").show();
					$("input[class*='clg']").val('');
					$("input[class*='shs']").val('');
					$('.clg').find('select').each(function(){this.selectedIndex = 0;});
					$('.shs').find('select').each(function(){this.selectedIndex = 0;});
					
				}
				var validator = $("#saveNew, #saveEdited").validate().resetForm();
				
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
	
			if(profileForm=='shProfile'){
				$(".clg").hide();
				$(".shs").show();
				$(".bsc").hide();
			}
			else if(profileForm=='basicProfile'){
				$(".clg").hide();
				$(".shs").hide();
				$(".bsc").show();
			}
		});
		

	</script>
	
	
</head>
<body>



<jsp:include page="includes/header.jsp" />
<div id="main">
	<c:if test="${saveType=='saveNew'}" >
		<jsp:include page="includes/main-left.jsp" />
	</c:if>
	<c:if test="${saveType=='saveEdited'}" >
		<jsp:include page="includes/student-left-menu.jsp" />
	</c:if>

	<div>
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">${title}</h1>
			<input type="hidden" id="url" value="${pageContext.request.contextPath}/students/student/" />
			<c:if test="${saveType=='saveEdited'}" >
				<div class="floatright">
						<button id="edit" class="linkButton" >Edit</button>   
						<button id="save" class="linkButton"  >Save</button>   
						<button id="cancel" class="linkButton"  >Cancel</button>   
				</div>
			</c:if>
		</div>
		<form:form method="POST" action="${pageContext.request.contextPath}/students/spr/${saveType}${params}" modelAttribute="sprForm" id="${saveType}" class="sprForm" >
			<jsp:include page="forms/studentPersonalData.jsp" />
			<jsp:include page="forms/studentFBG.jsp" />
			<c:choose>
				<c:when test="${saveType=='saveNew'}">
					<jsp:include page="forms/collegeProfile.jsp" />
					<jsp:include page="forms/shProfile.jsp" />
					<jsp:include page="forms/basicProfile.jsp" />
					<!--<input type="submit" class="linkButton" style="float:right;" value="Save New"/>-->
				
				</c:when>
				<c:otherwise>
					<jsp:include page="forms/${profileForm}.jsp" />
					<!--  <input id="submit" type="submit" class="linkButton" style="float:right;" value="Save"/>-->
					
				</c:otherwise>
			</c:choose>
		</form:form>
		<button type="button" id="submit" class="linkButton">Save</button>
	</div>
</div>
<jsp:include page="includes/footer.jsp" />

</body>
</html>
