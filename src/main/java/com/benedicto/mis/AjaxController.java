package com.benedicto.mis;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ModelAttribute;  
import org.springframework.web.servlet.ModelAndView;
import com.benedicto.mis.beans.*;
import com.benedicto.mis.beans.containers.*;
import com.benedicto.mis.beans.formbackers.CurriculumForm;
import com.benedicto.mis.beans.formbackers.DaysCollector;
import com.benedicto.mis.beans.formbackers.SubjectsViewForm;

@Controller
@RequestMapping("ajax")
public class AjaxController {

	@Autowired  
    studentdb db;
	
	@RequestMapping(value="/searchstudent/", method = RequestMethod.GET)
	@ResponseBody
	public List<StudentProfile> searchstudent(@RequestParam("param") String param, @RequestParam("courseID") String courseID) {
		System.out.println("search param: " + param);
		System.out.println("course ID: " + courseID);
		
		List<StudentProfile> list = db.getCollegeStudents(param,courseID);
		System.out.println("list size: " + list.size());
		
		return list;
	}
	

	@RequestMapping(value="/searchSHstudents/", method = RequestMethod.GET)
	@ResponseBody
	public List<StudentProfile> searchSHstudent(@RequestParam("param") String param, @RequestParam("strandCode") String strandCode) {
		System.out.println("search param: " + param);
		System.out.println("strandCode: " + strandCode);
		
		List<StudentProfile> list = db.getSHStudents(param, strandCode);
		System.out.println("list size: " + list.size());
		return list;
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
	
	@RequestMapping(value="StrandChanged", method = RequestMethod.GET)
	@ResponseBody
	public String getSHCurricus(@RequestParam("param") String param) {
			
		System.out.println("at selectedvaluechanged param: " + param);
		List<Curriculum> list = db.getSHCurriculums(param);
		StringBuilder builder = new StringBuilder();
		builder.append("<option value=\"NONE\" label=\"\" /> \n");
		for (Curriculum c: list) {
			builder.append("<option value=\""+c.getCurriculumID()+"\" label=\" "+ c.getCurriculumDesc() +" \" /> \n");
		}
		return builder.toString();
	}
	
	@RequestMapping(value="departmentSelectChanged", method = RequestMethod.GET)
	@ResponseBody
	public String getDepartmentSelectElements(@RequestParam("param") String param) {
			
		System.out.println("at selectedvaluechanged param: " + param);
		List<Course> list = db.getCollegeCourses(param);
		StringBuilder builder = new StringBuilder();
		builder.append("<option value=\"\" label=\"\" /> \n");
		for (Course c: list) {
			builder.append("<option value=\""+c.getCourseID()+"\" label=\" "+ c.getCourseDesc() +" \" /> \n");
		}
		return builder.toString();
	}
	
	@RequestMapping(value="/curriculumSubjects", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView getSubjectsList(@RequestParam("param") String param, @ModelAttribute("subjects") SubjectsViewForm s, Model model) {
			
		if(s.getSubjects() != null) {
			System.out.println("search curriculum Subjects: " + param + "First checked value: " + s.getSubjects().get(0).isChecked());
		}
		
		SubjectsViewForm subs = new SubjectsViewForm();
		subs.setSubjects(db.getCollegeSubjects(param));
		
		return new ModelAndView("includes/subjectschecklist", "subjectsForm", subs);
	}
	
	
	@RequestMapping(value="/studentIDExists/", method = RequestMethod.GET)
	@ResponseBody
	public String studentIDExists(@RequestParam("studentID") String studentID) {
		StudentProfile sp = db.getCollegeProfileByID(studentID);
		
	
		return sp.getStudentID();
	}
	
	
	@RequestMapping(value="/enlistSubjects", method = RequestMethod.POST)
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
	
	
	
	
	@RequestMapping(value="schedSearch", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView  getSchedulesByDays(@RequestParam("param") String param,  @ModelAttribute("daysCollector") DaysCollector collector) {
		System.out.println("at selectedvaluechanged param: " + param + "Days: " +  collector.getDays()[0]);
		
		String days = "";
		boolean[] checked = collector.getDays();
		if(checked[0]) 
			days = days.concat("M");
		if(checked[1]) 
			days = days.concat("T");
		if(checked[2]) 
			days = days.concat("W");
		if(checked[3]) 
			days = days.concat("Th");
		if(checked[4]) 
			days = days.concat("F");
		if(checked[5]) 
			days = days.concat("S");
		if(checked[6]) 
			days = days.concat("Su");

		
		//System.out.println("schedules: "+ schedules.size());
		System.out.println("Getting schedules");
		
		SchoolYear sy = db.getActiveSchoolYear();
		List<Schedule> schedules = db.getCollegeSchedules("", sy.getYear_start()+"-"+sy.getYear_end(), sy.getSemester());
	
		return new ModelAndView("includes/classesview", "schedules", schedules);
	}
	

	@RequestMapping(value="/saveSubjectToCurric", method = RequestMethod.POST)
	@ResponseBody
	public String saveSubjectsToCurric(@RequestParam("subjectCode") String subjectCode,
			 								@RequestParam("yr") int yr,@RequestParam("sem") int sem) {
		System.out.println("SubjectCode: "+ subjectCode + " Year: "+ yr + " sem: " + sem );
		db.saveCurriculumSubjects("0", subjectCode, yr, sem);
		return "success";
	}
	
	@RequestMapping(value="/saveSubjectToCurric/sh/", method = RequestMethod.POST)
	@ResponseBody
	public String saveSubjectsSHToCurric(@RequestParam("subjectCode") String subjectCode,
			 								@RequestParam("yr") int yr,@RequestParam("sem") int sem) {
		System.out.println("wahahahah");
		db.saveSHCurriculumSubjects("0", subjectCode, yr, sem);
		return "success";
	}
	
	
	@RequestMapping(value="/saveSubjectToCurric/bsc/", method = RequestMethod.POST)
	@ResponseBody
	public String saveSubjectsBSCToCurric(@RequestParam("subjectCode") String subjectCode,
			 								@RequestParam("yr") int yr) {
		System.out.println("wahahahah");
		db.saveBSCCurriculumSubjects("0", subjectCode, yr);
		return "success";
	}

}
