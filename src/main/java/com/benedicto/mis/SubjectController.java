package com.benedicto.mis;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
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
		List<Subject> list = db.getCollegeSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("subjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}
	
	@RequestMapping(value = "/clg", method = RequestMethod.GET)
	public ModelAndView clgSubjects() {
		List<Subject> list = db.getCollegeSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("clgsubjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}
	
	@RequestMapping(value = "/clg/{subjectCode}", method = RequestMethod.GET)
	public ModelAndView clgSubject(@PathVariable("subjectCode") String subjectCode) {
		Subject subject = db.getCollegeSubjectByCode(subjectCode);
		List<Schedule> schedules = db.getCollegeSchedules(subjectCode,"");
		List<Curriculum> currics = db.getCollegeCurriculumsBySubject(subjectCode);
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("subject");
		model.addObject("subjectType", "clg");
		model.addObject("subject", subject);
		model.addObject("schedules", schedules);
		model.addObject("currics", currics);
		return model;
	}
	
	@RequestMapping(value = "/sh", method = RequestMethod.GET)
	public ModelAndView shSubjects() {
		List<Subject> list = db.getSHSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("shsubjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}
	
	@RequestMapping(value = "/sh/{subjectCode}", method = RequestMethod.GET)
	public ModelAndView shSubject(@PathVariable("subjectCode") String subjectCode) {
		Subject subject = db.getSHSubjectByCode(subjectCode);
		List<Schedule> schedules = db.getSHSchedules(subjectCode,"");
		List<Curriculum> currics = db.getSHCurriculumsBySubject(subjectCode);
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("subject");
		model.addObject("subjectType", "shs");
		model.addObject("subject", subject);
		model.addObject("schedules", schedules);
		model.addObject("currics", currics);
		return model;
	}
	
	@RequestMapping(value = "/bsc", method = RequestMethod.GET)
	public ModelAndView bscSubjects() {
		List<Subject> list = db.getBSCSubjects("");
		ModelAndView model = new ModelAndView();
		model.setViewName("bscsubjects");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		return model;
	}

	
	@RequestMapping(value = "/newSubject/clg", method = RequestMethod.GET)
	public ModelAndView newCollegeSubject() {
		System.out.println("Add new subject");
		List<Subject> list = db.getCollegeSubjects("");
		System.out.println("List size: "+ list.size());
		ModelAndView model = new ModelAndView();
		model.setViewName("subjectForm");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		model.addObject("subjectType", "clg");
		model.addObject("formType", "newSubject");
		model.addObject("pageTitle", "New Subject");
		
		
		
		return model;
	}
	
	@RequestMapping(value = "/newSubject/sh", method = RequestMethod.GET)
	public ModelAndView newSHSubject() {
		System.out.println("Add new subject");
		List<Subject> list = db.getSHSubjects("");
		System.out.println("List size: "+ list.size());
		ModelAndView model = new ModelAndView();
		model.setViewName("subjectForm");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		model.addObject("subjectType", "sh");
		model.addObject("formType", "newSubject");
		model.addObject("pageTitle", "New Subject");
		
		
		
		return model;
	}
	
	
	@RequestMapping(value = "/newSubject/clg/save", method = RequestMethod.POST)
	public ModelAndView addNewCollegeSubject(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new course");
		db.createCollegeSubject(s);
		return new ModelAndView("redirect:/subjects/clg");
	}
	
	

	@RequestMapping(value = "/newSubject/sh/save", method = RequestMethod.POST)
	public ModelAndView addNewSHSubject(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new course");
		db.createSHSubject(s);
		
		return new ModelAndView("redirect:/subjects/sh");
	}

	@RequestMapping(value = "/editSubject/clg/{subjectCode}", method = RequestMethod.GET)
	public ModelAndView editCollegeSubject(@PathVariable("subjectCode") String subjectCode) {
		System.out.println("Edit existing subject");
		
		Subject subject = db.getCollegeSubjectByCode(subjectCode);
		List<Subject> list = db.getCollegeSubjects("");
		System.out.println("List size: "+ list.size());
		
		Iterator<Subject> i = list.iterator();
		while(i.hasNext()) {
			if(i.next().getSubjectCode().equals(subjectCode)) {
				i.remove();
			}
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("subjectForm");
		model.addObject("subjects", list);
		model.addObject("subject", subject);
		model.addObject("subjectType", "clg");
		model.addObject("formType", "editSubject");
		model.addObject("pageTitle", subject.getSubjectCode()+" - " + subject.getSubjectDesc());
		
		
		return model;
	}
	
	@RequestMapping(value = "/editSubject/clg/save/{subjectCode}", method = RequestMethod.POST)
	public ModelAndView saveEditedCollegeSubject(@PathVariable("subjectCode") String subjectCode, @ModelAttribute("subject") Subject s) {
		System.out.println("Save edited subject.");
		db.updateCollegeSubject(s, subjectCode);
		return new ModelAndView("redirect:/subjects/clg/"+ s.getSubjectCode());
	}	
	
	@RequestMapping(value = "/editSubject/shs/{subjectCode}", method = RequestMethod.GET)
	public ModelAndView editSHSubject(@PathVariable("subjectCode") String subjectCode) {
		System.out.println("Edit existing subject");
		List<Subject> list = db.getSHSubjects("");
		Subject subject = db.getSHSubjectByCode(subjectCode);
		System.out.println("List size: "+ list.size());
		
		Iterator<Subject> i = list.iterator();
		while(i.hasNext()) {
			if(i.next().getSubjectCode().equals(subjectCode)) {
				i.remove();
			}
		}
		
		ModelAndView model = new ModelAndView();
		model.setViewName("subjectForm");
		model.addObject("subjects", list);
		model.addObject("subject", subject);
		model.addObject("subjectType", "shs");
		model.addObject("formType", "editSubject");
		model.addObject("pageTitle", subject.getSubjectCode()+" - " + subject.getSubjectDesc());
		
		return model;
	}
	
	@RequestMapping(value = "/editSubject/shs/save/{subjectCode}", method = RequestMethod.POST)
	public ModelAndView saveEditedSHSubject(@PathVariable("subjectCode") String subjectCode, @ModelAttribute("subject") Subject s) {
		System.out.println("Save edited subject. --SH");
		db.updateSHSubject(s, subjectCode);
		return new ModelAndView("redirect:/subjects/clg/"+ s.getSubjectCode());
	}	
	
}
