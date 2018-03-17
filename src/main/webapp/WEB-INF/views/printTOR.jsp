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
					$("#registrar").html(registrar);
					
				}
			
				if($("#tb_director").val()!=""){
					$("#director").html(director);
				}
				
			});
	
			var table = $('#gradesview').DataTable( {
			 	"sDom" : 'rt',
			 	"pageLength": 30,
		        "select": {
		        	style : 'multiple'
		        }, "columnDefs": [
		        	{	
		        		"targets": [4],  
		        		"visible" : false
		        	},
		        	{	
		        		"targets": [0,1,2,3,4],  
		        		"orderable" : false
		        	}
		        ], 
		        'order': [[4, 'asc']]
		 	} );
		
			var table1 = $('#allsubjects').DataTable( {
			 	"sDom" : 'rt',
		        "scrollY":        "200px",
		        "scrollCollapse": false,
		        "paging" : false,
		        "select": {
		        	style : 'multiple'
		        }
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
			            	text: 'REMOVE from TOR',
			            	action: function ( e, dt, node, config ) {
			            		table.rows( '.selected' ).remove().draw();
			            	},
			            	className: 'blue'
			            }
		
			    ]
			}).container().appendTo($('#buttons'));
	
			
		
		
			$("#addone").click(function() {
					var data = table.rows().data();
					var subjectCode = $("#subjectcode").val();
					var description = $("#description").val();
					var grade = $("#grade").val();
					var units = $("#units").val();
		
					//if(subjectCode!="" && description!="" )
					//{
						table1
					    .row.add( [ subjectCode, description, grade, units ] )
					    .draw();
						
						$("#subjectcode").val('');
						$("#description").val('');
						$("#grade").val('');
						$("#units").val('');	
				
					//}
					//else{
					//	alert("Please input all subject fields");
					//}
				
			});
			
			$("#remove").click(function() {
				var data = table1.rows().data();
				table1
			    .rows(".selected").remove().draw();
			
			});
		
			$("#addtor").click(function() {
				var data = table.rows().data().toArray();
				var data1 = table1.rows().data().toArray();
				var sy = $("#schoolYear").val();
				var sem = $("#semester").val(); 
				var desc = $("#description").val();
				var school = $("#schoolName").val();
				var course = $("#course").val();
				var sems = ["", "1st Semester", "2nd Semester", "Summer"];
				var semheader = "Taken at " + school +"<br>"+ course+"<br>"+ sems[sem] + "-"+sy; 
				if(school!="" && course!=""){
					table.rows().remove().draw();
					
					//add rows from the other table
					table.row.add(['','<center>'+semheader+'</center>','','',sy+"-"+sem]);
					$.each(data1, function(index, row){
						table.row.add([row[0],row[1],'<center>'+row[2]+'</center>','<center>'+row[3]+'</center>',sy+"-"+sem]);
					});
					table.draw();
		
					//add rows from the TOR
					$.each(data, function(index, row){
						if(row[0] == ""){
							table.row.add(['','<center>'+row[1]+'</center>','','',row[4]]);
						}
						else{
							table.row.add([row[0],row[1],'<center>'+row[2]+'</center>','<center>'+row[3]+'</center>',row[4]]);
							//table.row.add(row);
						}
					});
					table.draw();
					table1.clear().draw();
	
				}
				else{
					alert("Please input School and Course");
				}
		
			});
	
			$("#prev").click(function() {
				var info = table.page.info();
				if(info.pages > 1 && info.page > 0)
				{
					 table.page( 'previous' ).draw( 'page' );
				}
			});
			
			$("#next").click(function() {
				var info = table.page.info();
				if(info.pages > 1 && info.page < (info.pages-1))
				{
					 table.page( 'next' ).draw( 'page' );	
				}
			
			});
	
			$("#hide").click(function() {
				 $.fn.dataTable.ext.search.push(
					      function(settings, data, dataIndex) {
					    	  //return $(table.row(dataIndex).node()).hasClass('selected');
					    	  // return table.rows(".selected");
					    	  if($(table.row(dataIndex).node()).hasClass('selected'))
					    	  	return false;
					    	  return true;
					      }

				);
				table.draw();
			});
	
			$("#show").click(function() {
			    $.fn.dataTable.ext.search.pop();
			    table.draw();
			});
			
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
		td{
			font-weight: bold;
			font-size:12px;
			text-align: left;
		}
		
	
	

	</style>
