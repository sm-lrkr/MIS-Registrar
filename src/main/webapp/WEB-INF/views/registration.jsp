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
		        $.post($("#form1").attr("action"), $("#form1").serialize()+$("#form2").serialize(),
		              function() {
		                alert('Saved Record.');
		              });
		      });
		});
	</script>
	
	
</head>
<body>

	<jsp:include page="includes/header.jsp" />
	<div id="main">
		<jsp:include page="includes/student-left-menu.jsp" />
		<div style="width: =70%;">
			<div  style="border-bottom: 1px solid grey; padding-bottom: 20px;">
				<h1 style="display: inline-block; margin-top: 0px;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
				<div class="floatright">
				
				 </div>
			</div>
			
			<div style="width: 800px;">
				<h3>College</h3>
				<div id="horizontalAlign" style="width: 700px;border-top: 1px solid grey; border-bottom: 1px solid grey;">
					
					
					<div style="inline-block;">
						
						 <h4>ID: ${clgProfile.studentID} </h4>
						 <h4>Course:  ${clgProfile.courseID} </h4>
					</div>
					<div class="floatright">	 
						<c:choose>
						    <c:when test="${not empty clgProfile.studentNo}">
						       
						    	<a href="${pageContext.request.contextPath}/students/spr/profile/clg/${clgProfile.studentNo}" ><span class="linkButton" >View Profile</span></a>   
						    </c:when>    
						    <c:otherwise>
								<a href="${pageContext.request.contextPath}/students/spr/newProfile/clg/${student.studentNo}" ><span class="linkButton" >Register</span></a>   
						    </c:otherwise>
						</c:choose>
					</div>		
				</div>		
				<h3>Senior High</h3>	
				<div id="horizontalAlign" style="width: 700px;border-top: 1px solid grey; border-bottom: 1px solid grey;">
					<div style="inline-block;">
						
						 <h4>LRN: ${shsProfile.LRN} </h4>
						 <h4>Strand:  ${shsProfile.strandCode} </h4>
					</div>
					<div class="floatright">	 
						<c:choose>
						    <c:when test="${not empty shsProfile.studentNo}" >
						    	<a href="${pageContext.request.contextPath}/students/spr/profile/shs/${shsProfile.studentNo}" ><span class="linkButton" >View Profile</span></a>   
						    </c:when>    
						    <c:otherwise>
								<a href="${pageContext.request.contextPath}/students/spr/newProfile/shs/${student.studentNo}" ><span class="linkButton" >Register</span></a>   
						    </c:otherwise>
						</c:choose>
					</div>		
				</div>		
				<h3>Basic Education</h3>
				<div id="horizontalAlign" style="width: 700px;border-top: 1px solid grey; border-bottom: 1px solid grey;">
					<div style="inline-block;">
						
						 <h4>LRN: ${bscProfile.LRN} </h4>
					</div>
					<div class="floatright">	 
						<c:choose>
						    <c:when test="${not empty bscProfile.studentNo}">
						       
						    	<a href="${pageContext.request.contextPath}/students/spr/profile/bsc${bscProfile.studentNo}" ><span class="linkButton" >View Profile</span></a>   
						    </c:when>    
						    <c:otherwise>
									<a href="${pageContext.request.contextPath}/students/spr/newProfile/bsc/${student.studentNo}" ><span class="linkButton" >Register</span></a>   
						    
						    </c:otherwise>
						</c:choose>
					</div>		
				</div>			
			</div>
		</div>
			
		
	</div>
	<jsp:include page="includes/footer.jsp" />

</body>
</html>
