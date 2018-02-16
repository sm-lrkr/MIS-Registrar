<div id="main-left">
	
	
	<div id="main-left-nav-panel">
		
		<ul>
			<li><a href="${pageContext.request.contextPath}/students/student/${student.studentNo}">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/students/registration/${student.studentNo}">Registration</a></li>
			<li><a href="${pageContext.request.contextPath}/schedules/enlistment/${student.studentNo}">Enlistment</a></li>
			<li><a href="${pageContext.request.contextPath}/grades/?studentNo=${student.studentNo}">Grades</a></li>
			<li><a href="${pageContext.request.contextPath}/students/reports/${student.studentNo}">Reports</a></li>

		</ul>
	
	</div>
	
	<div style="display:block; margin-top:20px; margin-left: 40px;	 "><a href="${pageContext.request.contextPath}/" ><span class="linkButton" >Back to Main</span></a></div> 
	
	
	
</div>