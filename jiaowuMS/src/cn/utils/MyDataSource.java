package cn.utils;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.Properties;

import org.apache.taglibs.standard.tag.common.sql.DataSourceWrapper;

public class MyDataSource extends DataSourceWrapper {

	public MyDataSource() {
	};

	static Properties config = new Properties();
	static private String url;
	static private String user;
	static private String password;
	static private String driver;

	static private int ini = 5;
	static private int max = 10;
	static private int curr = 0;

	static private LinkedList<Connection> connectionPool = new LinkedList<Connection>();

	static {
		try {
			config.load(MyDataSource.class.getResourceAsStream("db.properties"));
			url = config.getProperty("url");
			user = config.getProperty("user");
			password = config.getProperty("password");
			driver = config.getProperty("driver");

			Class.forName(driver);

			String tini = config.getProperty("ini");
			String tmax = config.getProperty("max");

			if (tini != null) {
				ini = Integer.parseInt(tini);
			}
			if (tmax != null) {
				max = Integer.parseInt(tmax);
			}

			for (int i = 0; i < ini; i++) {
				connectionPool.add(createConn());
			}
			curr = ini;

			System.out.println(ini + "--" + max + "--" + curr);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError("fail to initialize ...");
		}
	}

	@Deprecated
	public static void free(Connection conn) {
		connectionPool.addLast(conn);
	}

	@Override
	public Connection getConnection() throws SQLException {
		synchronized (connectionPool) {
			if (connectionPool.size() > 0) {
				return connectionPool.removeFirst();
			} else if (curr < max) {
				return createConn();
			} else {
				throw new RuntimeException("no more connections...");
			}
		}
	}

	/* enhanced Connection */
	private static Connection createConn() throws SQLException {
		final Connection conn = DriverManager
				.getConnection(url, user, password);
		return (Connection) Proxy.newProxyInstance(conn.getClass()
				.getClassLoader(), new Class[] { Connection.class },
				new InvocationHandler() {

					@Override
					public Object invoke(Object proxy, Method method,
							Object[] args) throws Throwable {
//						 System.out.println(method.getName());
						if (method.getName().equals("close")) {

							connectionPool.addLast(conn);
							return null;
						}
						return method.invoke(conn, args);
					}
				});
	}

}
