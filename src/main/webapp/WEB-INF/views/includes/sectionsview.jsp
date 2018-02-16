<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
		<table id="sectionsview" class="display compact listTable">  
			<thead>
				<tr><th>SectionID</th><th>Section</th><th>Strand</th><th>Room</th><th>Session</th><th>Adviser</th></tr>  
		   	</thead>
	
			<tbody>
				<c:forEach var="section" items="${sections}">   
				   	<tr>
				   
					   	<td>${section.sectionID}</td>  
					   	<td>${section.sectionName}</td>  
					   	<td>${section.strandCode}</td>  
					   	<td>${section.room}</td>
					   	<td>${section.session}</td>
					   	<td>${section.personnelName}</td>
					</tr>  
			   	</c:forEach>  
			</tbody>
		 </table>  