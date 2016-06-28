package cn.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import cn.domain.Course;
import cn.domain.Position;
import cn.domain.Student;
import cn.domain.Teacher;
import cn.utils.BeanHandler;
import cn.utils.BeanListHandler;
import cn.utils.JdbcUtils;

public class TeacherDaoImpl {

	/*
	 * pid stands for teacher's position
	 */
	public void add(Teacher t, int pid) {
		String sql = "insert into teacher(id,name,male,posid,password) values(?,?,?,?,?)";
		Object[] params = { t.getId(), t.getName(), t.isMale(), pid,
				t.getPassword() };
		JdbcUtils.update(sql, params);
	}

	public void delete(Teacher t) {
		String sql = "Delete from teacher where id=?";
		Object param = t.getId();
		JdbcUtils.update(sql, param);
	}

	public Teacher find(Teacher t) {
		String sql = "select t.*,tp.name as position from teacher t join tea_position tp on t.posid=tp.id where t.id=?";
		Object param = t.getId();
		return (Teacher) JdbcUtils.find(sql, new BeanHandler<Teacher>(
				Teacher.class), param);
	}

	public Teacher find(String username, String password) {
		String sql = "select * from teacher where id=? and password=?";
		Object[] params = { username, password };
		return (Teacher) JdbcUtils.find(sql, new BeanHandler<Teacher>(
				Teacher.class), params);
	}

	public void update(Teacher t) {
		String sql = "update teacher set password=? where id=?";
		Object[] params = { t.getPassword(), t.getId() };
		JdbcUtils.update(sql, params);
	}

	// cid stands for courses' ids
	public void addCourses(Teacher t, String... cids) {
		for (int i = 0; i < cids.length; i++) {
			String sql = "insert into Teacher_Course(tid,cid,submit,people) values(?,?,0,0)";
			Object[] params = { t.getId(), cids[i] };
			JdbcUtils.update(sql, params);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Student> getStudents(String tid, String cid) {
		String sql = "select * from student s join Tea_Stu_Cour_Save tsc on tsc.tid=? and tsc.cid=? and tsc.sid=s.id";
		Object[] param = { tid, cid };
		return (List<Student>) JdbcUtils.find(sql,
				new BeanListHandler<Student>(Student.class), param);
	}

	public void modifyScore(String tid, String cid, String sid, String grades) {
		String sql = "update Tea_Stu_Cour_Save set grades=? where tid=? and cid=? and sid=?";
		Object[] params = { grades, tid, cid, sid };
		JdbcUtils.update(sql, params);
	}

	public void submitScore(String tid, String cid) {
		String sql = "update Teacher_Course set submit=1 where tid=? and cid=?";
		Object[] params = { tid, cid };
		JdbcUtils.update(sql, params);
	}

	public boolean checkSubmit(String tid, String cid) {
		/*String sql = "select submit from teacher_course where tid=? and cid=?";
		Object params[] = { tid, cid };

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
				if (rs.getBoolean(1))
					return true;
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.release(conn, pstmt, rs);
		}
		return false;*/
		
		String proc = "{call pcheckSubmit(?,?,?)}";
		Object params[] = { tid, cid };
		
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
	public List<Course> getAllSemester(String tid) {
		String sql = "select distinct s.id as semid, s.name as semester from teacher_course join course c on cid=c.id join semester s on s.id=c.semid where tid=? order by semester desc";
		Object param = tid;
		return (List<Course>) JdbcUtils.find(sql, new BeanListHandler<Course>(
				Course.class), param);
	}

	@SuppressWarnings("unchecked")
	public List<Teacher> getAllTeachers() {
		String sql = "select t.*,tp.name as position from teacher t join tea_position tp on t.posid=tp.id";
		Object params[] = {};
		return (List<Teacher>) JdbcUtils.find(sql,
				new BeanListHandler<Teacher>(Teacher.class));
	}

	@SuppressWarnings("unchecked")
	public List<Position> getAllPositions() {
		String sql = "select * from tea_position";
		Object params[] = {};
		return (List<Position>) JdbcUtils.find(sql,
				new BeanListHandler<Position>(Position.class));
	}

}
