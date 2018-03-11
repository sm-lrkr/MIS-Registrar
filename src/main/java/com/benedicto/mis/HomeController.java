package com.benedicto.mis;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.benedicto.mis.beans.formbackers.DaysCollector;
import com.benedicto.mis.beans.formbackers.SchedulesViewForm;
import com.benedicto.mis.beans.formbackers.SubjectsViewForm;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	studentdb db;// will inject dao from xml file

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("redirect:/index");
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView home() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
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

//	@RequestMapping(value = "/courses", method = RequestMethod.GET)
//	public ModelAndView courses() {
//		Locale locale = new Locale("en_US");
//		logger.info("Welcome home! The client locale is {}.", locale);
//
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		List<Course> list = db.getCourses("");
//		String formattedDate = dateFormat.format(date);
//
//		ModelAndView model = new ModelAndView();
//		model.setViewName("courses");
//		model.addObject("serverTime", formattedDate);
//
//		model.addObject("list", list);
//		model.addObject("course", new Course());
//
//		return model;
//	}

//	@RequestMapping(value = "/subjects", method = RequestMethod.GET)
//	public ModelAndView subjects() {
//		Locale locale = new Locale("en_US");
//		logger.info("Welcome home! The client locale is {}.", locale);
//
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		List<Subject> list = db.getSubjects("");
//		String formattedDate = dateFormat.format(date);
//
//		ModelAndView model = new ModelAndView();
//		model.setViewName("subjects");
//		model.addObject("serverTime", formattedDate);
//		model.addObject("list", list);
//		model.addObject("subject", new Subject());
//		return model;
//	}
	
	@RequestMapping(value = "/classes", method = RequestMethod.GET)
	public ModelAndView classes() {

		List<Schedule> list = db.getCollegeSchedules("", "");

		ModelAndView model = new ModelAndView();
		model.setViewName("classes");
		model.addObject("schedules", list);
		model.addObject("daysCollector", new DaysCollector());
		//model.addObject("subject", new Subject());
		return model;
	}

//	@RequestMapping(value = "/enlistment/{studentID}", method = RequestMethod.GET)
//	public ModelAndView enlistment(@PathVariable("studentID") String studentID) {
//		Locale locale = new Locale("en_US");
//		logger.info("Welcome home! The client locale is {}.", locale);
//
//		StudentProfile studCAB = db.getCollegeProfileByNo(studentID);
//		System.out.println("Curriculum ID : " + studCAB.getCurriculumID());
//
//		SchedulesViewForm schedules = new SchedulesViewForm();
//		SchedulesViewForm enlisted = new SchedulesViewForm();
//		schedules.setSchedules(db.getCollegeSchedulesByStudentCurric("", studCAB.getCurriculumID()));
//		enlisted.setSchedules(db.getCollegeEnlistedSubjects(studentID));
//
//		System.out.println("Offered: " + schedules.getSchedules().size());
//		System.out.println("Enlisted: " + enlisted.getSchedules().size());
//
//		ModelAndView model = new ModelAndView();
//		model.setViewName("enlistment");
//		model.addObject("studentID", studentID);
//		model.addObject("offered", schedules);
//		model.addObject("enlisted", enlisted);
//		return model;
//	}

//	@RequestMapping(value = "/enlistSchedules/{studentID}", method = RequestMethod.POST)
//	public ModelAndView enlistSchedules(@ModelAttribute("offered") SchedulesViewForm s,
//			@PathVariable("studentID") String studentID) {
//		Locale locale = new Locale("en_US");
//		logger.info("Welcome home! The client locale is {}.", locale);
//
//		for (Schedule S : s.getSchedules()) {
//			if (S.isChecked()) {
//				db.enlistCollegeStudentSchedules(studentID, S.getScheduleID());
//				//db.enlistStudentSubjects(studentID, S.getLabScheduleID());
//			}
//		}
//
//		return new ModelAndView("redirect:/enlistment/" + studentID);
//	}
	
//	@RequestMapping(value = "/unenlistSchedules/{studentID}", method = RequestMethod.POST)
//	public ModelAndView unenlistSchedules(@ModelAttribute("offered") SchedulesViewForm s,
//			@PathVariable("studentID") String studentID) {
//		Locale locale = new Locale("en_US");
//		logger.info("Welcome home! The client locale is {}.", locale);
//
//		for (Schedule S : s.getSchedules()) {
//			if (S.isChecked()) {
//				//db.unenlistStudentSubjects(studentID, S.getScheduleID());
//				//db.enlistStudentSubjects(studentID, S.getLabScheduleID());
//			}
//		}
//		return new ModelAndView("redirect:/enlistment/" + studentID);
//	}
//
//	@RequestMapping(value = "course/{courseID}", method = RequestMethod.GET)
//	public ModelAndView curriculum(@PathVariable("courseID") String courseID) {
//		Locale locale = new Locale("en_US");
//
//		logger.info("Welcome home! The client locale is {}.", locale);
//
//		Map<String, List<CurriculumSubject>> subjects = new HashMap<String, List<CurriculumSubject>>();
//		List<Curriculum> currics = db.getCurriculumsByCourse(courseID);
//		Course course = db.getCourseByID(courseID);
//		
//		Curriculum c = currics.get(0);
//
//		for (int i = 1; i <= 5; ++i) {
//			subjects.put(i + "-1", db.getCurriculumSubjects(c.getCurriculumID(), i, 1));
//			subjects.put(i + "-2", db.getCurriculumSubjects(c.getCurriculumID(), i, 2));
//			subjects.put(i + "-3", db.getCurriculumSubjects(c.getCurriculumID(), i, 3));
//		}
//
//		ModelAndView model = new ModelAndView();
//		model.setViewName("course");
//		model.addObject("courseID", courseID);
//		model.addObject("subjects", subjects);
//		model.addObject("course", course);
//		model.addObject("curriculums", currics);
//		return model;
//	}
//
//	@RequestMapping(value = "/grades/{studentID}", method = RequestMethod.GET)
//	public ModelAndView studentGrades(@PathVariable("studentID") String studentID) {
//		Locale locale = new Locale("en_US");
//
//		List<SubjectGrades> grades = db.getStudentGrades(studentID);
//		System.out.println("Student ID: " + studentID + " Size: " + grades.size());
//		ModelAndView model = new ModelAndView();
//		model.setViewName("studentgrades");
//		model.addObject("grades", grades);
//		model.addObject("studentID", studentID);
//		return model;
//	}


