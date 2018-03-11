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
						<form:label path="profile.courseID" >*Course/ Major</form:label>	
			
					</td>
					<td colspan="2" >
						<form:select path="profile.courseID" id="db_Course" value="${profile.courseID}" >
							<c:forEach var="crs" items="${courses}">   
								<form:option value="${crs.courseID}" label="${crs.courseDesc}" /> 
						   	</c:forEach>  
						</form:select>
					</td>
					<td></td>	
				</tr>
		
				<tr>
					<td>
						<form:label path="profile.curriculumID">*Curriculum</form:label>
					</td>
					<td colspan="3">
						<form:select  path="profile.curriculumID" id="dbCurriculum" value="${profile.curriculumID}" >
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
						<form:select path="profile.studentStatus" value="${profile.studentStatus}">
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
						<form:label path="profile.shiftee" >Shiftee? </form:label>
					</td>
					<td>
						<form:select path="profile.shiftee" value="${profile.shiftee}" class="db_clgshiftee">
							<form:option value="false" label="No" />
							<form:option value="true" label="Yes" />
						</form:select>
					</td>
					
					<td>
						<form:label path="profile.shiftCourse" class="db_clgshiftCourse">Shift Course: </form:label>
					</td>
					<td>
						<form:select path="profile.shiftCourse" value="${profile.shiftCourse}" class="db_clgshiftCourse" >
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
						<form:select path="profile.semEntry" value="${profile.semEntry}">
							<form:option value="1" label="1st Semester" />
							<form:option value="2" label="2nd Semester" />
							<form:option value="3" label="Summer" />
						</form:select>
					</td>
		
					<td>
						<form:label path="profile.yearEntry" > Year of Entry</form:label>
					</td>
					<td>
						<form:select path="profile.yearEntry" value="${profile.yearEntry}">
							<form:option value="" label="" />
							<form:option value="2020" label="2020" />
							<form:option value="2019" label="2019" />
							<form:option value="2018" label="2018" />
							<form:option value="2017" label="2017" />
							<form:option value="2016" label="2016" />
							<form:option value="2015" label="2015" />
							<form:option value="2014" label="2014" />
							<form:option value="2013" label="2013" />
							<form:option value="2012" label="2012" />
							<form:option value="2011" label="2011" />
							<form:option value="2010" label="2010" />
							<form:option value="2009" label="2009" />
							<form:option value="2008" label="2008" />
							<form:option value="2007" label="2007" />
							<form:option value="2006" label="2006" />
							<form:option value="2005" label="2005" />
							<form:option value="2004" label="2004" />
							<form:option value="2003" label="2003" />
							<form:option value="2002" label="2002" />
							<form:option value="2001" label="2001" />
							<form:option value="2000" label="2000" />
						</form:select>
				
					</td>
					
						
				</tr>
		
				<tr>
					
					<td>
						<form:label path="profile.graduationYear" >Year of Graduation</form:label>
					</td>
					<td>
						<form:select path="profile.graduationYear" value="${profile.graduationYear}">
							<form:option value="" label="" />
							<form:option value="2020" label="2020" />
							<form:option value="2019" label="2019" />
							<form:option value="2018" label="2018" />
							<form:option value="2017" label="2017" />
							<form:option value="2016" label="2016" />
							<form:option value="2015" label="2015" />
							<form:option value="2014" label="2014" />
							<form:option value="2013" label="2013" />
							<form:option value="2012" label="2012" />
							<form:option value="2011" label="2011" />
							<form:option value="2010" label="2010" />
							<form:option value="2009" label="2009" />
							<form:option value="2008" label="2008" />
							<form:option value="2007" label="2007" />
							<form:option value="2006" label="2006" />
							<form:option value="2005" label="2005" />
							<form:option value="2004" label="2004" />
							<form:option value="2003" label="2003" />
							<form:option value="2002" label="2002" />
							<form:option value="2001" label="2001" />
							<form:option value="2000" label="2000" />
						</form:select>
					</td>		
					
					<td>
						<form:label path="profile.applicationType">Type of Application</form:label>
					</td>
					<td>
						<form:select path="profile.applicationType" value="${profile.applicationType}">
							<form:option value="freshman" label="Freshman" />
							<form:option value="transferee" label="Transferee" />
						</form:select>
					</td>			
				</tr>
				
			</table>
		</div>
		<hr>
</div>
