<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
	
		<div class="tableContainer">
			<table class="listTable">  
			<tr><th>Subject</th><th>Section</th><th>Units</th><th>Time</th><th>Days</th><th>Room</th></tr>
			   	<c:forEach var="sched" items="${schedules}">   
					<tr>  
					  	<td> ${sched.subjectCode}</td>  
					   	<td> ${sched.section}</td>  
					   	<td> ${sched.lecUnits}</td>  
					   	<td> ${sched.lecTimeStart}-${sched.lecTimeEnd}</td>  
					   	<td> ${sched.lecDays}</td>  
					   	<td> ${sched.lecRoom}</td>  
				   	</tr>
					<c:if test="${sched.labDays ne '' }">			   
					   	<tr>  
							<td> ${sched.subjectCode}-LAB</td>  
							<td> ${sched.section}</td>  
							<td> ${sched.labUnits}</td>  
							<td> ${sched.labTimeStart}-${sched.labTimeEnd}</td>  
							<td> ${sched.labDays}</td>  
							<td> ${sched.labRoom}</td>  
						</tr>    
					</c:if>
		   		</c:forEach>  
	  		 </table>
		</div>
		  
   <br/>  
   