
	
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

	<table id="studview" class="listTable" >  
			<thead>
				<tr><th>Id/LRN</th><th>Last Name</th><th>First Name</th><th>Middle Name</th><th>Edit</th></tr>  
			</thead>
					
					<tbody>
					<c:forEach var="stud" items="${students}">   
					   	<tr>  
					   	<td>${stud.studentID}</td>  
					   	<td>${stud.lastName}</td>  
					   	<td>${stud.firstName}</td>  
					   	<td>${stud.middleName}</td>  
					   	<td><a href="${pageContext.request.contextPath}/students/student/${stud.studentNo}">View</a></td>  
					   	</tr>  
				   	</c:forEach>
				   	</tbody>  
	</table>  