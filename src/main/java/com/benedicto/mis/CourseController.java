package com.benedicto.mis;

import java.text.DateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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
import com.benedicto.mis.beans.formbackers.StrandSubjects;


@Controller
@RequestMapping("courses")
public class CourseController {
	
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

	@Autowired
	studentdb db;// will inject dao from xml file

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
	
	@RequestMapping(value = "/newCourse", method = RequestMethod.GET)
	public ModelAndView newCollegeCourse() {
		System.out.println("Add new course");
		List<Department> depts = db.getDepartments("");
		//Course c = db.getCourseByID(courseID);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("courseForm");
		model.addObject("course", new Course());
		model.addObject("departments",	 depts);
		model.addObject("saveType","saveNewCourse");
		
		return model;
	}
	
	@RequestMapping(value = "/editCourse/", method = RequestMethod.GET)
	public ModelAndView editCollegeCourse(@RequestParam("courseID") String courseID) {
		System.out.println("Edit course: " + courseID);
		List<Department> depts = db.getDepartments("");
		Course course =  db.getCourseByID(courseID);
		System.out.println("Edit1 course: " + courseID);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("courseForm");
		model.addObject("course", course);
		model.addObject("departments",	 depts);
		model.addObject("id",	 courseID);
		model.addObject("saveType","saveEditedCourse");
		return model;
		
	}
	
