package cn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import cn.domain.Major;
import cn.domain.Student;
import cn.domain.StudentM;

public interface StudentDao {
	
	void add(Student stu, int mid);

	void addMoreInfo(StudentM sm);

	void updateMoreInfo(StudentM sm);
	
	StudentM findM(Student s);

	void delete(Student stu);

	void update(Student stu);

	Student find(String id);

	Student find(Student stu);

	Student find(String username, String password);

	// save students' selected courses
	void saveCourses(String sid, String tid, String cid);

	void delCourses(Student s);

	void submitCourses(Student s);

	List<Student> getStuByTeaAndCour(String tid, String cid);

	List<Student> getAllStuInfo();

	List<Major> getAllMajors();
	
	@Insert("insert into major(name) values(#{name})")
	void addMajor(String name);

}