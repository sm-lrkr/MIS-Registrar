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
			 
			 $("#print").click(function(){
				 $(".content").printThis({
     				  importCSS: true,
     				  importStyle: true,
     			 });
			 });
			 
	
			table.on( 'dblclick', 'tr', function () {
				var stdNo = table.row( this ).data()[0];
				window.location.href = ctx+"/students/student/" + stdNo;
			} );
			
			var buttons = new $.fn.dataTable.Buttons(table, {
			     buttons: [
			    		{
			            	text: 'PRINT',
			            	action: function ( e, dt, node, config ) {
			            		window.print();
			            	},
			            	className: 'blue'
			            },
			    	 {
			    	 	extend: 'collection',
		                text: 'Export',
		                autoClose: true,
		                buttons: [
		                    'copy',
		                    'excel',
		                    'csv',
		                    'pdf'
		              
		                ],
		                className: 'blue'
					}
			    
			    ]
			}).container().appendTo($('#buttons'));
				
			
			$(".content").printThis({
				  importCSS: true,
				  importStyle: true,
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
			<div style=" display: inline-block;">
				<div style="text-align:center;" class="content" >
					<h1 style="display: inline-block;">${strandDesc}</h1>
				</div>
			
				<div style="width: 7.5in; " class="content">
					<table id="studview" class="display compact nowrap listTable" >  
						<thead >
							<tr>
								<th >StudentNo</th>
								<th>Id/LRN</th>
								<th>Last Name</th>
								<th>First Name</th>
								<th>Middle Name</th>
								<c:if test = "${byStrand ne true}">
									<th>Strand</th>
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
								   	
								   	<c:if test = "${byStrand ne true}">
										<td>${stud.strandCode}</td>
									</c:if>
							   	</tr>  
							</c:forEach>
						</tbody>  
					</table>  
				</div>
			</div>
		</div>
		<div class="no-print" style="display: inline-block;	margin-top:100px;">
			<div id="buttons">
			</div>
		</div>
	</div>

</body>
</html>
