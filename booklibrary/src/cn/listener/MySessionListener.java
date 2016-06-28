package cn.listener;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MySessionListener implements HttpSessionListener {
	
	
	@SuppressWarnings("unchecked")
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession s = se.getSession();
		ServletContext sc = s.getServletContext();
		List<HttpSession> sessions = (List<HttpSession>) sc.getAttribute("sessions");
		if (sessions == null) {
			sessions = new LinkedList<HttpSession>();
			sc.setAttribute("sessions", sessions);
		}
		sessions.add(s);
		System.out.println("创建了一个session..");
		
		List<HttpSession> l = (List<HttpSession>)sc.getAttribute("sessions");
		System.out.println(l.size());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession s = se.getSession();
		ServletContext sc = s.getServletContext();
		List<HttpSession> sessions = (List<HttpSession>) sc.getAttribute("sessions");
		sessions.remove(s);
		System.out.println("销毁了一个session..");
	}

}
