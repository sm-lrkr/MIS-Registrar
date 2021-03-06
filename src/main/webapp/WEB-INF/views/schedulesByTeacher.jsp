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
					<p style="font-size: 18px; font-weight: bold;">${teacher.first_name} ${teacher.last_name}</p>
					<p  style="font-size: 14px; font-weight: bold; margin-top: -10px;" id="sy"></p>
				</div>
		
				<div style="width: 7.5in; margin-top:30px;" class="content" >
	
					<table id="schedsview" class="compact listTable">  
						<thead>
								<tr><th>Subject</th><th>Section</th><th>Units</th><th>Time</th><th>Days</th><th>Room</th><th>SY</th></tr>
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
									   	<td> ${sched.schoolYear} ${sems[sched.semester]}</td>
									   	  
									</tr>
									<c:if test="${sched.labDays ne '' }">			   
									   	<tr>  
											<td> ${sched.subjectCode}-LAB</td>  
											<td> ${sched.section}</td>  
											<td> ${sched.labUnits}</td>  
											<td> ${sched.labTimeStart}-${sched.labTimeEnd}</td>  
											<td> ${sched.labDays}</td>  
											<td> ${sched.labRoom}</td>  
											<td> ${sched.schoolYear} ${sems[sched.semester]}</td>
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
					<option value="" label="By Teacher"/> 
					<option value="printByCourse" label="By Course"/> 
					
				</select>
			</div>
	
			<div style="margin-top:20px;">
				<select id="db_Option1" >
					<option value="" label="---Teachers---"/> 
					<c:forEach var="teacher" items="${teachers}">   
						<option value="${teacher.personnelID}" label="${teacher.first_name} - ${teacher.last_name}"/>   
				   	</c:forEach>
				</select>
				<input type="hidden" id="teacherID" value="${teacher.personnelID}"/> 
			</div>
			
			<div style="margin-top:20px;">
				<select id="db_Option2" >
					<c:forEach var="schoolYear" items="${schoolYears}">   
						<option value="${schoolYear.year_start}-${schoolYear.year_end} ${sems[schoolYear.semester]}" label="${schoolYear.year_start}-${schoolYear.year_end} ${sems[schoolYear.semester]} "/>   
				   	</c:forEach>
				   	<option value="TestTestTest" label="Test" />
				</select>
			
			</div>
		</div>
	</div>

</body>
</html>
