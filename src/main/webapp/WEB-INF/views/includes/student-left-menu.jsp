<div id="main-left">
	
	
	<div id="main-left-nav-panel">
		<ul>
			<li><a href="${pageContext.request.contextPath}/students/student/${student.studentNo}">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/schedules/enlistment/?studentNo=${student.studentNo}">Enlistment</a></li>
			<li><a href="${pageContext.request.contextPath}/grades/?studentNo=${student.studentNo}">Grades</a></li>
		</ul>
	</div>
	<div style="display:block; margin-top:-300px; margin-left: 40px;	 "><a href="${pageContext.request.contextPath}/" ><span class="linkButton" >Back to Main</span></a></div> 	
</div>