<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<div>
	<form:form method="POST" action="/mis/${saveType}" modelAttribute="student" id="form1">
		
		<div>
		<p>I. Personal Data</p>
		<hr>
		<table style="border-collapse: separate; border-spacing: 15px;">
			<tr>
				<td>
				<form:label path="studentID" >Student ID</form:label>
				</td>
				<td>
				<form:input path="studentID" id="studentID"/>
				</td>
			</tr>
			
			<tr>
				<td>
				<form:label path="lastName">Last Name</form:label>
				</td>
				<td>
				<form:input path="lastName"/>
				</td>
		
				<td>
				<form:label path="firstName">First Name</form:label>
				</td>
				<td>
				<form:input path="firstName"/>
				</td>
			
				<td>
				<form:label path="middleName">Middle Name</form:label>
				</td>
				<td>
				<form:input path="middleName"/>
				</td>
			
			</tr>
			
				<tr>
				<td>
				<form:label path="birthPlace">Place of Birth</form:label>
				</td>
				<td>
				<form:input path="birthPlace"/>
				</td>
		
				<td>
				<form:label path="birthDate">Date of Birth</form:label>
				</td>
				<td>
				<form:input path="birthDate"/>
				</td>
			
				<td>
				<form:label path="gender">Gender </form:label>
				</td>
				<td>
					 <form:select path = "gender">
					        <form:option value = "NONE" label = "--Gender--"/>
					        <form:option value = "Male" label = "Male" />
					        <form:option value = "Female" label = "Female" />
				     </form:select>     	
				</td>
			
			</tr>
			
			<tr>
				<td>
					<form:label path="maritalStatus">Marital Status</form:label>
				</td>
				<td>
					<form:select path = "maritalStatus">
					        <form:option value = "NONE" label = ""/>
					        <form:option value = "Single" label = "Single" />
					        <form:option value = "Married" label = "Married" />
				     </form:select>     	
				</td>
		
				<td>
				<form:label path="religion">Religion</form:label>
				</td>
				<td>
				<form:input path="religion"/>
				</td>
			
				<td>
				<form:label path="citizenship">Citizenship</form:label>
				</td>
				<td>
				<form:input path="citizenship"/>
				</td>
			</tr>
			
			
			<tr>
				
				<tr>
				<td >
				<form:label path="cityAddress">City Address</form:label>
				</td>
				<td colspan="3">
				<form:input path="cityAddress" size="67" />
				</td>
				
				<td>
				<form:label path="regionNumber">Region</form:label>
				</td>
				<td>
				<form:input path="regionNumber"/>
				</td>
				
			</tr>
			
			<tr>
				
				<tr>
				<td>
				<form:label path="provincialAddress">Provincial Address</form:label>
				</td>
				<td colspan="3">
				<form:input path="provincialAddress"  size="65" />
				</td>
				
				<td>
				<form:label path="country">Country</form:label>
				</td>
				<td>
				<form:input path="country"/>
				</td>
			</tr>
			
			<tr>
				<td >
				<form:label path="ACR">ACR</form:label>
				</td>
				<td>
				<form:input path="ACR" />
				</td>
				
				<td >
				<form:label path="emailAddress">Email Address</form:label>
				</td>
				<td>
				<form:input path="emailAddress" />
				</td>
				
				<td >
				<form:label path="contactNumber">Contact Number</form:label>
				</td>
				<td>
				<form:input path="contactNumber" />
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td >
				<form:label path="telNumber">Telephone Number</form:label>
				</td>
				<td>
				<form:input path="telNumber" />
				</td>
						
			</tr>
			
			 
			 <tr>
				<td >
				<form:label path="working">Working</form:label>
				</td>
				<td>
				 <form:select path = "working">
					        <form:option value = "true" label = "Yes" />
					        <form:option value = "false" label = "No" />
				     </form:select>     	
				</td>
			</tr>
			
			<tr>
				<td >
				<form:label path="workingAddress">Working Address</form:label>
				</td>
				<td>
				<form:input path="workingAddress" />
				</td>
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
	
	<p>III. Current Academic Background</p>
		
	<form:form method="POST" action="/mis/${saveType}" modelAttribute="studentCAB" id="form2">
		<div>
			<table cellpadding="5" class="formTable">
				<tr>
					<td>
						<form:input path="empty" hidden="true"/>
					</td>
				</tr>
				
				<tr>
					
					<td>
						<form:label path="courseID" >Course/ Major</form:label>	
					</td>
					<td>
						<form:select path="courseID" id="db_Course" value="${studentCAB.courseID}">
							<form:option value="" label=""/>
							<c:forEach var="crs" items="${courses}">   
								<form:option value="${crs.courseID}" label="${crs.courseDesc}" /> 
						   	</c:forEach>  
						</form:select>
					</td>			
					
					<td>
						<form:label path="curriculumID">Curriculum</form:label>
					</td>
					<td>
						<form:select  path="curriculumID" id="dbCurriculum" value="${studentCAB.curriculumID}">
							<form:option value="" label=""/>
							<c:forEach var="crc" items="${curriculums}">   
								<form:option value="${crc.curriculumID}" label="${crc.curriculumDesc}" /> 
						   	</c:forEach>  
						</form:select>
					</td>			
					
					
					
				</tr>
				
				<tr>
					<td>
						<form:label path="studentStatus">Student Status</form:label>
					</td>
					<td>
						<form:select path="studentStatus">
							<form:option value="regular" label="Regular" />
							<form:option value="irregular" label="Irregular" />
						</form:select>
					</td>
					
					<td>
						<form:label path="enrollmentStatus">Enrollment Status</form:label>
					</td>
					<td>
						<form:select path="enrollmentStatus">
							<option value="false" label="Not Enrolled" />
							<option value="true" label="Enrolled" />
						</form:select>
					</td>			
				</tr>
				
				<tr>
					<td>
						<label>Shiftee?:</label>
					</td>
					<td>
						<select>
							<option value="false" label="No" />
							<option value="true" label="Yes" />
						</select>
					</td>
					
					<td>
						<label>Shift Course:</label>
					</td>
					<td>
						<select>
						</select>
					</td>			
				</tr>
				
				<tr>
					<td>
						<label>Semester Entry:</label>
					</td>
					<td>
						<select>
							<option value="1" label="1st Semester" />
							<option value="2" label="2nd Semester" />
							<option value="3" label="Summer" />
						</select>
					</td>
				
					<td>
						<label>Year of Entry:</label>
					</td>
					<td>
						<select>
						</select>
					</td>
					
						
				</tr>
		
				<tr>
					
					<td>
						<label>Year of Graduation:</label>
					</td>
					<td>
						<select>
						</select>
					</td>		
					
					<td>
						<label>Type of Application:</label>
					</td>
					<td>
						<select>
							<option value="freshman" label="Freshman" />
							<option value="transferee" label="Transferee" />
						</select>
					</td>			
				</tr>
				
			</table>
		</div>
		<hr>
	</form:form>
	<input type="button" value="Submit" id="submit">
</div>
