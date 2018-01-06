<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<form:form id="curricFormTable" action="" method="post" modelAttribute="curriculumForm">
				<div>
					<form:input type="hidden" path="curriculum.courseID" />
				</div>
				
				<c:forEach begin="1" end="5" varStatus="year">
						<div>
							<h3>${years[year.index]}</h3>
							<c:forEach begin="1" end="3" varStatus="sem">
								<table id="semsubjects" class="listTable">  
									<tr><th colspan="7" >${sems[sem.index]}</th></tr>
									<tr><th rowspan="2"></th><th rowspan="2">CODE</th><th rowspan="2">DESCRIPTIVE TITLE</th><th colspan="3"> UNITS</th><th rowspan="2">PRE-REQUISITE(s)</th></tr>  
									<tr><th>LEC</th><th>LAB</th><th>TOTAL</th></tr>
									<c:forEach var="subj" items="${curriculumForm.curricSubjects}" varStatus="status">
										 	<c:if test="${subj.year == year.index && subj.sem == sem.index}">
							   					<tr>
													<td>  
														<form:input path="curricSubjects[${status.index}].subjectCode" type="hidden" />
									   					<form:input path="curricSubjects[${status.index}].subjectDesc" type="hidden" />
									   					<form:input path="curricSubjects[${status.index}].year"  type="hidden" />
														<form:input path="curricSubjects[${status.index}].sem"  type="hidden" />
														<form:checkbox path="curricSubjects[${status.index }].checked" />
													</td>
													<td>${subj.subjectCode}</td>
													<td>${subj.subjectDesc}</td>
													<td>${subj.lecUnits}</td>
													<td>${subj.labUnits}</td>
													<td></td>
													<td></td>		
												</tr>
							   				</c:if>
									</c:forEach>   
								</table>
							</c:forEach>   
						</div>
					</c:forEach>    
</form:form>