<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

    
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	<link href="<c:url value="/resources/main2.css" />" rel="stylesheet">
	
	<script type="text/javascript" src="${jscript}" ></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#db_Course").on('change', function(){
				var ctx = "${pageContext.request.contextPath}";
				var searchurl = encodeURI(ctx+'/ajax/selectValueChanged/?param='+$("#db_Course").val());
				$.ajax({
					
					url: searchurl,
					type: "GET" ,
					success: function(result){
						$("#dbCurriculum").html(result);
						
					},
					error:function(e) {  
					      alert('Error: ' + e);   
					}  
					
				});
			});
			
			
			$("#submit").click(function() {
		        $.post($("#form1").attr("action"), $("#form1").serialize()+$("#form2").serialize(),
		              function() {
		                alert('Saved Record.');
		              });
		      });
		});
	</script>
	
	
</head>
<body>



<jsp:include page="includes/header.jsp" />
<div id="main">
	<jsp:include page="includes/student-left-menu.jsp" />
	<div>
	    <div>
			<h1 style="display: inline-block; margin-top: 0px;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
			<div class="floatright">
				<a href="${pageContext.request.contextPath}/students/newspr" ><span class="linkButton" >Edit</span></a>   
				<a href="sprForm" ><span class="linkButton" >Print</span></a>   
			 </div>
		</div>
		<div>
			<form:form method="POST" action="${pageContext.request.contextPath}/students/spr/${saveType}" modelAttribute="student" id="form1" style="width: 1000px;">
		
				<form:input path="checked" type="hidden" />
				<div>
				<h3>I. Personal Data</h3>
				<hr>
			
				<table style="border-collapse: separate; border-spacing: 15px; width:800px;">
					
					<tr>
						<td><form:label path="lastName">*Last Name</form:label></td>
						<td><p>${student.lastName}</p></td>
								
						<td><form:label path="firstName">*First Name</form:label></td>
						<td><p>${student.firstName}</p></td>
						
						<td><form:label path="middleName">Middle Name</form:label></td>
						<td><p>${student.middleName}</p></td>
						
					
					</tr>
					
					<tr>
						<td><form:label path="birthPlace">Place of Birth</form:label></td>
						<td><p>${student.birthPlace}</p></td>
						
				
						<td><form:label path="birthDate">Date of Birth</form:label></td>
						<td><p>${student.birthDate}</p></td>
						
					
						<td><form:label path="gender">Gender </form:label></td>
				
						<td><p>${student.gender}</p></td>
						
						
					
					</tr>
					
					<tr>
						<td><form:label path="maritalStatus">Marital Status</form:label></td>
						<td><p>${student.maritalStatus}</p></td>
						
				
						<td><form:label path="religion">Religion</form:label></td>
						<td><p>${student.religion}</p></td>
						
					
						<td><form:label path="citizenship">Citizenship</form:label></td>
						<td><p>${student.citizenship}</p></td>
						
					</tr>
					
					
					<tr>
						
						<tr>
						<td ><form:label path="cityAddress">City Address</form:label></td>
						<td colspan="3"><p>${student.cityAddress}</p></td>
						
						
						<td><form:label path="regionNumber">Region</form:label></td>
						<td><p>${student.regionNumber}</p></td>
						
						
					</tr>
					
					<tr>
						
						<tr>
						<td><form:label path="provincialAddress">Provincial Address</form:label></td>
						<td colspan="3"><p>${student.provincialAddress}</p></td>
						
						<td><form:label path="country">Country</form:label></td>
						<td><p>${student.country}</p></td>
						
					</tr>
					
					<tr>
						<td ><form:label path="ACR">ACR</form:label></td>
						<td><p>${student.ACR}</p></td>
						
						
						<td ><form:label path="emailAddress">Email Address</form:label></td>
						<td><p>${student.emailAddress}</p></td>
						
						
						<td ><form:label path="contactNumber">Contact Number</form:label></td>
						<td><p>${student.contactNumber}</p></td>
						
					</tr>
					
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td ><form:label path="telNumber">Telephone Number</form:label></td>
						<td><p>${student.telNumber}</p></td>
						
								
					</tr>
					
					 
					 <tr>
						<td ><form:label path="working">Working</form:label></td>
						<td><p>${student.working}</p></td>
						
					</tr>
					
					<tr>
						<td ><form:label path="workingAddress">Working Address</form:label></td>
						<td><p>${student.workingAddress}</p></td>
						
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
			<jsp:include page="forms/studentFBG.jsp" />
			<h3>III. Current Academic Background </h3>
			<form:form method="POST" action="${pageContext.request.contextPath}/students/spr/newProfile/clg/save/${student.studentNo}" modelAttribute="profile" id="profileForm">
				<div>
					<table cellpadding="5" class="formTable">
						<tr>
							<td>
								<form:input path="empty" hidden="true"/>
							</td>
						</tr>
						
						<tr >
						
							   <c:choose>
         
						         <c:when test = "${profileForm == 'collegeProfile' }">
						          	<td>
										<form:label path="StudentID" >Student ID</form:label>	
									</td>
									<td>
										<form:input path="StudentID" />
									</td>
						         </c:when>
	
						         <c:otherwise>
									<td>
										<form:label path="LRN" >LRN</form:label>	
									</td>
									<td>
										<form:input path="LRN" />
									</td>
						         </c:otherwise>
						      </c:choose>
							<td></td>
							<td></td>
						</tr>
						
						<tr>
						
							  <c:choose>
         
						         <c:when test = "${profileForm == 'collegeProfile'}">
						      
										<td>
											<form:label path="courseID" >Course/ Major</form:label>	
										</td>
										<td colspan="2">
											<form:select path="courseID" id="db_Course" value="${profile.courseID}">
												<form:option value="" label=""/>
												<c:forEach var="crs" items="${courses}">   
													<form:option value="${crs.courseID}" label="${crs.courseDesc}" /> 
											   	</c:forEach>  
											</form:select>
										</td>			
			
						
						         </c:when>
								
								<c:when test = "${profileForm == 'shProfile'}">
						         	<td><form:label path="strandCode" >Strand</form:label></td>
									<td colspan="3">
										<form:select path="strandCode" id="db_Strands" value="${shsProfile.strandCode} ">
											<form:option value="" label=""/>
											<c:forEach var="strand" items="${strands}">   
												<form:option value="${strand.strandCode}" label="${strand.strandDesc} - ${strand.major}" /> 
										   	</c:forEach>  
										</form:select>
									</td>			
						         </c:when>
						         <c:otherwise>
								
						         </c:otherwise>
						      </c:choose>
							
							
						</tr>
						<tr>		
							<c:if test = "${profileForm ne 'bscProfile'}">
								<td>
								<form:label path="curriculumID">Curriculum</form:label>
								</td>
								<td>
									<form:select  path="curriculumID" id="dbCurriculum" value="${profile.curriculumID}">
										<form:option value="" label=""/>
										<c:forEach var="crc" items="${currics}">   
											<form:option value="${crc.curriculumID}" label="${crc.curriculumDesc}" /> 
									   	</c:forEach>  
									</form:select>
								</td>
							</c:if>
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
							
							
							<c:choose>
         					     <c:when test = "${profileForm == 'collegeProfile'}">
						         	<td>
										<label>Shift Course:</label>
									</td>
									<td>
										<form:select path="shiftCourse" value="${profile.courseID}">
											<form:option value="" label=""/>
											<c:forEach var="crs" items="${courses}">   
												<form:option value="${crs.courseID}" label="${crs.courseDesc}" /> 
										   	</c:forEach>  
										</form:select>
									</td>
						         </c:when>
						         
						         <c:when test = "${profileForm == 'shProfile'}">
						         	<td>
										<label>Shift Strand:</label>
									</td>
									<td>
										<form:select path="shiftStrand" value="${profile.strandCode}">
											<form:option value="" label=""/>
											<c:forEach var="strand" items="${strands}">   
												<form:option value="${strand.strandCode}" label="${strand.strandDesc}" /> 
										   	</c:forEach>  
										</form:select>
									</td>
						         </c:when>
						    </c:choose>
										
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
		
		
			
		</div>
	</div>
	
</div>
<jsp:include page="includes/footer.jsp" />

</body>
</html>
