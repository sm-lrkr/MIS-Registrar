<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<form:form id="subjectsForm"  action="" method="post" modelAttribute="subjectsForm">
				
						<table   id="subjectsList" class="display compact listTable" >  
							<thead>
								<tr><th></th><th>Code</th><th>Description</th><th>Lab</th><th>Lec</th><th>Units</th><th>Requisite</th></tr>  
						   	</thead>
						
							<tbody>
								<c:forEach var="subj" items="${subjectsForm.subjects}" varStatus="status">   
							     	<tr>
										<td></td>
									   	<td>${subj.subjectCode}</td>  
									   	<td>${subj.subjectDesc}</td>  
									   	<td>${subj.lecUnits}</td>
										<td>${subj.labUnits}</td>
									   	<td>${subj.lecUnits + subj.labUnits}</td>  
									   	<td>${subj.preRequisites}</td>  
									</tr>
								</c:forEach>
							</tbody>
						
							  
				   		</table>  
				   
</form:form>
