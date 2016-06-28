package cn.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cn.domain.Course;
import cn.domain.Student;
import cn.domain.Teacher;
import cn.interceptor.AuthPassport;
import cn.service.impl.BusinessServiceImpl;

@AuthPassport(validate="teacher")
@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired
	BusinessServiceImpl bsi;

	@RequestMapping("/{id}")
	public String loginView() {
		return "/teacher/index";
	}

	@RequestMapping(value="test")
	public String test(String username,String password, HttpServletRequest request) {
		System.out.println(username + "---" + password);
		Teacher t = bsi.findTeacher(username, password);
		if (t != null) {
			System.out.println("t login successfully...");
			request.getSession().setAttribute("teacher", t);
		}
		return "/teacher/index";
	}
	
	@RequestMapping("personalInfo")
	public ModelAndView personalInfo(HttpServletRequest request) {
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		return new ModelAndView("teacher/Node/personalInformation", "t", bsi.findTeacher(t));
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("teacher");
		return "redirect:/login";
	}
	
	@RequestMapping("personalCourse")
	public ModelAndView getPersonalCourse(HttpServletRequest request) {
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		List<Course> list = bsi.getAllTeaCourses(t.getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("t", request.getSession().getAttribute("teacher"));
		return new ModelAndView("teacher/Node/personalCourse", map);
	}
	
	@RequestMapping("forRecordScores")
	public ModelAndView forRecordScores(HttpServletRequest request, String cid) {
		
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		String tid = t.getId();
		
		List<Student> list = bsi.getStuByTeaAndCour(tid, cid);
		Course c = bsi.findCourse(cid);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("c", c);

		boolean subm = bsi.checkSubmit(tid, cid);
		map.put("submit", subm);

		System.out.println(subm);
		return new ModelAndView("teacher/Node/recordGrades", map);
	}
	
	@RequestMapping("showGradesForm")
	public String showGradesForm(HttpServletRequest request) {
		
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		String tid = t.getId();
		
		List<Course> list = bsi.getAllSemester(tid);
		request.setAttribute("list", list);
		return "teacher/Node/showGradesForm";
	}
	
	@RequestMapping("getTeaSemesterCourses")
	@ResponseBody
	public String getTeaSemesterCourses(HttpServletRequest request, String semid) {
		// System.out.println(semid + "---" + tid);
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		String tid = t.getId();
		
		List<Course> list = bsi.getTeaSemesterCourses(semid, tid);
		JSONArray ja = JSONArray.fromObject(list);
		System.out.println(ja.toString());
		return ja.toString();
	}
	
	
	@RequestMapping("getStuGrades")
	public String getStuGrades(HttpServletRequest request, String cid) {
		Teacher t = (Teacher) request.getSession().getAttribute("teacher");
		String tid = t.getId();
		
		List<Student> list = bsi.getStudents(tid,cid);
		
		Course c = bsi.findCourse(cid);
		
		request.setAttribute("c", c);
		request.setAttribute("list", list);
		return "teacher/Node/showGrades";
	}
	
	
}
