package com.benedicto.mis;

import java.util.Iterator;
import java.util.List;

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



@Controller
@RequestMapping("subjects")
public class SubjectController {

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
	
	@RequestMapping(value = "/clg/", method = RequestMethod.GET)
	public ModelAndView clgSubject(@RequestParam("subjectCode") String subjectCode) {
		SchoolYear sy = db.getActiveSchoolYear();
		List<Schedule> schedules = db.getCollegeSchedules(subjectCode, sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
		Subject subject = db.getCollegeSubjectByCode(subjectCode);
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
		model.addObject("subjectType", "shs");
		
		return model;
	}

	@RequestMapping(value = "/sh/", method = RequestMethod.GET)
	public ModelAndView shSubject(@RequestParam("subjectCode") String subjectCode) {
		Subject subject = db.getSHSubjectByCode(subjectCode);
		SchoolYear sy = db.getActiveSchoolYear();
		List<Schedule> schedules = db.getSHSchedules(sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
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
		model.addObject("subjectType", "bsc");
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
	
	@RequestMapping(value = "/newSubject/bsc", method = RequestMethod.GET)
	public ModelAndView newBSCSubject() {
		System.out.println("Add new subject");
		List<Subject> list = db.getBSCSubjects("");
		System.out.println("List size: "+ list.size());
		
		ModelAndView model = new ModelAndView();
		model.setViewName("subjectForm");
		model.addObject("subjects", list);
		model.addObject("subject", new Subject());
		model.addObject("subjectType", "bsc");
		model.addObject("formType", "newSubject");
		model.addObject("pageTitle", "New Subject");
		
		return model;
	}
	
	
	@RequestMapping(value = "/newSubject/clg/save", method = RequestMethod.POST)
	public ModelAndView addNewCollegeSubject(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new clg subject ");
		db.createCollegeSubject(s);
		return new ModelAndView("redirect:/subjects/clg");
	}
	
	

	@RequestMapping(value = "/newSubject/sh/save", method = RequestMethod.POST)
	public ModelAndView addNewSHSubject(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new sh subject");
		db.createSHSubject(s);
		
		return new ModelAndView("redirect:/subjects/sh");
	}

	@RequestMapping(value = "/newSubject/bsc/save", method = RequestMethod.POST)
	public ModelAndView addNewBSCSubject(@ModelAttribute("subject") Subject s) {
		System.out.println("Add new bsc subject");
		db.createBSCSubject(s);
		
		return new ModelAndView("redirect:/subjects/sh");
	}

	@RequestMapping(value = "/editSubject/clg/", method = RequestMethod.GET)
	public ModelAndView editCollegeSubject(@RequestParam("subjectCode") String subjectCode) {
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
		model.addObject("subjectCode", "/?origCode="+subjectCode);
		model.addObject("subject", subject);
		model.addObject("subjectType", "clg");
		model.addObject("formType", "editSubject");
		model.addObject("pageTitle", subject.getSubjectCode()+" - " + subject.getSubjectDesc());
		
		return model;
	}

	@RequestMapping(value = "/editSubject/clg/save/", method = RequestMethod.POST)
	public ModelAndView saveEditedCollegeSubject(@RequestParam("origCode") String origCode,@ModelAttribute("subject") Subject s) {
		System.out.println("Save edited subject.");
		db.updateCollegeSubject(s, origCode);
		return new ModelAndView("redirect:/subjects/clg/?subjectCode="+ s.getSubjectCode());
	}	
	
	@RequestMapping(value = "/editSubject/shs/{subjectCode}", method = RequestMethod.POST)
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
