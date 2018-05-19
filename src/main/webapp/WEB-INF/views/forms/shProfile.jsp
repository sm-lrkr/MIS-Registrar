<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<div class="shs">
<h4>Senior High Profile</h4>

	<div>
			<table cellpadding="5" class="formTable">
				<tr>
					<td>
						<form:input path="profilesh.empty" hidden="true"/>
					</td>
				</tr>
				
	
				<tr>
					
					<td><form:label path="profilesh.strandCode" >*Strand</form:label></td>
					<td colspan="3">
						<form:select path="profilesh.strandCode" id="db_Strands" value="${profilesh.strandCode} ">
							<form:option value="" label=""/>
							<c:forEach var="strand" items="${strands}">   
								<form:option value="${strand.strandCode}" label="${strand.strandDesc} - ${strand.major}" /> 
						   	</c:forEach>  
						</form:select>
					</td>			
				</tr>
				<tr>
					<td><form:label path="profilesh.curriculumID">*Curriculum</form:label></td>
					<td>
						<form:select  path="profilesh.curriculumID" id="dbCurriculum" value="${profilesh.curriculumID}" >
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
						<form:label path="profilesh.studentStatus">Student Status</form:label>
					</td>
					<td>
						<form:select path="profilesh.studentStatus" value="${profilesh.studentStatus}" >
							<form:option value="regular" label="Regular" />
							<form:option value="irregular" label="Irregular" />
							<form:option value="withdrawn" label="Withdrawn" />
							<form:option value="suspended" label="Suspended" />
							<form:option value="dismissed" label="Dismissed" />
						
						</form:select>
					</td>
			
					<td>
						<form:label path="profilesh.enrolled">Enrollment Status</form:label>
					</td>
					<td>
						<form:select path="profilesh.enrolled" value="${profilesh.enrolled}">
							<option value="false" label="Not Enrolled" />
							<option value="true" label="Enrolled" />
						</form:select>
					</td>			
				</tr>
		
				<tr>
					<td>
						<form:label path="profilesh.shiftee"  >Shiftee? </form:label>
					</td>
					<td>
						<form:select path="profilesh.shiftee" value="${profilesh.shiftee}" class="db_shsshiftee" >
							<form:option value="false" label="No" />
							<form:option value="true" label="Yes" />
						</form:select>
					</td>
		
					<td>
						<label class="db_shsshiftCourse" >Shift Strand:</label>
					</td>
					<td>
							<form:select path="profilesh.shiftCourse" value="${profilesh.shiftStrand}" class="db_shsshiftCourse">
							<form:option value="" label=""/>
							<c:forEach var="strand" items="${strands}">   
								<form:option value="${strand.strandCode}" label="${strand.strandDesc}" /> 
						   	</c:forEach>  
						</form:select>

					</td>			
				</tr>
				
				<tr>
					<td>
						<label>Semester Entry:</label>
					</td>
					<td>
						<form:select path="profilesh.semEntry" value="${profilesh.semEntry}">
							<option value="1" label="1st Semester" />
							<option value="2" label="2nd Semester" />
							<option value="3" label="Summer" />
						</form:select>
					</td>
			
					<td>
						<label>Year of Entry:</label>
					</td>
					<td>
						<form:select path="profilesh.yearEntry" value="${profilesh.yearEntry}" >
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
						<form:select path="profilesh.graduationYear" value="${profilesh.graduationYear}" >
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
						<form:select path="profilesh.applicationType" value="${profilesh.applicationType}">
							<option value="freshman" label="Freshman" />
							<option value="transferee" label="Transferee" />
						</form:select>
					</td>			
				</tr>
				
				<tr>
					<td>
						<label>Previous School Type:</label>
					</td>
					<td>
						<form:select path="profilesh.prevSchoolType" class="db_prevSchool" value="${profilesh.prevSchoolType}" >
							<option value="public" label="Public" />
							<option value="private" label="Private" />
						</form:select>
					</td>		
					<td>
					</td>
					<td>
					</td>			
				</tr>
				
				<tr>
					<td>
					</td>
					<td>
						<form:select path="profilesh.ESC" class="db_esc" value="${profilesh.ESC}" >
							<option value="true" label="ESC" />
							<option value="false" label="Non-ESC" />
						</form:select>
					</td>		
					<td>
					</td>
					<td>
					</td>			
				</tr>
			
			</table>
		</div>

</div>
