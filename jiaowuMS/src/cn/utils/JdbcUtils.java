package cn.utils;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcUtils {
	
	static MyDataSource ds = new MyDataSource();
	
	public static Connection getConn() throws SQLException {
		return ds.getConnection();
	}

	public static void release(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
//				MyDataSource.free(conn);
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static int update(String sql, Object... params) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			release(conn, pstmt, rs);
		}
		return 0;
	}

	public static Object find(String sql, ResultSetHandler rsh,
			Object... params) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConn();
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
			rs = pstmt.executeQuery();
			return rsh.handler(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			release(conn, pstmt, rs);
		}
		return null;
	}

	public static Object pfind(String proc, ResultSetHandler rsh,
			Object... params) {
		Connection conn = null;
		CallableStatement cs = null;
		ResultSet rs = null;
		try {
			conn = getConn();
			cs = conn.prepareCall(proc);
			for (int i = 0; i < params.length; i++) {
				cs.setObject(i + 1, params[i]);
			}
			rs = cs.executeQuery();
			return rsh.handler(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			release(conn, cs, rs);
		}
		return null;
	}

	public static int getTotalRecords(String sql, Object... params) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = JdbcUtils.getConn();
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				pstmt.setObject(i + 1, params[i]);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			release(conn, pstmt, rs);
		}
		return 0;
	}
}
