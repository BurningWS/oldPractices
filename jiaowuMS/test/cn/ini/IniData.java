package cn.ini;

import java.util.List;
import java.util.Random;

import org.junit.Test;

import cn.dao.impl.AdminDaoImpl;
import cn.dao.impl.CourseDaoImpl;
import cn.dao.impl.StudentDaoImpl;
import cn.dao.impl.TeacherDaoImpl;
import cn.domain.Course;
import cn.domain.Student;
import cn.domain.StudentM;
import cn.domain.Teacher;

public class IniData {
	
	StudentDaoImpl sdi = new StudentDaoImpl();
	String[] majors = {"微电子","计算机科学与技术","软件工程","信息安全","通信","材料科学"};
	
	@Test
	public void AddMajor() {
		for (int i = 0; i < majors.length; i++) {
			sdi.addMajor(majors[i]);
		}
	}
	
	@Test
	public void AddStudent() {
		Random r = new Random();
		String str = "";
		String base = "20132211042100";
		for (int i = 0; i < 15; i++) {
			if (i < 10) {
				str = base + "0" + i;
			} else 
			str = base + i;
			String name = RandomValue.getChineseName();
			String birthday = "199508"+r.nextInt(30);
			Student s = new Student(str, name, r.nextBoolean(), birthday, "123456",
					false);
			sdi.add(s, r.nextInt(majors.length)+1);
			
			
			StudentM sm = new StudentM(s, "计科", RandomValue.getRoad(), "2013年",
					"计算机", RandomValue.getTel(), "学士", false, "汉族", "湖北",
					"共产党", "443000", "1654442542", 5);
			sdi.addMoreInfo(sm);
		}
	}
	
	@Test
	public void AddAdmin() {
		//insert into admin values 1313270236&password=123456
	}
	
	AdminDaoImpl adi = new AdminDaoImpl();
	
	@Test
	public void AddTeacherPosition() {
		adi.addTeacherPosition("讲师");
		adi.addTeacherPosition("校长");
		adi.addTeacherPosition("教导主任");
		adi.addTeacherPosition("教学秘书");
	}
	
	@Test
	public void addSemester() {
		adi.addSemester("2015-2016-1");
		adi.addSemester("2015-2016-2");
	}
	
	@Test
	public void addBroadcast() {
		adi.addBroadcast("Hello~3Q1...");
		adi.addBroadcast("Hello~3Q2...");
		adi.addBroadcast("Hello~3Q3...");
		adi.addBroadcast("Hello~3Q4...");
		adi.addBroadcast("Hello~3Q5...");
	}
	CourseDaoImpl cdi = new CourseDaoImpl();
	
	
	String[] courses = {"Java语言设计","C语言设计","C++语言设计","操作系统","数据结构","计算机网络"};
	
	@Test
	public void AddCourse() {
		Random r = new Random();
		for (int i = 0; i < courses.length; i++) {
			Course c = new Course(courses[i], 25);
			cdi.add(c, r.nextInt(2)+1);
		}
	}
	
	
	/************************************/
	TeacherDaoImpl tdi = new TeacherDaoImpl();
	
	@Test
	public void AddTeacher() {
		Random r = new Random();
		String base = "123456";
		for (int i = 0; i < 6; i++) {
			String str = base + i;
			Teacher t = new Teacher(str , RandomValue.getChineseName(), r.nextBoolean(), "123456");
			tdi.add(t, r.nextInt(4)+1);
		}
	}
	
	@Test
	public void TeacherAddCourses() {
		for (int i = 0; i < 3; i++) {
			Teacher t = new Teacher();
			t.setId("123456"+i);
			
			CourseDaoImpl cdi = new CourseDaoImpl();
			List<Course> courses = cdi.getAll();
			System.out.println(courses);
			
			String[] cids = new String[courses.size()];
			int j = 0;
			for (Course c : courses) {
				cids[j++] = c.getId();
				
				System.out.println(c.getId());
			}
			tdi.addCourses(t, cids);
		}

		
	}
}
