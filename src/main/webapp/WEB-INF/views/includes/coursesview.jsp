<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
	<div class="tableContainer">
		<table class="listTable">  
			<tr><th>CourseId</th><th>Description</th><th>Department</th><th>View</th></tr>  
		   	<c:forEach var="course" items="${list}">   
			   	<tr>  
				   	<td>${course.courseID}</td>  
				   	<td>${course.courseDesc}</td>  
				   	<td>${course.departmentCode}</td>  
				   	<td><a href=" ${pageContext.request.contextPath}/courses/${course.courseID}">View</a></td>  
				</tr>  
		   	</c:forEach>  
	   </table>  
   </div>

   <br>
   