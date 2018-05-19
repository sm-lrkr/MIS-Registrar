<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<form:form id="schedForm" action="${pageContext.request.contextPath}/schedules/saveNew" method="POST" modelAttribute="scheduleForm" >
					<table class="formTable">
						<tr>
							<td><form:label path="schedule.subjectCode" >Subject Code</form:label></td>
							<td><form:input path="schedule.subjectCode"/></td> 
						</tr>
						
						<tr>
							<td><form:label path="schedule.section" >Section</form:label></td>
							<td><form:input path="schedule.section"/></td>
						</tr>
					</table>
					<h3>Lecture</h3>
					<table class="formTable">
						<tr>
							<td><form:label path="schedule.lecTimeStart" >Time Start</form:label></td>
							<td> <form:select path = "schedule.lecTimeStart">
							        <form:option value = "1" label = "1:00 AM" />
							        <form:option value = "1.5" label = "1:30 AM" />
							        <form:option value = "2" label = "2:00 AM" />
						    	 </form:select>     	
							</td>

						</tr>
						
						<tr>
							<td><form:label path="schedule.lecTimeEnd" >Time End</form:label></td>
							<td> <form:select path = "schedule.lecTimeEnd">
							        <form:option value = "1" label = "1:00 AM" />
							        <form:option value = "1.5" label = "1:30 AM" />
							        <form:option value = "2" label = "2:00 AM" />
						    	 </form:select>     	
							</td>
						</tr>
						
						<tr>
							<td><form:label path="schedule.lecRoom" >Room</form:label></td>
							<td><form:input path="schedule.lecRoom"/></td>
						</tr>
						
	
						
						<tr>
							<td><form:label path="schedule.lecDays" >Days</form:label></td>
							<td>
								<form:checkbox class="cbox" path="lecDays.days[0]" value="M"  label="M" />
							    <form:checkbox class="cbox" path="lecDays.days[1]" value="T"  label="T"/>
								<form:checkbox class="cbox" path="lecDays.days[2]" value="W"  label="W"/>
								<form:checkbox class="cbox" path="lecDays.days[3]" value="Th" label="Th"/>
								<form:checkbox class="cbox" path="lecDays.days[4]" value="F"  label="F"/>
								<form:checkbox class="cbox" path="lecDays.days[5]" value="S"  label="S"/>
								<form:checkbox class="cbox" path="lecDays.days[6]" value="Su" label="Su"/>
							</td>			
						</tr>

						</table>
						<h3>Lab</h3>
						<table class="formTable">
						<tr>
							<td><form:label path="schedule.labTimeStart" >Time Start</form:label></td>
							<td> <form:select path = "schedule.labTimeStart">
							        <form:option value = "1" label = "1:00 AM" />
							        <form:option value = "1.5" label = "1:30 AM" />
							        <form:option value = "2" label = "2:00 AM" />
						    	 </form:select>     	
							</td>
						</tr>
						
						<tr>
							<td><form:label path="schedule.labTimeEnd" >Time End</form:label></td>
							<td> <form:select path = "schedule.labTimeEnd">
							        <form:option value = "1" label = "1:00 AM" />
							        <form:option value = "1.5" label = "1:30 AM" />
							        <form:option value = "2" label = "2:00 AM" />
						    	 </form:select>     	
							</td>
						</tr>
						
						<tr>
							<td><form:label path="schedule.labRoom" >Room</form:label></td>
							<td><form:input path="schedule.labRoom"/></td>
						</tr>
						
					
						
						<tr>
							<td><form:label path="schedule.labDays" >Days</form:label></td>
							<td>
								<form:checkbox class="cbox" path="labDays.days[0]" value="M"  label="M" />
							    <form:checkbox class="cbox" path="labDays.days[1]" value="T"  label="T"/>
								<form:checkbox class="cbox" path="labDays.days[2]" value="W"  label="W"/>
								<form:checkbox class="cbox" path="labDays.days[3]" value="Th" label="Th"/>
								<form:checkbox class="cbox" path="labDays.days[4]" value="F"  label="F"/>
								<form:checkbox class="cbox" path="labDays.days[5]" value="S"  label="S"/>
								<form:checkbox class="cbox" path="labDays.days[6]" value="Su" label="Su"/>
							</td>
							
						</tr>
					</table>

</form:form>
				