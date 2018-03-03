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
	</style>
</head>
<body>
	<div style="display: flex; flex-direction: right;">
		<div style="width: 8.5in; text-align:center" >
			<div style=" display: inline-block;" >
				<div style="text-align:center;" class="content">
					<img src="${pageContext.request.contextPath}/resources/images/bclogo.png" />
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
					<option value="-------" label="---Courses---"/> 
					<c:forEach var="course" items="${courses}">   
						<option value="${course.courseID}" label="${course.courseDesc}"/>   
				   	</c:forEach>
				</select>
				<input type="hidden" id="courseID" value="${course.courseID}"/> 
			</div>
		</div>
		
	
	</div>

</body>
</html>
