package com.benedicto.mis;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import com.benedicto.mis.beans.*;
import com.benedicto.mis.beans.containers.*;
import com.benedicto.mis.beans.formbackers.SemGrades;
import com.benedicto.mis.beans.formbackers.SemGradesForm;

@Controller
@RequestMapping("grades")
public class GradesController {

	private static final Logger logger = LoggerFactory.getLogger(GradesController.class);

	@Autowired
	studentdb db;// will inject dao from xml file

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView studentGrades(@RequestParam("studentNo") String studentNo) {
		logger.info("grades");
		StudentProfile profile = db.getCollegeProfileByNo(studentNo);
		String profileType = "clg";
		
		if(profile.getStudentID().equals("")) {
			profile = db.getSHProfileByNo(studentNo);
			profileType = "shs";
			if(profile.getLRN().equals("")) {
				profile = db.getBSCProfileByNo(studentNo);
				profileType = "bsc";
			}
		}
		
		return new ModelAndView("redirect:/grades/"+profileType+"/?studentNo="+ studentNo );
	}
	
	
	@RequestMapping(value = "/shs/", method = RequestMethod.GET)
	public ModelAndView shStudentGrades(@RequestParam("studentNo") String studentNo) {
		logger.info("grades");
		
		StudentPersonal student = db.getStudentByNo(studentNo);
		SemGradesForm allSemGrades = new SemGradesForm();
		List<SemGrades> list = new ArrayList<SemGrades>();
		List<Enrollment> enrollments = db.getSHEnrollmentsByStudentNo(studentNo);
		
		for(Enrollment e: enrollments) {
			float average = 0;
			SemGrades semGrades = new SemGrades();
			semGrades.setEnrollment(e);
			semGrades.setGrades(db.getSHGradesFromCurrentSem(e.getEnrollmentNo()));
			for(SubjectGrades sg: semGrades.getGrades()) {
				sg.setBackupGrade(sg.getFinalGrade());
				average += sg.getFinalGrade();
			}
			average /= semGrades.getGrades().size();
			semGrades.setAverage(average);

			list.add(semGrades);
		}
		allSemGrades.setSemGrades(list);
	
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentgrades");
		model.addObject("student", student);
		model.addObject("dept", "shs");
		model.addObject("allSemGrades", allSemGrades);
		
		return model;
	}
	
	@RequestMapping(value = "/clg/", method = RequestMethod.GET)
	public ModelAndView collegeStudentGrades(@RequestParam("studentNo") String studentNo) {
		logger.info("grades");
		
		StudentPersonal student = db.getStudentByNo(studentNo);
		SemGradesForm allSemGrades = new SemGradesForm();
		List<SemGrades> list = new ArrayList<SemGrades>();
		List<Enrollment> enrollments = db.getCollegeEnrollmentsByStudentNo(studentNo);
		
		System.out.println("Enrollments count: " + enrollments.size());
		for(Enrollment e: enrollments) {
			float average = 0;
			SemGrades semGrades = new SemGrades();
			semGrades.setEnrollment(e);
			semGrades.setGrades(db.getCollegeGradesForCurrentSem(e.getEnrollmentNo()));
			for(SubjectGrades sg: semGrades.getGrades()) {
				sg.setBackupGrade(sg.getFinalGrade());
				average += sg.getFinalGrade();
			}
			average /= semGrades.getGrades().size();
			semGrades.setAverage(average);
			list.add(semGrades);
		}
		allSemGrades.setSemGrades(list);
	
		
		ModelAndView model = new ModelAndView();
		model.setViewName("studentgrades");
		model.addObject("student", student);
		model.addObject("dept", "clg");
		model.addObject("allSemGrades", allSemGrades);
		
		return model;
	}
	
	@RequestMapping(value = "/clg/{scheduleID}", method = RequestMethod.GET)
	public ModelAndView collegeScheduleGrades(@PathVariable("scheduleID") String scheduleID) {
		logger.info("grades");
		Schedule schedule = db.getCollegeScheduleByID(scheduleID);
		
		String _class="LEC";
		
		if(schedule.getSubjectCode().contains("LAB")) {
			_class="LAB";
		}
		
		List<SubjectGrades> subjectGrades = db.getCollegeGradesBySchedule(scheduleID);
		System.out.println("Grades size: " + subjectGrades.size());
		
		SemGrades semGrades = new SemGrades();
		semGrades.setGrades(subjectGrades);
		
		for(SubjectGrades sg: semGrades.getGrades()) {
			sg.setBackupGrade(sg.getFinalGrade());
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("schedulegrades");
		model.addObject("dept", "clg");
		model.addObject("semGrades", semGrades);
		model.addObject("schedule", schedule);
		model.addObject("classType", _class);
	
		return model;
	}
	
	@RequestMapping(value = "/clg/save/", method = RequestMethod.POST)
	public ModelAndView saveStudentGrades(@RequestParam("studentNo") String studentNo, @ModelAttribute("allSemGrades") SemGradesForm sgf) {
		logger.info("Update Grades");
		System.out.println("List size: " + sgf.getSemGrades().size());
		
		Locale locale = new Locale("en_US");
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, locale);
		String formattedDate = dateFormat.format(date);
		
		for(SemGrades sg: sgf.getSemGrades()) {
			for(SubjectGrades g: sg.getGrades()) {
				if(g.getFinalGrade()!=g.getBackupGrade()) {
					System.out.println("Enrollment: "+ g.getEnrollmentNo());
					g.setDateModified(formattedDate);
					g.setEquivalentGrade(g.getFinalGrade());
					db.updateCollegeStudentGrading(g);
				}
			}
		} 	
		return new ModelAndView("redirect:/grades/clg/?studentNo="+ studentNo );
	}
	
