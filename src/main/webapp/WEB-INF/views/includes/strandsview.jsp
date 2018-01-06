<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
	<div class="tableContainer">
		<table class="listTable">  
			<tr><th>StrandCode</th><th>Track</th><th>Description</th><th>Major</th><th></th></tr>  
		   	<c:forEach var="strand" items="${strands}">   
			   	<tr>  
				   	<td>${strand.strandCode}</td>  
				   	<td>${strand.track}</td>  
				   	<td>${strand.strandDesc}</td>  
				   	<td>${strand.major}</td>  
				   	<td><a href=" ${pageContext.request.contextPath}/courses/strands/${strand.strandCode}">View</a></td>  
				</tr>  
		   	</c:forEach>  
	   </table>  
   </div>

   <br>
   