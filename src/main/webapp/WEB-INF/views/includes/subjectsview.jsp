<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

	
	<table id="subjectsview" class="display compact listTable">  
		<thead>
			<tr><th>Subject Code</th><th>Description</th>
			<c:if test = "${subjectType ne 'bsc'}">
				<th>Lecture Units</th><th>Lab Units</th>
				<th>Pre Requisites</th> 
			</c:if>
	   		<c:if test = "${subjectType == 'shs'}">
						<th>Type</th>  
					</c:if>
					</tr>
	   	</thead>
		<tbody>
			<c:forEach var="subj" items="${subjects}">   
			   	<tr>  
				   	<td>${subj.subjectCode}</td>  
				   	<td>${subj.subjectDesc}</td>  
				   <c:if test = "${subjectType ne 'bsc'}">
						<td>${subj.lecUnits}</td>  
				   		<td>${subj.labUnits}</td>
					</c:if>
					<c:if test = "${subjectType ne 'bsc'}">
				   		<td>${subj.preRequisites}</td>  
				   	</c:if>
					<c:if test = "${subjectType == 'shs'}">
						<td>${subj.type}</td>  
					</c:if>
			   	</tr>  
	   		</c:forEach>
		</tbody>
	
   </table>  
    
  
   
   