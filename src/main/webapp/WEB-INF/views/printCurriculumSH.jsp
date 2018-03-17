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
<spring:url value="/resources/javascript/printThis.js" var="printThis" />

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
				//var table = $("table[id*='semsubjects']").DataTable( {
				// 	"sDom" : 'rt',
			     //   "select": {
			     //   	style : 'multi'
			     //   },
			        
			     //   'order': [[1, 'asc']]
			 //	} );
		
			//$("table thead th, table tbody td").wrapInner("<div></div>");

			$("td#units").each(function(){
				if(Number($(this).html()) == 0){
					$(this).html('');
				}
			});
		
			//window.print();
			$(".divcontent").printThis({
				  importCSS: true,
				  importStyle: true
			});
		});
	</script>
	
	
	<style type="text/css">
		@page {
		  margin-top: 0.2in;
		  margin-bottom: 0.5in;
		  margin-left: 1in;
		  margin-right: 1in;
		}
	</style>
</head>
<body>
	<div style="display: flex; flex-direction: right;">
		<div style="width: 8.5in; text-align:center" >
			<div style="display: inline-block;">
				<div style="text-align:center; " class="divcontent">
					<div class="content" style="border-bottom: 2px solid grey;">
						<img src="${pageContext.request.contextPath}/resources/images/bclogo.png" />
					</div>
					<h2 style="margin-bottom: 5px;">${curric.curriculumDesc}</h2>
					<h4 style="margin-top:5px;" >${curric.yearImplemented}</h4>
				</div>
		
				<div id="curricSubjects" style="width:650px;" class="divcontent">
				   		<c:forEach begin="11" end="12" varStatus="year">
						<div>
							<h3>${years[year.index-10]}</h3>
							<c:forEach begin="1" end="3" varStatus="sem">
								<table id="semsubjects" class="compact listTable printTable">  
									<tr><th colspan="5" >${sems[sem.index]}</th></tr>
									<tr><th>CODE</th><th>DESCRIPTIVE TITLE</th><th>UNITS</th><th>PRE-REQUISITE(s)</th><th>TYPE</th></tr>  
									<c:forEach var="subj" items="${strandSubjects.subjects}" varStatus="status">
										 	<c:if test="${subj.year == year.index && subj.sem == sem.index}">
							   					<tr>
													<td>${subj.subject.subjectCode}</td>
													<td>${subj.subject.subjectDesc}</td>
													<td>${subj.subject.lecUnits}</td>
													<td>${subj.subject.preRequisites}</td>
													<td>${subj.subject.type}</td>
													
												</tr>
							   				</c:if>
									</c:forEach>   
								</table>
							</c:forEach>   
						</div>
					</c:forEach>
					</div>	
			
					<c:forEach begin="11" end="12" varStatus="year">
						<div style=" text-align: center;" class="divcontent" >
						<c:set var = "yr"> ${year.index}-1</c:set>
						<c:if test="${not empty subjects[yr] }">
							<c:forEach begin="1" end="3" varStatus="sem">
								<c:set var = "sm"> ${year.index}-${sem.index}</c:set>	
								<c:if test="${not empty subjects[sm] }">
							
									<div style="width: 7.5in; display:inline-block; " >
										<c:if test="${sem.index == 1}">
											<div style="float:left;"><h4 style="margin-bottom: 5px;">${years[year.index]}</h4></div>
										</c:if>
					
										<table id="semsubjects" class="listTable printTable" style="font-size: 12px;width: 100%; border: 1px solid grey; text-align: left; " >  
											<c:set var = "totalLec"> 0</c:set>
											<c:set var = "totalLab"> 0</c:set>
											<c:set var = "totalUnits"> 0</c:set>
											
											<thead>
												<tr><th colspan="6" >${sems[sem.index]}</th></tr>
												<tr><th rowspan="2">CODE</th><th rowspan="2">DESCRIPTIVE TITLE</th><th colspan="3"> UNITS</th><th rowspan="2">PRE-REQUISITE(s)</th></tr>  
												<tr><th>LEC</th><th>LAB</th><th>TOTAL</th></tr>
											</thead>
											<tfoot>
											</tfoot>
									
											<tbody>
												
												<c:forEach var="subj" items="${subjects[sm]}" varStatus="status">
													<tr >
														<td style="width: 80px;">${subj.subjectCode}</td>
														<td style="width: 350px;">${subj.subjectDesc}</td>
														<td id="units" >${subj.lecUnits}</td>
														<td id="units">${subj.labUnits}</td>
														<td id="units">${subj.lecUnits + subj.labUnits}</td>
														<td>${subj.preRequisites}</td>		
													   
														<c:set var = "totalLec"> ${totalLec + subj.lecUnits}</c:set>
														<c:set var = "totalLab"> ${totalLab + subj.labUnits}</c:set>
														<c:set var = "totalUnits">${totalLec + totalLab}</c:set>
													</tr>
												</c:forEach>   
												<tr>
													<td>Total</td>
													<td></td>
													<td id="units">${totalLec}</td>
													<td id="units">${totalLab}</td>
													<td id="units">${totalUnits}</td>
													<td></td>
												</tr>
											</tbody>									
										</table>
									</div>
									
									<br><br >
								</c:if>
							</c:forEach>   
						</c:if>
						</div>
					</c:forEach>   
			</div>
		</div>
		
		
		<div class="no-print" style="display: inline-block;	margin-top:100px;">
			<div id="buttons">
			</div>
		</div>
		
	</div>

</body>
</html>
