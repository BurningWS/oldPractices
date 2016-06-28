package cn.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.dao.StudentDao;
import cn.dao.impl.AdminDaoImpl;
import cn.dao.impl.CourseDaoImpl;
import cn.dao.impl.StudentDaoImpl;
import cn.dao.impl.TeacherDaoImpl;
import cn.domain.Admin;
import cn.domain.Broadcast;
import cn.domain.Course;
import cn.domain.Major;
import cn.domain.Position;
import cn.domain.Semester;
import cn.domain.Student;
import cn.domain.StudentM;
import cn.domain.Teacher;
import cn.utils.BeanHandler;
import cn.utils.JdbcUtils;

//@Service("bsi")
public class BusinessServiceImpl {
	StudentDao sdi = new StudentDaoImpl();
	TeacherDaoImpl tdi = new TeacherDaoImpl();
	CourseDaoImpl cdi = new CourseDaoImpl();
	AdminDaoImpl adi = new AdminDaoImpl();

	/*
	 * About Student's method
	 */
	public void addStudent(Student stu, int mid) {
		sdi.add(stu, mid);
	}

	public void updateStudent(Student stu) {
		sdi.update(stu);
	}

	public Student findStudent(Student stu) {
		return sdi.find(stu.getId());
	}

	public Student findStudent(String username, String password) {
		return sdi.find(username, password);
	}

	public void deleteStudent(Student stu) {
		sdi.delete(stu);
	}

	// more info...
	public void addMoreStudentInfo(StudentM sm) {
		sdi.addMoreInfo(sm);
	}

	public void updateMoreStudentInfo(StudentM sm) {
		sdi.updateMoreInfo(sm);
	}

	public StudentM findMoreStudentInfo(Student s) {
		return sdi.findM(s);
	}

	// save students' selected courses
	public void saveStudentCourses(String sid, String tid, String cid) {
		sdi.saveCourses(sid, tid, cid);
	}

	public void delStudentCourses(Student s) {
		sdi.delCourses(s);
	}

	public void submitStudentCourses(Student s) {
		sdi.submitCourses(s);
	}

	public List<Student> getStuByTeaAndCour(String tid, String cid) {
		return sdi.getStuByTeaAndCour(tid, cid);
	}

	public List<Student> getAllStuInfo() {
		return sdi.getAllStuInfo();
	}

	public List<Major> getAllMajors() {
		return sdi.getAllMajors();
	}

	public void addMajor(String name) {
		sdi.addMajor(name);
	}

	/******************************/

	/**
	 * About teacher's method
	 */
	public void addTeacher(Teacher t, int pid) {
		tdi.add(t, pid);
	}

	public void deleteTeacher(Teacher t) {
		tdi.delete(t);
	}

	public Teacher findTeacher(Teacher t) {
		return tdi.find(t);
	}

	public Teacher findTeacher(String username, String password) {
		return tdi.find(username, password);
	}

	public void updateTeacher(Teacher t) {
		tdi.update(t);
	}

	public List<Teacher> getAllTeachers() {
		return tdi.getAllTeachers();
	}

	// cid stands for courses' ids
	public void addTeacherCourses(Teacher t, String... cids) {
		tdi.addCourses(t, cids);
	}

	public List<Student> getStudents(String tid, String cid) {
		return tdi.getStudents(tid, cid);
	}

	public void modifyStudentScore(String tid, String cid, String sid,
			String grades) {
		tdi.modifyScore(tid, cid, sid, grades);
	}

	public void submitStudentScore(String tid, String cid) {
		tdi.submitScore(tid, cid);
	}

	public boolean checkSubmit(String tid, String cid) {
		return tdi.checkSubmit(tid, cid);
	}

	// get the tea's all course's semester
	public List<Course> getAllSemester(String tid) {
		return tdi.getAllSemester(tid);
	}

	public List<Position> getAllPositions() {
		return tdi.getAllPositions();
	}

	/******************************/

	/******************************/

	/**
	 * About course's method
	 */
	public void addCourse(Course c, int semid) {
		cdi.add(c, semid);
	}

	public void deleteCourse(Course c) {
		cdi.delete(c);
	}

	public Course findCourse(String cid) {
		return cdi.find(cid);
	}

	public List<Course> getAllCourses() {
		return cdi.getAll();
	}

	// get all courses & related teachers...
	public List<Course> getAllCourses(boolean flag) {
		return cdi.getAll(flag);
	}

	// get the stu's courses & related teacher...
	public List<Course> getAllCourses(String sid) {
		return cdi.getAll(sid);
	}

	public List<Course> getAllTeaCourses(String tid) {
		return cdi.getAllTeaCourses(tid);
	}

	public void quitCourses(String sid, String tid, String cid) {
		cdi.quitCourses(sid, tid, cid);
	}

	// check whether has selected the course
	public boolean checkCourse(String cid, String sid) {
		return cdi.checkCourse(cid, sid);
	}

	public List<Semester> getAllSemesters() {
		return cdi.getAllSemesters();
	}

	public List<Course> getAllCourseGrades(String sid, String semid) {
		if ("0".equals(semid)) {
			return cdi.getAllCourseGrades(sid);
		}
		return cdi.getAllCourseGrades(sid, semid);
	}

	public List<Course> getTeaSemesterCourses(String semid, String tid) {
		return cdi.getTeaSemesterCourses(semid, tid);
	}

	/******************************/

	/******************************/

	/**
	 * About admin's method
	 */
	public void addTeacherPosition(String tp) {
		adi.addTeacherPosition(tp);
	}

	public void delTeacherPosition(int id) {
		adi.delTeacherPosition(id);
	}

	public void delTeacherPosition(String name) {
		adi.delTeacherPosition(name);
	}

	public Admin findAdmin(String id, String password) {
		return adi.find(id, password);
	}

	public void addSemester(String semester) {
		adi.addSemester(semester);
	}
	
	public void operateXK(boolean xk) {
		adi.operateXK(xk);
	}
	
	public void operateDF(boolean df) {
		adi.operateDF(df);
	}
	
	public boolean getXK() {
		return adi.getXK();
	}
	
	public boolean getDF() {
		return adi.getDF();
	}
	
	public void addBroadcast(String name) {
		adi.addBroadcast(name);
	}
	
	public List<Broadcast> getAllBroadcast() {
		return adi.getAllBroadcast();
	}
	
	public void delBroadcast(int id) {
		adi.delBroadcast(id);
	}
	/******************************/

	public void setSdi(StudentDao sdi) {
		this.sdi = sdi;
	}
}
