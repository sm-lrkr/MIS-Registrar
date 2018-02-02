<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<div>

<h3>Senior High Profile</h3>
		
	<form:form method="POST" action="${pageContext.request.contextPath}/students/spr/newProfile/shs/save/${student.studentNo}" modelAttribute="profile" id="profileForm">
		<div>
			<table cellpadding="5" class="formTable">
				<tr>
					<td>
						<form:input path="empty" hidden="true"/>
					</td>
				</tr>
				
				<tr >
					<td>
						<form:label path="LRN" >LRN </form:label>	
					</td>
					<td>
						<form:input path="LRN" />
					</td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					
					<td><form:label path="strandCode" >Strand</form:label></td>
					<td colspan="3">
						<form:select path="strandCode" id="db_Strands" value="${shsProfile.strandCode} ">
							<form:option value="" label=""/>
							<c:forEach var="strand" items="${strands}">   
								<form:option value="${strand.strandCode}" label="${strand.strandDesc} - ${strand.major}" /> 
						   	</c:forEach>  
						</form:select>
					</td>			
				</tr>
				<tr>
					<td><form:label path="curriculumID">Curriculum</form:label></td>
					<td>
						<form:select  path="curriculumID" id="dbCurriculum" value="${shsProfile.curriculumID}">
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
						<label>Shift Strand:</label>
					</td>
					<td>
							<form:select path="shiftCourse" value="${profile.strandCode}">
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
						<form:select path="semEntry">
							<option value="1" label="1st Semester" />
							<option value="2" label="2nd Semester" />
							<option value="3" label="Summer" /><option value="true" label="Enrolled" />
						</form:select>
					</td>
				
					<td>
						<label>Year of Entry:</label>
					</td>
					<td>
						<form:select path="yearEntry">
							<option value="2017" label="2017" />
							<option value="2016" label="2016" />
							<option value="2015" label="2015" />
							<option value="2014" label="2014" />
							<option value="2013" label="2013" />
							<option value="2012" label="2012" />
							<option value="2011" label="2011" />
							<option value="2010" label="2010" />
							<option value="2009" label="2009" />
							<option value="2008" label="2008" />
							<option value="2007" label="2007" />
							<option value="2006" label="2006" />
							<option value="2005" label="2005" />
							<option value="2004" label="2004" />
							<option value="2003" label="2003" />
							<option value="2002" label="2002" />
							<option value="2001" label="2001" />
							<option value="2000" label="2000" />
							
						</form:select>
					</td>
					
						
				</tr>
		
				<tr>
					
					<td>
						<label>Year of Graduation:</label>
					</td>
					<td>
						<form:select path="graduationYear">
							<option value="2018" label="2018" />
							<option value="2017" label="2017" />
							<option value="2016" label="2016" />
							<option value="2015" label="2015" />
							<option value="2014" label="2014" />
							<option value="2013" label="2013" />
							<option value="2012" label="2012" />
							<option value="2011" label="2011" />
							<option value="2010" label="2010" />
							<option value="2009" label="2009" />
							<option value="2008" label="2008" />
							<option value="2007" label="2007" />
							<option value="2006" label="2006" />
							<option value="2005" label="2005" />
							<option value="2004" label="2004" />
							<option value="2003" label="2003" />
							<option value="2002" label="2002" />
							<option value="2001" label="2001" />
							<option value="2000" label="2000" />
						</form:select>
					</td>		
					
					<td>
						<label>Type of Application:</label>
					</td>
					<td>
						<form:select path="applicationType">
							<option value="freshman" label="Freshman" />
							<option value="transferee" label="Transferee" />
						</form:select>
					</td>			
				</tr>
				
			</table>
		</div>
	</form:form>
	<div style="margin-top: 20px; float:right;">
		<input type="button" class="linkButton"id="submit" value="Submit" >
	</div>
</div>
