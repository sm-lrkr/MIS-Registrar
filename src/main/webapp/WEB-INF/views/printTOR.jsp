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
		
			$("#edit").on('click', function(){
				alert("clicked");
				var remarks = $("#tb_remarks").val();
				var registrar = $("#tb_registrar").val();
				var director = $("#tb_director").val();

				if($("#tb_remarks").val()!=""){
					$("#remarks").html('REMARKS: <u>'+remarks+'</u>');
				}
			
				if($("#tb_registrar").val()!=""){
					$("#registrar").html(remarks);
					
				}
			
				if($("#tb_director").val()!=""){
					$("#director").html(director);
				}
				
			});
		
			var table1 = $('#allsubjects').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY":        "300px",
		        "scrollCollapse": false,
		        "paging" : false,
		        "select": {
		        	style : 'single'
		        }
		 	} );
			
			table1.on( 'dblclick', 'tr', function () {
				var subjectCode = table.row( this ).data()[0];
				var current = $("#preReq").val();
				if(current !== "")
				{
					current = current.concat(", ");	
				}	
				
				if(current.indexOf(subjectCode) == -1)
				{
					$("#preReq").val(current.concat(subjectCode));
				}
				
				
			});
			
			var buttons = new $.fn.dataTable.Buttons(table1, {
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
			
	
			 var table = $('#gradesview').DataTable( {
				 	"dom" : 'rtf'
			 } );
			
		
				
			
			$("#db_Option").on('input', function(){
				var printBy = $("#db_Option").val();
				if(printBy != ""){
					window.location.href=  encodeURI("${pageContext.request.contextPath}/schedules/clg/"+ printBy +"/?courseID=none&year=0");
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
		  margin-top: 0.2in;
		  margin-bottom: 0.5in;
		  margin-left: 0.5in;
		  margin-right: 0.5in;
		}

		tr{
			font-size: 12px;
		}
		td{
			font-weight: bold;
			font-size:12px;
			text-align: left;
			cell-padding: 0px;
		}
		

	
	</style>
</head>
<body>
	<div style="display: flex; flex-direction: right;">
		<div style="width: 8.5in; text-align:center" >
			<div style=" display: inline-block;" >
				<div class="content" style="text-align: center;">
					<img src="${pageContext.request.contextPath}/resources/images/bclogo.png" />
					<hr>
					<p style="font-size: 20px; font-weight: bold; ">OFFICIAL TRANSCRIPT OF RECORDS</p>
				</div>
				<div style="width: 100%; border-bottom: 1px solid black; margin-bottom: -330px; text-align:left;">
					<p style="font-size: 14px; font-weight: bold;  display:inline-block; ">Name: ${student.firstName} ${student.lastName}</p>
					<p style="font-size: 14px; font-weight: bold; float: right; margin-right: 10px;">I.D. No: ${student.studentID}</p>
				</div>
				<div style="width: 7.5in; margin-top:30px;" class="content" >
					<form:form  action="${pageContext.request.contextPath}/grades/${dept}/save/?studentNo=${student.studentNo}" method="post" modelAttribute="allSemGrades" >
							<div style="width: 7.5in; border-bottom: 1px solid black;">
							<table id="gradesview" class=" compact" >
								<thead>
									<tr>
										<th>Subject Code</th>
										<th>Description</th>
										<th >Grades</th>
										<th>Credit/s</th>
									</tr>
								</thead>
					
								<tbody>
			
						<c:forEach var="sg" items="${allSemGrades.semGrades}" varStatus="status">
							<c:set var="ap" value="" />
					
								<tr>
									<td style="text-align:center; font-weight:1500; font-size: 12px;" > ${sems[sg.enrollment.semester]} ${sg.enrollment.schoolYear}</td>
									<td></td>
									<td></td>
									<td></td>
									
								</tr>
									<c:forEach var="grade" items="${sg.grades}" varStatus="status1">
										<tr>
											<td>
												${grade.subjectCode} 
												<form:input type="hidden" path="semGrades[${status.index}].grades[${status1.index}].subjectCode" />	
											</td>
											<td>${grade.subjectDesc} </td>
											<td style="text-align:center;">
												<form:input type="hidden" path="semGrades[${status.index}].grades[${status1.index}].enrollmentNo" />
												<form:input type="hidden" path="semGrades[${status.index}].grades[${status1.index}].backupGrade" />
												${allSemGrades.semGrades[status.index].grades[status1.index].prelimGrade}
											</td>
											<td style="text-align:center;"  >${grade.lecUnits + grade.labUnits} </td>
										</tr>
									</c:forEach>
				
								</c:forEach>
							</tbody>
							</table>	
							</div>
							<div style=" margin-top:-10px; margin-bottom: -10px;">
									<p style="font-size: 12px; font-weight: bold; padding:0px;">**********(MORE ENTRIES NEXT PAGE)**********</p>
							</div>
	
							<div style="text-align: left; margin-top:-10px; border-top: 1px solid black; border-bottom: 2px solid black;">
								<p style="font-size: 12px; font-weight: bold; padding:0px;">Note: This transcript is not valid if there is/are erasure(s) in the grades</p>
								<div style="width: 100%; display: flex; flex-direction: horizontal;" >
									<div style="text-lign: left;">
										<p id="remarks" style="font-size: 14px; font-weight: bold; padding:0px;">REMARKS: <u>FOR EVALUATION PURPOSES ONLY</u></p>
										<p style="font-size: 12px; font-weight: bold; margin-left: 50px;">Prepared by :</p>
										<p id="registrar" style="font-size: 14px; font-weight: bold; margin-left: 100px;padding:0px; text-decoration: underline;">MIGUELA A. INDIG</p>
										<p style="font-size: 12px; font-weight: bold; margin-left: 100px;padding:0px;">School Registrar</p>
										<p style="font-size: 10px; font-weight: bold; margin-left: 50px; padding:0px;">Not valid without<br>School Dry Seal: </p>
									</div>
									<div style="display: inline-block; margin-right: 10px; padding-left:50px;">
											<p style="font-size: 14px; font-weight: bold; margin-left: 100px; padding:0px;">DATE ISSUED: </p>
											<p style="font-size: 12px; font-weight: bold; margin-left: 100px; padding:0px;">Approved by: </p>
											<p id="director" style="font-size: 14px; font-weight: bold; margin-left: 100px; padding:0px; text-decoration: underline;">RANULFO L VISAYA JR., M.Ed.: </p>
											<p style="font-size: 12px; font-weight: bold; margin-left: 100px; padding:0px;">School Director: </p>
										
									</div>
								</div>	
							</div>
							<p style="font-size: 9px; font-weight: bold; ">A.S. Fortuna Street, Mandaue City 6014, Cebu, Philippines * 
											Tel. Nos.:(63-32)345-6873|345-6874 Telefax No.:(63-62)345-5790 * benedictoregistrar@yahoo.com</p>
	
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
			
			<div style="margin-top:100px;">
				Remarks:
				<input style=" margin-bottom: 10px;" type="text" id="tb_remarks" /><br>
				Registrar:
				<input style=" margin-bottom: 10px;" type="text" id="tb_registrar" /><br>
				Director:
				<input style=" margin-bottom: 10px;" type="text" id="tb_director" /><br>
			</div>
			
			<div>
				<button type="button" class="linkButton" id="edit" >Edit</button>
			</div>
			
			<div>
				<table id="allsubjects" class="display compact listTable">  
					<thead>
						<tr>
							<th>Subject Code</th>
							<th>Description</th>
							<th>Grades</th>
							<th>Credit/s</th>
							<th>School Year</th>
							<th>Semester</th>
							<th>School</th>
							
											
						</tr>  
				   	</thead>
			
					<tbody>
						<c:forEach var="subj" items="${credited}">   
						   	<tr>  
							   	<td>${subj.subjectCode}</td>  
							   	<td>${subj.subjectDesc}</td>  
							   	<td>${subj.finalGrade}</td>  
							   	<td>${subj.lecUnits + subj.labUnits}</td>
							   	<td>${subj.schoolYear}</td>
							   	<td>${sems[subj.semester]}</td>
							   	<td>Benedicto College</td>
							   </tr>  
				   		</c:forEach>
					</tbody>
					  
			  	 </table>  
			</div>
		</div>
	</div>

</body>
</html>
