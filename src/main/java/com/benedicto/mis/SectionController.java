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
	
	@RequestMapping(value = "/sh/{sectionID}", method = RequestMethod.GET)
	public ModelAndView shSections(@PathVariable("sectionID") String sectionID) {
		
		List<Schedule> schedules = db.getSHSchedulesBySection(sectionID);
		List<Student> students = db.getSHStudentsBySection(sectionID, "", "2016-2017", 1);
		
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
	
	
	@RequestMapping(value = "/bsc/{sectionID}", method = RequestMethod.GET)
	public ModelAndView basicSections(@PathVariable("sectionID") String sectionID) {
		
		List<Schedule> schedules = db.getBSCSchedulesBySection(sectionID);
		List<Student> students = db.getBSCStudentsBySection(sectionID, "", "2016-2017", 1);
		
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
	

	


	@RequestMapping(value = "/newCourse", method = RequestMethod.POST)
	public ModelAndView addNewCourse(@ModelAttribute("course") Course c) {
		System.out.println("Add new course");
		db.createCourse(c);
		return new ModelAndView("redirect:/courses");
	}

	
	

	
}
