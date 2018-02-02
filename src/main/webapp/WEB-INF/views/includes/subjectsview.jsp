<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

	
	<table id="subjectsview" class="display compact listTable">  
		<thead>
			<tr><th>Subject Code</th><th>Description</th><th>Lecture Units</th><th>Lab Units</th><th>Pre Requisites</th></tr>  
	   	</thead>
		
		<tbody>
			<c:forEach var="subj" items="${subjects}">   
			   	<tr>  
				   	<td>${subj.subjectCode}</td>  
				   	<td>${subj.subjectDesc}</td>  
				   	<td>${subj.lecUnits}</td>  
				   	<td>${subj.labUnits}</td>  
				   	<td>${subj.preRequisites}</td>  
			
			   	</tr>  
	   		</c:forEach>
		</tbody>
		  
   </table>  
    
  
   
   