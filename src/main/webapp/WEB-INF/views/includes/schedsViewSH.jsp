<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
	
		<table id="schedsview" class="display compact listTable">  
			<thead>
				<tr><th>Schedule ID</th><th>Subject Code</th><th>Time Start</th><th>Time End</th><th>Room</th><th>Days</th><th>Teacher</th></tr>  
		   	</thead>

			<tbody>
				<c:forEach var="schedule" items="${schedulesForm.schedules}">   
				   	<tr>  
				   		<td>${schedule.scheduleID}</td>  
					   	<td>${schedule.subjectCode}</td>  
					   	<td>${schedule.lecTimeStart}</td>  
					   	<td>${schedule.lecTimeEnd}</td>
					   	<td>${schedule.lecRoom}</td>
					   	<td>${schedule.lecDays}</td>
					   	<td>${schedule.personnelName}</td>
					</tr>  
		   		</c:forEach>
			</tbody>

			  
	   </table>  
   