<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<div class="bsc">
<h4>Basic Profile</h4>
		<div>
			<table cellpadding="5" class="formTable">
				<tr>
					<td>
						<form:input path="profilebsc.empty" hidden="true"/>
					</td>
				</tr>
				
				<tr>
					<td><form:label path="profilesh.curriculumID">Curriculum</form:label></td>
					<td>
						<form:select  path="profilesh.curriculumID" id="dbCurriculum" value="${sprForm.profilesh.curriculumID}">
							<form:option value="" label=""/>
							<c:forEach var="crc" items="${shscurrics}">   
								<form:option value="${crc.curriculumID}" label="${crc.curriculumDesc}" /> 
						   	</c:forEach>  
						</form:select>
					</td>			
					<td></td>
					<td></td>
					
				</tr>
			
				<tr>
					<td>
						<form:label path="profilebsc.studentStatus">Student Status</form:label>
					</td>
					<td>
						<form:select path="profilebsc.studentStatus">
							<form:option value="regular" label="Regular" />
							<form:option value="irregular" label="Irregular" />
							<form:option value="withdrawn" label="Withdrawn" />
							<form:option value="suspended" label="Suspended" />
							<form:option value="dismissed" label="Dismissed" />
						
						</form:select>
					</td>
					
					<td>
						<form:label path="profilebsc.enrolled">Enrollment Status</form:label>
					</td>
					<td>
						<form:select path="profilebsc.enrolled">
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
						<form:select path="profilebsc.applicationType">
							<option value="freshman" label="Freshman" />
							<option value="transferee" label="Transferee" />
						</form:select>
					</td>			
				</tr>
				
			</table>
		</div>
		<hr>
</div>
