package cn.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.domain.Course;
import cn.domain.Semester;
import cn.domain.Student;
import cn.domain.StudentM;
import cn.interceptor.AuthPassport;
import cn.service.impl.BusinessServiceImpl;

@AuthPassport(validate="student")

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	BusinessServiceImpl bsi;

	@RequestMapping("test")
	public String test(String username, String password, HttpServletRequest request) {
		System.out.println(username + "---" + password);
		Student s = bsi.findStudent(username, password);
		if (s != null) {
			System.out.println("login successfully...");
			request.getSession().setAttribute("student", s);
		}
		return "/student/index";
	}
	
	@RequestMapping("{id}")
	public String loginView() {
		return "/student/index";
	}
	
	@RequestMapping("personalInfo")
	public String personalInfo(HttpServletRequest request) {
		Student s = (Student) request.getSession().getAttribute("student");
		StudentM sm = bsi.findMoreStudentInfo(s);
		request.setAttribute("sm", sm);
		
		return "student/Node/personalInformation";
	}
	
	@RequestMapping("queryGrades")
	public String queryGrades(HttpServletRequest request) {
		List<Semester> list = bsi.getAllSemesters();
		request.setAttribute("list", list);
		return "student/Node/grades";
	}
	
	@RequestMapping("getGrades")
	public String getGrades(HttpServletRequest request, String semid) {
		Student s = (Student) request.getSession().getAttribute("student");
		String sid = s.getId();
		System.out.println("**************");
		System.out.println(sid);
		System.out.println(semid);
		System.out.println(request.getParameter("semid"));
		System.out.println(s);
		System.out.println("*****************/");
		List<Course> list = bsi.getAllCourseGrades(sid, semid);
		System.out.println(list);
		request.setAttribute("list", list);
		return "student/Node/showgrade";
	}
	
	@RequestMapping("selectCourse")
	public String selectCourse() {
		return "student/Node/selectCourse";
	}
	
	@RequestMapping("getAllCourses")
	public String getAllCourses(HttpServletRequest request) {
		if (!bsi.getXK()) {
			request.setAttribute("msg", "<h1>Select System isn't open present!</h1>");
			return "forward:/WEB-INF/message.jsp";
		}
		
		List<Course> list = bsi.getAllCourses(true);
		request.setAttribute("list", list);
		return "student/Node/daixuanCourse";
	}
	
	@RequestMapping("getTheStuCourses")
	public String getTheStuCourses(HttpServletRequest request) {
		Student s = (Student) request.getSession().getAttribute("student");
		String sid = s.getId();
		
		if (!bsi.getXK()) {
			request.setAttribute("msg", "<h1>Select System isn't open present!</h1>");
			return "forward:/WEB-INF/message.jsp";
		}
		
		List<Course> list = bsi.getAllCourses(sid);
		request.setAttribute("list", list);
		return "student/Node/yixuanCourse";
	}
	
	@RequestMapping("quitCourses")
	@ResponseBody
	public void quitCourses(HttpServletRequest request, String tid, String cid) {
		Student s = (Student) request.getSession().getAttribute("student");
		String sid = s.getId();
		
		bsi.quitCourses(sid, tid, cid);
	}
	
	@RequestMapping("saveCourses")
	@ResponseBody
	public String saveCourses(HttpServletRequest request,HttpServletResponse response, String tid, String cid) {
		// System.out.println("Save...."+sid+"****"+tid+"****"+cid);
		Student s = (Student) request.getSession().getAttribute("student");
		String sid = s.getId();
		
		if (bsi.checkCourse(cid, sid)) {
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			return "You have choosen the course!";
		}
		bsi.saveStudentCourses(sid, tid, cid);
		return null;
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("student");
		return "redirect:/login";
	}
}
