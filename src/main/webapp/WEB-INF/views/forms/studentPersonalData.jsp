<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


		<div>
		<hr>
		<table style="border-collapse: separate; border-spacing: 15px;">
			<tr><td><form:input path="student.checked" type="hidden" />	</td>
				<td><form:input path="student.studentNo" type="hidden" /></td>
				<td><form:input path="fbg.studentNo" type="hidden" /></td>
				<td><form:input path="profile.studentNo" type="hidden" /></td>
				
			</tr>
			<tr>
				<td><form:label path="student.lastName" >*Last Name</form:label>
				<td><form:input path="student.lastName"/></td>
				<td><form:errors path="student.lastName"></form:errors> </td>
				<td></td>
				<td></td>
				<td></td>
				
			</tr>
				
			<tr>
				<td><form:label path="student.firstName">*First Name</form:label></td>
				<td><form:input path="student.firstName"/></td>
				<td> <form:errors  class="formError" ></form:errors> </td>
				<td></td>
				<td><form:label path="student.gender">Gender </form:label></td>
				<td>
					 <form:select path = "student.gender">
					        <form:option value = "NONE" label = ""/>
					        <form:option value = "Male" label = "Male" />
					        <form:option value = "Female" label = "Female" />
				     </form:select>     	
				</td>
				
			</tr>
			
			<tr>
				<td><form:label path="student.middleName">Middle Name</form:label></td>
				<td><form:input path="student.middleName"/></td>
				<td></td>
				<td></td>
				<td><form:label path="student.maritalStatus">Marital Status</form:label></td>
				<td>
					<form:select path = "student.maritalStatus">
					        <form:option value = "NONE" label = ""/>
					        <form:option value = "Single" label = "Single" />
					        <form:option value = "Married" label = "Married" />
				     </form:select>     
				</td>
				
			</tr>
			
			<tr>
				<td><form:label path="student.birthPlace">Place of Birth</form:label></td>
				<td colspan="3"><form:input path="student.birthPlace" size="65"/></td>
		
				<td><form:label path="student.birthDate">Date of Birth</form:label></td>
				<td><form:input path="student.birthDate"/></td>
			
				
			
			</tr>
			
			<tr>

				<td ><form:label path="student.emailAddress">Email Address</form:label></td>
				<td><form:input path="student.emailAddress" /></td>
				
				<td></td>
				<td></td>
				
				<td ><form:label path="student.telephoneNo">Telephone Number</form:label></td>
				<td><form:input path="student.telephoneNo" /></td>
			</tr>
			
			<tr>
				
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td ><form:label path="student.contactNo">Contact Number</form:label></td>
				<td><form:input path="student.contactNo" /></td>
				
				
			</tr>
			
			<tr>
				
				<tr>
				<td ><form:label path="student.cityAddress">City Address</form:label></td>
				<td colspan="3"><form:input path="student.cityAddress" size="67" /></td>
				
				<td><form:label path="student.region">Region</form:label></td>
				<td>
					<form:select path = "student.region">
					        <form:option value = "NONE" label = ""/>
					        <form:option value = "NCR" label = "NCR" />
					        <form:option value = "CAR" label = "CAR" />
					        <form:option value = "1" label = "Region 1" />
					        <form:option value = "2" label = "Region 2" />
					        <form:option value = "3" label = "Region 3" />
					        <form:option value = "4A" label = "Region 4A" />
					        <form:option value = "4B" label = "Region 4B" />
					        <form:option value = "5" label = "Region 5" />
					        <form:option value = "6" label = "Region 6" />
					        <form:option value = "7" label = "Region 7" />
					        <form:option value = "8" label = "Region 8" />
					        <form:option value = "9" label = "Region 9" />
					        <form:option value = "10" label = "Region 10" />
					        <form:option value = "11" label = "Region 11" />
					        <form:option value = "12" label = "Region 12" />
					        <form:option value = "13" label = "Region 13" />
					        <form:option value = "ARMM" label = "ARMM" />
					        
					        
				     </form:select> 
				</td>
				
			</tr>
			
			<tr>
				
				<tr>
				<td><form:label path="student.provincialAddress">Provincial Address</form:label></td>
				<td colspan="3"><form:input path="student.provincialAddress"  size="65" /></td>
				
				<td><form:label path="student.country">Country</form:label></td>
				<td><form:input path="student.country"/></td>
			</tr>
		
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><form:label path="student.citizenship">Citizenship</form:label></td>
				<td><form:input path="student.citizenship"/></td>
			</tr>
			
			<tr>
				<td ><form:label path="student.working">Working</form:label></td>
				<td>
				 <form:select path = "student.working" value="${student.working} }" >
					        <form:option value = "0" label = "" />
					        <form:option value = "1" label = "Yes" />
					        <form:option value = "0" label = "No" />
				     </form:select>     	
				</td>
				<td></td>
				<td></td>
				<td><form:label path="student.religion">Religion</form:label></td>
				<td><form:input path="student.religion"/></td>
			</tr>
				
			<tr>
				<td ><form:label path="student.workingAddress">Working Address</form:label></td>
				<td><form:input path="student.workingAddress" /></td>
				<td></td>
				<td></td>
				<td><form:label path="student.APR">APR</form:label></td>
				<td><form:input path="student.APR"/></td>
			</tr>
			 
			 <tr>
				
			</tr>
			
			<tr>
				
			</tr>
		
		
			
			<tr>
				<td colspan="2" ></td>    
			</tr>
			
			<tr>
			</tr>
		</table>
		</div>
