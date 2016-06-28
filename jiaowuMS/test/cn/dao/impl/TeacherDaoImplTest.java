package cn.dao.impl;

import static org.junit.Assert.fail;

import java.util.List;

import net.sf.json.JSONArray;

import org.junit.Test;

import cn.domain.Course;
import cn.domain.Teacher;
import cn.service.impl.BusinessServiceImpl;

public class TeacherDaoImplTest {

	TeacherDaoImpl tdi = new TeacherDaoImpl();

	@Test
	public void testAdd() {
		Teacher t = new Teacher("1007", "万老师", true, "123455");
		tdi.add(t, 2);
		t = new Teacher("1008", "胡老师", false, "123456");
		tdi.add(t, 1);
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}

	@Test
	public void testFind() {
		Teacher t = new Teacher();
		t.setId("1008");
		t = tdi.find(t);
		System.out.println(t);

		System.out.println(tdi.find("1234567", "123456"));
	}

	@Test
	public void testUpdate() {
		Teacher t = new Teacher();
		t.setId("1008");
		t.setPassword("111111");
		tdi.update(t);
	}

	@Test
	public void testAddCourses() {
		Teacher t = new Teacher();
		t.setId("1007");

		CourseDaoImpl cdi = new CourseDaoImpl();
		List<Course> courses = cdi.getAll();
		String[] cids = new String[courses.size()];
		int i = 0;
		for (Course c : courses) {
			cids[i++] = c.getId();
		}
		tdi.addCourses(t, cids);
	}

	@Test
	public void testGetStudents() {
		System.out.println(tdi.getStudents("1234567", "58bcf141-80ec-487d-b"));
	}

	@Test
	public void testModifyScore() {
		tdi.modifyScore("1234567", "58bcf141-80ec-487d-b", "20132212", "85.554");
	}

	@Test
	public void testSubmitScore() {
		tdi.submitScore("1007", "04e5f8d6-36d7-4293-8");
	}

	@Test
	public void checkSubmit() {
		System.out.println(tdi.checkSubmit("1234562", "d2b9b249-47e2-489e-b"));
		System.out.println(tdi.checkSubmit("1234562", "faa29bc7-c7e9-4e16-a"));
	}

	@Test
	public void getAllSemester() {
		System.out.println(tdi.getAllSemester("1008"));
	}
	
	@Test
	public void getAllTeachers() {
		System.out.println(tdi.getAllTeachers());
	}
	
	@Test
	public void getAllPositions() {
		System.out.println(tdi.getAllPositions());
	}
}
