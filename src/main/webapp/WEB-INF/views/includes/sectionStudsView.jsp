<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form id="secStudents" action="" method="post" modelAttribute="studentsForm">
		<table class="listTable">  
			<tr><th></th><th>LRN</th><th>Last Name</th><th>First Name</th><th>Middle Name</th></tr>  
		   	<c:forEach var="student" items="${studentsForm.students}" varStatus="status" >   
			   	<tr>  
			   		<td>
				   		<form:input path="students[${status.index}]studentID" type="hidden" />  
				   		<form:checkbox path="students[${status.index}].checked" />
				   	</td> 
				   	
				   	<td>${student.studentID}</td>  
				   	<td>${student.lastName}</td>  
				   	<td>${student.firstName}</td>
				   	<td>${student.middleName}</td>
				</tr>  
		   	</c:forEach>  
	   </table>  
</form:form>   