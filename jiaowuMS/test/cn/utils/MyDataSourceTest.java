package cn.utils;


import java.sql.SQLException;

import org.junit.Test;

public class MyDataSourceTest {


	@Test
	public void testGetConn() throws SQLException {
		MyDataSource.getConn();
	}

}
