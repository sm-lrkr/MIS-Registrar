$().ready(function(){
	var validator = $("#saveNew, #saveEdited").validate({
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
		    "profile.studentID" :  {
				required: true,
		    	minlength: 10
		    }, 
			"profilesh.LRN" :  {
				required: true,
		    	minlength: 11
		    }, 
		    "profilebsc.LRN" :  {
				required: true,
		    	minlength: 11
		    },
		    "profile.courseID": "required",
		    "profilesh.strandCode": "required",
		    "profile.curriculumID": "required",
		    "profilesh.curriculumID": "required",
		    "profilebsc.curriculumID": "required",
		  
		  },
		  messages: {
			  "profile.studentID":{
			    	required: " Required",
			    	minlength: "at least 10 characters"
			    },
			   "personal.lastName":{
			    	required: " Required"
			    },
			    "personal.citizenship":{
			    	required: " Required"
			    },
			    "personal.firstName":{
			    	required: " Required"
			    },
			    "personal.middleName":{
			    	required: " Required"
			    },
			    "personal.birthDate":{
			    	required: " Required"
			    },
			    "personal.birthPlace":{
			    	required: " Required"
			    },
			    "personal.cityAddress":{
			    	required: " Required"
			    },
			    "personal.provincialAddress":{
			    	required: " Required"
			    },
			    "personal.region":{
			    	required: " Required"
			    },
			    "personal.country":{
			    	required: " Required"
			    },
			    "profile.courseID":{
			    	required: " Required"
			    },
			    "profilesh.strandCode":{
			    	required: " Required"
			    },
			    "profile.curriculumID":{
			    	required: " Required"
			    },
			    "profilesh.curriculumID":{
			    	required: " Required"
			    },
			    "profilebsc.curriculumID":{
			    	required: " Required"
			    },
		  }
	});
});

