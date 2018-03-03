<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


				<div>
				</div>
				
				<c:forEach begin="1" end="5" varStatus="year">
						<div>
							<h3>${years[year.index]}</h3>
							<c:forEach begin="1" end="3" varStatus="sem">
								<table id="semTable-${year.index}-${sem.index}" class="listTable display compact "  >  
									<thead>
										<tr><th colspan="7" >${sems[sem.index]}</th></tr>
										<tr><th rowspan="2"></th><th rowspan="2">CODE</th><th rowspan="2">DESCRIPTIVE TITLE</th><th colspan="3"> UNITS</th><th rowspan="2">PRE-REQUISITE(s)</th></tr>  
										<tr><th>LEC</th><th>LAB</th><th>TOTAL</th></tr>
									</thead>
									<tbody>
									
									</tbody>
								</table>
							</c:forEach>   
						</div>
					</c:forEach>    