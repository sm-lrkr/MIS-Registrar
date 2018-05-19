<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar Log In</title>

	<jsp:include page="includes/includes.jsp" />
   
	<script type = "text/javascript">
		$(document).ready(function(){
		
		
		});
	</script>
	
	<style>
		.login-page {
		  width: 360px;
		  padding: 8% 0 0;
		  margin: auto;
		}
		.form {
		  position: relative;
		  z-index: 1;
		  background: #FFFFFF;
		  max-width: 360px;
		  margin: 0 auto 100px;
		  padding: 45px;
		  text-align: center;
		  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		}
		
		.form input {
		  font-family: "Roboto", sans-serif;
		  outline: 1px;
		  background: #f2f2f2;
		  width: 100%;
		  border: 1px;
		  margin: 0 0 20px;
		  padding: 15px;
		  box-sizing: border-box;
		  font-size: 14px;
		}
		.form button {
		  font-family: "Roboto", sans-serif;
		  text-transform: uppercase;
		  outline: 0;
		  background: #4CAF50;
		  width: 90%;
		  border: 0;
		  padding: 15px;
		  color: #FFFFFF;
		  font-size: 14px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		}
		img{
			width: 60%;
			height: 60%;
			margin: 0 0 30px;
		}

	</style>
</head>
<body>
			<div class="login-page">
			  <div class="form">
			  	<img src="${pageContext.request.contextPath}/resources/images/uv.png" />
			    <form:form class="login-form" id="subjectForm" method="POST" action="${pageContext.request.contextPath}/login" modelAttribute="user" >
				  <form:input path="username" placeholder="username" />
			      <form:password path="password" placeholder="password" />
			      <button>login</button>
			      <p class="message">Not registered? <a href="#">Create an account</a></p>
			    </form:form>
			  </div>
			</div>
</body>
</html>
