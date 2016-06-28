package cn.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import cn.domain.Admin;
import cn.domain.Broadcast;
import cn.utils.BeanHandler;
import cn.utils.BeanListHandler;
import cn.utils.JdbcUtils;

public class AdminDaoImpl {

	public void addMajor(String name) {
		// String sql = "insert into major(name) values(?)";
		// Object param = name;
		// JdbcUtils.update(sql, param);

		try {
			CallableStatement cs = JdbcUtils.getConn().prepareCall(
					"{call paddmajor(?)}");
			cs.setString(1, name);
			cs.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void addSemester(String semester) {
		// String sql = "insert into semester(name) values(?)";
		// Object param = semester;
		// JdbcUtils.update(sql, param);

		try {
			CallableStatement cs = JdbcUtils.getConn().prepareCall(
					"{call paddsemester(?)}");
			cs.setString(1, semester);
			cs.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void addTeacherPosition(String tp) {
		String sql = "insert into Tea_position(name) values(?)";
		Object param = tp;
		JdbcUtils.update(sql, param);
	}

	public void delTeacherPosition(int id) {
		String sql = "delete from Tea_position where id=?";
		Object param = id;
		JdbcUtils.update(sql, param);
	}

	public void delTeacherPosition(String name) {
		String sql = "delete from Tea_position where name like ?";
		Object param = name;
		JdbcUtils.update(sql, param);
	}

	public Admin find(String id, String password) {
		// String sql = "select * from admin where id=? and password=?";
		// Object[] params = { id, password };
		// return (Admin) JdbcUtils.find(sql, new
		// BeanHandler<Admin>(Admin.class),
		//	params);
		String sql = "{call pfindadmin(?,?)}";
		Object[] params = { id, password };
		return (Admin) JdbcUtils.pfind(sql, new BeanHandler<Admin>(Admin.class),
				params);
	}

	public void operateXK(boolean xk) {
		String sql = "update power set xk=? where id=1";
		Object param = xk;
		JdbcUtils.update(sql, param);
	}

	public void operateDF(boolean df) {
		String sql = "update power set df=? where id=1";
		Object param = df;
		JdbcUtils.update(sql, param);
	}

	public boolean getXK() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtils.getConn();
			String sql = "select xk from power where id = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getBoolean("xk");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.release(conn, pstmt, rs);
		}
		return false;
	}

	public boolean getDF() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtils.getConn();
			String sql = "select df from power where id = 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getBoolean("df");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.release(conn, pstmt, rs);
		}
		return false;
	}

	public void addBroadcast(String name) {
		String sql = "insert into broadcast(content,time) values(?,?)";
		Object params[] = { name, new Date() };
		JdbcUtils.update(sql, params);
	}

	@SuppressWarnings("unchecked")
	public List<Broadcast> getAllBroadcast() {
		String sql = "select * from broadcast";
		return (List<Broadcast>) JdbcUtils.find(sql,
				new BeanListHandler<Broadcast>(Broadcast.class));
	}

	public void delBroadcast(int id) {
		String sql = "delete from broadcast where id=?";
		Object param = id;
		JdbcUtils.update(sql, param);
	}

}
