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
			

			$("#db_Option1").on('input', function(){
				var courseID = $("#db_Option1").val();
				var year = $("#db_Option2").val();
				if(courseID != ""){
					window.location.href = encodeURI("${pageContext.request.contextPath}/students/clg/printByCourse/?courseID=" + courseID+"&year="+ year);
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
	</style>
</head>
<body>
	<div style="display: flex; flex-direction: right;">
		<div style="width: 8.5in; text-align:center" >
			<div style=" display: inline-block;" >
				<div style="text-align:center;" class="content">
					<p id="header" style="display: inline-block; fon-size:14px; font-weight:bold;">${courseDesc}</p>
				</div>
				
				<div style="width: 7.5in;" class="content" >
					<table id="studview" class="compact listTable" >  
						<thead >
							<tr>
								<th >StudentNo</th>
								<th>Id/LRN</th>
								<th>Last Name</th>
								<th>First Name</th>
								<th>Middle Name</th>
								<c:if test = "${byCourse ne true}">
									<th>Course</th>
								</c:if>
							</tr>  
						</thead>
									
						<tbody>
							<c:forEach var="stud" items="${students}" varStatus="status">   
							   	<tr>  
								   	<td>${stud.studentNo}</td>  
								   	<td>${stud.studentID}</td>  
								   	<td>${stud.lastName}</td>  
								   	<td>${stud.firstName}</td>  
								   	<td>${stud.middleName}</td>  
								   	<c:if test = "${byCourse ne true}">
										<td>${stud.courseID}</td>
									</c:if>
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
			
			<div style="margin-top:100px;">
				<select id="db_Option" >
					<option value="printByTeacher" label="Enrolled"/> 
					<option value="printByCourse" label="By Course"/> 
					<option value="printByTeacher" label="By Strand"/> 
					<option value="printByTeacher" label="By Section"/>
					<option value="printByTeacher" label="By College Schedule"/>
					<option value="printByTeacher" label="By SH Schedule"/>
					
					 
					
				</select>
			</div>
			
			<div style="margin-top:20px;">
				<select id="db_Option1" >
					<option value="all" label="ALL"/> 
					<option value="clg" label="College"/> 
					<option value="shs" label="Senior High"/> 
					
				</select>
				<input type="hidden" id="courseID" value="${course.courseID}"/> 
			</div>
		</div>
		
	
	</div>

</body>
</html>
