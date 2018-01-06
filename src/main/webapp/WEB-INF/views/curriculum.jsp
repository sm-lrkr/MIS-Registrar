<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />

    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="${css}" rel="stylesheet">
	<script type="text/javascript" src="${jscript}" ></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#btnSearch").click(function(){
				alert("Pressed");
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/searchCurriculumSubjects/?param='+$("#search").val());
				$.ajax({
					url: searchurl,
					data: $("#subjectsForm").serialize(),
					type: "POST" ,
					success: function(result){
						alert(result);
						$('#subjects').html(result);
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
			
			$("#enlist").click(function(){
				alert("Pressed");
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/addCurriculumSubjects/?year='+$("#Year").val()+'&sem='+ $("#Sem").val());
					
				$.ajax({
					
					url: searchurl,
					data: $("#subjectsForm").serialize() + $("#curricFormTable").serialize() + $("#curricTable").serialize(),
					type: "POST" ,
					success: function(result){
						alert(result);
						$('#curricSubjects').html(result);
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
			
			$("#remove").click(function(){
				alert("Pressed");
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/removeCurriculumSubjects/');
					
				$.ajax({
					
					url: searchurl,
					data: $("#curricFormTable").serialize(),
					type: "POST" ,
					success: function(result){
						alert(result);
						$('#curricSubjects').html(result);
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
			
			$("#btnSubmit").click(function(){
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/saveNew/?curricDesc='+$("#tb_Desc").val()+'&curricYear='+ $("#tb_Year").val());
					
				$.ajax({
					
					url: searchurl,
					data: $("#curricFormTable").serialize() + $("#curricTable").serialize(),
					type: "POST" ,
					success: function(result){
						alert("Success");
						 window.location.replace("/mis/");
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
			
			    $("#subb").click(function() {
			    	var searchurl = encodeURI('${pageContext.request.contextPath}/ajax/enlistSubjects/?year='+$("#Year").val()+'&sem='+ $("#Sem").val());
			        $.post(searhcurl, $("#subjectsForm").serialize() + $("#curricFormTable").serialize() ,
			          function(result) {
			        	$('#subjects').html(result);
			          });
			      });
	
			
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
		<div style="width: 100%;">
			
			<div>
					<h1 style="display: inline-block; margin-top: 0px;">New Curriculum</h1>
					<div class="floatright">
						<a href="newspr" ><span class="linkButton" >Add New Curriculum</span></a>    
			    	</div>
		  	</div>
		
			<div style="width: 100%;">
				<div style="position: fixed;" >
					<h3>Subjects List</h3>
					<div id="subjects" class="tableContainer" style="width:  650px; height: 300px;">
						<jsp:include page="includes/subjectschecklist.jsp" />
					</div>
					
					<div id="horizontalAlign" style="width: 600px;">
						<div>
							<input id="enlist" type="button" value="Add Checked"/>
						</div>
	
						<div>
							<select id="Year" >
								<option value="" label="--Year--"/>
							 	<option value="1" label="1st Year"/>
							 	<option value="2" label="2nd Year"/>
							 	<option value="3" label="3rd Year"/>
							 	<option value="4" label="4th Year"/>
							 	<option value="5" label="5th Year"/>
							 </select>
									
							 <select id="Sem">
							   	<option value="" label="--- Sem ---"/>
								<option value="1" label="1st"/>
								<option value="2" label="2nd Sem"/>
								<option value="3" label="Summer"/>
							 </select>
						</div>
								   
						<div class="floatright">
							<input type="text" id="search"/>
							<input type="button" id="btnSearch" value="Search">
						</div>
						
						<div>
							<input id="remove" type="button" value="Remove checked"/>
						</div>
					</div>
				</div>
				
				<div style=" float: right; padding-right: 50px;" >
					<div id="form" style="height: 200px; ">
						<form:form id="curricTable" action="" method="post" modelAttribute="curriculum">
							<%-- First field binding doesnt work on submit to controller. courseID binds successfully and curriculumDesc doesnt --%>
							<form:input type="hidden" path="curriculumDesc" />
							<form:input type="hidden" path="courseID" />
							<div style="display: flex; flex-direction: row;">
								<div><p style="display: inline; padding-right:20px;" >Description: </p></div>
								<div>
									<input id="tb_Desc" type="text" />
								</div>
							</div>
							
							<div style="display: flex; flex-direction: row; padding-top:15px;">
								<div><p style="display: inline; padding-right:15px;" >School Year: </p></div>
								<div>
									<input id="tb_Year" type="text" />
									<div  style="padding-top: 15px;"><input type="button" id="btnSubmit" value="Create"/></div>
								</div>
							</div>
						</form:form>
					</div>
					<h3>Curriculum Subjects</h3>
					<hr>
					<div id="curricSubjects" style="width:650px;">
				   		<jsp:include page="includes/curriculumForm.jsp" />
					</div>	
					
					<div  style="padding-top: 15px;"><input type="button" id="btnAddYear" value="Add"/></div>
					
				</div>
			</div>
			
		   		
		   			
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
