package com.benedicto.mis;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
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
import com.benedicto.mis.beans.formbackers.CurriculumForm;
import com.benedicto.mis.beans.formbackers.SchedulesViewForm;
import com.benedicto.mis.beans.formbackers.StrandSubjects;
import com.benedicto.mis.beans.formbackers.StudentsViewForm;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/sections")
public class SectionController {

	private static final Logger logger = LoggerFactory.getLogger(SectionController.class);

	@Autowired
	studentdb db;// will inject dao from xml file

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	
	@RequestMapping(value = "/clg", method = RequestMethod.GET)
	public ModelAndView clgSections() {
		List<Section> list = db.getSHSections("");


		ModelAndView model = new ModelAndView();
		model.setViewName("sections");
		model.addObject("sections", list);

		return model;
	}
	

	@RequestMapping(value = "/sh", method = RequestMethod.GET)
	public ModelAndView shSections() {
		List<Section> list = db.getSHSections("");


		ModelAndView model = new ModelAndView();
		model.setViewName("sections");
		model.addObject("sections", list);

		return model;
	}
	
	@RequestMapping(value = "/bsc", method = RequestMethod.GET)
	public ModelAndView bscSections() {
		List<Section> list = db.getBSCSections("");


		ModelAndView model = new ModelAndView();
		model.setViewName("bscsections");
		model.addObject("sections", list);

		return model;
	}

	@RequestMapping(value = "/strands", method = RequestMethod.GET)
	public ModelAndView strands() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		List<Strand> list = db.getSHStrands("");

		ModelAndView model = new ModelAndView();
		model.setViewName("strands");

