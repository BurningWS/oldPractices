package cn.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.domain.Admin;
import cn.domain.Course;
import cn.domain.Student;
import cn.domain.Teacher;
import cn.interceptor.AuthPassport;
import cn.service.impl.BusinessServiceImpl;

@AuthPassport(validate="admin")
@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	BusinessServiceImpl bsi;

	@RequestMapping("test")
	public String test(String username, String password,
			HttpServletRequest request) {
		System.out.println(username + "---" + password);
		Admin a = bsi.findAdmin(username, password);
		if (a != null) {
			System.out.println("login successfully...");
			request.getSession().setAttribute("admin", a);
		}
		return "/admin/index";
	}

	@RequestMapping("{id}")
	public String loginView() {
		return "/admin/index";
	}

	@RequestMapping("getAllStudentInfo")
	public String getAllStudentInfo(ModelMap map) {

		List<Student> list = bsi.getAllStuInfo();
		map.addAttribute("list", list);
		return "admin/studentInfo";
	}

	@RequestMapping("getAllTeacherInfo")
	public String getAllTeacherInfo(HttpServletRequest request) {
		List<Teacher> list = bsi.getAllTeachers();
		request.setAttribute("list", list);
		return "admin/teacher";
	}

	@RequestMapping("getAllCourses")
	public String getAllCourses(HttpServletRequest request) {
		List<Course> list = bsi.getAllCourses();
		request.setAttribute("list", list);
		return "admin/courseInfo";
	}

	@RequestMapping("addStudent")
	@ResponseBody
	public String addStudent(Student s, int mid) {
		System.out.println(s + "--" + mid);
		bsi.addStudent(s, mid);
		return "add succssfully";
	}

	@RequestMapping("operateXK")
	@ResponseBody
	public String operateXK(boolean xk) {
		bsi.operateXK(xk);
		if (xk == false) {
			return "XK has closed..";
		} else
			return "XK has opened..";
	}
}
