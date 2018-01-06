package com.benedicto.mis;


import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.benedicto.mis.beans.*;
import com.benedicto.mis.beans.containers.*;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("students")
public class StudentController {

	private static final Logger logger = LoggerFactory.getLogger(StudentController.class);

	@Autowired
	studentdb db;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView allStudents() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		List<Student> list = db.getAllStudents("","");
		List<Department> departments = db.getDepartments("");
		List<Course> courses = db.getCollegeCourses("");
		

		ModelAndView model = new ModelAndView();
		model.setViewName("students");
		model.addObject("students", list);
		model.addObject("departments", departments);
		model.addObject("courses", courses);
		

		return model;
	}
	
	@RequestMapping(value = "/clg", method = RequestMethod.GET)
	public ModelAndView clgStudents() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		List<Student> list = db.getCollegeStudents("","");
		List<Department> departments = db.getDepartments("");
		List<Course> courses = db.getCollegeCourses("");
		

		ModelAndView model = new ModelAndView();
		model.setViewName("clgstudents");
		model.addObject("students", list);
		model.addObject("departments", departments);
		model.addObject("courses", courses);
		
		return model;
	}
	
	

	
	@RequestMapping(value = "/sh", method = RequestMethod.GET)
	public ModelAndView shStudents() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		List<Student> list = db.getSHStudents("","");
		List<Department> departments = db.getDepartments("");
		List<Course> courses = db.getCollegeCourses("");
		

		ModelAndView model = new ModelAndView();
		model.setViewName("sh");
		model.addObject("students", list);
		model.addObject("departments", departments);
		model.addObject("strands", courses);
		

		return model;
	}
	
	@RequestMapping(value = "/bsc", method = RequestMethod.GET)
	public ModelAndView bscStudents() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<Student> list = db.getBSCStudents("");
		
		List<Department> departments = db.getDepartments("");
		String [] gradeLevels = {"", "Grade 1","Grade 2", "Grade 3", "Grade 4", "Grade 5", "Grade 6", "Grade 7", "Grade 8", "Grade 9", "Grade 10"};
		
		

		ModelAndView model = new ModelAndView();
		model.setViewName("bsc");
		model.addObject("students", list);
		model.addObject("departments", departments);
		model.addObject("gradeLevels", gradeLevels);
		

		return model;
	}


	@RequestMapping(value = "/spr/saveEdited", method = RequestMethod.POST)
	@ResponseBody
	public String save(@ModelAttribute("student") Student s, @ModelAttribute("studentCAB") StudentProfile sc,
			BindingResult result) {
		logger.info("The student ID is: {}.", s.getStudentID());
		db.updateSPR(s);
	
		return "success";
	}

	@RequestMapping(value = "/spr/saveNew", method = RequestMethod.POST)
	@ResponseBody
	public String saveNew(@ModelAttribute("student") Student s, @ModelAttribute("studentFBG") StudentFBG fbg,
			BindingResult result) {
		logger.info("The student Name is: {}.", s.getFirstName());
		
		String studentNo = String.valueOf(db.createSPR(s));
		fbg.setStudentNo(studentNo);
		db.createFBG(fbg);
		return studentNo;
	}


	@RequestMapping(value = "/newspr")
	public ModelAndView sprFormNew() {
		logger.info("sprForm");
		List<Course> courses = db.getCollegeCourses("");
		List<Curriculum> currics = db.getCollegeCurriculums("");

		ModelAndView model = new ModelAndView();
		model.setViewName("newspr");
		model.addObject("student", new Student());
		model.addObject("studentFBG", new StudentFBG());
		model.addObject("courses", courses);
		model.addObject("curriculums", currics);
		model.addObject("saveType", "saveNew");
		return model;
	}
	
	@RequestMapping(value = "/student/{studentNo}")
	public ModelAndView student(@PathVariable("studentNo") String studentNo) {
		Student stud = db.getStudentByNo(studentNo);
		StudentProfile profile = db.getCollegeProfileByNo(studentNo);
		String profileType = "college";
		
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		if(profile.getStudentID().equals("")) {
			profile = db.getSHProfileByNo(studentNo);
			profileType = "shs";
			if(profile.getLRN().equals("")) {
				profile = db.getBSCProfileByNo(studentNo);
				profileType = "basic";
			}
		}
		
		
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentHome");
		model.addObject("student", stud);
		model.addObject("profile", profile);
		model.addObject("profileType", profileType);
		model.addObject("sems", sems);
		
		
		
		
		
		return model;
	}

	
	@RequestMapping(value = "/registration/{studentNo}")
	public ModelAndView registration(@PathVariable("studentNo") String studentNo) {
		Student stud = db.getStudentByNo(studentNo);
		
		StudentProfile clgProfile = db.getCollegeProfileByNo(studentNo);
		StudentProfile shsProfile = db.getSHProfileByNo(studentNo);
		StudentProfile bscProfile = db.getBSCProfileByNo(studentNo);

		System.out.println("Student No.: "+ stud.getStudentNo());
		System.out.println("Student ID : "+ clgProfile.getStudentID());
		System.out.println("shsProfile No.: "+ shsProfile.getStudentNo());
		System.out.println("bscProfile No.: "+ bscProfile.getStudentNo());
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("registration");
		model.addObject("student", stud);
		model.addObject("clgProfile", clgProfile);
		model.addObject("shsProfile", shsProfile);
		model.addObject("bscProfile", bscProfile);
		
		return model;
	}
	
	
	@RequestMapping(value = "/spr/info/{studentNo}")
	public ModelAndView sprInfo(@PathVariable("studentNo") String studentNo) {
		Student stud = new Student();
		StudentFBG fbg = new StudentFBG();
		String profileForm="";
		List<Course> courses = db.getCollegeCourses("");
		List<Curriculum> clgcurrics = db.getCollegeCurriculums("");
		
		List<Strand> strands = db.getSHStrands("");
		List<Curriculum> shscurrics = db.getSHCurriculums("");
		List<Curriculum> currics;
		
		
		
		StudentProfile profile = db.getCollegeProfileByNo(studentNo);
		currics = clgcurrics;
		profileForm="collegeProfile";
		
		
		if(profile.getStudentID().equals("")) {
			profile = db.getSHProfileByNo(studentNo);
			profileForm="shProfile";
			currics = shscurrics;
			if(profile.getLRN().equals("")) {
				profile = db.getBSCProfileByNo(studentNo);
				profileForm="basicProfile";
				
			}
		}
			
		
		
		if (!studentNo.equals("")) {
			stud = db.getStudentByNo(studentNo);
			fbg = db.getStudentFBGByNo(studentNo);
		}	

		System.out.println("Student No.: "+ stud.getStudentNo());
		System.out.println("Student ID : "+ stud.getStudentID());
		
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("student");
		model.addObject("student", stud);
		model.addObject("profile", profile);
		model.addObject("profileForm", profileForm);
		model.addObject("courses", courses);
		model.addObject("strands", strands);
		model.addObject("currics", currics);
		model.addObject("studentFBG", fbg);
		model.addObject("saveType", "saveEdited");
		return model;
	}
	
	@RequestMapping(value = "/spr/newProfile/clg/{studentNo}")
	public ModelAndView newCollegeProfile(@PathVariable("studentNo") String studentNo) {
		Student stud = db.getStudentByNo(studentNo);
		
		List<Course> courses = db.getCollegeCourses("");
		List<Curriculum> clgcurrics = db.getCollegeCurriculums("");

		System.out.println("Student No.: "+ stud.getStudentNo());
		System.out.println("Student ID : "+ stud.getStudentID());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentAB");
		model.addObject("student", stud);
		model.addObject("form", "collegeProfile");
		model.addObject("profile", new StudentProfile());
		model.addObject("courses", courses);
		model.addObject("clgcurrics", clgcurrics);
		
		model.addObject("saveType", "saveNew");
		return model;
	}
	
	@RequestMapping(value = "/spr/newProfile/clg/save/{studentNo}")
	public ModelAndView saveNewCLGProfile(@PathVariable("studentNo") String studentNo, @ModelAttribute("profile") StudentProfile sp) {
		db.createCollegProfile(sp);
		return new ModelAndView("redirect:/students/registration/"+ sp.getStudentNo());
	}
	
	@RequestMapping(value = "/spr/newProfile/shs/save/{studentNo}")
	public ModelAndView saveNewSHSProfile(@PathVariable("studentNo") String studentNo, @ModelAttribute("profile") StudentProfile sp) {
		db.createSHProfile(sp);
		return new ModelAndView("redirect:/students/registration/"+ sp.getStudentNo());
	}
	

	@RequestMapping(value = "/spr/newProfile/shs/{studentNo}")
	public ModelAndView newSHSProfile(@PathVariable("studentNo") String studentNo) {
		Student stud = db.getStudentByNo(studentNo);
		
		List<Strand> strands = db.getSHStrands("");
		List<Curriculum> shscurrics = db.getSHCurriculums("");

		System.out.println("Student No.: "+ stud.getStudentNo());
		System.out.println("Student ID : "+ stud.getStudentID());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentAB");
		model.addObject("student", stud);
		model.addObject("form", "shProfile");
		model.addObject("profile", new StudentProfile());
		model.addObject("strands", strands);
		model.addObject("shscurrics", shscurrics);
		
		model.addObject("saveType", "saveNew");
		return model;
	}
	
	
	
	
	
	@RequestMapping(value = "/spr/profile/clg/{studentNo}")
	public ModelAndView collegeProfile(@PathVariable("studentNo") String studentNo) {
		Student stud = db.getStudentByNo(studentNo);
		StudentProfile clgProfile = db.getCollegeProfileByNo(studentNo);
		
		List<Course> courses = db.getCollegeCourses("");
		List<Curriculum> clgcurrics = db.getCollegeCurriculums(clgProfile.getCourseID());

		System.out.println("StudentCAB curriculumID is: " + clgProfile.getCurriculumID());
		System.out.println("Student No.: "+ stud.getStudentNo());
		System.out.println("Student ID : "+ stud.getStudentID());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentAB");
		model.addObject("form", "collegeProfile");
		model.addObject("student", stud);
		model.addObject("profile", clgProfile);
		model.addObject("courses", courses);
		model.addObject("clgcurrics", clgcurrics);
		
		model.addObject("saveType", "saveEdited");
		return model;
	}
	
	@RequestMapping(value = "/spr/profile/shs/{studentNo}")
	public ModelAndView shsProfile(@PathVariable("studentNo") String studentNo) {
		Student stud = db.getStudentByNo(studentNo);
		StudentProfile shsProfile = db.getSHProfileByNo(studentNo);
		
		List<Strand> strands = db.getSHStrands("");
		List<Curriculum> shscurrics = db.getSHCurriculums(shsProfile.getStrandCode());

		System.out.println("StudentCAB curriculumID is: " + shsProfile.getCurriculumID());
		System.out.println("Student No.: "+ stud.getStudentNo());
		System.out.println("Student ID : "+ stud.getStudentID());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentAB");
		model.addObject("form", "shProfile");
		model.addObject("student", stud);
		model.addObject("profile", shsProfile);
		model.addObject("strands", strands);
		model.addObject("shscurrics", shscurrics);
		
		model.addObject("saveType", "saveEdited");
		return model;
	}
	
	@RequestMapping(value = "/spr/profile/bsc/{studentNo}")
	public ModelAndView bscProfile(@PathVariable("studentNo") String studentNo) {
		Student stud = db.getStudentByNo(studentNo);
		StudentProfile bscProfile = db.getBSCProfileByNo(studentNo);
		
		List<Curriculum> bsccurrics = db.getSHCurriculums("");

		ModelAndView model = new ModelAndView();
		model.setViewName("studentAB");
		model.addObject("form", "basicProfile");
		model.addObject("student", stud);
		model.addObject("profile", bscProfile);
		model.addObject("bsccurrics", bsccurrics);
		
		model.addObject("saveType", "saveEdited");
		return model;
	}
	
	@RequestMapping(value = "/spr/profile/{studentNo}")
	public ModelAndView sprForm(@PathVariable("studentNo") String studentNo) {
		Student stud = new Student();
		StudentProfile clgProfile = new StudentProfile();
		StudentProfile shsProfile = new StudentProfile();
		StudentProfile bscProfile = new StudentProfile();
		
		List<Course> courses = db.getCollegeCourses("");
		List<Strand> strands = db.getSHStrands("");
		
		List<Curriculum> clgcurrics = db.getCollegeCurriculums("");
		List<Curriculum> shscurrics = db.getSHCurriculums("");
		List<Curriculum> bsccurrics = db.getBSCCurriculums("");
		
		
		if (!studentNo.equals("")) {
			stud = db.getStudentByNo(studentNo);
			clgProfile = db.getCollegeProfileByNo(studentNo);
			shsProfile = db.getSHProfileByNo(studentNo);
			bscProfile = db.getBSCProfileByNo(studentNo);
			clgcurrics = db.getCollegeCurriculums(clgProfile.getCourseID());
		}
		
		

		System.out.println("StudentCAB curriculumID is: " + clgProfile.getCurriculumID());
		System.out.println("Student No.: "+ stud.getStudentNo());
		System.out.println("Student ID : "+ stud.getStudentID());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentAB");
		model.addObject("student", stud);
		model.addObject("clgProfile", clgProfile);
		model.addObject("shsProfile", shsProfile);
		model.addObject("bscProfile", bscProfile);
		model.addObject("courses", courses);
		model.addObject("strands", strands);
		model.addObject("clgcurrics", clgcurrics);
		model.addObject("shscurrics", shscurrics);
		model.addObject("bsccurrics", bsccurrics);
		
		model.addObject("saveType", "saveEdited");
		return model;
	}
	
	@RequestMapping(value = "/student/sh/{LRN}")
	public ModelAndView shSprForm(@PathVariable("LRN") String LRN) {
		Student stud = new Student();
		StudentProfile studCAB = new StudentProfile();
		List<Course> courses = db.getCollegeCourses("");
		List<Curriculum> currics = db.getCollegeCurriculums("");

		if (!LRN.equals("")) {
//			stud = db.getStudentByID(studentID);
//			studCAB = db.getStudentCABByID(studentID);
//			currics = db.getCurriculum(studCAB.getCourseID());
		}

		System.out.println("StudentCAB curriculumID is: " + studCAB.getCurriculumID());

		ModelAndView model = new ModelAndView();
		model.setViewName("student");
		model.addObject("student", stud);
		model.addObject("LRN", LRN);
		model.addObject("studentCAB", studCAB);
		model.addObject("courses", courses);
		model.addObject("curriculums", currics);
		model.addObject("saveType", "saveEdited");
		return model;
	}


	@RequestMapping(value = "/deleteSPR/{studentNo}")
	public ModelAndView deleteSPR(@PathVariable("studentID") String id) {
		// model.addAttribute("student", new Student());
		db.deleteSPR(id);
		return new ModelAndView("redirect: /index");
	}

	@ModelAttribute("schoolYear")
	public String getInitializeMyObject() {
		return "2017-2018";
	}

}
