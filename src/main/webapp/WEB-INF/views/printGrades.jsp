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
			
			 var table = $('#studview').DataTable( {
				 	"dom" : 'rt',
			        "columnDefs": [
			        	{"title" : "StudentNo", "visible" : false, "targets": 0 },
			        	{"title" : "ID/LRN"},
			        	{"title" : "Last Name"},
			        	{"title" : "First Name"},
			        	{"title" : "Middle Name"},
			       
			        ]
			 } );
			 
			
	
			table.on( 'dblclick', 'tr', function () {
				var stdNo = table.row( this ).data()[0];
				window.location.href = ctx+"/students/student/" + stdNo;
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
					}
			   
			    ]
			}).container().appendTo($('#buttons'));
				
			$(".content").printThis({
				  importCSS: true,
				  importStyle: true
				  
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
		  margin-top: 0.2in;
		  margin-bottom: 0.5in;
		  margin-left: 0.5in;
		  margin-right: 0.5in;
		}
	
		td{
			text-align: left;
			font-size: 12px;
	
		}
	</style>
</head>
<body>
	<div style="display: flex; flex-direction: right;">
		<div style="width: 8.5in; text-align:center" >
			
			<div style=" display: inline-block;" >
			
				<div style="text-align:center;" class="content">
					<img src="${pageContext.request.contextPath}/resources/images/bclogo.png" />
				</div>
				
				<h2>${schoolYear} </h2>
	
				<div style="width: 7.5in; margin-top: 20px; text-align:left;" class="content"  >
					<h4 style="margin-bottom:-15px;">ID: ${student.studentID}  </h4>	
					<h4 style="float:right; margin-right:20px;">Course: ${student.courseID}  </h4>	
					<h4 style="margin-bottom:-15px;" >Name: ${student.lastName}, ${student.firstName} ${student.middleName}  </h4>	
					<table id="gradesview" class="display compact listTable ">
							<thead>
								<tr><th>Code</th><th>Description</th><th>Units</th><th>Prelim</th><th>Midterm</th><th>Final</th></tr>
							</thead>
					
							<tbody>
								<c:forEach var="grade" items="${semGrades.grades}" varStatus="status1">
									<tr>
										<td>
											${grade.subjectCode} 
										</td>
										<td>${grade.subjectDesc} </td>
										<td>${grade.lecUnits + grade.labUnits} </td>
										<td>
											<c:if test="${grade.prelimGrade ne 0}">
												${grade.prelimGrade}
											</c:if>
										</td>
										<td>
											<c:if test="${grade.midtermGrade ne 0}">
												${grade.midtermGrade}
											</c:if>
										</td>
										<td>
											<c:if test="${grade.finalGrade ne 0}">
												${grade.finalGrade}
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</tbody>
					</table>	
				</div>
			</div>
		</div>
		<div  class="no-print" style="display: inline-block;	margin-top:100px;">
			<div id="buttons">
			</div>
			
		
		</div>
		
	
	</div>

</body>
</html>
