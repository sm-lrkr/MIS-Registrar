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
	
	@RequestMapping(value = "/enlistment/{studentNo}", method = RequestMethod.GET)
	public ModelAndView enlistment(@PathVariable("studentNo") String studentNo) {
		StudentProfile clgProfile = db.getCollegeProfileByNo(studentNo);
		System.out.println("Student ID: " + clgProfile.getStudentID());
		
		if(!clgProfile.getStudentID().equals(""))
			return new ModelAndView("redirect:/schedules/enlistment/college/" + studentNo);
		if(!db.getSHProfileByNo(studentNo).getLRN().equals(""))
			return new ModelAndView("redirect:/schedules/enlistment/shs/" + studentNo);
		return new ModelAndView("redirect:/schedules/enlistment/bsc/" + studentNo);
	}
	
	@RequestMapping(value = "/enlistment/college/{studentNo}", method = RequestMethod.GET)
	public ModelAndView clgEnlistment(@PathVariable("studentNo") String studentNo) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		StudentPersonal stud = db.getStudentByNo(studentNo);
		StudentProfile studCAB = db.getCollegeProfileByNo(studentNo);
		System.out.println("Curriculum ID : " + studCAB.getCurriculumID());
 
		SchedulesViewForm schedules = new SchedulesViewForm();
		SchedulesViewForm enlisted = new SchedulesViewForm();
		schedules.setSchedules(db.getCollegeSchedulesByStudentCurric("", studCAB.getCurriculumID(), studentNo));
		enlisted.setSchedules(db.getCollegeEnlistedSubjects(studentNo));

		System.out.println("Offered: " + schedules.getSchedules().size());
		System.out.println("Enlisted: " + enlisted.getSchedules().size());

		ModelAndView model = new ModelAndView();
		model.setViewName("enlistment");
		model.addObject("student", stud);
		model.addObject("ID", studCAB.getStudentID());
		model.addObject("offered", schedules);
		model.addObject("enlisted", enlisted);
		return model;
	}
	
	@RequestMapping(value = "/enlistment/shs/{studentNo}", method = RequestMethod.GET)
	public ModelAndView shsEnlistment(@PathVariable("studentNo") String studentNo) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		StudentPersonal stud = db.getStudentByNo(studentNo);
		StudentProfile studCAB = db.getCollegeProfileByNo(studentNo);
		System.out.println("Curriculum ID : " + studCAB.getCurriculumID());
 
		SchedulesViewForm schedules = new SchedulesViewForm();
		SchedulesViewForm enlisted = new SchedulesViewForm();
		schedules.setSchedules(db.getCollegeSchedulesByStudentCurric("", studCAB.getCurriculumID(), studentNo));
		enlisted.setSchedules(db.getCollegeEnlistedSubjects(studentNo));

		System.out.println("Offered: " + schedules.getSchedules().size());
		System.out.println("Enlisted: " + enlisted.getSchedules().size());

		ModelAndView model = new ModelAndView();
		model.setViewName("enlistmentsh");
		model.addObject("student", stud);
		model.addObject("ID", studCAB.getStudentID());
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
		
		logger.info("Welcome home! The client locale is {}.", locale);
		Enrollment enrollment = db.getEnrollment(studentNo, "2017-2018", 1);
		
		for (Schedule S : s.getSchedules()) {
			if (S.isChecked()) {
				db.enlistCollegeStudentSchedules(enrollment, S.getScheduleID());
				//db.enlistStudentSubjects(studentID, S.getLabScheduleID());
				db.addSubjectGrading(S, enrollment.getEnrollmentNo(), formattedDate);
			}
		}

		return new ModelAndView("redirect:/schedules/enlistment/college/" + studentNo);
	}
	
	
	@RequestMapping(value = "/withdraw/college/{studentNo}", method = RequestMethod.POST)
	public ModelAndView unenlistSchedules(@ModelAttribute("offered") SchedulesViewForm s,
			@PathVariable("studentNo") String studentNo) {
		
		Enrollment enrollment = db.getEnrollment(studentNo, "2017-2018", 1);
		
		for (Schedule S : s.getSchedules()) {
			if (S.isChecked()) {
				db.withdrawStudentSubjects(enrollment, S.getScheduleID());
				
			}
		}
		return new ModelAndView("redirect:/schedules/enlistment/college/" + studentNo);
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
