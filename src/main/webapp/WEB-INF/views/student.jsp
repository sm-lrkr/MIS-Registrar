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
			
			
			$("#save").click(function() {
		        $("#editSPR").submit();
		     });
			
			$("#edit").click(function() {
				$("#editSPR :input").prop("disabled", false);
				$("#editSPR :input").removeClass("disabledInput");
				$("#save").show();
				$("#cancel").show();
				$("#edit").hide();
				$("#print").hide();
				
			});
		
			$("#cancel").click(function() {
				$("#editSPR :input").prop("disabled", true);
				$("#editSPR :input").addClass("disabledInput");
				$("#save").hide();
				$("#cancel").hide();
				$("#print").show();
				$("#edit").show();
			});
			
			$("#editSPR :input").prop("disabled", true);
			$("#editSPR :input").addClass("disabledInput");
			$("#save").hide();
			$("#cancel").hide();

	
			$("#dbTypes").on('input', function(){
				var type = $("#dbTypes").val();
				if(type == "clg"){
					$(".clg").show();
					$(".shs").hide();
					$(".bsc").hide();
						
				}
				if(type == "shs"){
					$(".clg").hide();
					$(".shs").show();
					$(".bsc").hide();
					
				}
				if(type == "bsc"){
					$(".clg").hide();
					$(".shs").hide();
					$(".bsc").show();
				}
			});		
		
			$(".clg").show();
			$(".shs").hide();
			$(".bsc").hide();
	
			
		});
	</script>
	
	
</head>
<body>



<jsp:include page="includes/header.jsp" />
<div id="main">
	<jsp:include page="includes/student-left-menu.jsp" />
	<div>	
		<input type="hidden" id="url" value="${pageContext.request.contextPath}/students/spr/${saveType}?profile= ${profileForm}" />
	    <div>
			<h1 style="display: inline-block; margin-top: 0px;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
			<div class="floatright">
				<button id="edit" class="linkButton" >Edit</button>   
				<button id="save" class="linkButton"  >Save</button>   
				<button id="cancel" class="linkButton"  >Cancel</button>   
				
				<a href="sprForm" id="print" ><span class="linkButton" >Print</span></a>   
			 </div>
		</div>
		<div>
		
			<form:form method="POST" action="${pageContext.request.contextPath}/students/spr/${saveType}?profile= ${profileForm}" modelAttribute="sprForm" id="editSPR" >
				<h3>I. Personal Information</h3>
				<jsp:include page="forms/studentPersonalData.jsp" />
				<h3>II. Family Background </h3>
				<jsp:include page="forms/studentFBG.jsp" />
				<h3>III. Current Academic Background </h3>
				
					<div>
						<table cellpadding="5" class="formTable">
							<tr>
								<td>
									<form:input path="profile.empty" hidden="true"/>
								</td>
							</tr>
							
							<tr >
							
								   <c:choose>
	         
							         <c:when test = "${profileForm == 'collegeProfile' }">
							          	<td>
											<form:label path="profile.StudentID" >Student ID</form:label>	
										</td>
										<td>
											<form:input path="profile.StudentID" />
										</td>
							         </c:when>
		
							         <c:otherwise>
										<td>
											<form:label path="profile.LRN" >LRN</form:label>	
										</td>
										<td>
											<form:input path="profile.LRN" />
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
												<form:label path="profile.courseID" >Course/ Major</form:label>	
											</td>
											<td colspan="2">
												<form:select path="profile.courseID" id="db_Course" value="${profile.courseID}">
													<form:option value="" label=""/>
													<c:forEach var="crs" items="${courses}">   
														<form:option value="${crs.courseID}" label="${crs.courseDesc}" /> 
												   	</c:forEach>  
												</form:select>
											</td>			
				
							
							         </c:when>
									
									<c:when test = "${profileForm == 'shProfile'}">
							         	<td><form:label path="profile.strandCode" >Strand</form:label></td>
										<td colspan="3">
											<form:select path="profile.strandCode" id="db_Strands" value="${shsProfile.strandCode} ">
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
									<form:label path="profile.curriculumID">Curriculum</form:label>
									</td>
									<td>
										<form:select  path="profile.curriculumID" id="dbCurriculum" value="${profile.curriculumID}">
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
									<form:select path="profile.enrolled" value="${profile.enrolled}">
										<form:option value="0" label="Not Enrolled" />
										<form:option value="1" label="Enrolled" />
									</form:select>
								</td>			
							</tr>
							
							<tr>
								<td>
									<label>Shiftee?:</label>
								</td>
								<td>
									<form:select path="profile.shiftee" value="${profile.shiftee}">
										<form:option value="false" label="No" />
										<form:option value="true" label="Yes" />
									</form:select>
								</td>
								
								
								<c:choose>
	         					     <c:when test = "${profileForm == 'collegeProfile'}">
							         	<td>
											<label>Shift Course:</label>
										</td>
										<td>
											<form:select path="profile.shiftCourse" value="${profile.courseID}">
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
											<form:select path="profile.shiftStrand" value="${profile.strandCode}">
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
									<form:select path="profile.semEntry" value="${profile.semEntry}">
										<form:option value="1" label="1st Semester" />
										<form:option value="2" label="2nd Semester" />
										<form:option value="3" label="Summer" /><option value="true" label="Enrolled" />
									</form:select>
								</td>
							
								<td>
									<label>Year of Entry:</label>
								</td>
								<td>
									<form:select path="profile.yearEntry" value="${profile.yearEntry}">
										<form:option value="NONE" label="" />
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
									<form:label path="profile.graduationYear">Year of Graduation: </form:label>
								</td>
								<td>
									<form:select path="profile.graduationYear" value="${profile.graduationYear}">
										<form:option value="NONE" label="" />
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
						
										<form:label path="profile.applicationType">Application Type: </form:label>
									</td>
									<td>
										<form:select path="profile.applicationType" value="${profile.applicationType}">
											<form:option value="NONE" label="" />
											<form:option value="freshman" label="Freshman" />
											<form:option value="transferee" label="Transferee" />
										</form:select>
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
