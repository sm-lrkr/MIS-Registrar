<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<form:form id="subjectsForm"  action="" method="post" modelAttribute="subjectsForm">
					
						<table   id="subjectsList" class="listTable" >  
							<tr><th>Code</th><th>Description</th><th>Units</th><th>Requisite</th></tr>  
						   	<c:forEach var="subj" items="${subjectsForm.subjects}" varStatus="status">   
							  
							   	<tr>
								 
								   	<td>
								   		<form:input path="subjects[${status.index}].subjectCode" type="hidden" />
								   		<form:input path="subjects[${status.index}].subjectDesc" type="hidden" />
								   		<form:checkbox path="subjects[${status.index}].checked" />
								   		<form:label path="subjects[${status.index}].subjectCode">${subj.subjectCode}</form:label></td>  
								   	<td>${subj.subjectDesc}</td>  
								   	<td>${subj.labUnits + subj.lecUnits}</td>  
								   	<td></td>  
								</tr>
							</c:forEach>  
				   		</table>  
				   
</form:form>
