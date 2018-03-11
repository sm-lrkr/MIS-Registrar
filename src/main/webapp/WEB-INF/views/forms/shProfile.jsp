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
							<option value="2020" label="2020" />
							<option value="2019" label="2019" />
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
					
						
				</tr>
		
				<tr>
					
					<td>
						<label>Year of Graduation:</label>
					</td>
					<td>
						<form:select path="profilesh.graduationYear" value="${profilesh.graduationYear}" >
							<option value="" label="" />
							<option value="2020" label="2020" />
							<option value="2019" label="2019" />
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
