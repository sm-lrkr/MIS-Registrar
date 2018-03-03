<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<div class="clg" >

<h4>College Profile</h4>
		
		<div>
			<table cellpadding="5" class="formTable">
				<tr>
					<td>
						<form:input path="profile.empty" hidden="true"/>
					</td>
				</tr>
			
				
				<tr>
					
					<td>
						<form:label path="profile.courseID" >Course/ Major</form:label>	
			
					</td>
					<td colspan="2" >
						<form:select path="profile.courseID" id="db_Course" value="${profile.courseID}" >
							<form:option value="" label=""/>
							<c:forEach var="crs" items="${courses}">   
								<form:option value="${crs.courseID}" label="${crs.courseDesc}" /> 
						   	</c:forEach>  
						</form:select>
					</td>
					<td></td>	
				</tr>
				
				<tr>
					<td>
						<form:label path="profile.curriculumID">Curriculum</form:label>
					</td>
					<td colspan="3">
						<form:select  path="profile.curriculumID" id="dbCurriculum" value="${sprForm.profile.curriculumID}" >
							<form:option value="" label=""/>
							<c:forEach var="crc" items="${clgcurrics}">   
								<form:option value="${crc.curriculumID}" label="${crc.curriculumDesc}" /> 
						   	</c:forEach>  
						</form:select>
					</td>	
			
			
				</tr>
				
				<tr>
					<td>
						<form:label path="profile.studentStatus">Student Status</form:label>
					</td>
					<td>
						<form:select path="profile.studentStatus">
							<form:option value="regular" label="Regular" />
							<form:option value="irregular" label="Irregular" />
							<form:option value="withdrawn" label="Withdrawn" />
							<form:option value="suspended" label="Suspended" />
							<form:option value="dismissed" label="Dismissed" />
						</form:select>
					</td>
			
					<td>
						<form:label path="profile.enrolled">Enrollment Status</form:label>
					</td>
					<td>
						<form:select path="profile.enrolled" value="${profile.enrolled}" >
								<form:option value="0" label="Not Enrolled" />
								<form:option value="1" label="Enrolled" />
						</form:select>
					</td>			
				</tr>
			
				<tr>
					<td>
						<form:label path="profile.shiftee">Shiftee? </form:label>
					</td>
					<td>
						<form:select path="profile.shiftee" value="${profile.courseID}">
							<form:option value="false" label="No" />
							<form:option value="true" label="Yes" />
						</form:select>
					</td>
					
					<td>
						<form:label path="profile.shiftCourse" >Shift Course: </form:label>
					</td>
					<td>
						<form:select path="profile.shiftCourse" value="${profile.courseID}">
							<form:option value="" label=""/>
							<c:forEach var="crs" items="${courses}">   
								<form:option value="${crs.courseID}" label="${crs.courseDesc}" /> 
						   	</c:forEach>  
						</form:select>
					</td>			
				</tr>
				
				<tr>
					<td>
						<form:label path="profile.semEntry">Semester Entry </form:label>
					</td>
					<td>
						<form:select path="profile.semEntry">
							<option value="1" label="1st Semester" />
							<option value="2" label="2nd Semester" />
							<option value="3" label="Summer" /><option value="true" label="Enrolled" />
						</form:select>
					</td>
				
					<td>
						<form:label path="profile.yearEntry">Year of Entry</form:label>
					</td>
					<td>
						<form:select path="profile.yearEntry">
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
						<form:label path="profile.graduationYear">Year of Graduation</form:label>
					</td>
					<td>
						<form:select path="profile.graduationYear">
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
						<form:label path="profile.applicationType">Type of Application</form:label>
					</td>
					<td>
						<form:select path="profile.applicationType">
							<option value="freshman" label="Freshman" />
							<option value="transferee" label="Transferee" />
						</form:select>
					</td>			
				</tr>
				
			</table>
		</div>
		<hr>
</div>
