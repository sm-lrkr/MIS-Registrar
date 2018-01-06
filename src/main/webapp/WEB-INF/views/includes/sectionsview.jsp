<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
		<table class="listTable">  
			<tr><th>Section</th><th>Strand</th><th>Room</th><th>Session</th><th>Teacher</th><th></th></tr>  
		   	<c:forEach var="section" items="${sections}">   
			   	<tr>
			   		
				   	<td>${section.sectionName}</td>  
				   	
				   	<td>${section.strandCode}</td>  
				   	<td>${section.room}</td>
				   	<td>${section.session}</td>
				   	<td>${section.teacher}</td>
				   	
				   	<td><a href=" ${pageContext.request.contextPath}/sections/sh/${section.sectionID}">View</a></td>  
				</tr>  
		   	</c:forEach>  
	   </table>  