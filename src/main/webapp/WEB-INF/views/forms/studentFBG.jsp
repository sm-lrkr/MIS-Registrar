<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>




	<form:form method="POST" action="/mis/${saveType}" modelAttribute="studentFBG" id="form2">
		<form:input path="f_Name" type="hidden" />
		<div>
		<h3>II. Family Background </h3>
		<hr>
		<table style="border-collapse: separate; border-spacing: 20px; width: 800px; ">
			 
			<tr>
				<td><form:label path="f_Name">Father's Name</form:label></td>
				<td><form:input path="f_Name"/></td>
				<td><form:label path="f_ContactNo">Contact No: </form:label></td>
				<td><form:input path="f_ContactNo"/></td>
				
			</tr>
			
			<tr>
				<td><form:label path="f_Occupation">Occupation: </form:label></td>
				<td><form:input path="f_Occupation"/></td>
				<td><form:label path="f_Income">Income: </form:label></td>
				<td><form:input path="f_Income"/></td>
			</tr>
			<tr>
				<td><form:label path="f_Address">Address: </form:label></td>
				<td colspan="3" ><form:input path="f_Address" size="76"/></td>
			</tr>
			<tr></tr>			
			<tr>
				<td><form:label path="m_Name">Mother's Name</form:label></td>
				<td><form:input path="m_Name"/></td>
				<td><form:label path="m_ContactNo">Contact No: </form:label></td>
				<td><form:input path="m_ContactNo"/></td>
				
			</tr>
			
			<tr>
				
				<td><form:label path="m_Occupation">Occupation: </form:label></td>
				<td><form:input path="m_Occupation"/></td>
				<td><form:label path="m_Income">Income: </form:label></td>
				<td><form:input path="m_Income"/></td>
			</tr>
			<tr>
				<td><form:label path="m_Address">Address: </form:label></td>
				<td colspan="3"  ><form:input path="m_Address" size="76"/></td>
			</tr>
			<tr></tr>
			<tr>
				<td><form:label path="g_Name">Guardian's Name</form:label></td>
				<td><form:input path="g_Name"/></td>
				<td><form:label path="g_ContactNo">Contact No: </form:label></td>
				<td><form:input path="g_ContactNo"/></td>
			</tr>
			<tr>
				<td><form:label path="g_Relationship">Relationship: </form:label></td>
				<td><form:input path="g_Relationship"/></td>
			</tr>
			<tr>
				<td><form:label path="g_Address">Address: </form:label></td>
				<td colspan="3"><form:input path="g_Address" size="76"/></td>
			</tr>
			
			<tr></tr>
			<tr>
				<td><form:label path="s_Name">Spouse's Name</form:label></td>
				<td><form:input path="s_Name"/></td>
				<td><form:label path="s_ContactNo">Contact No: </form:label></td>
				<td><form:input path="s_ContactNo"/></td>
			</tr>
		
		
		</table>
		</div>
		<hr>
	</form:form>

