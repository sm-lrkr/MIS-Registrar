<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

		
	<form:form id="offeredTable" action="${pageContext.request.contextPath}/schedules/enlist/college/${student.studentNo}" method="post" modelAttribute="offered">
		<table id="offered" class="listTable">  
			<tr><th></th><th>Subject</th><th>Section</th><th>Units</th><th>Time Start</th><th>Time End</th><th>Days</th><th>Room</th></tr>
		   	<c:forEach var="sched" items="${offered.schedules}" varStatus="status">   
			   <tr>  
				   	<td>  
					   	<form:input path="schedules[${status.index}].scheduleID" type="hidden" />
					   	<form:input path="schedules[${status.index}].subjectCode" type="hidden" />
					   	<form:input path="schedules[${status.index}].personnelID" type="hidden" />
					   	<form:checkbox path="schedules[${status.index}].checked" />
				   	</td>
				   	<td> ${sched.subjectCode}</td>  
				   	<td>${sched.section}</td>  
				   	<td>${sched.lecUnits}</td>  
				   	<td><form:input type="hidden" path="schedules[${status.index}].lecTimeStart"/> ${sched.lecTimeStart}</td>  
				   	<td><form:input type="hidden" path="schedules[${status.index}].lecTimeEnd"/> ${sched.lecTimeEnd}</td>  
				   	<td><form:input type="hidden" path="schedules[${status.index}].lecDays"/> ${sched.lecDays}</td>  
				   	<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.lecRoom}</td>  
			   	</tr>
				<c:if test="${sched.labDays ne '' }">			   
				   	<tr>  
				   		<td></td>
						<td>${sched.subjectCode}-LAB</td>  
						<td>${sched.section}</td>  
						<td>${sched.labUnits}</td>  
						<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.labTimeStart}</td>  
						<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.labTimeEnd}</td>  
						<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.labDays}</td>  
						<td><form:input type="hidden" path="schedules[${status.index}].lecRoom"/> ${sched.labRoom}</td>  
					</tr>    
				</c:if>
			</c:forEach>  
   		</table>  

   </form:form>	
	
	  


   