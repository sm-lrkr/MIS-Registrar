<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/jquery-3.2.1.js" var="jscript" />
<spring:url value="/resources/myscript.js" var="myscript" />
<spring:url value="/resources/css/dataTable.min.css" var="dtcss" />
<spring:url value="/resources/css/dataTableSelect.min.css" var="dtselectcss" />
<spring:url value="/resources/css/dataTables.checkboxes.min.css" var="dtcbcss" />
<spring:url value="/resources/javascript/dataTable.js" var="dtjs" />
<spring:url value="/resources/javascript/dataTableSelect.min.js" var="dtselectjs" />
<spring:url value="/resources/javascript/dataTables.checkboxes.min.js" var="dtcbjs" />
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>MIS Registrar</title>
	
	<link href="${dtcss}" rel="stylesheet">
	<link href="${dtselectcss}" rel="stylesheet">
	<link href="${dtcbcss}" rel="stylesheet">
	<link href="${css}" rel="stylesheet">
	
	
	<script type="text/javascript" src="${jscript}" ></script>
	<script type="text/javascript" src="${myscript}" ></script>
	<script type="text/javascript" src="${dtjs}" ></script>
	<script type="text/javascript" src="${dtselectjs}" ></script>
	<script type="text/javascript" src="${dtcbjs}" ></script>
	
	
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#enlist").click(function(){
				alert("Pressed");
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/addCurriculumSubjects/?year='+$("#Year").val()+'&sem='+ $("#Sem").val());
					
				$.ajax({
					
					url: searchurl,
					data: $("#subjectsForm").serialize() + $("#curricFormTable").serialize() + $("#curricTable").serialize(),
					type: "POST" ,
					success: function(result){
						alert(result);
						$('#curricSubjects').html(result);
					},
					error: function (jqXHR, exception) {
					        var msg = '';
					        if (jqXHR.status === 0) {
					            msg = 'Not connect.\n Verify Network.';
					        } else if (jqXHR.status == 404) {
					            msg = 'Requested page not found. [404]';
					        } else if (jqXHR.status == 500) {
					            msg = 'Internal Server Error [500].';
					        } else if (exception === 'parsererror') {
					            msg = 'Requested JSON parse failed.';
					        } else if (exception === 'timeout') {
					            msg = 'Time out error.';
					        } else if (exception === 'abort') {
					            msg = 'Ajax request aborted.';
					        } else {
					            msg = 'Uncaught Error.\n' + jqXHR.responseText;
					        }
					       	alert(msg);
					    }
				});
			});
		
			$("#btnCreate1").click(function(){
				var rowData = $("table[id*='semTable']").DataTable().rows().data().toArray();	
				var ctx = "${pageContext.request.contextPath}";
				alert(rowData);
			
				$.each(rowData, function(index, row){
					alert(row[1]);
					var subject = row[1];
					var yr = row[3];
			
					var searchurl = ctx+'/ajax/saveSubjectToCurric/bsc/?subjectCode='+subject+'&yr='+yr;
		
			        $.ajax({
						url: searchurl,
						type: "POST" ,
						success: function(result){
							alert("Success");
							$("#curricTable").submit();
						},
						error: function (jqXHR, exception) {
						        var msg = '';
						        if (jqXHR.status === 0) {
						            msg = 'Not connect.\n Verify Network.';
						        } else if (jqXHR.status == 404) {
						            msg = 'Requested page not found. [404]';
						        } else if (jqXHR.status == 500) {
						            msg = 'Internal Server Error [500].';
						        } else if (exception === 'parsererror') {
						            msg = 'Requested JSON parse failed.';
						        } else if (exception === 'timeout') {
						            msg = 'Time out error.';
						        } else if (exception === 'abort') {
						            msg = 'Ajax request aborted.';
						        } else {
						            msg = 'Uncaught Error.\n' + jqXHR.responseText;
						        }
						       	alert(msg);
						    }
					});
				
					
				});
				
				
			});
			
			    var table1 = $('#subjectsList').DataTable( {
				 	"sDom" : 'frt',
			        "scrollY":        "250px",
			        "scrollCollapse": false,
			        "select": {
			        	style : 'multi'
			        },
			        "columnDefs": [
			        	{	"targets": 0,  
			        		"checkboxes": {
			        			"selectRow": true	
			        		}	
			        	},
			        	
			        	{	
			        		"targets": [0,2],  
			        		"orderable" : false
			        	}
			        ],
			        'order': [[1, 'asc']]
			 	} );
			  
			    var table2 = $("table[id*='semTable']").DataTable( {
				 	"sDom" : 'rt',
			        "select": {
			        	style : 'multi'
			        },
			        "columnDefs": [
			        	{	"targets": 0,  
			        		"checkboxes": {
			        			"selectRow": true	
			        		}	
			        	},
			        	
			        	{	
			        		"targets": [0,2],  
			        		"orderable" : false
			        	}
			        ],
			        'order': [[1, 'asc']]
			 	} );
			   
				$("#test").click(function(){
					alert("Pressed");
					var rowData = table1.rows( ".selected").data().toArray();	
					var count = table1.rows( { selected: true } ).count();
					
	
					var year = $("#Year").val();
					var sem = $("#Sem").val();
					var tableName = year;
					var semTable = $("#semTable-"+tableName).DataTable();
					table1.rows(".selected").remove().draw();
					
					$.each(rowData, function(index, row){
						row.push(year);
						row.push(sem);
						semTable.row.add(row);
						
					});
					semTable.draw();
				
					alert("success");
				});
				

				$("#testremove").click(function(){
					alert("Pressed");
					var rowData = $("table[id*='semTable']").DataTable().rows( ".selected").data().toArray();	
					$("table[id*='semTable']").DataTable().rows(".selected").remove().draw();
					alert(rowData);
					$.each(rowData, function(index, row){
						table1.row.add(row);
					});
					
					table1.draw();
				
					alert("success");
				});
		});
		
	</script>
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
		<div style="width: 100%;">
		
			<div>
					<h1 style="display: inline-block; margin-top: 0px;">New Curriculum - Basic Ed</h1>
					<div class="floatright">
						<a href="${pageContext.request.contextPath}/" class="linkButton">Back to Main</a>    
			    	</div>
		  	</div>
		
			<div style="width: 100%;">
				<div style="position: fixed;" >
					<h3>Subjects List</h3>
					<div id="subjects" style="width:  550px; height: 300px;">
						<form:form id="subjectsForm"  action="" method="post" modelAttribute="subjectsForm">
								<table   id="subjectsList" class="display compact" >  
										<thead>
												<tr><th></th><th>Code</th><th>Description</th></tr>  
										</thead>
									
										<tbody>
											<c:forEach var="subj" items="${subjectsForm.subjects}" varStatus="status">   
												<tr>
													<td></td>
													<td>${subj.subjectCode}</td>  
													<td>${subj.subjectDesc}</td>  
												</tr>
											</c:forEach>
										</tbody>
								</table>  
						</form:form>

					</div>
				
					<div id="horizontalAlign" style="width: 600px;">
				
						<div>
							<select id="Year" >
								<option value="" label="--Year--"/>
							 	<option value="7" label="Grade 7"/>
							 	<option value="8" label="Grada 8"/>
							 	<option value="9" label="Grade 9"/>
							 	<option value="10" label="Grada 10"/>
							 </select>
					
							 <select id="Sem">
							 	<option value="" label="--Year--"/>
							   	<option value="kg" label="Kindergarten"/>
								<option value="elem" label="Elementary"/>
								<option value="jh" label="Junior High"/>
							 </select>
						</div>
						
						<div>
							<input id="test" type="button" value="Add Checked"/>
						</div>
	
						<div>
							<input id="testremove" type="button" value="Remove"/>
						</div>
					</div>
				</div>
			
				<div style=" float: right; padding-right: 50px;" >
					
				
					<div id="form" style="height: 200px; ">
						<form:form id="curricTable" action="${pageContext.request.contextPath}/curriculums/bsc/saveNew/" method="post" modelAttribute="curriculum" >
							<%-- First field binding doesnt work on submit to controller. courseID binds successfully and curriculumDesc doesnt --%>
							<div style="display: flex; flex-direction: row;">
								<div><p style="display: inline; padding-right:20px;" >Description: </p></div>
								<div>
									<form:input path="curriculumDesc" />
								</div>
							</div>
						
							<div style="display: flex; flex-direction: row; padding-top:15px;">
								<div><p style="display: inline; padding-right:15px;" >Year: </p></div>
								<div>
									<form:input  type="text" path="yearImplemented"  />
									<div  style="padding-top: 15px;"><input type="button" id="btnSubmit" value="Create"/></div>
									<div  style="padding-top: 15px;"><input type="button" id="btnCreate1" value="Create New"/></div>
								</div>
							</div>
						</form:form>
					</div>
		
					<h3>Curriculum Subjects</h3>
					<hr>
					<div id="curricSubjects" style="width:650px;">
				
						<div id="kg">
							<div>
								<h3>Kindergarten</h3>
									<table id="semTable-kg" class="listTable display compact "  >  
										<thead>
											<tr><th colspan="3" >Kindergarten</th></tr>
											<tr><th></th><th>CODE</th><th>DESCRIPTIVE TITLE</th></tr>  
										</thead>
										<tbody>
										
										</tbody>
									</table>
							</div>
						</div>
					
						<div id="elem">
							<h3>Elementary</h3>
					   		<c:forEach begin="1" end="6" varStatus="year">
								<div>
									<table id="semTable-${year.index}" class="listTable display compact "  >  
										<thead>
											<tr><th colspan="3" >Grade ${year.index}</th></tr>
											<tr><th></th><th>CODE</th><th>DESCRIPTIVE TITLE</th></tr>  
							
										</thead>
										<tbody>
											
										</tbody>
									</table>
								</div>
							</c:forEach>    
						</div>
						
						<div id="jh">
							<h3>Junior High School</h3>
							<c:forEach begin="7" end="10" varStatus="year">
								<div>
									
									<table id="semTable-${year.index}" class="listTable display compact "  >  
										<thead>
											<tr><th colspan="3" >Grade ${year.index}</th></tr>
											<tr><th></th><th>CODE</th><th>DESCRIPTIVE TITLE</th></tr>  
							
										</thead>
										<tbody>
											
										</tbody>
									</table>
								</div>
							</c:forEach>    
						</div>
					</div>	
					
					
				</div>
			</div>
			
		   		
		   			
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
