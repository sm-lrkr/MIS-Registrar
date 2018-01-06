<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

	
	<table id="studview" class="listTable">  
		<tr><th>Subject Code</th><th>Description</th><th>Lecture Units</th><th>Lab Units</th></tr>  
	   	<c:forEach var="subj" items="${subjects}">   
		   	<tr>  
			   	<td>${subj.subjectCode}</td>  
			   	<td>${subj.subjectDesc}</td>  
			   	<td>${subj.lecUnits}</td>  
			   	<td>${subj.labUnits}</td>  
		   	</tr>  
	   	</c:forEach>  
   </table>  
    
  
   
   