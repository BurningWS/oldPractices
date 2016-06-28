package cn.dao.impl;

import java.util.List;

import cn.dao.StudentDao;
import cn.domain.Course;
import cn.domain.Major;
import cn.domain.Student;
import cn.domain.StudentM;
import cn.utils.BeanHandler;
import cn.utils.BeanListHandler;
import cn.utils.JdbcUtils;

public class StudentDaoImpl implements StudentDao {

	public void add(Student stu, int mid) {
		String sql = "insert into student(id,name,male,birthday,phone,mid,idcard,password,submit)"
				+ " values(?,?,?,?,?,?,?,?,?)";
		Object[] params = { stu.getId(), stu.getName(), stu.isMale(),
				stu.getBirthday(), stu.getPhone(), mid, stu.getIdcard(),
				stu.getPassword(), stu.isSubmit() };
		JdbcUtils.update(sql, params);
	}

	public void addMoreInfo(StudentM sm) {
		String sql = "insert into Student_moreInfo(id,clazz,contact,daytoschool,department,homephone,layer,married,nation,origin,politics,postcode,ruxuekaohao,years)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params = { sm.getS().getId(), sm.getClazz(), sm.getContact(),
				sm.getDaytoschool(), sm.getDepartment(), sm.getHomephone(),
				sm.getLayer(), sm.isMarried(), sm.getNation(), sm.getOrigin(),
				sm.getPolitics(), sm.getPostcode(), sm.getRuxuekaohao(),
				sm.getYears() };
		JdbcUtils.update(sql, params);
	}

	public void updateMoreInfo(StudentM sm) {
		String sql = "update Student_moreInfo set clazz=?,contact=?,daytoschool=?,department=?,homephone=?,layer=?,married=?,nation=?,origin=?,politics=?,postcode=?,ruxuekaohao=?,years=?"
				+ " where id=?";
		Object[] params = { sm.getClazz(), sm.getContact(),
				sm.getDaytoschool(), sm.getDepartment(), sm.getHomephone(),
				sm.getLayer(), sm.isMarried(), sm.getNation(), sm.getOrigin(),
				sm.getPolitics(), sm.getPostcode(), sm.getRuxuekaohao(),
				sm.getYears(), sm.getS().getId() };
		JdbcUtils.update(sql, params);
	}

	public StudentM findM(Student s) {
		String sql = "select s.*,m.name as major from student s join major m on s.mid=m.id where s.id=?";
		Object param = s.getId();
		s = (Student) JdbcUtils.find(sql, new BeanHandler<Student>(
				Student.class), param);

		sql = "select * from Student_moreInfo where id=?";
		StudentM sm = (StudentM) JdbcUtils.find(sql, new BeanHandler<StudentM>(
				StudentM.class), param);
		if (sm == null) {
			sm = new StudentM();
		}
		sm.setS(s);
		return sm;
	}

	public void delete(Student stu) {
		String sql = "delete from student where id=?";
		Object param = stu.getId();
		JdbcUtils.update(sql, param);
	}

	public void update(Student stu) {
		String sql = "update student set phone=?,password=?,submit=? where id=?";
		Object[] params = { stu.getPhone(), stu.getPassword(), stu.isSubmit(),
				stu.getId() };
		JdbcUtils.update(sql, params);
	}

	public Student find(Student stu) {
		String sql = "select s.*,m.name as major from student s join major m on s.mid=m.id where s.id=? ";
		Object param = stu.getId();
		return (Student) JdbcUtils.find(sql, new BeanHandler<Student>(
				Student.class), param);
	}

	public Student find(String username, String password) {
		String sql = "select * from student where id=? and password=?";
		Object[] params = { username, password };
		return (Student) JdbcUtils.find(sql, new BeanHandler<Student>(
				Student.class), params);
	}

	// save students' selected courses
	public void saveCourses(String sid, String tid, String cid) {
		String sql = "insert into Tea_Stu_Cour_Save(sid,tid,cid,grades) values(?,?,?,?)";
		Object[] params = { sid, tid, cid, 0 };
		JdbcUtils.update(sql, params);
//		sql = "update Teacher_Course set people=people+1 where tid=? and cid=?";
//		params = new Object[] { tid, cid };
//		JdbcUtils.update(sql, params);
	}

	public void delCourses(Student s) {
		String sql = "delete from Student where id=?";
		Object param = s.getId();
		JdbcUtils.update(sql, param);
	}

	public void submitCourses(Student s) {
		String sql = "update Student set submit=? where id=?";
		Object[] params = { true, s.getId() };
		JdbcUtils.update(sql, params);
	}

	@SuppressWarnings("unchecked")
	public List<Student> getStuByTeaAndCour(String tid, String cid) {
		String sql = "select s.*, tsc.grades from Tea_Stu_Cour_Save tsc join student s on s.id=tsc.sid where tsc.tid=? and tsc.cid=?";
		Object[] params = { tid, cid };
		return (List<Student>) JdbcUtils.find(sql,
				new BeanListHandler<Student>(Student.class), params);
	}
	
	@SuppressWarnings("unchecked")
	public List<Student> getAllStuInfo() {
		String sql = "select s.*,m.name as major from student s join major m on s.mid=m.id";
		Object[] params = {  };
		return (List<Student>) JdbcUtils.find(sql,
				new BeanListHandler<Student>(Student.class), params);
	}
	
	@SuppressWarnings("unchecked")
	public List<Major> getAllMajors() {
		String sql = "select * from major";
		return (List<Major>) JdbcUtils.find(sql,
				new BeanListHandler<Major>(Major.class));
	}
	
	public void addMajor(String name) {
		String sql = "insert into major(name) values(?) ";
		Object[] params = { name};
		JdbcUtils.update(sql, params);
	}

	@Override
	public Student find(String id) {
		return null;
	}
}
