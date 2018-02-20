package com.benedicto.mis;


import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.benedicto.mis.beans.*;
import com.benedicto.mis.beans.containers.*;
import com.benedicto.mis.beans.formbackers.SPRForm;
import com.benedicto.mis.beans.formbackers.SchedulesViewForm;

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

		List<StudentProfile> list = db.getAllStudents("","");
		List<Department> departments = db.getDepartments("");
		List<Course> courses = db.getCollegeCourses("");
		

		ModelAndView model = new ModelAndView();
		model.setViewName("students");
		model.addObject("students", list);
		model.addObject("departments", departments);
		model.addObject("courses", courses);
		

		return model;
	}
	
	@RequestMapping(value = "/printAll", method = RequestMethod.GET)
	public ModelAndView printAllStudents(@RequestParam("filter") String filter) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<StudentProfile> list = db.getAllStudents("","");
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("studentsAll");
		model.addObject("students", list);
		
		return model;
	}


	@RequestMapping(value = "/clg", method = RequestMethod.GET)
	public ModelAndView clgStudents() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		List<StudentProfile> list = db.getCollegeStudents("","");
		List<Department> departments = db.getDepartments("");
		List<Course> courses = db.getCollegeCourses("");
		

		ModelAndView model = new ModelAndView();
		model.setViewName("clgstudents");
		model.addObject("students", list);
		model.addObject("departments", departments);
		model.addObject("courses", courses);
		
		return model;
	}
	
	@RequestMapping(value = "/clg/printByCourse", method = RequestMethod.GET)
	public ModelAndView printCollegeStudents(@RequestParam("courseID") String courseID, @RequestParam("filter") String filter) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println("The course is: " + courseID);
		System.out.println("The course is: " + courseID);
		
		boolean byCourse = true;
		Course course = new Course();
		if(courseID.trim().equals("")) {
			course.setCourseDesc("College Students");
			byCourse = false;
		}
		else {
			course = db.getCourseByID(courseID);
		}
		
		List<StudentProfile> list = db.getCollegeStudents(filter,courseID);
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("studentsByCourse");
		model.addObject("courseDesc", course.getCourseDesc());
		model.addObject("students", list);
		model.addObject("byCourse", byCourse);
		
		return model;
	}
	
	

	
	@RequestMapping(value = "/sh", method = RequestMethod.GET)
	public ModelAndView shStudents() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		List<StudentProfile> list = db.getSHStudents("","");
		List<Strand> strands= db.getSHStrands("");

		
		ModelAndView model = new ModelAndView();
		model.setViewName("sh");
		model.addObject("students", list);
		model.addObject("strands", strands);
		

		return model;
	}
	
	@RequestMapping(value = "/sh/printByStrand", method = RequestMethod.GET)
	public ModelAndView printSHStudents(@RequestParam("strandCode") String strandCode, @RequestParam("filter") String filter) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		System.out.println("The course is: " + strandCode);
		
		Strand strand = new Strand();
		boolean byStrand = true;
		
		if(strandCode.trim().equals("")) {
			strand.setStrandDesc("Senior High School");
			strand.setMajor("");
			byStrand = false;
		}
		else {
			strand = db.getSHStrandByCode(strandCode);
		}
		String title = strand.getStrandDesc();
		if(!strand.getMajor().equals("")) {
			title.concat("-"+strand.getMajor());
		}
		
		List<StudentProfile> list = db.getSHStudents(filter, strandCode);
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("studentsByStrand");
		model.addObject("strandDesc", title);
		model.addObject("students", list);
		model.addObject("byStrand", byStrand);
		
		return model;
	}
	
	@RequestMapping(value = "/bsc", method = RequestMethod.GET)
	public ModelAndView bscStudents() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<StudentProfile> list = db.getBSCStudents("");
		
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
	public ModelAndView save(@ModelAttribute("sprForm") SPRForm spr, BindingResult result, @RequestParam("profile") String profile) {
		logger.info("The student No is: {}.", spr.getPersonal().getStudentNo());
		System.out.println("Profile Type: " + profile);
		System.out.println("Student No from profile : " + spr.getProfile().getStudentNo());
		db.updateSPR(spr.getPersonal());
		db.updateStudentFBG(spr.getFbg());
		
		
		if(profile.trim().equals("collegeProfile")) {
			db.updateCollegeProfile(spr.getProfile());
		}
	
		else if(profile.trim().equalsIgnoreCase("shProfile")) {
			System.out.println("shProfile");
			db.updateSHProfile(spr.getProfile());
		}
		else {
			System.out.println("Profile Type: " +profile+".");
			
		}
		
		if(spr.getProfile().getEnrollmentStatus().trim().equals("true")) {
			System.out.println("Enrollment Status is true");
			Enrollment e = db.getCollegeEnrollmentBySY(spr.getPersonal().getStudentNo(), "2017-2018", 1);
			if(e.getEnrollmentNo().equals("")) {
				System.out.println("Student not enrolled for the current sem. Adding new enrollment. ");
				db.addNewStudentEnrollment(spr.getPersonal().getStudentNo(), "2017-2018", 1 );
			}
		}
		else {
			System.out.println("Student not enrolled.");
		}
		
		return new ModelAndView("redirect:/students/spr/info/"+ spr.getPersonal().getStudentNo());
	}

	@RequestMapping(value = "/spr/saveNew", method = RequestMethod.POST)
	public ModelAndView saveNew(@ModelAttribute("sprForm") @Valid SPRForm spr, BindingResult result) {
		logger.info("The student Name is: {}.", spr.getPersonal().getFirstName());
		System.out.println("asdfasf");
		String studentNo = String.valueOf(db.createSPR(spr.getPersonal()));
		spr.getFbg().setStudentNo(studentNo);
		db.createFBG(spr.getFbg());
		return new ModelAndView("redirect:/students/student/"+ studentNo);
	}


	@RequestMapping(value = "/newspr")
	public ModelAndView sprFormNew() {
		logger.info("sprForm");

		ModelAndView model = new ModelAndView();
		SPRForm spr = new SPRForm();
		spr.setPersonal(new StudentPersonal());
		spr.setFbg(new StudentFBG());
		
		model.setViewName("newspr");
		model.addObject("sprForm", spr);
		model.addObject("saveType", "saveNew");
		return model;
	}
	
	@RequestMapping(value = "/student/{studentNo}")
	public ModelAndView student(@PathVariable("studentNo") String studentNo) {
		StudentPersonal stud = db.getStudentByNo(studentNo);
		StudentProfile profile = db.getCollegeProfileByNo(studentNo);
		String profileType = "college";
		
		Enrollment e = db.getCollegeEnrollmentBySY(studentNo, "2017-2018", 1);
		SchedulesViewForm enlisted = new SchedulesViewForm();
		enlisted.setSchedules(db.getCollegeEnlistedSubjects(studentNo, e.getEnrollmentNo()));
		
		
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
		model.addObject("enlisted", enlisted);
		
		
		return model;
	}

	
	@RequestMapping(value = "/registration/{studentNo}")
	public ModelAndView registration(@PathVariable("studentNo") String studentNo) {
		StudentPersonal stud = db.getStudentByNo(studentNo);
		
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
		StudentPersonal stud = new StudentPersonal();
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
		
		SPRForm sprForm = new SPRForm();
		sprForm.setPersonal(stud);
		sprForm.setFbg(fbg);
		sprForm.setProfile(profile);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("student");
		model.addObject("sprForm", sprForm);
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
		StudentPersonal stud = db.getStudentByNo(studentNo);
		StudentProfile sp = new StudentProfile();
		sp.setLRN("------------");
		
		List<Course> courses = db.getCollegeCourses("");
		List<Curriculum> clgcurrics = db.getCollegeCurriculums("");

		System.out.println("Student No.: "+ stud.getStudentNo());
		//System.out.println("Student ID : "+ stud.getStudentID());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentAB");
		model.addObject("student", stud);
		model.addObject("form", "collegeProfile");
		model.addObject("profile", sp);
		model.addObject("courses", courses);
		model.addObject("clgcurrics", clgcurrics);
		
		model.addObject("saveType", "saveNew");
		return model;
	}
	
	@RequestMapping(value = "/spr/newProfile/clg/save/{studentNo}")
	public ModelAndView saveNewCLGProfile(@PathVariable("studentNo") String studentNo, @ModelAttribute("profile") @Valid StudentProfile sp,
			BindingResult result) {
	
		db.createCollegeProfile(sp);
		return new ModelAndView("redirect:/students/registration/"+ sp.getStudentNo());
	}
	
	@RequestMapping(value = "/spr/newProfile/shs/save/{studentNo}")
	public ModelAndView saveNewSHSProfile(@PathVariable("studentNo") String studentNo, @ModelAttribute("profile") StudentProfile sp) {
		db.createSHProfile(sp);
		return new ModelAndView("redirect:/students/registration/"+ sp.getStudentNo());
	}
	

	@RequestMapping(value = "/spr/newProfile/shs/{studentNo}")
	public ModelAndView newSHSProfile(@PathVariable("studentNo") String studentNo) {
		StudentPersonal stud = db.getStudentByNo(studentNo);
		
		List<Strand> strands = db.getSHStrands("");
		List<Curriculum> shscurrics = db.getSHCurriculums("");

		System.out.println("Student No.: "+ stud.getStudentNo());
		//System.out.println("Student ID : "+ stud.getStudentID());
		
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
		StudentPersonal stud = db.getStudentByNo(studentNo);
		StudentProfile clgProfile = db.getCollegeProfileByNo(studentNo);
		
		List<Course> courses = db.getCollegeCourses("");
		List<Curriculum> clgcurrics = db.getCollegeCurriculums(clgProfile.getCourseID());

		System.out.println("StudentCAB curriculumID is: " + clgProfile.getCurriculumID());
		System.out.println("Student No.: "+ stud.getStudentNo());
		//System.out.println("Student ID : "+ stud.getStudentID());
		
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
		StudentPersonal stud = db.getStudentByNo(studentNo);
		StudentProfile shsProfile = db.getSHProfileByNo(studentNo);
		
		List<Strand> strands = db.getSHStrands("");
		List<Curriculum> shscurrics = db.getSHCurriculums(shsProfile.getStrandCode());

		System.out.println("StudentCAB curriculumID is: " + shsProfile.getCurriculumID());
		System.out.println("Student No.: "+ stud.getStudentNo());
		//System.out.println("Student ID : "+ stud.getStudentID());
		
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
		StudentPersonal stud = db.getStudentByNo(studentNo);
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
		StudentPersonal stud = new StudentPersonal();
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
		//System.out.println("Student ID : "+ stud.getStudentID());
		
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
		StudentPersonal stud = new StudentPersonal();
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
