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
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<P>  The time on the server is ${serverTime}. </P>
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<div>
		
		<div style="width: 100%; margin-bottom: 25px;">
			
			<h2 style="display: inline-block; margin-top: 0px;" >${strand.strandDesc}</h2>  
			
			<div class="floatright">
				<a href="${pageContext.request.contextPath}/curriculums/addCurriculum/${courseID}" class="linkButton">New Curriculum</a>
			</div>
		</div>
		
		
		<div style=" padding-bottom: 30px;">
			<select  id="dbCurriculum">
					<c:forEach var="crc" items="${curriculums}">   
								<option value="${crc.curriculumID}" label="${crc.curriculumDesc}" /> 
					</c:forEach>  
			</select>
		</div>
				
		<div>
			<c:forEach begin="11" end="12" varStatus="year">
						<div>
							<h3>${years[year.index-10]}</h3>
							<c:forEach begin="1" end="3" varStatus="sem">
								<table id="semsubjects" class="listTable">  
									<tr><th colspan="4" >${sems[sem.index]}</th></tr>
									<tr><th>CODE</th><th>DESCRIPTIVE TITLE</th><th>PRE-REQUISITE(s)</th><th>TYPE</th></tr>  
									<c:forEach var="subj" items="${strandSubjects.subjects}" varStatus="status">
										 	<c:if test="${subj.year == year.index && subj.sem == sem.index}">
							   					<tr>
													<td>${subj.subject.subjectCode}</td>
													<td>${subj.subject.subjectDesc}</td>
													<td>${subj.subject.preRequisites}</td>
													<td>${subj.subject.type}</td>
														
												</tr>
							   				</c:if>
									</c:forEach>   
								</table>
							</c:forEach>   
						</div>
					</c:forEach>
		</div>
		
					
			
			
		</div>
	
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>