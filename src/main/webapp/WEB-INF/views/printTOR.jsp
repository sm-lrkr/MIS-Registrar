<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/css/dataTable.min.css" var="dtcss" />
<spring:url value="/resources/css/dataTableSelect.min.css" var="dtselectcss" />
<spring:url value="/resources/css/buttons.dataTables.min.css" var="dtbuttonscss" />
<spring:url value="/resources/javascript/printThis.js" var="printThis" />


<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/myscript.js" var="myscript" />
<spring:url value="/resources/javascript/dataTable.js" var="dtjs" />
<spring:url value="/resources/javascript/dataTableSelect.min.js" var="dtselectjs" />

<spring:url value="/resources/javascript/dataTables.buttons.min.js" var="dtbuttonsjs" />
<spring:url value="/resources/javascript/buttons.flash.min.js" var="flashButtons" />
<spring:url value="/resources/javascript/jszip.min.js" var="jszip" />
<spring:url value="/resources/javascript/pdfmake.min.js" var="pdfmake" />
<spring:url value="/resources/javascript/vfs_fonts.js" var="vfs_fonts" />
<spring:url value="/resources/javascript/buttons.html5.min.js" var="html5Buttons" />
<spring:url value="/resources/javascript/buttons.print.min.js" var="printButton" />


    
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	
	<link href="${dtcss}" rel="stylesheet">
	<link href="${dtselectcss}" rel="stylesheet">
	<link href="${dtbuttonscss}" rel="stylesheet">
	<link href="${css}" rel="stylesheet">
	<link href="/resources/css/dataTableS.checkboxes.min.css" rel="stylesheet">
	
	
	
	<script type="text/javascript" src="${jscript}" ></script>
	<script type="text/javascript" src="${myscript}" ></script>
	<script type="text/javascript" src="${dtjs}" ></script>
	<script type="text/javascript" src="${dtselectjs}" ></script>
	<script type="text/javascript" src="${printThis}" ></script>
	

	<script type="text/javascript" src="${dtbuttonsjs}" ></script>
	<script type="text/javascript" src="${flashButtons}" ></script>
	<script type="text/javascript" src="${jszip}" ></script>
	<script type="text/javascript" src="${pdfmake}" ></script>
	<script type="text/javascript" src="${vfs_fonts}" ></script>
	<script type="text/javascript" src="${html5Buttons}" ></script>
	<script type="text/javascript" src="${printButton}" ></script>
	
	<script type = "text/javascript">
	
		$(document).ready(function(){
			var ctx = "${pageContext.request.contextPath}";
			var url = encodeURI(ctx + '/ajax/departmentSelectChanged/?param=');
			departmentSelect($('#deptSelect'), $('#courseSelect'), ctx);
			courseSelect($('#search'), $('#courseSelect'), $('#studview'), ctx);
			searchStudents($('#search'), $('#searchBtn'), $('#courseSelect'), $('#studview'), ctx);	

			 var table = $('#schedsview').DataTable( {
				 	"dom" : 'rt',
				 	 "columnDefs": [
				        	{"targets": 6, "visible" : false},
				        	{"targets": [0,1,2,3,4,5], "searchable": false}
				     ]
			 } );

			table.search( $("#db_Option2").val() ).draw();
			 
			var buttons = new $.fn.dataTable.Buttons(table, {
			     buttons: [
			    		{
			            	text: 'PRINT',
			            	action: function ( e, dt, node, config ) {
			            		$(".content").printThis({
			      				  importCSS: true,
			      				  importStyle: true,
			      				});
			            	},
			            	className: 'blue'
			            },
			    	 {
			    	 	extend: 'collection',
		                text: 'Export',
		                autoClose: true,
		                buttons: [
		                    'copy',
		                    {  
		                    	extend: 'excel', 
		                    	exportOptions: {
				                	columns: ':visible'
				                }
		                    },
		                    {  
		                    	extend: 'csv', 
		                    	exportOptions: {
				                	columns: ':visible'
				                }
		                    },
		                    'pdf'
		              
		                ],
		                className: 'blue'
					}
	
			    ]
			}).container().appendTo($('#buttons'));
			$("#db_Option1").val($("#teacherID").val());
			$("#sy").html($("#db_Option2").val());

			$("#db_Option").on('input', function(){
				var printBy = $("#db_Option").val();
				if(printBy != ""){
					window.location.href=  encodeURI("${pageContext.request.contextPath}/schedules/clg/"+ printBy +"/?courseID=none&year=0");
				}
			});
	
			$("#db_Option1").on('input', function(){
				var teacherID = $("#db_Option1").val();
				if(teacherID != ""){
					window.location.href = encodeURI("${pageContext.request.contextPath}/schedules/clg/printByTeacher/?teacherID=" + teacherID);
				}
			});
		
			$("#db_Option2").on('input', function(){
				var year = this.value;
				table.search( year ).draw();
				$("#sy").html("");
				if(year != ""){
					$("#sy").html(this.value);
				}
		
				
			});
		});
	</script>

	
	
	<style>
		@media print
		{    
		    .no-print, .no-print *
		    {
		        display: none !important;
		    }
		}

		@page {
		  margin-top: 0.5in;
		  margin-bottom: 0.5in;
		  margin-left: 0.5in;
		  margin-right: 0.5in;
		}
	</style>
</head>
<body>
	<div style="display: flex; flex-direction: right;">
		<div style="width: 8.5in; text-align:center" >
			<div style=" display: inline-block;" >
				<div class="content" style="text-align: center;">
					<p style="font-size: 18px; font-weight: bold;">${student.firstName} ${student.lastName}</p>
					<p  style="font-size: 14px; font-weight: bold; margin-top: -10px;" id="sy"></p>
				</div>
		
				<div style="width: 7.5in; margin-top:30px;" class="content" >
					<form:form  action="${pageContext.request.contextPath}/grades/${dept}/save/?studentNo=${student.studentNo}" method="post" modelAttribute="allSemGrades" >
					
						<c:forEach var="sg" items="${allSemGrades.semGrades}" varStatus="status">
						<c:set var="ap" value="" />
						<div style="width: 1000px; ">
							<div style="margin-bottom: 5px;">
								<h3 style="display: inline-block;" >SY: ${sg.enrollment.schoolYear} , Sem: ${sg.enrollment.semester}</h3>
							</div>
								
							<table id="gradesview${status.index}" class="display compact listTable">
								<thead>
									<th>Subject Code</th>
									<th>Description</th>
									<th>Grades</th>
									<th>Credit/s</th>
									<th>School Year</th>
									<th>Semester</th>
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
		</div>
	
		<div  class="no-print" style="display: inline-block;	margin-top:100px;">
			<div id="buttons">

			</div>
			
			<div style="margin-top:100px;">
				<select id="db_Option" >
					<option value="" label="By Teacher"/> 
					<option value="printByCourse" label="By Course"/> 
					
				</select>
			</div>

		</div>
	</div>

</body>
</html>
