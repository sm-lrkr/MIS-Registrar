<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<form:form id="enlistedTable" action="${pageContext.request.contextPath}/schedules/withdraw/college/${student.studentNo}" method="post" modelAttribute="enlisted">
		<table id="enlisted"  class="display compact">  
			<thead>
				<tr><th></th><th>Subject</th><th>Section</th><th>Units</th><th>Time Start</th><th>Time End</th><th>Days</th><th>Room</th></tr>  
		   	</thead>
		   	
		   	<tbody>
			   	<c:forEach var="sched" items="${enlisted.schedules}" varStatus="status">   
				   	<tr>  
					   	<td>  
						   	<form:input path="schedules[${status.index}].scheduleID" type="hidden" />
						   	<form:checkbox path="schedules[${status.index}].checked" />
						</td>
					   	<td> ${sched.subjectCode}</td>  
					   	<td> ${sched.section}</td>  
					   	<td> ${sched.lecUnits}</td>  
					   	<td> ${sched.lecTimeStart}</td>  
					   	<td> ${sched.lecTimeEnd}</td>  
					   	<td> ${sched.lecDays}</td>  
					   	<td> ${sched.lecRoom}</td>  
				   	</tr>
				   		<c:if test="${sched.labDays ne '' }">	
					   	   	<tr>  
					   	   		<td></td>
							   	<td> ${sched.subjectCode}-LAB</td>  
							   	<td> ${sched.section}</td>  
							   	<td> ${sched.labUnits}</td>  
							   	<td> ${sched.labTimeStart}</td>  
							   	<td> ${sched.labTimeEnd}</td>  
							   	<td> ${sched.labDays}</td>  
							   	<td> ${sched.labRoom}</td>  
						   	</tr>    
					   	</c:if>
				</c:forEach>  
			</tbody>
   		</table>  
   		
   		
</form:form>
   
   