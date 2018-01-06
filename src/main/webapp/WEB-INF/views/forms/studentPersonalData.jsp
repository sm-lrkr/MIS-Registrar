<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>




	<form:form method="POST" action="${pageContext.request.contextPath}/students/spr/${saveType}" modelAttribute="student" id="form1">
		<form:input path="checked" type="hidden" />
		<div>
		<p>I. Personal Data</p>
		<hr>
		<table style="border-collapse: separate; border-spacing: 15px;">
			
			<tr>
				<td><form:label path="lastName">*Last Name</form:label></td>
				<td><form:input path="lastName"/></td>
		
				<td><form:label path="firstName">*First Name</form:label></td>
				<td><form:input path="firstName"/></td>
			
				<td><form:label path="middleName">Middle Name</form:label></td>
				<td><form:input path="middleName"/></td>
			
			</tr>
			
			<tr>
				<td><form:label path="birthPlace">Place of Birth</form:label></td>
				<td><form:input path="birthPlace"/></td>
		
				<td><form:label path="birthDate">Date of Birth</form:label></td>
				<td><form:input path="birthDate"/></td>
			
				<td><form:label path="gender">Gender </form:label></td>
				<td>
					 <form:select path = "gender">
					        <form:option value = "NONE" label = "--Gender--"/>
					        <form:option value = "Male" label = "Male" />
					        <form:option value = "Female" label = "Female" />
				     </form:select>     	
				</td>
			
			</tr>
			
			<tr>
				<td><form:label path="maritalStatus">Marital Status</form:label></td>
				<td><form:input path="maritalStatus"/></td>
		
				<td><form:label path="religion">Religion</form:label></td>
				<td><form:input path="religion"/></td>
			
				<td><form:label path="citizenship">Citizenship</form:label></td>
				<td><form:input path="citizenship"/></td>
			</tr>
			
			
			<tr>
				
				<tr>
				<td ><form:label path="cityAddress">City Address</form:label></td>
				<td colspan="3"><form:input path="cityAddress" size="67" /></td>
				
				<td><form:label path="regionNumber">Region</form:label></td>
				<td><form:input path="regionNumber"/></td>
				
			</tr>
			
			<tr>
				
				<tr>
				<td><form:label path="provincialAddress">Provincial Address</form:label></td>
				<td colspan="3"><form:input path="provincialAddress"  size="65" /></td>
				
				<td><form:label path="country">Country</form:label></td>
				<td><form:input path="country"/></td>
			</tr>
			
			<tr>
				<td ><form:label path="ACR">ACR</form:label></td>
				<td><form:input path="ACR" /></td>
				
				<td ><form:label path="emailAddress">Email Address</form:label></td>
				<td><form:input path="emailAddress" /></td>
				
				<td ><form:label path="contactNumber">Contact Number</form:label></td>
				<td><form:input path="contactNumber" /></td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td ><form:label path="telNumber">Telephone Number</form:label></td>
				<td><form:input path="telNumber" /></td>
						
			</tr>
			
			 
			 <tr>
				<td ><form:label path="working">Working</form:label></td>
				<td>
				 <form:select path = "working">
					        <form:option value = "true" label = "Yes" />
					        <form:option value = "false" label = "No" />
				     </form:select>     	
				</td>
			</tr>
			
			<tr>
				<td ><form:label path="workingAddress">Working Address</form:label></td>
				<td><form:input path="workingAddress" /></td>
			</tr>
		
		
			
			<tr>
				<td colspan="2" ></td>    
			</tr>
			
			<tr>
			</tr>
		</table>
		</div>
		<hr>
	</form:form>

