<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>

	<jsp:include page="includes/includes.jsp" />


	<script type = "text/javascript">
		$(document).ready(function(){
			var ctx = "${pageContext.request.contextPath}";

			var table = $('#studview').DataTable( {
			 	"sDom" : 'rtf',
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "paging": false,
		        "select": {
		        	style : 'multiple'
		        },"columnDefs": [
		        	{"targets": 0, "visible" : false }
		        ]
		 	} );
				
			table.on( 'dblclick', 'tr', function () {
			} );
			
		
			
			$(".cbox").on('click', function(){
				var searchurl = encodeURI('ajax/schedSearch/?param='+$("#search").val());
				
				$.ajax({
					url: searchurl,
					data: $("#daysPanel").serialize(),
					type: "POST" ,
					success: function(result){
						$('#schedsView').html(result);
					},
					
					error: function (jqXHR, exception) {
				        var msg = '';
				        if (jqXHR.status === 0) {
				            msg = 'Not connect.\n Verify Network.';
				        } else if (jqXHR.status == 404) {
				            msg = 'Requested page not found. [404]';
				        } else if (jqXHR.status == 500) {
				            msg = 'Internal Server Error [500].';
				        } else if (exception === 'parsererror') {
				            msg = 'Requested JSON parse failed.';
				        } else if (exception === 'timeout') {
				            msg = 'Time out error.';
				        } else if (exception === 'abort') {
				            msg = 'Ajax request aborted.';
				        } else {
				            msg = 'Uncaught Error.\n' + jqXHR.responseText;
				        }
				       	alert(msg);
				    }  
					
				});
			});
			
			
			$("#scheduleForm :input").prop("disabled", true);
			$("#scheduleForm :input").addClass("disabledInput");
			
			$("#print").click(function(){
				alert("clicked");
				var scheduleID = '${schedule.scheduleID}';
                window.open( encodeURI(ctx+"/schedules/clg/printEnlisted/?schedID="+scheduleID),'_blank');
			});
		
			$("table[id *= 'gradesview'] :input").prop("disabled", true);
			$("table[id *= 'gradesview'] :input").prop("style", "width:40px;");
			$("table[id *= 'gradesview'] :input").addClass("disabledInput");
			$("table[id ^= 'gradesview'] :input").hide();
			$("#save").hide();
			$("#cancel").hide();
			

			$("#cancel").click(function(){
				$("#save").hide();
				$("#cancel").hide();
				$("table[id *= 'gradesview'] :input").prop("disabled", true);
				$("table[id *= 'gradesview'] :input").addClass("disabledInput");		
				$("table[id ^= 'gradesview'] :input").hide();
			
				
				$(".gradelabel").show();
				$("#edit").show();
			});
		
			$("#edit").click(function(){
				var id = $(this).attr('id'); 
				activeTableID = id;
				$(".gradelabel").hide();
				$(this).hide();
			
			
				$("table[id *= 'gradesview'] :input").show();
				$("table[id *= 'gradesview'] :input").prop("disabled", false);
				$("table[id *= 'gradesview'] :input").removeClass("disabledInput");		
	
				$("#save").show();
				$("#cancel").show();
			});
			
			
		
		});
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/main-left.jsp" />
		
		<div>
			<h1 style="display: inline-block; margin-top: 0px;">${schedule.subjectCode}</h1>  
			<div class="floatright">
						<button type="button" id="print" class="linkButton" >Print</button> 
			</div>
			<div style="margin-bottom: 50px;">
				
				<form:form id="scheduleForm" action="" modelAttribute="schedule">
					<table class="formTable" style="margin-top: 30px;">
						<tr>
							<td><form:label path="section" >Section</form:label></td>
							<td><form:input path="section" /></td>
						</tr>
						
						
						<c:if test = "${classType == 'LEC'}">
							<tr>
								<td><form:label path="lecUnits" >Units</form:label></td>
								<td><form:input path="lecUnits"/></td>
							</tr>
							
							<tr>
								<td><form:label path="lecTimeStart">Time Start</form:label></td>
								<td><form:input path="lecTimeStart" /></td>
							</tr>		
							<tr>
								<td><form:label path="lecTimeEnd">Time End</form:label></td>
								<td><form:input path="lecTimeEnd" /></td>
							</tr>	
							
							<tr>
								<td><form:label path="lecDays"> Days </form:label></td>
								<td><form:input path="lecDays" /></td>
							</tr>		
							
							<tr>
								<td><form:label path="lecRoom"> Room </form:label></td>
								<td><form:input path="lecRoom"/></td>
							</tr>				         
						</c:if>
			
						<c:if test = "${classType == 'LAB'}">
							<tr>
								<td><form:label path="labUnits" >Units</form:label></td>
								<td><form:input path="labUnits"/></td>
							</tr>
							
							<tr>
								<td><form:label path="labTimeStart">Time Start</form:label></td>
								<td><form:input path="labTimeStart" /></td>
							</tr>		
							<tr>
								<td><form:label path="labTimeEnd">Time End</form:label></td>
								<td><form:input path="labTimeEnd" /></td>
							</tr>	
							
							<tr>
								<td><form:label path="labDays"> Days </form:label></td>
								<td><form:input path="labDays" /></td>
							</tr>		
						
							<tr>
								<td><form:label path="labRoom"> Room </form:label></td>
								<td><form:input path="labRoom"/></td>
							</tr>				         
						</c:if>
						<tr>
							<td><form:label path="personnelName"> Instructor </form:label></td>
							<td><form:input path="personnelName"/></td>
						</tr>		
					
					</table>
				</form:form>
			</div>
	
			<div style="width: 1000px; " >
					 <form:form  action="${pageContext.request.contextPath}/grades/${dept}/save/${schedule.scheduleID}" method="post" modelAttribute="semGrades" >
						<div style="float:right; margin-bottom:20px; ">
								<button type="button" id="edit" class="linkButton" >Edit</button>   
								<button type="submit" id="save" class="linkButton" >Save</button>   
								<button type="button" id="cancel" class="linkButton" >Cancel</button>   
						</div>
				
						<table id="gradesview" class="display compact listTable">
							<thead>
								<tr><th>Name</th><th>Midterm</th><th>Final</th><th>Grade Equivalent</th><th>Date Modified</th></tr>
							</thead>
				
							<tbody>
								<c:forEach var="grade" items="${semGrades.grades}" varStatus="status1">
									<tr>
										<td> 
											${grade.lastName}, ${grade.firstName} ${grade.middleName}  
											<form:input type="hidden" path="grades[${status1.index}].enrollmentNo" />	
											<form:input type="hidden" path="grades[${status1.index}].backupGrade" />
										</td>
	
										<td>
											<c:if test="${grade.midtermGrade ne 0}">
												<span class="gradelabel"> ${grade.midtermGrade}</span>
											</c:if>
											<form:input path="grades[${status1.index}].midtermGrade" />
										</td>
										<td>
											<c:if test="${grade.finalGrade ne 0}">
												<span class="gradelabel">${grade.finalGrade} </span>
											</c:if>
							
											<form:input path="grades[${status1.index}].finalGrade" />
										</td>
				
										<td>
											<c:if test="${grade.equivalentGrade ne 0}">
												${grade.equivalentGrade}
											</c:if>
										</td>
					
										<td>${grade.dateModified} </td>
									</tr>
								</c:forEach>
							</tbody>				
						</table>	
					</form:form>
			</div>
	
		</div>
	</div>
	
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
