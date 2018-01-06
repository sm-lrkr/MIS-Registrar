<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   

<h1>Employees List</h1>  
<table id="studview" >  
<tr><th>Id</th><th>Name</th><th>Edit</th><th>Delete</th></tr>  
   <c:forEach var="curric" items="${list}">   
   <tr>  
   <td>${curric.curriculumID}</td>  
   <td>${curric.curriculumDesc}</td>  
   <td><a href="sprForm/${stud.studentID}">Edit</a></td>  
   <td><a href="deleteSPR/${stud.studentID}">Delete</a></td>  
   </tr>  
   </c:forEach>  
   </table>  
   <br/>  
   <a href="sprForm">Add New Curriculum</a>  
   <a href="sprForm">Register Student</a>