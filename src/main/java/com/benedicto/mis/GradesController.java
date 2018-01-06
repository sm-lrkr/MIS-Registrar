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

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("grades")
public class GradesController {

	private static final Logger logger = LoggerFactory.getLogger(GradesController.class);

	@Autowired
	studentdb db;// will inject dao from xml file

	@RequestMapping(value = "/grades/{studentID}", method = RequestMethod.GET)
	public ModelAndView studentGrades(@PathVariable("studentID") String studentID) {
		logger.info("grades");
		List<SubjectGrades> grades = db.getStudentGrades(studentID);
		System.out.println("Student ID: " + studentID + " Size: " + grades.size());
		ModelAndView model = new ModelAndView();
		model.setViewName("studentgrades");
		model.addObject("grades", grades);
		model.addObject("studentID", studentID);
		return model;
	}
	

}
