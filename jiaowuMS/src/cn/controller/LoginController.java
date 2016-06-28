package cn.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.domain.Admin;
import cn.domain.Student;
import cn.domain.Teacher;
import cn.service.impl.BusinessServiceImpl;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	BusinessServiceImpl bsi;
	
	@RequestMapping()
	public String loginView() throws Exception {
		return "login/login";
	}
	
	@RequestMapping(value="studentLogin")  //, method=RequestMethod.POST
	public String studentLogin(String username, String password, HttpServletRequest request) {
		System.out.println(username + "---" + password);
		Student s = bsi.findStudent(username, password);
		if (s != null) {
			System.out.println("student login successfully...");
			request.getSession().setAttribute("student", s);
			return "redirect:/student/"+username;
		} else {
			System.out.println("username or password wrong..");
			request.setAttribute("msg", "username or password wrong..");
			return "forward:/WEB-INF/message.jsp";
		}
	}
	
	@RequestMapping(value="teacherLogin")  //, method=RequestMethod.POST
	public String teacherLogin(String username, String password, HttpServletRequest request) {
		System.out.println(username + "---" + password);
		Teacher t = bsi.findTeacher(username, password);
		if (t != null) {
			System.out.println("teacher login successfully...");
			request.getSession().setAttribute("teacher", t);
			return "redirect:/teacher/"+username;
		} else {
			System.out.println("username or password wrong..");
			request.setAttribute("msg", "username or password wrong..");
			return "forward:/WEB-INF/message.jsp";
		}
	}
	
	@RequestMapping(value="adminLogin")  //, method=RequestMethod.POST
	public String adminLogin(String username, String password, HttpServletRequest request) {
		System.out.println(username + "---" + password);
		Admin a = bsi.findAdmin(username, password);
		if (a != null) {
			System.out.println("admin login successfully...");
			request.getSession().setAttribute("admin", a);
			return "redirect:/admin/"+username;
		} else {
			System.out.println("username or password wrong..");
			request.setAttribute("msg", "username or password wrong..");
			return "forward:/WEB-INF/message.jsp";
		}
	}
}
