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
			$("#btnSearch").click(function(){
				alert("Pressed");
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/searchCurriculumSubjects/?param='+$("#search").val());
				$.ajax({
					url: searchurl,
					data: $("#subjectsForm").serialize(),
					type: "POST" ,
					success: function(result){
						alert(result);
						$('#subjects').html(result);
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
			
		
			
			$("#remove").click(function(){
				alert("Pressed");
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/removeCurriculumSubjects/');
					
				$.ajax({
					
					url: searchurl,
					data: $("#curricFormTable").serialize(),
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
			
			
			$("#btnSubmit").click(function(){
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/saveNew/?curricDesc='+$("#tb_Desc").val()+'&curricYear='+ $("#tb_Year").val());
					
				$.ajax({
					
					url: searchurl,
					data: $("#curricFormTable").serialize() + $("#curricTable").serialize(),
					type: "POST" ,
					success: function(result){
						alert("Success");
						 window.location.replace("/mis/");
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
			
			
			
			$("#btnCreate").click(function(){
				var searchurl = encodeURI('${pageContext.request.contextPath}/curriculums/saveNewTest/');
				
				var heads = ["checked","subjectCode","subjectDesc","lecUnits","labUnits","preRequisites", "year", "sem" ];
				var rowData = $("table[id*='semTable']").DataTable().rows().data().toArray();	
				var subjects = [];
				var curriculum = {};
				var stringsubjects = "[";
				curriculum["curriculumID"] = "";
				curriculum["courseID"] = $("#courseID").val();
				curriculum["curriculumDesc"] = $("#curriculumDesc").val();
				curriculum["yearImplemented"] = $("#yearImplemented").val();
				alert(JSON.stringify(curriculum));			
				
				
				
				alert("Getting all subjects");			
				$.each(rowData, function(i, row){
					
					var subject = {}
					subject[heads[1]] = row[1];
					subject[heads[2]] = row[2];
					subject[heads[3]] = row[3];
					subject[heads[4]] = row[4];
					subject[heads[5]] = "value";
					subject[heads[6]] = row[7];
					subject[heads[7]] = row[8];
					
					
					alert(JSON.stringify(subject));
					subjects.push(JSON.stringify(subject));
					stringsubjects += JSON.stringify(subject)
					if(i < rowData.length-1)
					{
						 stringsubjects +=  ",";	
					}
					
				});
				stringsubjects += "]";
				alert( JSON.stringify(subjects));
				
				alert("Subjects stringified");
				
				var postData = {
					curriculum: curriculum,
			        subjects: subjects
			        
			   };
				
				$.ajax({
					
					url: searchurl,
					type: "POST" ,
					dataType: "json",
					contentType :'application/json; charset=utf-8',
					data:   JSON.stringify(subjects).replace(/\\/g, '' ),
					success: function(result){
						alert("Success");
						 window.location.replace("/mis/");
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
				var rowCount = $("table[id*='semTable']").DataTable().rows().count();
				var count = 0;
				var ctx = "${pageContext.request.contextPath}";
				//alert(rowData);
			
				$.each(rowData, function(index, row){
					//alert(row[1]);
				var subject = row[1];
				var yr = row[7];
				var sem = row[8];
				
					var searchurl = ctx+'/ajax/saveSubjectToCurric/?subjectCode='+subject+'&yr='+yr+'&sem='+sem;
			
			        $.ajax({
						url: searchurl,
						type: "POST" ,
						success: function(result){
							//alert("Success");
							count += 1;
							if(count == rowCount){
								$("#curricTable").submit();
							}
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
			
			    $("#subb").click(function() {
			    	var searchurl = encodeURI('${pageContext.request.contextPath}/ajax/enlistSubjects/?year='+$("#Year").val()+'&sem='+ $("#Sem").val());
			        $.post(searhcurl, $("#subjectsForm").serialize() + $("#curricFormTable").serialize() ,
			          function(result) {
			        	$('#subjects').html(result);
			          });
			      });
			    
			    
			  
			    var table1 = $('#subjectsList').DataTable( {
				 	"sDom" : 'rtf',
			        "scrollY":        "250px",
			        "scrollCollapse": false,
			        "paginate": false,
			        "select": {
			        	style : 'multi'
			        },
			        "columnDefs": [
			        	{	
			        		"targets": [3,4],  
			        		"visible" : false
			        	},
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
	
	
</head>
<body>

	
	<jsp:include page="includes/header.jsp" />
	<div id="main">
		<div style="width: 100%;">
			<div>
					<h1 style="display: inline-block; margin-top: 0px;">New Curriculum</h1>
					<div class="floatright">
						<a href="${pageContext.request.contextPath}/" class="linkButton">Back</a>    
			    	</div>
		  	</div>

			<div style="width: 100%;">
				<div style="position: fixed; border-right: 1px solid grey;" >
					<h3 style="margin-top:30px;">Subjects List</h3>
					
					<div id="horizontalAlign" style="width: 600px;">
						
	
						<div>
							<select id="Year" >
								<option value="" label="--Year--"/>
							 	<option value="1" label="1st Year"/>
							 	<option value="2" label="2nd Year"/>
							 	<option value="3" label="3rd Year"/>
							 	<option value="4" label="4th Year"/>
							 	<option value="5" label="5th Year"/>
							 </select>
									
							 <select id="Sem">
							   	<option value="" label="--- Sem ---"/>
								<option value="1" label="1st"/>
								<option value="2" label="2nd Sem"/>
								<option value="3" label="Summer"/>
							 </select>
						</div>
								   
						<div>
							<input id="test" type="button" value="Add Checked"/>
							
						</div>		   
						
					
						
					</div>
					<div id="subjects" style="width:  550px; height: 300px;">
							<jsp:include page="includes/subjectschecklist.jsp" />
						</div>
				</div>
			
				<div style=" float: right; padding-right: 50px;" >
					<div id="form" style="height: 200px; ">
						<form:form id="curricTable" action="${pageContext.request.contextPath}/curriculums/saveNew/" method="post" modelAttribute="curriculum" >
							<%-- First field binding doesnt work on submit to controller. courseID binds successfully and curriculumDesc doesnt --%>
							<div style="display: flex; flex-direction: row;">
								<div><p style="display: inline; padding-right:20px;" >Description: </p></div>
								<div>
									<form:input path="curriculumDesc" value="${courseDesc}" />
									<form:input type="hidden" path="courseID" />
							
								</div>
							</div>
					
							<div style="display: flex; flex-direction: row; padding-top:15px;">
								<div><p style="display: inline; padding-right:15px;" >SY Implemented: </p></div>
								<div>
									<form:select  id="schoolYear" path="yearImplemented">
												<form:option value="2000-2001" label="2000-2001" />  
												<form:option value="2001-2002" label="2001-2002" />  
												<form:option value="2002-2003" label="2002-2003" /> 
												<form:option value="2003-2004" label="2003-2004" />  
												<form:option value="2004-2006" label="2004-2006" />  
												<form:option value="2005-2006" label="2005-2006" />  
												<form:option value="2006-2007" label="2006-2007" />  
												<form:option value="2007-2008" label="2007-2008" /> 
												<form:option value="2008-2009" label="2008-2009" />  
												<form:option value="2009-2010" label="2009-2010" />  
												<form:option value="2010-2011" label="2010-2011" />  
												<form:option value="2011-2012" label="2011-2012" />  
												<form:option value="2012-2013" label="2012-2013" />  
												<form:option value="2013-2014" label="2013-2014" />  
												<form:option value="2014-2015" label="2014-2015" />  
												<form:option value="2015-2016" label="2015-2016" />  
												<form:option value="2016-2017" label="2016-2017" />  
												<form:option value="2017-2018" label="2017-2018" />  
												<form:option value="2018-2019" label="2018-2019" />  
												<form:option value="2019-2020" label="2019-2020" />  
												<form:option value="2020-2021" label="2020-2021" />  
												<form:option value="2021-2022" label="2021-2022" />  
												<form:option value="2022-2023" label="2022-2023" />  
												<form:option value="2023-2024" label="2023-2024" />  
												<form:option value="2024-2025" label="2024-2025" />  
												<form:option value="2025-2026" label="2025-2026" />
												<form:option value="2026-2027" label="2026-2027" />
												<form:option value="2027-2028" label="2027-2028" />
												<form:option value="2028-2029" label="2028-2029" />
												<form:option value="2029-2030" label="2029-2030" />
											</form:select>
									<div  style="padding-top: 15px;"><input type="button" id="btnCreate1" value="Create New"/></div>
								</div>
							</div>
						</form:form>
					</div>
	
					<h3>Curriculum Subjects</h3>
					<div style="float:right;">
					<input id="testremove" type="button" value="Remove Checked"/>
					</div>
					<hr>
					<div id="curricSubjects" style="width:600px;">
				   		<jsp:include page="includes/curriculumForm.jsp" />
					</div>	
					
					
				</div>
			</div>
			
		   		
		   			
		</div>
	</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
