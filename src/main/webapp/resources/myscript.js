/**
 * 
 */



function departmentSelect(departmentSelect, courseSelect, ctx){
	departmentSelect.on('change', function(){
		var searchurl = ctx +'/ajax/departmentSelectChanged/?param=' + departmentSelect.val();
		alert(searchurl);
		$.ajax({
			url: searchurl,
			type: "GET" ,
			success: function(result){
				courseSelect.html(result);
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
}


function courseSelect(search, courseSelect, studview, ctx){
	courseSelect.on('input', function(){
		var searchurl = ctx+ '/ajax/searchstudent/?param='+search.val()+'&courseID='+ courseSelect.val();
		alert(searchurl);
		$.ajax({
			
			url: searchurl,
			type: "GET" ,
			success: function(result){
				studview.html(result);
			},
			error:function(e) {  
			      alert('Error: ' + e);   
			}  
			
		});
	});
}

function searchStudents(search, searchBtn, courseSelect, studview, ctx){
	searchBtn.click(function(){
		var searchurl = encodeURI(ctx+'/ajax/searchstudent/?param='+search.val()+'&courseID='+ courseSelect.val());
		alert(searchurl);
		$.ajax({
			
			url: searchurl,
			type: "GET" ,
			success: function(result){
				studview.html(result);
			},
			error:function(e) {  
			      alert('Error: ' + e);   
			}  
			
		});
	});
	
	
}


