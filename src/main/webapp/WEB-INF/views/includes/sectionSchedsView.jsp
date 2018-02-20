<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


	<div class="tableContainer">
	<form:form id="enlistedTable" action="${pageContext.request.contextPath}/schedules/withdraw/college/${student.studentNo}" method="post" modelAttribute="enlisted">
			<table class="listTable">  
				<tr><th></th><th>Subject Code</th><th>Time Start</th><th>Time End</th><th>Room</th><th>Days</th><th>Teacher</th></tr>  
			   	<c:forEach var="schedule" items="${enlisted.schedules}" varStatus="status">   
				   	<tr>  
				   		<td>  
						   	<form:input path="schedules[${status.index}].scheduleID" type="hidden" />
						   	<form:input path="schedules[${status.index}].subjectCode" type="hidden" />
						   	<form:input path="schedules[${status.index}].personnelID" type="hidden" />
						   	<form:checkbox path="schedules[${status.index}].checked" />
					   	</td>
					 
				   		<td>${schedule.subjectCode}</td>  
					   	<td>${schedule.lecTimeStart}</td>  
					   	<td>${schedule.lecTimeEnd}</td>
					   	<td>${schedule.lecRoom}</td>
					   	<td>${schedule.lecDays}</td>
						<td>${schedule.personnelName}</td>
								   
					</tr>  
			   	</c:forEach>  
		   </table>
	   </form:form>  
   </div>

