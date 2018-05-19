	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

	<table id="studview" class="display compact nowrap listTable" >  
			<thead >
				<tr><th >StudentNo</th><th>Id/LRN</th><th>Last Name</th><th>First Name</th><th>Middle Name</th><th>Status</th></tr>  
			</thead>
					<tbody>
					<c:forEach var="stud" items="${students}">   
					   	<tr>  
					   	<td>${stud.studentNo}</td>  
					   	<td>${stud.studentID}</td>  
					   	<td>${stud.lastName}</td>  
					   	<td>${stud.firstName}</td>  
					   	<td>${stud.middleName}</td>  
					   	<td>${stud.studentStatus}</td>  
					   	</tr>  
				   	</c:forEach>
				   	</tbody>  
	</table>  