</head>
<body>
	<div style="display: flex; flex-direction: right;">
		<div style="width: 8.5in; text-align:center" >
			<div style=" display: inline-block;" >
				<div class="content" style="text-align: center; border-bottom: 3px solid blue">
					<img src="${pageContext.request.contextPath}/resources/images/bclogo.png" />
				</div>
				<div class="content"  style="text-align: center;" >
					<p style="font-size: 20px; font-weight: bold; ">OFFICIAL TRANSCRIPT OF RECORDS</p>
				</div>
				<div class="content" style="width: 100%; border-bottom: 1px solid black; margin-bottom: -350px; text-align:left;">
					<p style="font-size: 14px; font-weight: bold;  display:inline-block; ">Name: ${student.firstName} ${student.lastName}</p>
					<p style="font-size: 14px; font-weight: bold; float: right; margin-right: 10px;">I.D. No: ${student.studentID}</p>
				</div>
				<div style="width: 7.5in; margin-top:30px; border-top: 1px solid black;" class="content" >
					<form:form  action="${pageContext.request.contextPath}/grades/${dept}/save/?studentNo=${student.studentNo}" method="post" modelAttribute="allSemGrades" >
							<div style="width: 7.5in;">
							<table id="gradesview" class="compact pageResize" style="border-collapse: true;">
								<thead>
									<tr style="height: 0;">
										<th> Subject Code</th>
										<th> Description</th>
										<th> Grades</th>
										<th> Credit/s</th>
										<th> SchoolYear</th>
									</tr>
								</thead>
								<tbody>
						<c:forEach var="sg" items="${allSemGrades.semGrades}" varStatus="status">
							<c:set var="ap" value="" />
								<tr style="height: 0;">
								
									<td></td>
									<td style="text-align:center; font-weight:1500; font-size: 12px;" >
									 	<strong>Taken at Benedicto College<br>
									 	${sems[sg.enrollment.semester]} ${sg.enrollment.schoolYear}
									 	</strong>
									 </td>
									<td></td>
									<td></td>
									<td>${sg.enrollment.schoolYear}-${sg.enrollment.semester}</td>
								
								
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
												<c:if test="${allSemGrades.semGrades[status.index].grades[status1.index].finalGrade ne 0}">
													${allSemGrades.semGrades[status.index].grades[status1.index].finalGrade}
												</c:if>
											</td>
											<td style="text-align:center;"  >
													<c:if test="${allSemGrades.semGrades[status.index].grades[status1.index].finalGrade ne 0}">
														${grade.lecUnits + grade.labUnits}
													</c:if>
											 </td>
											 <td>${sg.enrollment.schoolYear}-${sg.enrollment.semester}</td>
										</tr>
									</c:forEach>
		
								</c:forEach>
							</tbody>
							</table>	
							</div>
							<div style=" margin-top:-10px; margin-bottom: -10px; text-align: center;">
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
		
			<div class="no-print">
				<button type="button" id="prev" >Prev</button>
				<button type="button" id="next" >Next</button>
				<button type="button" class="linkButton" id="hide" >Hide selected</button>
				<button type="button" class="linkButton" id="show" >Show Hidden</button>
			</div>
			
		</div>
		<div  class="no-print" style="display: inline-block;	margin-top:100px;">
			<div id="buttons">
			</div>
			<div style="margin-top:50px;">
				<table>
					<tr>
						<td> 
							<table class="formTable" style="margin-top: 30px; ">
						
								<tr>
									<td>Subject Code</td>
									<td>
										<input id="subjectcode"/>
									</td>
								</tr>
								
								<tr>
									<td>Description</td>
									<td><input id="description"/></td>
								</tr>
					     		
					     		<tr>
									<td>Grade</td>
									<td><input id="grade"/></td>
								</tr>
						
								<tr>
									<td>Credited Units</td>
									<td><input id="units"/></td>
								</tr>
							</table>	
				
							<div>
								<button type="button" class="linkButton" id="addone" >Add </button>
								<button type="button" class="linkButton" id="remove" >Remove Selected </button>
							</div>
						</td>
			
						<td> 
							
							<table class="formTable" style="margin-top: 30px;">
									<tr>
										<td>School</td>
										<td>
											 <input id="schoolName"/>
										</td>
									</tr>
									
						     		<tr>
										<td>Course</td>
										<td><input id="course"/></td>
									</tr>
									
									<tr>
										<td>SchoolYear</td>
										<td>
											<select  id="schoolYear">
												<option value="2000-2001"> 2000-2001 </option>
												<option value="2001-2002"> 2001-2002 </option>
												<option value="2002-2003"> 2002-2003 </option>
												<option value="2003-2004"> 2003-2004 </option>
												<option value="2004-2006"> 2004-2006 </option>
												<option value="2005-2006"> 2005-2006 </option>
												<option value="2006-2007"> 2006-2007 </option>
												<option value="2007-2008"> 2007-2008 </option>
												<option value="2008-2009"> 2008-2009 </option>
												<option value="2009-2010"> 2009-2010 </option>
												<option value="2010-2011"> 2010-2011 </option>
												<option value="2011-2012"> 2011-2012 </option>
												<option value="2012-2013"> 2012-2013 </option>
												<option value="2013-2014"> 2013-2014 </option>
												<option value="2014-2015"> 2014-2015 </option>
												<option value="2015-2016"> 2015-2016 </option>
												<option value="2016-2017"> 2016-2017 </option>
												<option value="2017-2018"> 2017-2018 </option>
												<option value="2018-2019"> 2018-2019 </option>
												<option value="2019-2020"> 2019-2020 </option>
												<option value="2020-2021"> 2020-2021 </option>
												<option value="2021-2022"> 2021-2022 </option>
												<option value="2022-2023"> 2022-2023 </option>
												<option value="2023-2024"> 2023-2024 </option>
												<option value="2024-2025"> 2024-2025 </option>
												<option value="2025-2026"> 2025-2026 </option>
												<option value="2026-2027"> 2026-2027 </option>
												<option value="2027-2028"> 2027-2028 </option>
												<option value="2028-2029"> 2028-2029 </option>
												<option value="2029-2030"> 2029-2030 </option>
												
											</select>
										</td>
									</tr>
							
									<tr>
										<td>Semester</td>
										<td>
											<select  id="semester">
												<option value="1"> 1st Semester </option>
												<option value="2"> 2nd Semester</option>
												<option value="3"> Summer </option>
										
											</select>
										</td>
									</tr>
								</table>
					
								<div>
									<button type="button" class="linkButton" id="addtor" >Add to TOR</button>
								</div>
						</td>
					</tr>
			
				</table>
			</div>

		
			<div style="margin-top:10px;">

				<table id="allsubjects" class="display compact listTable">  
					<thead>
						<tr>
						
							<th>Subject Code</th>
							<th>Description</th>
							<th>Grades</th>
							<th>Credit/s</th>							
						</tr>  
				   	</thead>
					<tbody>
						<c:forEach var="subj" items="${credited}">   
						   	<tr>  
						   		
							   	<td>${subj.subjectCode}</td>  
							   	<td>${subj.subjectDesc}</td>  
							   	<td>${subj.finalGrade}</td>  
							   	<td>${subj.lecUnits + subj.labUnits}</td>
							   	
							   </tr>  
				   		</c:forEach>
					</tbody>
					  
			  	 </table>  
			</div>
	
		
			
			<div style="margin-top:30px;">
								<table class="formTable" style="margin-top: 30px; ">						<tr>
										<td>Remarks:</td>
										<td><input type="text" id="tb_remarks" /><br></td>
									</tr>
									<tr>
										<td>Registrar:</td>
										<td><input  type="text" id="tb_registrar" /><br></td>
								
									</tr>
									<tr>
										<td>Director:</td>
										<td><input type="text" id="tb_director" /><br></td>
				
									</tr>
									<tr>
										<td>Date:</td>
										<td><input type="text" id="tb_date" /></td>
									</tr>
								</table>
								
								<div><button type="button" class="linkButton" id="edit" >Edit</button></div>
							
			</div>
	
			
		</div>
	</div>

</body>
</html>
