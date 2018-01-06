<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
	<div class="tableContainer">
		<table class="listTable">  
			<tr><th>Subject Code</th><th>Time Start</th><th>Time End</th><th>Room</th><th>Days</th><th></th></tr>  
		   	<c:forEach var="schedule" items="${schedulesForm.schedules}">   
			   	<tr>  
				   	<td>${schedule.subjectCode}</td>  
				   	
				   	<td>${schedule.lecTimeStart}</td>  
				   	<td>${schedule.lecTimeEnd}</td>
				   	<td>${schedule.lecRoom}</td>
				   	<td>${schedule.lecDays}</td>
				   	
				   	<td><a href=" ${pageContext.request.contextPath}/sections/sh/${section.sectionID}">View</a></td>  
				</tr>  
		   	</c:forEach>  
	   </table>  
   </div>

