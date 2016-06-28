package cn.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.UUID;

import cn.domain.Course;
import cn.domain.Semester;
import cn.domain.Teacher;
import cn.utils.BeanHandler;
import cn.utils.BeanListHandler;
import cn.utils.JdbcUtils;

public class CourseDaoImpl {

	public void add(Course c, int semid) {
		String sql = "insert into course(id,name,semid,weeks) values(?,?,?,?)";
		String uuid = UUID.randomUUID().toString();
		Object[] params = { uuid.substring(0, 20), c.getName(), semid,
				c.getWeeks() };
		JdbcUtils.update(sql, params);
	}

	public void delete(Course c) {
		String sql = "delete from course where id=?";
		Object param = c.getId();
		JdbcUtils.update(sql, param);
	}

	public Course find(String cid) {
		String sql = "select c.*,s.name as semester from course c join semester s on c.semid=s.id where c.id=?";
		Object param = cid;
		return (Course) JdbcUtils.find(sql, new BeanHandler<Course>(
				Course.class), param);
	}

	@SuppressWarnings("unchecked")
	public List<Course> getAll() {
		// String sql =
		// "select c.*,s.name as semester from course c join semester s on c.semid=s.id";
		// return (List<Course>) JdbcUtils.find(sql, new
		// BeanListHandler<Course>(
		// Course.class));
		String sql = "{call pgetAllCourses()}";
		return (List<Course>) JdbcUtils.find(sql, new BeanListHandler<Course>(
				Course.class));
	}

	// get all courses & related teachers...
	@SuppressWarnings("unchecked")
	public List<Course> getAll(boolean flag) {
		String sql = "select c.*,s.name as semester from course c join semester s on c.semid=s.id";
		List<Course> list = (List<Course>) JdbcUtils.find(sql,
				new BeanListHandler<Course>(Course.class));
		for (Course c : list) {
			sql = "select t.name,t.id,tc.people from teacher t join Teacher_Course tc on t.id=tc.tid join course c on c.id=tc.cid where c.id=?";
			Object param = c.getId();
			List<Teacher> teachers = (List<Teacher>) JdbcUtils.find(sql,
					new BeanListHandler<Teacher>(Teacher.class), param);
			c.setTeachers(teachers);
		}
		return list;
	}

	// get the stu's courses & related teacher...
	@SuppressWarnings("unchecked")
	public List<Course> getAll(String sid) {
		String sql = "select c.*,s.name as semester from Tea_Stu_Cour_Save tsc join course c on tsc.cid=c.id join semester s on c.semid=s.id where tsc.sid=?";
		Object param = sid;
		List<Course> list = (List<Course>) JdbcUtils.find(sql,
				new BeanListHandler<Course>(Course.class), param);

		for (Course c : list) {
			sql = "select t.name,t.id from Tea_Stu_Cour_Save tsc join teacher t on tsc.tid=t.id where sid=? and cid=?";
			Object[] params = { sid, c.getId() };
			List<Teacher> teachers = (List<Teacher>) JdbcUtils.find(sql,
					new BeanListHandler<Teacher>(Teacher.class), params);
			c.setTeachers(teachers);
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Course> getAllTeaCourses(String tid) {
		String sql = "select c.*,s.name as semester from teacher_course tc join course c on tc.cid=c.id join semester s on c.semid=s.id where tc.tid=?";
		Object param = tid;
		return (List<Course>) JdbcUtils.find(sql, new BeanListHandler<Course>(
				Course.class), param);
	}

	@SuppressWarnings("unchecked")
	public List<Course> getAllCourseGrades(String sid, String semid) {
		String sql = "select c.*,s.name as semester,tsc.grades from Tea_Stu_Cour_Save tsc join course c on tsc.cid=c.id join semester s on c.semid=s.id where tsc.sid=? and c.semid=?";
		Object[] params = { sid, semid };
		return (List<Course>) JdbcUtils.find(sql, new BeanListHandler<Course>(
				Course.class), params);
	}

	@SuppressWarnings("unchecked")
	public List<Course> getAllCourseGrades(String sid) {
		String sql = "select c.*,s.name as semester,tsc.grades from Tea_Stu_Cour_Save tsc join course c on tsc.cid=c.id join semester s on c.semid=s.id where tsc.sid=?";
		Object[] params = { sid };
		return (List<Course>) JdbcUtils.find(sql, new BeanListHandler<Course>(
				Course.class), params);
	}

	public void quitCourses(String sid, String tid, String cid) {
		String sql = "delete from Tea_Stu_Cour_Save where sid=? and tid=? and cid=?";
		Object[] params = { sid, tid, cid };
		JdbcUtils.update(sql, params);

//		sql = "update Teacher_Course set people=people-1 where tid=? and cid=?";
//		params = new Object[] { tid, cid };
//		JdbcUtils.update(sql, params);
	}

	public boolean checkCourse(String cid, String sid) {
		/*String sql = "select tid from Tea_Stu_Cour_Save where cid=? and sid=?";
		Object params[] = { cid, sid };

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtils.getConn();
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.release(conn, pstmt, rs);
		}
		return false;*/
		String proc = "{call pcheckCourse(?,?,?)}";
		Object params[] = { cid, sid };
		
		Connection conn = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtils.getConn();
			cs = conn.prepareCall(proc);
			for (int i = 1; i <= params.length; i++) {
				cs.setObject(i+1, params[i-1]);
			}
			cs.registerOutParameter(1, Types.BOOLEAN);
			cs.execute();
			return cs.getBoolean(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.release(conn, cs, rs);
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<Semester> getAllSemesters() {
		String sql = "select s.id,s.name as date from semester s";
		return (List<Semester>) JdbcUtils.find(sql,
				new BeanListHandler<Semester>(Semester.class));
	}

	@SuppressWarnings("unchecked")
	public List<Course> getTeaSemesterCourses(String semid, String tid) {
		String sql = "select c.id, c.name from teacher_course tc join course c on cid=c.id join semester s on s.id=c.semid where c.semid=? and tc.tid=?";
		Object[] params = { semid, tid };
		return (List<Course>) JdbcUtils.find(sql, new BeanListHandler<Course>(
				Course.class), params);
	}
}
