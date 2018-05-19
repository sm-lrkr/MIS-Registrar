package com.benedicto.mis;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
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
import com.benedicto.mis.beans.formbackers.DaysCollector;
import com.benedicto.mis.beans.formbackers.ScheduleForm;
import com.benedicto.mis.beans.formbackers.SchedulesViewForm;


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

		SchoolYear sy = db.getActiveSchoolYear();
		List<Schedule> schedules = db.getCollegeSchedules("",sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("schedules");
		model.addObject("schedules", schedules);
		model.addObject("dept", "clg");
		model.addObject("schedsView", "schedsViewCLG");
		model.addObject("daysCollector", new DaysCollector());
		
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
		SchoolYear sy =db.getActiveSchoolYear();
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
		model.addObject("schoolYear", sy.getYear_start()+"-"+sy.getYear_end());
		
		
		return model;
	}
	
	@RequestMapping(value = "/clg/printEnlisted/", method = RequestMethod.GET)
	public ModelAndView clgprintEnlisted( @RequestParam("schedID") String scheduleID) {
		List<StudentProfile> students = db.getCollegeStudentsBySchedule(scheduleID);
		Schedule schedule = db.getCollegeScheduleByID(scheduleID);
		String _class="LEC";
		SchoolYear sy = db.getActiveSchoolYear();
		System.out.println("Teacher name: "+ schedule.getPersonnelName());
		Teacher teacher = db.getPersonnelByID(schedule.getScheduleID());
		System.out.println("Teacher name: "+ teacher.getFirst_name());
	
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		ModelAndView model = new ModelAndView();
		model.setViewName("studentsBySchedule");
		model.addObject("schedule", schedule);
		model.addObject("students", students);
		model.addObject("classType", _class);
		model.addObject("teacher", teacher);
		model.addObject("schoolYear", sy.getYear_start()+"-"+sy.getYear_end()+" "+ sems[sy.getSemester()]);
		
		return model;
	}

	@RequestMapping(value = "/sh", method = RequestMethod.GET)
	public ModelAndView shSchedules() {
		
		SchoolYear sy = db.getActiveSchoolYear();
		List<Schedule> schedules = db.getSHSchedules(sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		
		SchedulesViewForm schedulesForm = new SchedulesViewForm();
		schedulesForm.setSchedules(schedules);

		ModelAndView model = new ModelAndView();
		model.setViewName("schedules");
		model.addObject("schedsView", "schedsViewSH");
		model.addObject("dept", "shs");
		
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
		
		StudentProfile sp = db.getCollegeProfileByNo(studentNo);
		TimeTrapper trapper = new TimeTrapper();
		SchoolYear sy = db.getActiveSchoolYear();
		
		Enrollment enrollment = db.getCollegeEnrollmentBySY(studentNo, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		if(enrollment.getEnrollmentNo().equals("")) {
			db.addNewStudentEnrollment(studentNo, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
			enrollment = db.getCollegeEnrollmentBySY(studentNo, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		}
		
		System.out.println("Enrollment enrollment No: "+ enrollment.getEnrollmentNo());
		EvaluationProfile eval = db.getEvaluationProfileByEnrollment(enrollment.getEnrollmentNo());
		System.out.println("EnrollmentNo: " + eval.getEvaluationNo());
		System.out.println("ID: " + eval.getId());

		if(eval.getEvaluationNo()==0) {
			db.addNewStudentVerification(enrollment, sp.getStudentID(), 3);
		}
	
		List<Schedule> enlisted = db.getCollegeEnlistedSubjects(studentNo, enrollment.getEnrollmentNo());
		List<Schedule> temp = new ArrayList<Schedule>();
		
		//boolean hasUncreditedPreRequisite = false;
		
		for(Schedule S: s.getSchedules()) {
			if(S.isChecked()) 
				temp.add(S);
		}
		
		List<Schedule> enlistedConflicts = new ArrayList<Schedule>();
		List<Schedule> selectedConflicts = new ArrayList<Schedule>();
		
		
		for(Schedule S: temp) {
			List<Schedule> scheds = new ArrayList<Schedule>();
			
			scheds.addAll(temp);
			scheds.remove(S);
			System.out.println(S.getScheduleID()+"-"+S.getSubjectCode()+"-");
			
			//Check time conflict
			selectedConflicts.addAll(trapper.timeConflict(scheds, S.getLecTimeStart(), S.getLecTimeEnd(), S.getLecDays(), "",""));
			enlistedConflicts.addAll(trapper.timeConflict(enlisted, S.getLecTimeStart(), S.getLecTimeEnd(), S.getLecDays(), "", ""));
		
			
			if(S.getLabTimeStart() != null) {
				selectedConflicts.addAll(trapper.timeConflict(scheds, S.getLabTimeStart(), S.getLabTimeEnd(), S.getLabDays(), "", ""));
				enlistedConflicts.addAll(trapper.timeConflict(enlisted, S.getLabTimeStart(), S.getLabTimeEnd(), S.getLabDays(), "", ""));
			}	
		
			if(!enlistedConflicts.isEmpty() || !selectedConflicts.isEmpty()) {
				System.out.println(S.getScheduleID()+"-"+S.getSubjectCode()+"is conflict with one of the checked schedules ");
				break;
			}	
			
		}
		
		if(enlistedConflicts.isEmpty() && selectedConflicts.isEmpty()) {
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


	@RequestMapping(value = "/newSchedule/{dept}", method = RequestMethod.GET)
	public ModelAndView scheduleForm(@PathVariable("dept") String dept, @ModelAttribute("subject") Subject s) {
		System.out.println("Add new schedule");
		
		List<Subject> subjects = new ArrayList<Subject>();
		List<Section> sections = db.getSHSections("");
	
		if(dept.equals("clg"))
			subjects = db.getCollegeSubjects("");
		else if(dept.equals("shs"))
			subjects = db.getSHSubjects("");	
		
		
		List<Teacher> teachers = db.getPersonnels("");
		List<Facility> rooms = db.getFacilities();
		List<String> times = new ArrayList<String>();
	
		times.add("");
		for(int i=5; i<=11; i++) {
			times.add(String.format("%02d", i).concat(":00 AM"));
			times.add(String.format("%02d", i).concat(":30 AM"));
		}
	
		times.add("12:00 PM");
		times.add("12:30 PM");
		
		for(int i=1; i<=10; i++) {
			times.add(String.format("%02d", i).concat(":00 PM"));
			times.add(String.format("%02d", i).concat(":30 PM"));
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("scheduleForm");
		model.addObject("subjects", subjects);
		model.addObject("teachers", teachers);
		model.addObject("sections", sections);
		model.addObject("rooms", rooms);
		model.addObject("times", times);
		model.addObject("department", dept);
		model.addObject("scheduleForm", new ScheduleForm());
	
		return model;
	}
	
	@RequestMapping(value = "/saveNew/{dept}", method = RequestMethod.POST)
	@ResponseBody
	public String addNewSchedule(@PathVariable("dept") String dept, @ModelAttribute("scheduleForm") ScheduleForm sf, BindingResult result) {
		System.out.println("Save new Schedule");
		
		try {
			if(result.hasErrors()) {
				System.out.println("Form has errors");
			}
			
			Schedule s = sf.getSchedule();
			s.setLecDays(sf.getLecDays().getStringDays());
		
			SchoolYear sy = db.getActiveSchoolYear();
			List<Schedule> clgScheds = db.getCollegeSchedules("", sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
			List<Schedule> shsScheds = db.getSHSchedules(sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
			
			List<Schedule> lecConflicts = new ArrayList<Schedule> ();
			List<Schedule> labConflicts = new ArrayList<Schedule> ();
			
			TimeTrapper trapper = new TimeTrapper();
			 
			lecConflicts.addAll(trapper.timeConflict(clgScheds,s.getLecTimeStart() ,s.getLecTimeEnd(), s.getLecDays(), s.getLecRoom(), s.getPersonnelID()));
			lecConflicts.addAll(trapper.timeConflict(shsScheds,s.getLecTimeStart() ,s.getLecTimeEnd(), s.getLecDays(), s.getLecRoom(), s.getPersonnelID()));
		
			if(dept.equals("clg")) {
				s.setLabDays(sf.getLabDays().getStringDays());
				labConflicts.addAll(trapper.timeConflict(clgScheds,s.getLabTimeStart() ,s.getLabTimeEnd(), s.getLabDays(), s.getLabRoom(), s.getPersonnelID()));
			}
		
			//If no conflicts on lecture and laboratory time
			if(lecConflicts.isEmpty() && labConflicts.isEmpty()) {
				System.out.println("Subject Code: "+ s.getSubjectCode() );
				
				Subject su = new Subject();
				if(dept.equals("clg")) {
					su = db.getCollegeSubjectByCode(s.getSubjectCode());
					s.setLabUnits(su.getLabUnits());
					s.setLabDays(sf.getLabDays().getStringDays());
				}else if(dept.equals("shs"))
					su = db.getSHSubjectByCode(s.getSubjectCode());
			
				s.setLecUnits(su.getLecUnits());
				s.setLecDays(sf.getLecDays().getStringDays());
				s.setSchoolYear(sy.getYear_start()+"-"+sy.getYear_end());
				s.setSemester(sy.getSemester());
				
				if(dept.equals("clg"))
					db.createSchedule(s);
				else if(dept.equals("shs"))
					db.createSHSchedule(s);
	
			}else {
				String error="";
				if(!lecConflicts.isEmpty()) {
					error = error.concat("Conflicts in lecture time<br>");
					for(Schedule S: lecConflicts) 
						error = error.concat(S.getSubjectCode()+" "+S.getLecTimeStart()+"-"+S.getLecTimeEnd()+" "+ S.getLecRoom()+" "+ S.getLecDays()+" "+ S.getPersonnelName()+"<br>");
				}
				if(!labConflicts.isEmpty()) {
					error = error.concat("Conflicts in laboratory time<br>");
					for(Schedule S: labConflicts) 
						error = error.concat(S.getSubjectCode()+" "+S.getLabTimeStart()+"-"+S.getLabTimeEnd()+" "+ S.getLabRoom()+" "+ S.getLabDays()+" "+ S.getPersonnelName()+"<br>");
				}
		
				return error;
			}
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
		System.out.println("Successfully added new schedule");
	
		return "success";
	}
}
