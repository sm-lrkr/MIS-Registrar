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
import com.benedicto.mis.beans.formbackers.SubjectsViewForm;



@Controller
@RequestMapping("subjects")
public class SubjectController {

	private static final Logger logger = LoggerFactory.getLogger(SubjectController.class);

	@Autowired
	studentdb db;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView subjects() {
		List<Subject> list = db.getSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("subjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}
	
	@RequestMapping(value = "/clg", method = RequestMethod.GET)
	public ModelAndView clgSubjects() {
		List<Subject> list = db.getSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("clgsubjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}
	
	@RequestMapping(value = "/sh", method = RequestMethod.GET)
	public ModelAndView shSubjects() {
		List<SubjectSHS> list = db.getSHSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("shsubjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}
	
	@RequestMapping(value = "/bsc", method = RequestMethod.GET)
	public ModelAndView bscSubjects() {
		List<SubjectSHS> list = db.getBSCSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("bscsubjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}

	
	@RequestMapping(value = "/subjectForm", method = RequestMethod.GET)
	public ModelAndView subjectForm(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new subject");
	
		return new ModelAndView("subjectForm", "subject", new Subject());
	}
	
	
	@RequestMapping(value = "/newSubject", method = RequestMethod.POST)
	public ModelAndView addNewSubject(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new course");
		db.createSubject(s);
		
		List<Subject> list = db.getSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("subjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}


}
