package com.benedicto.mis;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;
import com.benedicto.mis.beans.*;
import com.benedicto.mis.beans.containers.*;
import com.benedicto.mis.beans.formbackers.CurriculumForm;
import com.benedicto.mis.beans.formbackers.SubjectsViewForm;

@Controller
@RequestMapping("curriculums")
public class CurriculumController {

	private static final Logger logger = LoggerFactory.getLogger(CurriculumController.class);

	@Autowired
	studentdb db;// will inject dao from xml file

	
	@RequestMapping(value = "/addCurriculum/{courseID}")
	public ModelAndView addCurriculum(@PathVariable("courseID") String courseID) {
		logger.info("addCurriculum");
		
		String [] years = {"", "1st Year","2nd Year", "3rd Year", "4th Year", "5th Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		SubjectsViewForm subjects = new SubjectsViewForm();
		subjects.setSubjects(db.getCollegeSubjects(""));
		Course course = db.getCourseByID(courseID);
		Curriculum c = new Curriculum();
		c.setCurriculumID(course.getCourseDesc());
		c.setCurriculumDesc("");
		c.setCourseID(courseID);
		
		System.out.println("CourseID: "+ courseID);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("curriculum");
		model.addObject("curriculum", c);
		model.addObject("courseID", courseID);
		model.addObject("courseDesc", course.getCourseDesc());
		model.addObject("subjectsForm", subjects);
		model.addObject("years", years);
		model.addObject("sems", sems);
		model.addObject("saveType", "saveNew");
		
		return model;
	}
	
	@RequestMapping(value = "/editCurriculum/")
	public ModelAndView editCurriculum(@RequestParam("curricID") String curricID) {
		logger.info("addCurriculum");
		
		SchoolYear sy = db.getActiveSchoolYear();
		
		String [] years = {"", "1st Year","2nd Year", "3rd Year", "4th Year", "5th Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		
		Map<String, List<CurriculumSubject>> curricSubjects = new HashMap<String, List<CurriculumSubject>>();
		
		SubjectsViewForm subjects = new SubjectsViewForm();
		subjects.setSubjects(db.getCollegeSubjects(""));
		Curriculum c = db.getCollegeCurriculumByID(curricID);
		
		for(Subject S: subjects.getSubjects()) {
			
		}
		
		for (int i = 1; i <= 5; ++i) {
			curricSubjects.put(i + "-1", db.getCurriculumSubjects(c.getCurriculumID(), i, 1));
			curricSubjects.put(i + "-2", db.getCurriculumSubjects(c.getCurriculumID(), i, 2));
			curricSubjects.put(i + "-3", db.getCurriculumSubjects(c.getCurriculumID(), i, 3));
		}
		
		//System.out.println("CourseID: "+ courseID);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("curriculum");
		model.addObject("curriculum", c);
		//model.addObject("courseID", courseID);
		//model.addObject("courseDesc", course.getCourseDesc());
		model.addObject("subjectsForm", subjects);
		model.addObject("curricSubjects", curricSubjects);
		model.addObject("years", years);
		model.addObject("sems", sems);
		model.addObject("saveType", "saveNew");
		
		return model;
	}
	
	@RequestMapping(value = "/addCurriculum/sh/{strandCode}")
	public ModelAndView addSHCurriculum(@PathVariable("strandCode") String strandCode) {
		logger.info("addCurriculum");
		
		String [] years = {"", "1st Year","2nd Year", "3rd Year", "4th Year", "5th Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		SubjectsViewForm subjects = new SubjectsViewForm();
		subjects.setSubjects(db.getSHSubjects(""));
		
		Curriculum c = new Curriculum();
		c.setCurriculumID("");
		c.setCurriculumDesc("");
		c.setStrandCode(strandCode);
		
		CurriculumForm curriculumForm = new CurriculumForm();
		curriculumForm.setCurricSubjects(new ArrayList<CurriculumSubject>());
		curriculumForm.setCurriculum(c);
		
		System.out.println("CourseID: "+ strandCode);
	
		ModelAndView model = new ModelAndView();
		model.setViewName("curriculumsh");
		model.addObject("curriculum", c);
		model.addObject("strandCode", strandCode);
		model.addObject("subjectsForm", subjects);
		model.addObject("years", years);
		model.addObject("sems", sems);
		model.addObject("saveType", "saveNew");
		return model;
	}
	
	@RequestMapping(value = "/addCurriculum/bsc")
	public ModelAndView addBSCCurriculum() {
		logger.info("addCurriculum");
		
		SubjectsViewForm subjects = new SubjectsViewForm();
		subjects.setSubjects(db.getBSCSubjects(""));
		
		Curriculum c = new Curriculum();
		c.setCurriculumID("");
		c.setCurriculumDesc("");
	
		CurriculumForm curriculumForm = new CurriculumForm();
		curriculumForm.setCurricSubjects(new ArrayList<CurriculumSubject>());
		curriculumForm.setCurriculum(c);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("curriculumbsc");
		model.addObject("curriculum", c);
		model.addObject("subjectsForm", subjects);
		model.addObject("saveType", "saveNew");
		return model;
	}


	
	@RequestMapping(value="selectValueChanged", method = RequestMethod.GET)
	@ResponseBody
	public String getSelectElements(@RequestParam("param") String param) {
			
		System.out.println("at selectedvaluechanged param: " + param);
		List<Curriculum> list = db.getCollegeCurriculums(param);
		StringBuilder builder = new StringBuilder();
		builder.append("<option value=\"NONE\" label=\"\" /> \n");
		for (Curriculum c: list) {
			builder.append("<option value=\""+c.getCurriculumID()+"\" label=\" "+ c.getCurriculumDesc() +" \" /> \n");
		}
		return builder.toString();
	}


	
	@RequestMapping(value="curriculumSubjects", method = RequestMethod.GET)
	@ResponseBody
	public String getCurriculumSubjects(@RequestParam("curricID") String curricID) {
			
		StringBuilder builder = new StringBuilder();
		
		Curriculum c = db.getCollegeCurriculumByID(curricID);
		
		builder.append("<tr><th>Id</th><th>Last Name</th><th>First Name</th><th>Middle Name</th><th></th></tr> \n");
		
		for (int year = 1; year <= 5; ++year) {
			builder.append("<h3>"+year+" ");
			builder.append(ordinal(year)+" Year</h3>");
			
			for (int sem = 1; sem <=3; ++sem) {
				List<CurriculumSubject> subjects = db.getCurriculumSubjects(c.getCurriculumID(), year, sem); 
				if(subjects.size() > 0) {
					builder.append("<table id=\"semsubjects\" class=\"listTable\">  ");
					
					builder.append("<tr><th colspan=\"6\" >" + ordinal(sem)+" Sem</th></tr>");
					builder.append("<tr><th rowspan=\"2\">CODE</th><th rowspan=\"2\">DESCRIPTIVE TITLE</th><th colspan=\"3\"> UNITS</th><th rowspan=\"2\">PRE-REQUISITE(s)</th></tr>  ");
					builder.append("<tr><th>LEC</th><th>LAB</th><th>TOTAL</th></tr>");
					for(CurriculumSubject s: subjects ) {
						builder.append("<tr>");
						builder.append("<td>"+s.getSubjectCode()+"</td>");
						builder.append("<td>"+s.getSubjectDesc()+"</td>");
						builder.append("<td>"+s.getLecUnits()+"</td>");
						builder.append("<td>"+s.getLabUnits()+"</td>");
						builder.append("<td></td>");
						builder.append("<td></td>");
						builder.append("<tr>");
					}
				}
				
			}
		}

		return builder.toString();
	}
	
	@RequestMapping(value = "/saveNew/", method = RequestMethod.POST)
	public ModelAndView saveNew( @ModelAttribute("curriculum") Curriculum c) {
		System.out.println("The course ID is: " + c.getCourseID());
		System.out.println("Desc: " + c.getCurriculumDesc());
		System.out.println("Year: " + c.getYearImplemented());
		
		int id = db.createCurriculum(c);
		String courseID = c.getCourseID();
		c = db.getLatestCourseCurriculum(courseID);
		
		db.updateCurricSubjects(id);
		return new ModelAndView("redirect:/courses/");
	}
	
	@RequestMapping(value = "/sh/saveNew/", method = RequestMethod.POST)
	public ModelAndView saveNewSH( @ModelAttribute("curriculum") Curriculum c) {
		System.out.println("The course ID is: " + c.getCourseID());
		System.out.println("Desc: " + c.getCurriculumDesc());
		System.out.println("Year: " + c.getYearImplemented());
		
		int id = db.createSHCurriculum(c);
		String strandCode = c.getStrandCode();
		c = db.getLatestStrandCurriculum(strandCode);
		db.updateSHCurricSubjects(id);
		
		return new ModelAndView("redirect:/courses/strands");
	}
	
	@RequestMapping(value = "/bsc/saveNew/", method = RequestMethod.POST)
	public ModelAndView saveNewBSC( @ModelAttribute("curriculum") Curriculum c) {
		System.out.println("The course ID is: " + c.getCourseID());
		System.out.println("Desc: " + c.getCurriculumDesc());
		System.out.println("Year: " + c.getYearImplemented());
		int id = db.createBSCCurriculum(c);
		db.updateBSCCurricSubjects(id);
		return new ModelAndView("redirect:/courses/bsc/?curricID="+id);
	}
	
	@RequestMapping(value = "/saveNewTest", method = RequestMethod.POST)
	@ResponseBody
	public String saveNewTest( @RequestBody ArrayList<CurriculumSubject> subjects,@RequestBody Curriculum curriculum) {
		
		System.out.println("The course ID is: " + curriculum.getCourseID());
		System.out.println("The number of subjects is: " + subjects.size());
		System.out.println("Desc: " + curriculum.getCurriculumDesc());
		System.out.println("Year: " + curriculum.getYearImplemented());
		
		db.createCurriculum(curriculum);
		String courseID = curriculum.getCourseID();
		curriculum = db.getLatestCourseCurriculum(courseID);
		
		for(CurriculumSubject cs: subjects) {
			db.saveCurriculumSubjects(curriculum.getCurriculumID(),cs.getSubjectCode(), cs.getYear(), cs.getSem());
		}			
		
		return "Success";
	}
	
	

	public String ordinal(int num) {
		switch(num) {
			case 1:
				return "1st";
			case 2:
				return "2nd";
			case 3:
				return "3rd";
			default:
				return String.valueOf(num)+"th";
		}
	}
	
	@RequestMapping(value="/searchCurriculumSubjects", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getSubjectsList(@RequestParam("param") String param, @ModelAttribute("subjects") SubjectsViewForm s, Model model) {
			
		if(s.getSubjects() != null) {
			System.out.println("search curriculum Subjects: " + param + "First checked value: " + s.getSubjects().get(0).isChecked());
		}
		
		SubjectsViewForm subs = new SubjectsViewForm();
		subs.setSubjects(db.getCollegeSubjects(param));
		
		return new ModelAndView("includes/subjectschecklist", "subjectsForm", subs);
	}
	
	
	@RequestMapping(value="/addCurriculumSubjects", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView enlistSubjects(@RequestParam("year") int year, @RequestParam("sem") int sem, @ModelAttribute("subjects") SubjectsViewForm s,
										@ModelAttribute("curriculumForm") CurriculumForm cf, @ModelAttribute("curriculum") Curriculum c) {
			
		String key = year+"-"+sem;
		System.out.println("Key: "+key);
		System.out.println("Subjects count: " + s.getSubjects().size());
		
		try {
			System.out.println("Curriculum subjects count: "+ cf.getCurricSubjects().size());
			System.out.println("Course ID: "+ c.getCourseID());
			for(CurriculumSubject cs: cf.getCurricSubjects()) {
				System.out.println(cs.getSubjectCode() + " - " + cs.getSubjectDesc());
			}
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			cf = new CurriculumForm();
			cf.setCurriculum(new Curriculum());
			cf.getCurriculum().setCourseID("BSIT");
			cf.setCurricSubjects(new ArrayList<CurriculumSubject>());
		}
		
		System.out.println("cf is alive");
		for(Subject S: s.getSubjects()) {
			if(S.isChecked()) {
				System.out.println(S.isChecked());
				CurriculumSubject cs = new CurriculumSubject();
				cs.setSubjectCode(S.getSubjectCode());
				cs.setSubjectDesc(S.getSubjectDesc());
				cs.setLecUnits(S.getLecUnits());
				cs.setLabUnits(S.getLabUnits());
				cs.setYear(year);
				cs.setSem(sem);
				
				S.setChecked(false);
				if(!cf.getCurricSubjects().contains(cs)) {
					cf.getCurricSubjects().add(cs);
				}
			}
		}
		
		System.out.println("Adding subjects complete. Sorting..");
		Collections.sort(cf.getCurricSubjects());
		System.out.println("Sort completed");
		
		String [] years = {"", "1st Year","2nd Year", "3rd Year", "4th Year", "5th Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("includes/curriculumForm");
		model.addObject("curriculumForm", cf);
		model.addObject("subjects",s);
		model.addObject("years", years);
		model.addObject("sems", sems);
		return model;
	}
	
	@RequestMapping(value="/removeCurriculumSubjects", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView removeSubjects( @ModelAttribute("curricForm") CurriculumForm cf) {
		
		try {
			System.out.println("Curriculum subjects count: "+ cf.getCurricSubjects().size());
			
			
			for(CurriculumSubject cs: cf.getCurricSubjects()) {
				System.out.println(cs.getSubjectCode() + " - " + cs.getSubjectDesc());
			}
		}
		catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			cf = new CurriculumForm();
			cf.setCurricSubjects(new ArrayList<CurriculumSubject>());
		}
		
		System.out.println("cf is alive");

		List<CurriculumSubject> curricSubjects = cf.getCurricSubjects();
		for(CurriculumSubject S: curricSubjects) {
			if(S.isChecked()) {
				System.out.println(S.isChecked());
				curricSubjects.remove(S);
				
			}
		}
		
		System.out.println("Remove subjects complete. Sorting..");
		Collections.sort(cf.getCurricSubjects());
		System.out.println("Sort completed");
		
		String [] years = {"", "1st Year","2nd Year", "3rd Year", "4th Year", "5th Year"};
		String [] sems = {"", "1st Sem","2nd Sem", "Summer"};
		
		ModelAndView model = new ModelAndView();
		model.setViewName("includes/curriculumForm");
		model.addObject("curricForm", cf);
		model.addObject("years", years);
		model.addObject("sems", sems);
		return model;
	}
}