	@RequestMapping(value = "/clg/save/{scheduleID}", method = RequestMethod.POST)
	public ModelAndView saveSubjectGrades(@PathVariable("scheduleID") String scheduleID, @ModelAttribute("semGrades") SemGrades sg) {
		logger.info("Update Grades");
		
		Locale locale = new Locale("en_US");
		Schedule schedule = db.getCollegeScheduleByID(scheduleID);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT, locale);
		String formattedDate = dateFormat.format(date);
		System.out.println("Grades to be saved: " + sg.getGrades().size());
	
		for(SubjectGrades g: sg.getGrades()) {
			if(g.getFinalGrade()!=g.getBackupGrade()) {
				System.out.println("Enrollment: "+ g.getEnrollmentNo());
				g.setSubjectCode(schedule.getSubjectCode());
				g.setDateModified(formattedDate);
				g.setEquivalentGrade(g.getFinalGrade());
				db.updateCollegeStudentGrading(g);
			}
		}
		
		return new ModelAndView("redirect:/grades/clg/"+ scheduleID );
	}
	
	@RequestMapping(value = "/shs/save/", method = RequestMethod.POST)
	public ModelAndView saveSHGrades(@RequestParam("studentNo") String studentNo, @ModelAttribute("allSemGrades") SemGradesForm sgf) {
		logger.info("Update Grades");
		System.out.println("List size: " + sgf.getSemGrades().size());
		
		for(SemGrades sg: sgf.getSemGrades()) {
			for(SubjectGrades g: sg.getGrades()) {
				db.updateSHSubjectGrading(g);
			
			}
		}

		return new ModelAndView("redirect:/grades/shs/?studentNo="+ studentNo );
	}
	
	@RequestMapping(value = "/clg/tor/", method = RequestMethod.GET)
	public ModelAndView saveStudentGrades(@RequestParam("studentNo") String studentNo) {
		logger.info("Update Grades");
		List<SubjectGrades> credited = db.getAllCreditedCollegeGrades(studentNo);
		StudentProfile student = db.getCollegeProfileByNo(studentNo);
		Collections.sort(credited);
	
		System.out.println("Credited Grades: "+ credited.size());
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		ModelAndView model = new ModelAndView();
		model.setViewName("transcriptForm");
		model.addObject("student", student);
		model.addObject("dept", "clg");
		model.addObject("sems", sems);
		model.addObject("credited", credited);
		model.addObject("subject", new Subject());
		
		
		return model;
	}

	@RequestMapping(value = "/clg/tor/print/", method = RequestMethod.GET)
	public ModelAndView printStudentTOR(@RequestParam("studentNo") String studentNo) {
		logger.info("Update Grades");
		System.out.println("Student No: "+ studentNo);
		List<SubjectGrades> credited = db.getAllCreditedCollegeGrades(studentNo);
		StudentProfile student = db.getCollegeProfileByNo(studentNo);
		Collections.sort(credited);
	
		SemGradesForm allSemGrades = new SemGradesForm();
		List<SemGrades> list = new ArrayList<SemGrades>();
		List<Enrollment> enrollments = db.getCollegeEnrollmentsByStudentNo(studentNo);
		
		System.out.println("Enrollments count: " + enrollments.size());
		for(Enrollment e: enrollments) {
			float average = 0;
			SemGrades semGrades = new SemGrades();
			semGrades.setEnrollment(e);
			semGrades.setGrades(db.getCollegeGradesForCurrentSem(e.getEnrollmentNo()));
			for(SubjectGrades sg: semGrades.getGrades()) {
				sg.setBackupGrade(sg.getFinalGrade());
				average += sg.getFinalGrade();
			}
			average /= semGrades.getGrades().size();
			semGrades.setAverage(average);
			Collections.sort(semGrades.getGrades());
			list.add(semGrades);
		}
		allSemGrades.setSemGrades(list);
	
		System.out.println("Credited Grades: "+ credited.size());
		String [] sems = {"", "1st Semester","2nd Semester", "Summer"};
		System.out.println("Student Name: " + student.getFirstName());

		ModelAndView model = new ModelAndView();
		model.setViewName("printTOR");
		model.addObject("student", student);
		model.addObject("dept", "clg");
		model.addObject("sems", sems);
		model.addObject("credited", credited);
		model.addObject("subject", new Subject());
		model.addObject("allSemGrades", allSemGrades);
		
		return model;
			
	}
	
	@RequestMapping(value = "/clg/grades/print/", method = RequestMethod.GET)
	public ModelAndView printStudentGrades(@RequestParam("studentNo") String studentNo) {
		logger.info("Update Grades");
		System.out.println("Student No: "+ studentNo);
		StudentProfile student = db.getCollegeProfileByNo(studentNo);
	
		SchoolYear sy = db.getActiveSchoolYear();
		Enrollment e = db.getCollegeEnrollmentBySY(studentNo, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		SemGrades semGrades = new SemGrades();
		semGrades.setGrades(db.getCollegeGradesForCurrentSem(e.getEnrollmentNo()));
	
		String [] sems = {"", "1st Semester","2nd Semester", "Summer"};
		System.out.println("Student Name: " + student.getFirstName());

		ModelAndView model = new ModelAndView();
		model.setViewName("printGrades");
		model.addObject("student", student);
		model.addObject("semGrades", semGrades);
		model.addObject("schoolYear", e.getSchoolYear()+"-"+sems[e.getSemester()]);
		model.addObject("subject", new Subject());
		
		return model;
			
	}

}
