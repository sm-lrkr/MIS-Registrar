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
			$("#btnCreate1").click(function(){
				var rowData = $("table[id*='semTable']").DataTable().rows().data().toArray();	
				var ctx = "${pageContext.request.contextPath}";
				alert(rowData);
			
				$.each(rowData, function(index, row){
					alert(row[1]);
					var subject = row[1];
					var yr = row[5];
					var sem = row[6];
			
					var searchurl = ctx+'/ajax/saveSubjectToCurric/sh/?subjectCode='+subject+'&yr='+yr+'&sem='+sem;
			
			        $.ajax({
						url: searchurl,
						type: "POST" ,
						success: function(result){
							alert("Success");
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
				
				$("#curricTable").submit();
			});
			
			    $("#subb").click(function() {
			    	var searchurl = encodeURI('${pageContext.request.contextPath}/ajax/enlistSubjects/?year='+$("#Year").val()+'&sem='+ $("#Sem").val());
			        $.post(searhcurl, $("#subjectsForm").serialize() + $("#curricFormTable").serialize() ,
			          function(result) {
			        	$('#subjects').html(result);
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
					var tableName = year+"-"+sem;
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

	<div class="no-print">
	<jsp:include page="includes/header.jsp" />
	</div>
	<div id="main">
		<div style="width: 100%;">
		
			<div class="no-print">
					<h1 style="display: inline-block; margin-top: 0px;">New Curriculum - ${strandCode}</h1>
					<div class="floatright">
						<a href="${pageContext.request.contextPath}/courses/strands" class="linkButton">Back to Main</a>    
			    	</div>
		  	</div>
	
			<div style="width: 100%;">
				<div style="position: fixed;" >
					<h3>Subjects List</h3>
					<div id="subjects" style="width:  550px; height: 300px;">
						<form:form id="subjectsForm"  action="" method="post" modelAttribute="subjectsForm">
								<table   id="subjectsList" class="display compact" >  
										<thead>
												<tr><th></th><th>Code</th><th>Description</th><th>Type</th><th>Requisite</th></tr>  
										</thead>
										
										<tbody>
											<c:forEach var="subj" items="${subjectsForm.subjects}" varStatus="status">   
													     	<tr>
																<td></td>
															   	<td>${subj.subjectCode}</td>  
															   	<td>${subj.subjectDesc}</td>  
															   	<td>${subj.type}</td>
															   	<td>${subj.preRequisites}</td>  
												
															</tr>
														</c:forEach>
													</tbody>
										   		</table>  
						</form:form>

					</div>
				
					<div id="horizontalAlign" style="width: 600px;">
						<div>
							<input id="test" type="button" value="Add Checked"/>
							
						</div>
	
						<div>
							<select id="Year" >
								<option value="" label="--Year--"/>
							 	<option value="11" label="Grade 11"/>
							 	<option value="12" label="Grada 12"/>
							 
							 </select>
										
							 <select id="Sem">
							   	<option value="" label="--- Sem ---"/>
								<option value="1" label="1st"/>
								<option value="2" label="2nd Sem"/>
								<option value="3" label="Summer"/>
							 </select>
						</div>
								   
						
						<div>
							<input id="testremove" type="button" value="Remove"/>
						</div>
					</div>
				</div>
			
				<div style=" float: right; padding-right: 50px;" >
					<div id="form" style="height: 200px; ">
						<form:form id="curricTable" action="${pageContext.request.contextPath}/curriculums/sh/saveNew/" method="post" modelAttribute="curriculum" >
							<%-- First field binding doesnt work on submit to controller. courseID binds successfully and curriculumDesc doesnt --%>
							<div style="display: flex; flex-direction: row;">
								<div><p style="display: inline; padding-right:20px;" >Description: </p></div>
								<div>
									<form:input path="curriculumDesc" />
									<form:input type="hidden" path="strandCode" />
									
								</div>
							</div>
						
							<div style="display: flex; flex-direction: row; padding-top:15px;">
								<div><p style="display: inline; padding-right:15px;" >Year: </p></div>
								<div>
									<form:select  id="schoolYear" path="yearImplemented">
										<c:forEach begin="2000" end="2099" varStatus="schoolYear">
											<form:option value="${schoolYear.index}-${schoolYear.index + 1}" label="${schoolYear.index}-${schoolYear.index + 1}" />
										</c:forEach>
									</form:select>
									<div  style="padding-top: 15px;"><input type="button" id="btnCreate1" value="Create New"/></div>
								</div>
							</div>
						</form:form>
					</div>
		
					<h3>Curriculum Subjects</h3>
					<hr>
					<div id="curricSubjects" style="width:650px;">
				   		<c:forEach begin="11" end="12" varStatus="year">
						<div>
							<h3>Grade ${year.index}</h3>
							<c:forEach begin="1" end="3" varStatus="sem">
								<table id="semTable-${year.index}-${sem.index}" class="listTable display compact "  >  
									<thead>
										<tr><th colspan="5" >${sems[sem.index]}</th></tr>
										<tr><th></th><th>CODE</th><th>DESCRIPTIVE TITLE</th><th> TYPE</th><th>PRE-REQUISITE(s)</th></tr>  
					
									</thead>
									<tbody>
									
									</tbody>
								</table>
							</c:forEach>   
						</div>
					</c:forEach>    
					</div>	
					
					
				</div>
			</div>
			
		   		
		   			
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
