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
import com.benedicto.mis.beans.formbackers.StrandSubjects;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/courses")
public class CourseController {

	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

	@Autowired
	studentdb db;// will inject dao from xml file

	/**
	 * Simply selects the home view to render by returning its name.
	 */


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView courses() {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		List<Course> list = db.getCollegeCourses("");
		String formattedDate = dateFormat.format(date);

		ModelAndView model = new ModelAndView();
		model.setViewName("courses");
		model.addObject("serverTime", formattedDate);

		model.addObject("list", list);
		model.addObject("course", new Course());

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
	
	@RequestMapping(value = "/{courseID}", method = RequestMethod.GET)
	public ModelAndView curriculum(@PathVariable("courseID") String courseID) {
		Locale locale = new Locale("en_US");

		logger.info("Welcome home! The client locale is {}.", locale);

		Map<String, List<CurriculumSubject>> subjects = new HashMap<String, List<CurriculumSubject>>();
		List<Curriculum> currics = db.getCurriculumsByCourse(courseID);
		String [] years = {"", "1st Year","2nd Year", "3rd Year", "4th Year", "5th Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		Course course = db.getCourseByID(courseID);
		
		Curriculum c = currics.get(0);

		for (int i = 1; i <= 5; ++i) {
			subjects.put(i + "-1", db.getCurriculumSubjects(c.getCurriculumID(), i, 1));
			subjects.put(i + "-2", db.getCurriculumSubjects(c.getCurriculumID(), i, 2));
			subjects.put(i + "-3", db.getCurriculumSubjects(c.getCurriculumID(), i, 3));
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("course");
		model.addObject("courseID", courseID);
		model.addObject("subjects", subjects);
		model.addObject("years", years);
		model.addObject("sems", sems);
		
		model.addObject("course", course);
		model.addObject("curriculums", currics);

		return model;
	}
	
	@RequestMapping(value = "/printCurriculum/", method = RequestMethod.GET)
	public ModelAndView curriculumPrint(@RequestParam("curricID") String curricID) {
		Locale locale = new Locale("en_US");
		Curriculum curric = db.getCollegeCurriculumByID(curricID);
		logger.info("Welcome home! The client locale is {}.", locale);

		Map<String, List<CurriculumSubject>> subjects = new HashMap<String, List<CurriculumSubject>>();
		String [] years = {"", "1st Year","2nd Year", "3rd Year", "4th Year", "5th Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		Course course = db.getCourseByID(curric.getCourseID());

		for (int i = 1; i <= 5; ++i) {
			subjects.put(i + "-1", db.getCurriculumSubjects(curric.getCurriculumID(), i, 1));
			subjects.put(i + "-2", db.getCurriculumSubjects(curric.getCurriculumID(), i, 2));
			subjects.put(i + "-3", db.getCurriculumSubjects(curric.getCurriculumID(), i, 3));
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("printCurriculum");
		model.addObject("courseID", course.getCourseID());
		model.addObject("subjects", subjects);
		model.addObject("years", years);
		model.addObject("sems", sems);
		model.addObject("course", course);
		
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
