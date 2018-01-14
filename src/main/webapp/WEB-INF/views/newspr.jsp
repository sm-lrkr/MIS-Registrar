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
		
	</script>
	
	
</head>
<body>



<jsp:include page="includes/header.jsp" />
<div id="main">
	<jsp:include page="includes/main-left.jsp" />
	<div>
		<h1 style="display: inline-block; margin-top: 0px;">New Student</h1>
		<input type="hidden" id="url" value="${pageContext.request.contextPath}/students/student/" />
		
		<form:form method="POST" action="${pageContext.request.contextPath}/students/spr/${saveType}" modelAttribute="sprForm" id="newSPR" >
			<jsp:include page="forms/studentPersonalData.jsp" />
			<jsp:include page="forms/studentFBG.jsp" />
			<input type="submit" class="linkButton" style="float:right;" value="Save New"/>
		</form:form>
	</div>
</div>
<jsp:include page="includes/footer.jsp" />

</body>
</html>