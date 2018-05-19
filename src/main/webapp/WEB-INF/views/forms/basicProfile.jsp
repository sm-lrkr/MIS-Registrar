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
					<td><form:label path="profilebsc.curriculumID">Curriculum</form:label></td>
					<td>
						<form:select  path="profilebsc.curriculumID" id="dbCurriculum" value="${sprForm.profilebsc.curriculumID}">
							<form:option value="" label=""/>
							<c:forEach var="crc" items="${bsccurrics}">   
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
						<form:select path="profilebsc.studentStatus" value="${profilebsc.studentStatus}">
							<form:option value="regular" label="Regular" />
							<form:option value="irregular" label="Irregular" />
							<form:option value="withdrawn" label="Withdrawn" />
							<form:option value="suspended" label="Suspended" />
							<form:option value="dismissed" label="Dismissed" />
						
						</form:select>
					</td>
					
					<td>
						<form:label path="profilebsc.enrolled"  >Enrollment Status</form:label>
					</td>
					<td>
						<form:select path="profilebsc.enrolled" value="${profilebsc.enrolled}">
							<option value="false" label="Not Enrolled" />
							<option value="true" label="Enrolled" />
						</form:select>
					</td>			
				</tr>
				
				
				<tr>
					<td>
						<label>Semester Entry:</label>
					</td>
					<td>
						<form:select path="profilebsc.semEntry" value="${profilebsc.semEntry}">
							<option value="1" label="1st Semester" />
							<option value="2" label="2nd Semester" />
							<option value="3" label="Summer" />
						</form:select>
					</td>
				
					<td>
						<form:label path="profilebsc.yearEntry"  >Year of Entry</form:label>
					</td>
					<td>
						<form:select path="profilebsc.yearEntry" value="${profilebsc.yearEntry}">
							<option value="" label="" />
							<c:forEach begin="2000" end="2099" varStatus="schoolYear">
								<form:option value="${schoolYear.index}-${schoolYear.index + 1}" label="${schoolYear.index}-${schoolYear.index + 1}" />
							</c:forEach>
						</form:select>
					
					</td>
					
						
				</tr>
		
				<tr>
					
					<td>
						<label>Year of Graduation:</label>
					</td>
					<td>
						<form:select path="profilebsc.graduationYear" value="${profilebsc.graduationYear}" >
							<option value="" label="" />
							<c:forEach begin="2000" end="2099" varStatus="schoolYear">
								<form:option value="${schoolYear.index}-${schoolYear.index + 1}" label="${schoolYear.index}-${schoolYear.index + 1}" />
							</c:forEach>
						</form:select>
					</td>			
					
					<td>
						<label>Type of Application:</label>
					</td>
					<td>
						<form:select path="profilebsc.applicationType" value="${profilebsc.applicationType}" >
							<option value="freshman" label="Freshman" />
							<option value="transferee" label="Transferee" />
						</form:select>
					</td>			
				</tr>
				
			</table>
		</div>
		<hr>
</div>
