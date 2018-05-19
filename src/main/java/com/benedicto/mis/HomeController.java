package com.benedicto.mis;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import com.benedicto.mis.beans.*;
import com.benedicto.mis.beans.containers.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	studentdb db;// will inject dao from xml file


	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("redirect:/index");
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
//		List<StudentProfile> list = db.getAllStudents("","");
//		List<Department> departments = db.getDepartments("");
//		List<Course> courses = db.getCollegeCourses("");
//	
//		ModelAndView model = new ModelAndView();
//		model.setViewName("students");
//		model.addObject("students", list);
//		model.addObject("departments", departments);
//		model.addObject("courses", courses);
//		return model;
		User user = (User) session.getAttribute("user");
		if(user != null )
			return new ModelAndView("redirect:/students/" );
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("loginForm");
		model.addObject("user", new User());
		
		return model;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, @ModelAttribute("User") User login) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		
		User user = db.getUser(login);
		if(!user.getAccountType().equals("")) {
			session.setAttribute("user", user);
			return new ModelAndView("redirect:/index" );
		}
		user.setPassword("");
		
		ModelAndView model = new ModelAndView();
		model.setViewName("loginForm");
		model.addObject("user", user);
		model.addObject("message", "Invalid username or password");
		
		return model;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("user");
		return new ModelAndView("redirect:/index" );
	}
	
	@RequestMapping(value = "/loginProcess", method = RequestMethod.GET)
	public ModelAndView loginProcess(HttpSession session,  @ModelAttribute("User") User login) {
		Locale locale = new Locale("en_US");
		logger.info("Welcome home! The client locale is {}.", locale);
		
		User user = db.getUser(login);
		if(!user.getAccountType().equals("")) {
			session.setAttribute("user", user);
			return new ModelAndView("redirect:/index" );
		}
		user.setPassword("");
		
		
		ModelAndView model = new ModelAndView();
		model.setViewName("loginForm");
		model.addObject("user", user);
		model.addObject("message", "Invalid username or password");
		
		return model;
	}
	
	

	@RequestMapping(value = "/deleteSPR/{studentID}")
	public ModelAndView deleteSPR(@PathVariable("studentID") String id) {
		db.deleteSPR(id);
		return new ModelAndView("redirect: /index");
	}
}
