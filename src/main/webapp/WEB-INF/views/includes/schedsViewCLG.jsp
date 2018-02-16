<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
	
	<table id="schedsview" class="display compact listTable">  
		<thead>
				<tr><th>ScheduleID</th><th>Subject</th><th>Section</th><th>Units</th><th>Time</th><th>Days</th><th>Room</th></tr>
		</thead>
		
		<tbody>
				<c:forEach var="sched" items="${schedules}">   
					<tr>  
						<td> ${sched.scheduleID}</td>
					  	<td> ${sched.subjectCode}</td>  
					   	<td> ${sched.section}</td>  
					   	<td> ${sched.lecUnits}</td>  
					   	<td> ${sched.lecTimeStart}-${sched.lecTimeEnd}</td>  
					   	<td> ${sched.lecDays}</td>  
					   	<td> ${sched.lecRoom}</td>  
				   	</tr>
					<c:if test="${sched.labDays ne '' }">			   
					   	<tr>  
							<td> ${sched.scheduleID}</td>
					  		<td> ${sched.subjectCode}-LAB</td>  
							<td> ${sched.section}</td>  
							<td> ${sched.labUnits}</td>  
							<td> ${sched.labTimeStart}-${sched.labTimeEnd}</td>  
							<td> ${sched.labDays}</td>  
							<td> ${sched.labRoom}</td>  
						</tr>    
					</c:if>
		   		</c:forEach>
		</tbody>
	</table>
