$().ready(function(){
	$("#profileForm").validate({
		
		rules: {
		    // simple rule, converted to {required:true}
		    studentID: {
		    	required: true,
		    	minlength: 10
		 
		    },
		    courseID: "required",
		    curriculumID: "required"
		  },
		  messages: {
			    studentID:{
			    	required: "Please enter Student ID field.",
			    	minlength: "ID should be at least 10 characters."		
			    },
		  		courseID:{
		  			required: "Select course."
		    	},
		  		curriculumID:{
		  			required: "Select curriculum."
		    	}  
		  },
		  errorPlacement: function(error, element) {
			    error.appendTo( element.parent("td").next("td") );
		  },

	});
	
});


	