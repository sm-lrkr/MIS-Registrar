<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
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
				 	"select": {
			        	style : 'multiple'
			        },
				 	 "columnDefs": [
				        	{"targets": 7 , "visible" : false},
				        	{"targets": [0,1,2,3,4,5,6], "searchable": false}
				     ]
			 } );


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
						},
						{
			            	text: 'REMOVE SELECTED',
			            	action: function ( e, dt, node, config ) {
			            		table.rows( '.selected' ).remove().draw();
			            	},
			            	className: 'blue'
			            }
			
			    ]
			}).container().appendTo($('#buttons'));
			$("#db_Option1").val($("#courseID").val());
		
			$("#db_Option").on('input', function(){
				var printBy = $("#db_Option").val();
				window.location.href=  encodeURI("${pageContext.request.contextPath}/schedules/clg/"+ printBy +"/?teacherID=none");
			});
			
			$("#db_Option1").on('input', function(){
				var courseID = $("#db_Option1").val();
				var year = $("#db_Option2").val();
				if(courseID != ""){
					window.location.href = encodeURI("${pageContext.request.contextPath}/schedules/clg/printByCourse/?courseID=" + courseID+"&year="+ year);
				}
			});
			
			$("#db_Option2, #db_Option3").on('input', function(){
				var filter = this.value;
				var year = $("#db_Option2").val();
				var sy = $("#db_Option3").val();
				
				table.search( year+"-"+sy ).draw();
				$("#ysubheader").html("");
				
				if(filter != ""){
					$("#subheader").html(year+" "+sy);
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
				<div style="text-align:center;" class="content">
					<img src="${pageContext.request.contextPath}/resources/images/bclogo.png" />
					<p  style="font-size: 14px; font-weight: bold; margin-top: -10px;" id="sy">${courseDesc}</p>
					<p  id="subheader" style="font-size: 10px; font-weight: bold; margin-top: -10px;" id="sy"></p>
				</div>
				<div style="width: 7.5in; margin-top:30px;" class="content" >
		
					<table id="schedsview" class="compact listTable">  
						<thead>
								<tr><th>Subject</th><th>Section</th><th>Units</th><th>Time</th><th>Days</th><th>Room</th><th>Teacher</th><th>Year-SYS</th></tr>
						</thead>
						<tbody>
								<c:forEach var="sched" items="${schedules}">   
									<tr>  
									  	<td> ${sched.subjectCode}</td>  
									   	<td> ${sched.section}</td>  
									   	<td> ${sched.lecUnits}</td>  
									   	<td> ${sched.lecTimeStart}-${sched.lecTimeEnd}</td>  
									   	<td> ${sched.lecDays}</td>  
									   	<td> ${sched.lecRoom}</td>  
									   	<td> ${sched.personnelName}</td>  
								   		<td> ${years[sched.personnelID]}-${sched.schoolYear} ${sems[sched.semester]}</td>  
					
								   	</tr>
									<c:if test="${sched.labDays ne '' }">			   
									   	<tr>  
											<td> ${sched.subjectCode}-LAB</td>  
											<td> ${sched.section}</td>  
											<td> ${sched.labUnits}</td>  
											<td> ${sched.labTimeStart}-${sched.labTimeEnd}</td>  
											<td> ${sched.labDays}</td>  
											<td> ${sched.labRoom}</td>  
											<td> ${sched.personnelName}</td>
											<td> ${years[sched.personnelID]}-${sched.schoolYear} ${sems[sched.semester]}</td>  
										
										</tr>    
									</c:if>
					
						   		</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
		<div  class="no-print" style="display: inline-block;	margin-top:100px;">
			<div id="buttons">

			</div>
			
			<div style="margin-top:100px;">
				<select id="db_Option" >
					<option value="printByCourse" label="By Course"/> 
					<option value="printByTeacher" label="By Teacher"/> 
				</select>
			</div>
			
			<div style="margin-top:20px;">
				<select id="db_Option1" >
					<option value="" label="---Courses---"/> 
					<c:forEach var="course" items="${courses}">   
						<option value="${course.courseID}" label="${course.courseDesc}"/>   
				   	</c:forEach>
				</select>
				<input type="hidden" id="courseID" value="${course.courseID}"/> 
			</div>
	
			<div style="margin-top:20px;">
				<select id="db_Option2" >
					<option value="" label="---Year---"/> 
					<option value="1st-Year" label="1st Year"/> 
					<option value="2nd-Year" label="2nd Year"/> 
					<option value="3rd-Year" label="3rd Year"/> 
					<option value="4th-Year" label="4th Year"/> 
					<option value="5th-Year" label="5th Year"/> 
				</select>
			</div>
	
			<div style="margin-top:20px;">
				<select id="db_Option3" >
					<c:forEach var="schoolYear" items="${schoolYears}">   
						<option value="${schoolYear.year_start}-${schoolYear.year_end} ${sems[schoolYear.semester]}" label="${schoolYear.year_start}-${schoolYear.year_end} ${sems[schoolYear.semester]} "/>   
				   	</c:forEach>
				   	<option value="TestTestTest" label="Test"/>
				</select>
			</div>
		</div>
		
		
	</div>

</body>
</html>