		model.addObject("strands", list);
		return model;
	}
	
	@RequestMapping(value = "/sh/", method = RequestMethod.GET)
	public ModelAndView shSections(@RequestParam("sectionID") String sectionID) {
		
		List<Schedule> schedules = db.getSHSchedulesBySection(sectionID);
		List<StudentProfile> students = db.getSHStudentsBySection(sectionID, "", "2017-2018", 1);
		List<Teacher> teachers = db.getPersonnels("");
		
		
		SchedulesViewForm schedulesForm = new SchedulesViewForm();
		StudentsViewForm studentsForm = new StudentsViewForm();
		
		Section s = db.getSHSectionByID(sectionID);
		
		schedulesForm.setSchedules(schedules);
		studentsForm.setStudents(students);
	
		
		System.out.println("Students in section: " + students.size());
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("section");
		
		model.addObject("section", s);
		model.addObject("sectionType", "sh");
		model.addObject("formType", "editSection");
		model.addObject("schedulesForm", schedulesForm);
		model.addObject("enlisted", studentsForm);
		model.addObject("teachers", teachers);
		model.addObject("sectionName", s.getSectionName());
		
		return model;
	}
	
	@RequestMapping(value = "/sh/enlistment/", method = RequestMethod.GET)
	public ModelAndView sectionEnlistment(@RequestParam("sectionID") String sectionID) {
		
		Section s = db.getSHSectionByID(sectionID);
		
		List<StudentProfile> list = db.getSHStudentsBySection(sectionID, "", "2017-2018", 1);
		List<StudentProfile> list1 = db.getUnenlistedSHStudentsByStrand( sectionID, s.getStrandCode(), "2017-2018", 1);
		
		
		StudentsViewForm enlisted = new StudentsViewForm();
		StudentsViewForm unEnlisted = new StudentsViewForm();
		enlisted.setStudents(list);
		unEnlisted.setStudents(list1);
		
		System.out.println("Students in section: " + list.size()+" Unenlisted:" + list1.size());
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("enlistToSHSection");
		model.addObject("section", s);
		model.addObject("sectionType", "sh");
		model.addObject("formType", "editSection");
		model.addObject("enlisted", enlisted);
		model.addObject("unEnlisted", unEnlisted);
		model.addObject("sectionName", s.getSectionName());
		
		return model;
	}
	
	@RequestMapping(value = "/sh/enlist/", method = RequestMethod.POST)
	public ModelAndView enlistToSection(@RequestParam("sectionID") String sectionID, @ModelAttribute("unEnlisted") StudentsViewForm unenlisted) {

		SchedulesViewForm schedules = new SchedulesViewForm();
		SchedulesViewForm enlisted = new SchedulesViewForm();
		
		schedules.setSchedules(db.getSHSchedulesBySection(sectionID));
		
		for(StudentProfile sp: unenlisted.getStudents()) {
			System.out.println("Student No to be enlisted to section: " + sp.getStudentNo());
			if(sp.isChecked()) {
				
				SchoolYear sy = db.getActiveSchoolYear();
				Enrollment e = db.getCollegeEnrollmentBySY(sp.getStudentNo(), sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
				
				if(e.getEnrollmentNo().equals("")) {
					e.setStudentNo(sp.getStudentNo());
					e.setSchoolYear(sy.getYear_start()+"-"+sy.getYear_end());
					e.setSemester(1);
					e.setStrandCode(sp.getStrandCode());
					e.setSectionID(sectionID);
					System.out.println("Student not enrolled for the current sem. Adding new enrollment. ");
					db.addNewSHEnrollment(e);
					e = db.getSHEnrollmentBySY(sp.getStudentNo(), sy.getYear_start()+"-"+sy.getYear_end(), 1);
				}
				db.enlistSHToSection(e, sectionID);
				for(Schedule s: schedules.getSchedules()) {
					db.enlistSHStudentSchedules(e, s.getScheduleID());
					db.addSHSubjectGrading(s, e.getEnrollmentNo());
				}
			}
		}
		return new ModelAndView("redirect:/sections/sh/enlistment/?sectionID="+ sectionID);
	}
	
	@RequestMapping(value = "/sh/withdraw/", method = RequestMethod.POST)
	public ModelAndView unenlistFromSection(@ModelAttribute("enlisted") StudentsViewForm enlisted,
			@RequestParam("sectionID") String sectionID) {
		
		for(StudentProfile sp: enlisted.getStudents()) {
			Enrollment e = db.getSHEnrollmentBySY(sp.getStudentNo(), "2017-2018", 1);
			SchedulesViewForm _enlisted = new SchedulesViewForm();
			_enlisted.setSchedules(db.getSHEnlistedSubjects(sp.getStudentNo(), e.getEnrollmentNo()));
			
			if(sp.isChecked()) {
				db.withdrawSHFromSection(e, sectionID);
				for(Schedule s: _enlisted.getSchedules()) {
					db.withdrawSHSubjects(e, s.getScheduleID());
					db.removeSHSubjectsGrading(e, s.getSubjectCode());
				}
			}
			
		}
		return new ModelAndView("redirect:/sections/sh/enlistment/?sectionID="+ sectionID);
	}
	
	@RequestMapping(value = "/bsc/{sectionID}", method = RequestMethod.GET)
	public ModelAndView basicSections(@PathVariable("sectionID") String sectionID) {
		
		List<Schedule> schedules = db.getBSCSchedulesBySection(sectionID);
		List<StudentProfile> students = db.getBSCStudentsBySection(sectionID, "", "2016-2017", 1);
		
		SchedulesViewForm schedulesForm = new SchedulesViewForm();
		StudentsViewForm studentsForm = new StudentsViewForm();
		
		Section s = db.getSHSectionByID(sectionID);
		
		schedulesForm.setSchedules(schedules);
		studentsForm.setStudents(students);
	
		
		System.out.println("Students in section: " + students.size());
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("section");
		model.addObject("schedulesForm", schedulesForm);
		model.addObject("studentsForm", studentsForm);
		model.addObject("sectionName", s.getSectionName());
		
		return model;
	}
	
	@RequestMapping(value = "/strands/{strandCode}", method = RequestMethod.GET)
	public ModelAndView strand(@PathVariable("strandCode") String strandCode) {
		
		List<Curriculum> currics = db.getSHCurriculumsByStrand(strandCode);
		StrandSubjects strandSubjects = new StrandSubjects();
		
		String [] years = {"", "Grade 11","Grade 12"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		Strand strand = db.getSHStrandByCode(strandCode);
		Curriculum c = currics.get(0);

		
		strandSubjects.setSubjects(db.getStrandSubjects(c.getCurriculumID()));
		Collections.sort(strandSubjects.getSubjects());
		
		System.out.println("Subjects from strand: " + strandSubjects.getSubjects().size());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("strand");
		
		model.addObject("years", years);
		model.addObject("sems", sems);
		
		model.addObject("strand", strand);
		model.addObject("strandSubjects", strandSubjects);
		model.addObject("curriculums", currics);
		
		return model;
		
	}
	

	@RequestMapping(value = "/newSection/sh", method = RequestMethod.GET)
	public ModelAndView newSHSection() {
		System.out.println("Add new subject");
		List<Subject> list = db.getSHSubjects("");
		List<Strand> strands = db.getSHStrands("");
		List<Teacher> teachers = db.getPersonnels("");
		
		System.out.println("List size: "+ list.size());
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("sectionForm");
		model.addObject("section", new Section());
		model.addObject("sectionType", "sh");
		model.addObject("strands", strands);
		model.addObject("teachers", teachers);
		
		model.addObject("formType", "newSection");
		model.addObject("pageTitle", "New Section");
		
		return model;
	}
	
	
}
