$().ready(function(){
	$("#newSPR").validate({
		rules: {
		    // simple rule, converted to {required:true}
			"personal.lastName": "required",
		    "personal.firstName": "required",
		    "personal.gender": "required",
		    "personal.birthDate": "required",
		    "personal.birthPlace": "required",
		    "personal.cityAddress": "required",
		    "personal.region": "required",
		    "personal.country": "required",
		    "personal.citizenship": "required",
		    "personal.cityAddress": "required",
		    "personal.provincialAddress": "required",
		    "profile.StudentID" :  {
				required: true,
		    	minlength: 10,
		    },    	
			"profilesh.LRN" :  {
				required: true,
		    	minlength: 11,
		    }, 
		    "profilebsc.LRN" :  {
				required: true,
		    	minlength: 11,
		    },
		    "profile.courseID": "required",
		    "profilesh.strandCode": "required",
		    "profile.curriculumID": "required",
		    "profilesh.curriculumID": "required",
		    "profilesh.courseID": "required",
		  },
		  messages: {
			    "personal.lastName":{
			    	required: " Required",
			    },
		  		"peronal.firstName":{
		  			required: "Required",
		    	},"peronal.gender":{
		  			required: "Required",
		    	},"peronal.birthDate":{
		  			required: "Required",
		    	},"peronal.birthPlace":{
		  			required: "Required",
		    	},"peronal.cityAddress":{
		  			required: "Required",
		    	},"peronal.region":{
		  			required: "Required",
		    	},"peronal.country":{
		  			required: "Required",
		    	},"peronal.citizenship":{
		  			required: "Required"
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
			    	required: "!",
			    },
		  		"student.firstName":{
		  			required: "!"
		    	},
			    "profile.studentID": {
			    	required: "!",
			    	minlength: "at least 10 characters"
			    },
			    "profile.courseID": {
			    	required: "!"
			    },
			    "profile.curriculumID": {
			    	required: "Please select curriculum."
			    }
		  },
		
	});
});


	