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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.benedicto.mis.beans.*;
import com.benedicto.mis.beans.containers.*;
import com.benedicto.mis.beans.formbackers.DaysCollector;
import com.benedicto.mis.beans.formbackers.ScheduleForm;
import com.benedicto.mis.beans.formbackers.SchedulesViewForm;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("schedules")
public class ScheduleController {

	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);

	@Autowired
	studentdb db;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView schedules() {
		return new ModelAndView("redirect:/schedules/clg");
	}
	
	
	@RequestMapping(value = "/clg", method = RequestMethod.GET)
	public ModelAndView clgSchedules() {

		List<Schedule> list = db.getCollegeSchedules("", "");

		ModelAndView model = new ModelAndView();
		model.setViewName("schedules");
		model.addObject("schedules", list);
		model.addObject("schedsView", "schedsViewCLG");
		model.addObject("daysCollector", new DaysCollector());
		//model.addObject("subject", new Subject());
		return model;
	}
	
	@RequestMapping(value = "/clg/printByCourse", method = RequestMethod.GET)
	public ModelAndView printCollegeSchedules(@RequestParam("courseID") String courseID, @RequestParam("year") String year) {

		SchedulesViewForm schedules = new SchedulesViewForm();
		//schedules.setSchedules(db.getCollegeSchedulesByCurric(curricID, "2017-2018", 1));
		schedules.setSchedules(db.getCollegeSchedulesByCourse(courseID, "2017-2018", 1, year));
		List<Course> courses = db.getCollegeCourses("");
		System.out.println(courseID+" schedules: "+ schedules.getSchedules().size());
		Course course = db.getCourseByID(courseID);
		List<SchoolYear> schoolYears = db.getSchoolYears();
		String [] years = {"", "1st-Year","2nd-Year", "3rd-Year", "4th-Year", "5th-Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
	
		
		ModelAndView model = new ModelAndView();
		model.setViewName("schedulesByCourse");
		model.addObject("schedules", schedules.getSchedules());
		model.addObject("schedsView", "schedsViewCLG");
		model.addObject("courses", courses);
		model.addObject("course", course);
		model.addObject("courseDesc", course.getCourseDesc());
		model.addObject("schoolYears", schoolYears);
		model.addObject("sems", sems);
		model.addObject("years", years);
		
	
		return model;
	}
	
	@RequestMapping(value = "/clg/printByTeacher", method = RequestMethod.GET)
	public ModelAndView printCollegeByTeacher(@RequestParam("teacherID") String teacherID) {

		SchedulesViewForm schedules = new SchedulesViewForm();
		schedules.setSchedules(db.getCollegeSchedulesByTeacher(teacherID, "2017-2018", 1));
		System.out.println(teacherID +" schedules: "+ schedules.getSchedules().size());
		List<Teacher> teachers = db.getPersonnels("");
		Teacher teacher = db.getPersonnelByID(teacherID);
		List<SchoolYear> schoolYears = db.getSchoolYears();
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("schedulesByTeacher");
		model.addObject("schedules", schedules.getSchedules());
		model.addObject("schedsView", "schedsViewCLG");
		model.addObject("teacher", teacher);
		model.addObject("teachers", teachers);
		model.addObject("schoolYears", schoolYears);
		model.addObject("sems", sems);
		
		return model;
	}
	
	
	@RequestMapping(value = "/clg/{subjectCode}/", method = RequestMethod.GET)
	public ModelAndView clgSchedule(@PathVariable("subjectCode") String subjectCode, @RequestParam("id") String scheduleID) {
		List<StudentProfile> students = db.getCollegeStudentsBySchedule(scheduleID);
		Schedule schedule = db.getCollegeScheduleByID(scheduleID);
		String _class="LEC";
		
		if(subjectCode.contains("LAB")) {
			_class="LAB";
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("schedule");
		model.addObject("subjectCode", subjectCode);
		model.addObject("schedule", schedule);
		model.addObject("students", students);
		model.addObject("classType", _class);
		
		return model;
	}

	@RequestMapping(value = "/sh", method = RequestMethod.GET)
	public ModelAndView shSchedules() {

		List<Schedule> schedules =  db.getSHSchedules("", "");
		SchedulesViewForm schedulesForm = new SchedulesViewForm();
		schedulesForm.setSchedules(schedules);

		ModelAndView model = new ModelAndView();
		model.setViewName("schedules");
		model.addObject("schedsView", "schedsViewSH");
		
		model.addObject("schedulesForm", schedulesForm);
		model.addObject("daysCollector", new DaysCollector());
		//model.addObject("subject", new Subject());
		return model;
	}
	
	@RequestMapping(value = "/enlistment/", method = RequestMethod.GET)
	public ModelAndView enlistment(@RequestParam("studentNo") String studentNo) {
		StudentProfile clgProfile = db.getCollegeProfileByNo(studentNo);
		System.out.println("Student ID: " + clgProfile.getStudentID());
		
		if(!clgProfile.getStudentID().equals(""))
			return new ModelAndView("redirect:/schedules/enlistment/college/?studentNo=" + studentNo);
		if(!db.getSHProfileByNo(studentNo).getLRN().equals(""))
			return new ModelAndView("redirect:/schedules/enlistment/shs/?studentNo=" + studentNo);
		return new ModelAndView("redirect:/schedules/enlistment/bsc/?studentNo=" + studentNo);
	}
	
	@RequestMapping(value = "/enlistment/college/", method = RequestMethod.GET)
	public ModelAndView clgEnlistment(@RequestParam("studentNo") String studentNo) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		
		SchoolYear sy = db.getActiveSchoolYear();
		Enrollment e = db.getCollegeEnrollmentBySY(studentNo, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		
		StudentPersonal stud = db.getStudentByNo(studentNo);
		StudentProfile studCAB = db.getCollegeProfileByNo(studentNo);
		System.out.println("Curriculum ID : " + studCAB.getCurriculumID()+" StudentNo: "+ studCAB.getStudentNo());
			
		
		
		
		SchedulesViewForm offered = new SchedulesViewForm();
		SchedulesViewForm enlisted = new SchedulesViewForm();
		offered.setSchedules(new ArrayList<Schedule>());
		enlisted.setSchedules(db.getCollegeEnlistedSubjects(studentNo, e.getEnrollmentNo()));
		List<Schedule> semscheds = db.getCollegeSchedulesByCurric(studCAB.getCurriculumID(),sy.getYear_start()+"-"+sy.getYear_end() , sy.getSemester());
	
		for(Schedule S:  semscheds) {
			boolean isEnlisted = false;
			List<StudentProfile> sps = db.getCollegEnlistedStudents(S.getScheduleID());
			for(Schedule E: enlisted.getSchedules()) {
				System.out.println("S ID: " + S.getScheduleID()+", E ID: "+ E.getScheduleID());
				if(E.getScheduleID().equals(S.getScheduleID())) {
					isEnlisted = true;
					break;
				}
			}
			if(!isEnlisted && sps.size() < 10) {
				offered.getSchedules().add(S);
			}
		}

		//offered.setSchedules(db.getCollegeSchedulesByStudentCurric("", studCAB.getCurriculumID(), studentNo));

		List<Schedule> temp = new ArrayList<Schedule>();
		for(Schedule S: offered.getSchedules()) {
			List<StudentProfile> _enlisted = db.getCollegeStudentsBySchedule(S.getScheduleID());
			if(_enlisted.size()<40) {
				temp.add(S);
			}
		}
		//offered.setSchedules(offered.getSchedules());
		
		System.out.println("Offered: " + offered.getSchedules().size());
		System.out.println("Enlisted: " + enlisted.getSchedules().size());

		ModelAndView model = new ModelAndView();
		model.setViewName("enlistment");
		model.addObject("student", stud);
		model.addObject("ID", studCAB.getStudentID());
		model.addObject("offered", offered);
		model.addObject("enlisted", enlisted);
		return model;
	}
	
	@RequestMapping(value = "/enlistment/shs/", method = RequestMethod.GET)
	public ModelAndView shsEnlistment(@RequestParam("studentNo") String studentNo) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		
		SchoolYear sy = db.getActiveSchoolYear();
		Enrollment e = db.getCollegeEnrollmentBySY(studentNo, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		
		StudentPersonal stud = db.getStudentByNo(studentNo);
		StudentProfile profile = db.getCollegeProfileByNo(studentNo);

		SchedulesViewForm schedules = new SchedulesViewForm();
		SchedulesViewForm enlisted = new SchedulesViewForm();
		
		schedules.setSchedules(db.getSHSchedulesBySection(e.getSectionID(), sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester()));
		enlisted.setSchedules(db.getSHEnlistedSubjects(studentNo, e.getEnrollmentNo()));

		System.out.println("Offered: " + schedules.getSchedules().size());
		System.out.println("Enlisted: " + enlisted.getSchedules().size());

		ModelAndView model = new ModelAndView();
		model.setViewName("enlistmentsh");
		model.addObject("student", stud);
		model.addObject("ID", profile.getStudentID());
		model.addObject("offered", schedules);
		model.addObject("enlisted", enlisted);
		return model;
	}

	
	@RequestMapping(value = "/enlist/college/{studentNo}", method = RequestMethod.POST)
	public ModelAndView enlistSchedules(@ModelAttribute("offered") SchedulesViewForm s,
			@PathVariable("studentNo") String studentNo) {
		Locale locale = new Locale("en_US");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, locale);
		String formattedDate = dateFormat.format(date);
		
		
		TimeTrapper trapper = new TimeTrapper();
		SchoolYear sy = db.getActiveSchoolYear();
		Enrollment enrollment = db.getCollegeEnrollmentBySY(studentNo, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		List<Schedule> enlisted = db.getCollegeEnlistedSubjects(studentNo, enrollment.getEnrollmentNo());
		List<Schedule> temp = new ArrayList<Schedule>();
		
		boolean hasConflictsLec = false;
		boolean hasConflictsLab = false;
		boolean hasConflictsLec1 = false;
		boolean hasConflictsLab1 = false;
		
		for(Schedule S: s.getSchedules()) {
			if(S.isChecked()) 
				temp.add(S);
		}
		
		for(Schedule S: temp) {
			List<Schedule> scheds = new ArrayList<Schedule>();
			scheds.addAll(temp);
			scheds.remove(S);
			System.out.println(S.getScheduleID()+"-"+S.getSubjectCode()+"-");
			
			hasConflictsLec1 = trapper.timeConflict(scheds, S.getLecTimeStart(), S.getLecTimeEnd(), S.getLecDays(), S.getLecRoom());
			hasConflictsLec = trapper.timeConflict(enlisted, S.getLecTimeStart(), S.getLecTimeEnd(), S.getLecDays(), S.getLecRoom());
			if(S.getLabTimeStart() != null) {
				hasConflictsLab = trapper.timeConflict(enlisted, S.getLabTimeStart(), S.getLabTimeEnd(), S.getLabDays(), S.getLabRoom());
				hasConflictsLab1 = trapper.timeConflict(scheds, S.getLabTimeStart(), S.getLabTimeEnd(), S.getLabDays(), S.getLabRoom());
				
			}	
				
			if(hasConflictsLec || hasConflictsLab) {
				System.out.println(S.getScheduleID()+"-"+S.getSubjectCode()+"is conflict with one of the checked schedules ");
				break;
			}	
			
		}
	
		if(!hasConflictsLec && !hasConflictsLab && !hasConflictsLec1 && !hasConflictsLab1 ) {
			for (Schedule S : s.getSchedules()) {
				if (S.isChecked()) {
					db.enlistCollegeStudentSchedules(enrollment, S.getScheduleID());
					db.addCollegeSubjectGrading(S, enrollment.getEnrollmentNo(), formattedDate, S.getScheduleID());
					
				}
			}
		}
		return new ModelAndView("redirect:/schedules/enlistment/college/?studentNo=" + studentNo);
	}
	
	
	@RequestMapping(value = "/withdraw/college/{studentNo}", method = RequestMethod.POST)
	public ModelAndView unenlistSchedules(@ModelAttribute("enlisted") SchedulesViewForm s,
			@PathVariable("studentNo") String studentNo) {
		
		SchoolYear sy = db.getActiveSchoolYear();
		Enrollment enrollment = db.getCollegeEnrollmentBySY(studentNo, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		
		for (Schedule S : s.getSchedules()) {
			if (S.isChecked()) {
				System.out.println("Schedule Checked: "+ S.getScheduleID());
				db.withdrawStudentSubjects(enrollment, S.getScheduleID());
				db.removeCollegeSubjectsGrading(enrollment, S.getSubjectCode());
			}
		}
		return new ModelAndView("redirect:/schedules/enlistment/college/?studentNo=" + studentNo);
	}


	@RequestMapping(value = "newSchedule", method = RequestMethod.GET)
	public ModelAndView scheduleForm(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new schedule");
		List<Subject> list = db.getCollegeSubjects("");

		ModelAndView model = new ModelAndView();
		model.setViewName("scheduleForm");
		model.addObject("subjects", list);
		model.addObject("scheduleForm", new ScheduleForm());
		
	
		return model;
	}
	
	@RequestMapping(value = "/saveNew", method = RequestMethod.POST)
	@ResponseBody
	public String addNewSchedule(@ModelAttribute("scheduleForm") ScheduleForm sf, BindingResult result) {
		System.out.println("Save new Schedule");
		
		
		try {
			if(result.hasErrors()) {
				System.out.println("Form has errors");
			}
			
			
			Schedule s = sf.getSchedule();
			System.out.println("Subject Code: "+ s.getSubjectCode() );
			
			Subject su = db.getCollegeSubjectByCode(s.getSubjectCode());

			s.setLecUnits(su.getLecUnits());
			s.setLabUnits(su.getLabUnits());
			s.setLecDays(sf.getLecDays().getStringDays());
			s.setLabDays(sf.getLabDays().getStringDays());
			s.setSchoolYear("2018-2019");
			s.setSemester("1");
			

			db.createSchedule(s);
			
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		

		System.out.println("Successfully added new schedule");
		
		return "Success";
	}

}
