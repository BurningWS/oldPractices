package cn.dao.impl;

import static org.junit.Assert.*;

import java.util.List;

import net.sf.json.JSONArray;

import org.junit.Test;

import cn.domain.Course;

public class CourseDaoImplTest {

	CourseDaoImpl cdi = new CourseDaoImpl();

	@Test
	public void testAdd() {
		// Course c = new Course("math");
		// cdi.add(c);
		// c = new Course("english");
		// cdi.add(c);
		Course c = new Course("physics", 25);
		cdi.add(c, 1);
		c = new Course("music", 24);
		cdi.add(c, 1);
		c = new Course("chinese", 25);
		cdi.add(c, 2);
	}

	@Test
	public void testDelete() {
		Course c = new Course();
		c.setId("c0f4f725-a4d0-48aa-8");
		cdi.delete(c);
	}

	@Test
	public void testGetAll() {
		System.out.println(cdi.getAll());
		System.out.println();
//		System.out.println(cdi.getAll(true));
	}

	@Test
	public void getAllSemesters() {
		System.out.println(cdi.getAllSemesters());
	}

	@Test
	public void getAllTeaCourses() {
		System.out.println(cdi.getAllTeaCourses("1008"));
	}

	@Test
	public void getAllCourseGrades() {
		System.out.println(cdi.getAllCourseGrades("20132212"));
	}

	@Test
	public void find() {
		System.out.println(cdi.find("1e3e1dba-bac3-40ef-a"));
	}

	@Test
	public void getTeaSemesterCourses() {
		System.out.println(cdi.getTeaSemesterCourses("1", "1008"));
		List<Course> list = cdi.getTeaSemesterCourses("1", "1008");
		JSONArray ja = JSONArray.fromObject(list);
		System.out.println(ja.toString());
	}
	
	@Test
	public void checkCourse() {
		System.out.println(cdi.checkCourse("91f3a6db-dfd8-455f-a", "2013221104210001"));
		System.out.println(cdi.checkCourse("91f3a6db-dfd8-455f-b", "2013221104210001"));
	}
	
	@Test
	public void quitCourses() {
		cdi.quitCourses("2013221104210002", "1234562", "d2b9b249-47e2-489e-b");
		cdi.quitCourses("2013221104210002", "1234562", "903f0e91-d7c8-4cc7-9");
	}
}
