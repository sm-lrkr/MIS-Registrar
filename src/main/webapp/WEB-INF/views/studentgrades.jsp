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
	
			var activeTableID;

			$("table[id *= 'gradesview'] :input").prop("disabled", true);
			$("table[id *= 'gradesview'] :input").prop("style", "width:40px;");
			$("table[id *= 'gradesview'] :input").addClass("disabledInput");
			$("button[id *= 'save']").hide();
			$("button[id *= 'cancel']").hide();
	
			$("button[id *= 'cancel']").click(function(){
				$("table[id *= '"+ activeTableID +"'] :input").prop("disabled", true);
				$("table[id *= '"+ activeTableID +"'] :input").addClass("disabledInput");		
			
				$("button[id *= '"+ activeTableID +"save']").hide();
				$("button[id *= '"+ activeTableID +"cancel']").hide();
				$("button[id = '"+ activeTableID +"']").show();
				activeTableID = "";
			
				$("table[id ^= 'gradesview'] :input").each(function(){
					if($(this).val() == '0.0'){
						$(this).hide();
					}
				});
			});
	
			$("button[id *= 'gradesview']").click(function(){
				var id = $(this).attr('id'); 
				activeTableID = id;
		
		
				$("table[id *= '"+ id +"'] :input").show();
				$("table[id *= '"+ id +"'] :input").prop("disabled", false);
				$("table[id *= '"+ id +"'] :input").removeClass("disabledInput");		
		
				$("button[id *= '"+ id +"save']").show();
				$("button[id *= '"+ id +"cancel']").show();
				$(this).hide();

			});

			$("table[id ^= 'gradesview'] :input").each(function(){
				if($(this).val() == '0.0'){
					$(this).hide();
				}
			});
		});
		
		</script>
	
</head>
<body>
	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
	
		<jsp:include page="includes/student-left-menu.jsp" />
		<div>
			<div style="margin-bottom: 20px;">
				<h1 style="display: inline-block;">${student.lastName}, ${student.firstName} ${student.middleName}</h1>
				<div class="floatright">
					<a href="${pageContext.request.contextPath}/grades/${dept}/tor/print/?studentNo=${student.studentNo}" id="print" ><span class="linkButton" >TOR </span></a>   
				 	<a href="${pageContext.request.contextPath}/grades/${dept}/grades/print/?studentNo=${student.studentNo}" id="printgrades" ><span class="linkButton" >Print</span></a>   
				 </div>
			</div>

			<form:form  action="${pageContext.request.contextPath}/grades/${dept}/save/?studentNo=${student.studentNo}" method="post" modelAttribute="allSemGrades" >
				<c:forEach var="sg" items="${allSemGrades.semGrades}" varStatus="status">
					<c:set var="ap" value="" />
					<div style="width: 1000px; ">
						<div style="margin-bottom: 5px;">
							<h3 style="display: inline-block;" >SY: ${sg.enrollment.schoolYear} , Sem: ${sg.enrollment.semester}</h3>
							<div style="float:right; ">
								<button type="button" id="gradesview${status.index}"class="linkButton" >Edit</button>   
								<button type="submit" id="gradesview${status.index}save"class="linkButton" >Save</button>   
								<button type="reset" id="gradesview${status.index}cancel"class="linkButton" >Cancel</button>   
							</div>
						</div>
							
						<table id="gradesview${status.index}" class="display compact listTable">
							<thead>
								<tr><th>Code</th><th>Description</th><th>Units</th><th>Prelim</th><th>Midterm</th><th>Final</th><th>Grade Equivalent</th><th>Date Modified</th></tr>
							</thead>
								
							<tbody>
								<c:forEach var="grade" items="${sg.grades}" varStatus="status1">
									<tr>
										<td>
											${grade.subjectCode} 
											<form:input type="hidden" path="semGrades[${status.index}].grades[${status1.index}].subjectCode" />	
										</td>
										<td>${grade.subjectDesc} </td>
										<td>${grade.lecUnits + grade.labUnits} </td>
												
											
										<td>
											<form:input type="hidden" path="semGrades[${status.index}].grades[${status1.index}].enrollmentNo" />
											<form:input type="hidden" path="semGrades[${status.index}].grades[${status1.index}].backupGrade" />
											${allSemGrades.semGrades[status.index].grades[status1.index].prelimGrade}
										</td>
						
										<td>${allSemGrades.semGrades[status.index].grades[status1.index].midtermGrade}</td>
										<td><form:input path="semGrades[${status.index}].grades[${status1.index}].finalGrade" /></td>
										<td>${allSemGrades.semGrades[status.index].grades[status1.index].equivalentGrade}</td>
				
										<td>${grade.dateModified} </td>
									</tr>
								</c:forEach>
								<tr style="border-top: 1px solid grey;" ><td colspan="8">GPA: ${sg.average}  </td></tr>
							</tbody>
								
						</table>	
					</div>
				</c:forEach>
			</form:form>
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
