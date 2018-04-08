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


	@RequestMapping(value = "/deleteSPR/{studentID}")
	public ModelAndView deleteSPR(@PathVariable("studentID") String id) {
		// model.addAttribute("student", new Student());
		db.deleteSPR(id);
		return new ModelAndView("redirect: /index");
	}
}
