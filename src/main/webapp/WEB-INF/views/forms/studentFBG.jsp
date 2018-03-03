<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>




	
		<div>
		<hr>
		<table style="border-collapse: separate; border-spacing: 20px; width: 800px; ">
			 
			<tr>
				<td><form:label path="fbg.f_Name">Father's Name</form:label></td>
				<td><form:input path="fbg.f_Name"/></td>
				<td><form:label path="fbg.f_ContactNo">Contact No: </form:label></td>
				<td><form:input path="fbg.f_ContactNo"/></td>
				
			</tr>
			
			<tr>
				<td><form:label path="fbg.f_Occupation">Occupation: </form:label></td>
				<td><form:input path="fbg.f_Occupation"/></td>
				<td><form:label path="fbg.f_Income">Income: </form:label></td>
				<td><form:input path="fbg.f_Income"/></td>
			</tr>
			<tr>
				<td><form:label path="fbg.f_Address">Address: </form:label></td>
				<td colspan="3" ><form:input path="fbg.f_Address" size="76"/></td>
			</tr>
			<tr></tr>			
			<tr>
				<td><form:label path="fbg.m_Name">Mother's Name</form:label></td>
				<td><form:input path="fbg.m_Name"/></td>
				<td><form:label path="fbg.m_ContactNo">Contact No: </form:label></td>
				<td><form:input path="fbg.m_ContactNo"/></td>
				
			</tr>
			
			<tr>
				
				<td><form:label path="fbg.m_Occupation">Occupation: </form:label></td>
				<td><form:input path="fbg.m_Occupation"/></td>
				<td><form:label path="fbg.m_Income">Income: </form:label></td>
				<td><form:input path="fbg.m_Income"/></td>
			</tr>
			<tr>
				<td><form:label path="fbg.m_Address">Address: </form:label></td>
				<td colspan="3"  ><form:input path="fbg.m_Address" size="76"/></td>
			</tr>
			<tr></tr>
			<tr>
				<td><form:label path="fbg.g_Name">Guardian's Name</form:label></td>
				<td><form:input path="fbg.g_Name"/></td>
				<td><form:label path="fbg.g_ContactNo">Contact No: </form:label></td>
				<td><form:input path="fbg.g_ContactNo"/></td>
			</tr>
			<tr>
				<td><form:label path="fbg.g_Relationship">Relationship: </form:label></td>
				<td><form:input path="fbg.g_Relationship"/></td>
			</tr>
			<tr>
				<td><form:label path="fbg.g_Address">Address: </form:label></td>
				<td colspan="3"><form:input path="fbg.g_Address" size="76"/></td>
			</tr>
			
			<tr></tr>
			<tr>
				<td><form:label path="fbg.s_Name">Spouse's Name</form:label></td>
				<td><form:input path="fbg.s_Name"/></td>
				<td><form:label path="fbg.s_ContactNo">Contact No: </form:label></td>
				<td><form:input path="fbg.s_ContactNo"/></td>
			</tr>
		
	
		</table>
		</div>
		<hr>
