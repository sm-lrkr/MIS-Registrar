<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


		<div>
		<hr>
		<table style="border-collapse: separate; border-spacing: 15px;">
			<tr><td><form:input path="personal.checked" type="hidden" />	</td>
				<td><form:input path="personal.studentNo" type="hidden" /></td>
				<td><form:input path="fbg.studentNo" type="hidden"/></td>
				<td><form:input path="profile.studentNo" type="hidden" /></td>
			</tr>

			<tr>
				<td>
					<form:label class="clg" path="profile.studentID" >*StudentID</form:label>
					<form:label class="shs" path="profilesh.LRN" >*LRN</form:label>
					<form:label class="bsc" path="profilebsc.LRN" >*LRN</form:label>
					</td>
				<td>
					<form:input class="clg" path="profile.studentID"/>
					<form:input class="shs" path="profilesh.LRN"/>
					<form:input class="bsc" path="profilebsc.LRN"/>
				</td>
				
				<td><form:errors path="personal.lastName"></form:errors> </td>
				<td> <c:if test="${saveType=='saveNew'}">
						<select id="dbTypes">
							<option value="clg" label="College"/>
							<option value="shs" label="Senior High"/>
							<option value="bsc" label="Basic"/>
						</select>
					</c:if>
				</td>
				<td></td>
				<td></td>
				
			</tr>
			
			
			<tr>
				<td><form:label path="personal.lastName" >*Last Name</form:label>
				<td><form:input path="personal.lastName"/></td>
				<td><form:errors path="personal.lastName"></form:errors> </td>
				<td></td>
				<td></td>
				<td></td>
				
			</tr>
				
			<tr>
				<td><form:label path="personal.firstName">*First Name</form:label></td>
				<td><form:input path="personal.firstName"/></td>
				<td> <form:errors  class="formError" ></form:errors> </td>
				<td></td>
				<td><form:label path="personal.gender">*Gender </form:label></td>
				<td>
					 <form:select path = "personal.gender">
					        <form:option value = "NONE" label = ""/>
					        <form:option value = "Male" label = "Male" />
					        <form:option value = "Female" label = "Female" />
				     </form:select>     	
				</td>
				
			</tr>
			
			<tr>
				<td><form:label path="personal.middleName">Middle Name</form:label></td>
				<td><form:input path="personal.middleName"/></td>
				<td></td>
				<td></td>
				<td><form:label path="personal.maritalStatus">Marital Status</form:label></td>
				<td>
					<form:select path = "personal.maritalStatus">
					        <form:option value = "NONE" label = ""/>
					        <form:option value = "Single" label = "Single" />
					        <form:option value = "Married" label = "Married" />
				     </form:select>     
				</td>
				
			</tr>
			
			<tr>
				<td><form:label path="personal.birthPlace">*Place of Birth</form:label></td>
				<td colspan="3"><form:input path="personal.birthPlace" size="65"/></td>
		
				<td><form:label path="personal.birthDate" >*Date of Birth</form:label></td>
				<td><form:input path="personal.birthDate" type="date"/></td>
			
				
			
			</tr>
			
			<tr>

				<td ><form:label path="personal.emailAddress">Email Address</form:label></td>
				<td><form:input path="personal.emailAddress" /></td>
				
				<td></td>
				<td></td>
				
				<td ><form:label path="personal.contactNo">Contact Number</form:label></td>
				<td><form:input path="personal.contactNo" /></td>
			</tr>
			
			<tr>
				
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				
				
			</tr>
			
			<tr>
				
				<tr>
				<td ><form:label path="personal.cityAddress">*City Address</form:label></td>
				<td colspan="3"><form:input path="personal.cityAddress" size="67" /></td>
				
				<td><form:label path="personal.region">*Region</form:label></td>
				<td>
					<form:select path = "personal.region">
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
				<td><form:label path="personal.provincialAddress">*Provincial Address</form:label></td>
				<td colspan="3"><form:input path="personal.provincialAddress"  size="65" /></td>
				
				<td><form:label path="personal.country">*Country</form:label></td>
				<td><form:input path="personal.country"/></td>
			</tr>
		
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><form:label path="personal.citizenship">*Citizenship</form:label></td>
				<td><form:input path="personal.citizenship"/></td>
			</tr>
			
			<tr>
				<td ><form:label path="personal.working">Working</form:label></td>
				<td>
				 <form:select path = "personal.working" value="${personal.working} }" >
					        <form:option value = "0" label = "" />
					        <form:option value = "1" label = "Yes" />
					        <form:option value = "0" label = "No" />
				     </form:select>     	
				</td>
				<td></td>
				<td></td>
				<td><form:label path="personal.religion">Religion</form:label></td>
				<td><form:input path="personal.religion"/></td>
			</tr>
				
			<tr>
				<td ><form:label path="personal.workingAddress">Working Address</form:label></td>
				<td><form:input path="personal.workingAddress" /></td>
				<td></td>
				<td></td>
				<td><form:label path="personal.APR">APR</form:label></td>
				<td><form:input path="personal.APR"/></td>
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
