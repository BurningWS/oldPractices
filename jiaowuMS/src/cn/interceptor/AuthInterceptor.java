package cn.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.domain.Admin;
import cn.domain.Student;
import cn.domain.Teacher;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@SuppressWarnings(value = { "unchecked", "rawtypes" })
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		System.out.println("...handler before0...");

		if (handler.getClass().isAssignableFrom(HandlerMethod.class)) {
			HandlerMethod hm = (HandlerMethod) handler;
			Class cla = hm.getMethod().getDeclaringClass();  // if annotation loaded on Elem.Type
			AuthPassport authPassport = (AuthPassport) cla.getAnnotation(AuthPassport.class);
			
			if (authPassport == null || authPassport.validate() == "")  // let other resources go.
				return true;
			else if (authPassport.validate().equals("student") ) {
				System.out.println("test stu login...");
				HttpSession session = request.getSession();
				Student s = (Student) session.getAttribute("student");
				return redirect(request, response, s);
			}
			else if (authPassport.validate().equals("teacher") ) {
				System.out.println("test tea login...");
				HttpSession session = request.getSession();
				Teacher s = (Teacher) session.getAttribute("teacher");
				return redirect(request, response, s);
			}
			else if (authPassport.validate().equals("admin") ) {
				System.out.println("test admin login...");
				HttpSession session = request.getSession();
				Admin a = (Admin) session.getAttribute("admin");
				return redirect(request, response, a);
			}
		}
		System.out.println("...handler before2...");
		return true;		
	}


	private boolean redirect(HttpServletRequest request, HttpServletResponse response, Object o)
			throws IOException {
		if (o != null) {
			System.out.println("user has logined...");
			return true;
		} else {
			String s = request.getContextPath();
			response.sendRedirect(s + "/login");
			return false;
		}
	}
}
