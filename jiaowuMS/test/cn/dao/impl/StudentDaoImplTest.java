package cn.dao.impl;


import java.util.List;

import org.junit.Test;

import cn.dao.impl.StudentDaoImpl;
import cn.domain.Major;
import cn.domain.Student;
import cn.domain.StudentM;

public class StudentDaoImplTest {

	StudentDaoImpl sdi = new StudentDaoImpl();

	@Test
	public void testAdd() {
		Student s = new Student("20132211", "学生甲", true, "19950720", "123456",
				false);
		sdi.add(s, 1);
		s = new Student("20132212", "学生乙", false, "19950820", "123456", false);
		sdi.add(s, 2);

		StudentM sm = new StudentM(s, "clazz", "contact", "daytoschool",
				"department", "homephone", "layer", false, "nation", "origin",
				"politics", "postcode", "ruxuekaohao", 5);
		sdi.addMoreInfo(sm);
	}

	@Test
	public void addMoreInfo() {
		Student s = new Student("20132212");

		StudentM sm = new StudentM(s, "clazz", "contact", "daytoschool",
				"department", "homephone", "layer", false, "nation", "origin",
				"politics", "postcode", "ruxuekaohao", 5);
		sdi.addMoreInfo(sm);
	}

	@Test
	public void findM() {
		StudentM sm = sdi.findM(new Student("20132212"));
		System.out.println(sm);
	}

	@Test
	public void updateMoreInfo() {
		StudentM sm = sdi.findM(new Student("20132212"));
		sm.setClazz("xxjike1banxxx");
		sm.setPostcode("443000");
		sdi.updateMoreInfo(sm);
	}

	@Test
	public void testDelete() {
		Student s = new Student();
		s.setId("20132211");
		sdi.delete(s);
	}

	@Test
	public void testUpdate() {
		Student s = new Student();
		s.setId("20132211");
		s = sdi.find(s);
		s.setPassword("546321");
		// s.setMajor("ei");
		s.setSubmit(true);
		s.setPhone("13032");
		sdi.update(s);
	}

	@Test
	public void testFind() {
		Student s = new Student();
		s.setId("20132211");
		s = sdi.find(s);
		System.out.println(s);

		s = sdi.find("20132212", "123456");
		System.out.println(s);
	}

	@Test
	public void testSaveCourses() {
		sdi.saveCourses("2013221104210002", "1234562", "903f0e91-d7c8-4cc7-9");
		sdi.saveCourses("2013221104210002", "1234562", "d2b9b249-47e2-489e-b");
	}

	@Test
	public void getStuByTeaAndCour() {
		System.out.println(sdi.getStuByTeaAndCour("1008",
				"1e3e1dba-bac3-40ef-a"));
	}

	@Test
	public void getAllStuInfo() {
		System.out.println(sdi.getAllStuInfo());
	}

	@Test
	public void getAllMajors() {
		System.out.println(sdi.getAllMajors());
	}
}