	@RequestMapping(value = "/newStrand", method = RequestMethod.GET)
	public ModelAndView newSHStrand() {
		System.out.println("Add new subject");
		List<Department> depts = db.getDepartments("");
		
		ModelAndView model = new ModelAndView();
		model.setViewName("strandForm");
		model.addObject("strand", new Strand());
		model.addObject("departments",	 depts);
		
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
	
	@RequestMapping(value = "/{courseID}/", method = RequestMethod.GET)
	public ModelAndView curriculum(@PathVariable("courseID") String courseID, @RequestParam("curricID") String curricID) {
		Locale locale = new Locale("en_US");

		logger.info("Welcome home! The client locale is {}.", locale);

		Map<String, List<CurriculumSubject>> subjects = new HashMap<String, List<CurriculumSubject>>();
		List<Curriculum> currics = db.getCurriculumsByCourse(courseID);
		String [] years = {"", "1st Year","2nd Year", "3rd Year", "4th Year", "5th Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		Course course = db.getCourseByID(courseID);
		Curriculum c = new Curriculum();
		if(currics.size() >0 ) {
			if(curricID.equals(""))
				c = currics.get(0);
			else
				c = db.getCollegeCurriculumByID(curricID);
			
			for (int i = 1; i <= 5; ++i) {
				subjects.put(i + "-1", db.getCurriculumSubjects(c.getCurriculumID(), i, 1));
				subjects.put(i + "-2", db.getCurriculumSubjects(c.getCurriculumID(), i, 2));
				subjects.put(i + "-3", db.getCurriculumSubjects(c.getCurriculumID(), i, 3));
			}
		}

		
		ModelAndView model = new ModelAndView();
		model.setViewName("course");
		model.addObject("courseID", courseID);
		model.addObject("subjects", subjects);
		model.addObject("years", years);
		model.addObject("sems", sems);
		model.addObject("curricID", c.getCurriculumID());
		model.addObject("course", course);
		model.addObject("curriculums", currics);

		return model;
	}
	
	@RequestMapping(value = "/strands/{strandCode}/", method = RequestMethod.GET)
	public ModelAndView strand(@PathVariable("strandCode") String strandCode, @RequestParam("curricID") String curricID ) {
		
		List<Curriculum> currics = db.getSHCurriculumsByStrand(strandCode);
		StrandSubjects strandSubjects = new StrandSubjects();
		
		String [] years = {"", "Grade 11","Grade 12"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		Curriculum c = new Curriculum();
		Strand strand = db.getSHStrandByCode(strandCode);
		if(currics.size() > 0) {
			if(curricID.equals(""))
				c = currics.get(0);
			else
				c = db.getSHCurriculumByID(curricID);
			
			System.out.println("Curriculum id: " + c.getCurriculumID());
			
			strandSubjects.setSubjects(db.getStrandSubjects(c.getCurriculumID()));
			System.out.println("Subjects from strand: " + strandSubjects.getSubjects().size());
			Collections.sort(strandSubjects.getSubjects());
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("strand");
		model.addObject("years", years);
		model.addObject("sems", sems);
		model.addObject("strand", strand);
		model.addObject("strandSubjects", strandSubjects);
		model.addObject("curriculums", currics);
		
		return model;
	}
	
	@RequestMapping(value = "/bsc", method = RequestMethod.GET)
	public ModelAndView bscCurric(@RequestParam("curricID") String curricID ) {
		
		List<Curriculum> currics = db.getBSCCurriculums("");
		StrandSubjects strandSubjects = new StrandSubjects();
		
		Curriculum c = new Curriculum();
		
		if(currics.size() > 0) {
			if(curricID.equals(""))
				c = currics.get(0);
			else
				c = db.getBSCCurriculumByID(curricID);
			
			System.out.println("Curriculum id: " + c.getCurriculumID());
			
			strandSubjects.setSubjects(db.getBSCCurricSubjects(c.getCurriculumID()));
			System.out.println("Subjects from strand: " + strandSubjects.getSubjects().size());
			Collections.sort(strandSubjects.getSubjects());
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("bscCurriculum");
		model.addObject("strandSubjects", strandSubjects);
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
		model.addObject("curric", curric);
		model.addObject("subjects", subjects);
		model.addObject("years", years);
		model.addObject("sems", sems);
		model.addObject("course", course);
		
		return model;
	}
	
	@RequestMapping(value = "/strands/printCurriculum/", method = RequestMethod.GET)
	public ModelAndView curriculumPrintSH(@RequestParam("curricID") String curricID) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		Curriculum c = db.getSHCurriculumByID(curricID);
		List<Curriculum> currics = db.getSHCurriculumsByStrand(c.getStrandCode());
		StrandSubjects strandSubjects = new StrandSubjects();
		
		String [] years = {"", "Grade 11","Grade 12"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		
		Strand strand = db.getSHStrandByCode(c.getStrandCode());
		if(currics.size() > 0) {
			if(curricID.equals(""))
				c = currics.get(0);
			else
				c = db.getSHCurriculumByID(curricID);
			
			System.out.println("Curriculum id: " + c.getCurriculumID());
			
			strandSubjects.setSubjects(db.getStrandSubjects(c.getCurriculumID()));
			System.out.println("Subjects from strand: " + strandSubjects.getSubjects().size());
			Collections.sort(strandSubjects.getSubjects());
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("printCurriculumSH");
		model.addObject("years", years);
		model.addObject("sems", sems);
		model.addObject("curric", c);
		model.addObject("strandCode", strand.getStrandCode());
		model.addObject("strand", strand);
		model.addObject("strandSubjects", strandSubjects);
		model.addObject("curriculums", currics);
		
		return model;
	}
	

	@RequestMapping(value = "/saveNewCourse/", method = RequestMethod.POST)
	public ModelAndView addNewCourse(@ModelAttribute("course") Course c) {
		System.out.println("Add new course: " + c.getCourseID());
		db.createCourse(c);
		return new ModelAndView("redirect:/courses/");
	}

	@RequestMapping(value = "/saveEditedCourse/{courseID}", method = RequestMethod.POST)
	public ModelAndView editCourse(@PathVariable("courseID") String courseID, @ModelAttribute("course") Course c) {
		System.out.println("Edit course: "+ courseID);
		db.editCourse(c, courseID);
		return new ModelAndView("redirect:/courses/");
	}
	
	@RequestMapping(value = "/saveNewStrand", method = RequestMethod.POST)
	public ModelAndView addNewStrand(@ModelAttribute("strand") Strand s) {
		System.out.println("Add new strand");
		db.createStrand(s);
		return new ModelAndView("redirect:/strands/");
	}
}
