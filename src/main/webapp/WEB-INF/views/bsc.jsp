<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
    
<spring:url value="/resources/main2.css" var="css" />
<spring:url value="/resources/css/dataTable.min.css" var="dtcss" />
<spring:url value="/resources/css/dataTableSelect.min.css" var="dtselectcss" />
<spring:url value="/resources/css/buttons.dataTables.min.css" var="dtbuttonscss" />

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
		
			var table = $('#studview').DataTable( {
			 	"sDom" : 'rt<"courses">f',
		        "scrollY":        "350px",
		        "scrollCollapse": false,
		        "paging" : false,
		        "select": {
		        	style : 'multiple'
		        },
		        "columnDefs": [
		        	{"title" : "StudentNo", "visible" : false, "targets": 0 },
		        	{"title" : "ID"},
		        	{"title" : "Last Name"},
		        	{"title" : "First Name"},
		        	{"title" : "Middle Name"},
		        ]
		 	} );
			
			
			$('#studview tbody').on( 'dblclick', 'tr', function () {
				//alert();
			    //alert( table.row( this ).data()[0] );
			    var stdNo = table.row( this ).data()[0];
			    window.location.href = ctx+"/students/student/" + stdNo;
			} );
		});
	</script>
	
</head>
<body>


	<jsp:include page="includes/header.jsp" />
		<div id="main">
			<jsp:include page="includes/main-left.jsp" />
			<div>
				<div>
					<h1 style="display: inline-block; margin-top: 0px;">Students - Basic Education</h1>
					<div class="floatright">
						<a href="newspr" ><span class="linkButton" >Add New SPR</span></a>   
				    </div>
		  		</div>
		  		
		  		<div style="padding-bottom: 5px;">
					<a id="all" class="linkButton" href="${pageContext.request.contextPath}/students/"> ALL </a> 
			    	<a id="clg" class="linkButton" href="${pageContext.request.contextPath}/students/clg" > COLLEGE </a> 
			    	<a id="shs" class="linkButton" href="${pageContext.request.contextPath}/students/sh"> SENIOR H </a> 
			    	<a id="bsc" class="linkButton" href="${pageContext.request.contextPath}/students/bsc"> BASIC </a> 
			    	<span class="notifier" >Double click on a record to view more details.</span>
			    </div>
	
				
				<div style="width: 1000px; " >
					<jsp:include page="includes/studentview.jsp"/>
				</div>
				
				
				<div id="horizontalAlign">
			   		<div class="divElements" >
				   		<input type="text" id="search"/>
					    <input type="button" id="searchBtn" value="Search">
				   	</div>
				</div>
				<div >
				   		<select id="gradeLevelSelect" >
			   			<option value="" label="--Grade Level--"/>
			   				<c:forEach begin="1" end="10" varStatus="gradelvl">
								<c:set var = "lvl"> Grade-${gradelvl.index}</c:set>	
			   					<option value="${gradelvl.index}" label="${lvl}" />
							</c:forEach>
				   		</select>
				
				   		
				</div>
			</div>
		</div>
	<jsp:include page="includes/footer.jsp" />


</body>
</html>
