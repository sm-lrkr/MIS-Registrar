$().ready(function(){
	$("#newSPR").validate({
		rules: {
		    // simple rule, converted to {required:true}
			"student.lastName": "required",
		    "student.firstName": "required"
		    
		  },
		  messages: {
			    "student.lastName":{
			    	required: "Please enter last name.",
			    },
		  		"student.firstName":{
		  			required: "Please enter first name."
		    	}
		  },
		
	});
	
	$("#editSPR").validate({
		rules: {
		    // simple rule, converted to {required:true}
			"student.lastName": "required",
		    "student.firstName": "required",
		    "profile.studentID": {
		    	required: true,
		    	minlength: 10
		    },
		    "profile.courseID": "required",
		    "profile.curriculumID": "required"
		  },
		  messages: {
			    "student.lastName":{
			    	required: "Please enter last name.",
			    },
		  		"student.firstName":{
		  			required: "Please enter first name."
		    	},
			    "profile.studentID": {
			    	required: "Please enter ID",
			    	minlength: "ID should be at least 10 characters"
			    },
			    "profile.courseID": {
			    	required: "Please select course."
			    },
			    "profile.curriculumID": {
			    	required: "Please select curriculum."
			    }
		  },
		
	});
});


	