<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
			
		
			$("#db_curriculum").on('input', function(){
				var strandCode = '${strand.strandCode}';
				var curricID = $("#db_curriculum").val();
				window.location.href = encodeURI("${pageContext.request.contextPath}/courses/strands/" + strandCode+"/?curricID="+curricID);
			});
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<div>
		
		<div style="width: 100%; margin-bottom: 25px;">
			
			<h2 style="display: inline-block; margin-top: 0px;" >Basic Education Curriculum</h2>  
			
			<div class="floatright">
				<a href="${pageContext.request.contextPath}/curriculums/addCurriculum/bsc" class="linkButton">New Curriculum</a>
			</div>
		</div>
	
	
		<div style=" padding-bottom: 30px;">
			<select  id="db_curriculum">
					<c:forEach var="crc" items="${curriculums}">   
								<option value="${crc.curriculumID}" label="${crc.curriculumDesc}" /> 
					</c:forEach>  
			</select>
		</div>
	
		<div>
			<div id="kg">
				<h3>Pre-school</h3>
							<div>
									<table id="semsubjects" class="listTable">  
										<tr><th colspan="4" >Kinder</th></tr>
										<tr><th>CODE</th><th>DESCRIPTIVE TITLE</th></tr>  
										<c:forEach var="subj" items="${strandSubjects.subjects}" varStatus="status">
											<c:if test="${subj.year == 0}">
												<tr>
														<td>${subj.subject.subjectCode}</td>
														<td>${subj.subject.subjectDesc}</td>
												</tr>
											</c:if>
								   		</c:forEach>   
									</table>
							</div>
			</div>
			
			<div id="elem">
				<h3>Elementary</h3>
				<c:forEach begin="1" end="6" varStatus="year">
							<div>
								
									<table id="semsubjects" class="listTable">  
										<tr><th colspan="4" >Grade - ${year.index}</th></tr>
										<tr><th>CODE</th><th>DESCRIPTIVE TITLE</th></tr>  
										<c:forEach var="subj" items="${strandSubjects.subjects}" varStatus="status">
											 	<c:if test="${subj.year == year.index}">
								   					<tr>
														<td>${subj.subject.subjectCode}</td>
														<td>${subj.subject.subjectDesc}</td>
												</tr>
								   				</c:if>
										</c:forEach>   
									</table>
							</div>
				</c:forEach>
			</div>
			
			<div id="jh">
				<h3>Junior High School</h3>
				<c:forEach begin="7" end="10" varStatus="year">
							<div>
								
									<table id="semsubjects" class="listTable">  
										<tr><th colspan="4" >Grade - ${year.index}</th></tr>
										<tr><th>CODE</th><th>DESCRIPTIVE TITLE</th></tr>  
										<c:forEach var="subj" items="${strandSubjects.subjects}" varStatus="status">
											 	<c:if test="${subj.year == year.index}">
								   					<tr>
														<td>${subj.subject.subjectCode}</td>
														<td>${subj.subject.subjectDesc}</td>
												</tr>
								   				</c:if>
										</c:forEach>   
									</table>
							</div>
				</c:forEach>
			</div>
		</div>
		
					
			
		
		</div>
	
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