//	@RequestMapping(value = "/saveEdited", method = RequestMethod.POST)
//	@ResponseBody
//	public String save(@ModelAttribute("student") StudentPersonal s, @ModelAttribute("studentCAB") StudentProfile sc,
//			BindingResult result) {
//		logger.info("The student ID is: {}.", s.getStudentID());
//		db.updateSPR(s);
//	
//		return "success";
//	}
//
//	@RequestMapping(value = "/saveNew", method = RequestMethod.POST)
//	@ResponseBody
//	public String saveNew(@ModelAttribute("student") StudentPersonal s, @ModelAttribute("studentCAB") StudentProfile sc,
//			BindingResult result) {
//		logger.info("The student ID is: {}.", s.getStudentID());
//		System.out.println("The course ID is: " + sc.getCourseID());
//		System.out.println("The curriculum ID is: " + sc.getCurriculumID());
//		System.out.println("The enrollment status is: " + sc.getEnrollmentStatus());
//		System.out.println("The student status is: " + sc.getStudentStatus());
//
//		sc.setStudentID(s.getStudentID());
//		db.createCollegeProfile(sc);
//		db.createSPR(s);
//		return "Success";
//	}

	@RequestMapping(value = "/saveNewCourse", method = RequestMethod.POST)
	public ModelAndView addNewCourse(@ModelAttribute("course") Course c) {
		System.out.println("Add new course");
		db.createCourse(c);
		return new ModelAndView("redirect:/courses");
	}

	
	@RequestMapping(value = "/subjectForm", method = RequestMethod.GET)
	public ModelAndView subjectForm(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new subject");
	
		return new ModelAndView("subjectForm", "subject", new Subject());
	}
	
	@RequestMapping(value = "/scheduleForm", method = RequestMethod.GET)
	public ModelAndView scheduleForm(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new subject");
	
		return new ModelAndView("subjectForm", "subject", new Subject());
	}
	
	@RequestMapping(value = "/newSubject", method = RequestMethod.POST)
	public ModelAndView addNewSubject(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new course");
		db.createCollegeSubject(s);
		return new ModelAndView("redirect:/subjects");
	}
	
	@RequestMapping(value = "/newSchedule", method = RequestMethod.POST)
	public ModelAndView addNewSchedule(@ModelAttribute("schedule") Schedule s) {
		System.out.println("Add new course");
		db.createSchedule(s);
		return new ModelAndView("redirect:/subjects");
	}

//	@RequestMapping(value = "/addCurriculum/{courseID}")
//	public ModelAndView addCurriculum(@PathVariable("courseID") String courseID) {
//		logger.info("addCurriculum");
//		List<Subject> list = db.getCollegeSubjects("");
//		SubjectsViewForm subjects = new SubjectsViewForm();
//		subjects.setSubjects(list);
//
//		ModelAndView model = new ModelAndView();
//		model.setViewName("curriculum");
//		model.addObject("subjects", subjects);
//		model.addObject("listed", new ArrayList<Subject>());
//		model.addObject("saveType", "saveNew");
//		return model;
//	}

//	@RequestMapping(value = "/newspr")
//	public ModelAndView sprFormNew() {
//		logger.info("sprForm");
//		List<Course> courses = db.getCollegeCourses("");
//		List<Curriculum> currics = db.getCollegeCurriculums("");
//
//		ModelAndView model = new ModelAndView();
//		model.setViewName("newspr");
//		model.addObject("student", new StudentPersonal());
//		model.addObject("studentCAB", new StudentProfile());
//		model.addObject("courses", courses);
//		model.addObject("curriculums", currics);
//		model.addObject("saveType", "saveNew");
//		return model;
//	}

	@RequestMapping(value = "/deleteSPR/{studentID}")
	public ModelAndView deleteSPR(@PathVariable("studentID") String id) {
		// model.addAttribute("student", new Student());
		db.deleteSPR(id);
		return new ModelAndView("redirect: /index");
	}

//	@ModelAttribute("schoolYear")
//	public String getInitializeMyObject() {
//		return "2017-2018";
//	}
//
//	// @RequestMapping(value="/")
//	// public ModelAndView home() {
//	// List<Student> list = dao.getStudents();
//	// return new ModelAndView("index", "emp", list);
//	// }
//	
//	@RequestMapping(value = "/newCourse", method = RequestMethod.GET)
//	public ModelAndView newSHSubject() {
//		Course course = new Course();
//		ModelAndView model = new ModelAndView();
//		model.setViewName("courseForm");
//		model.addObject("course ", course);
//		
//		return model;
	//}
	

}
