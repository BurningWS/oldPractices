package cn.utils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.LinkedList;
import java.util.List;

public class BeanListHandler<T> implements ResultSetHandler {

	private Class<T> clazz;

	public BeanListHandler(Class<T> clazz) {
		super();
		this.clazz = clazz;
	};

	@Override
	public List<T> handler(ResultSet rs) {
		try {
			ResultSetMetaData rsm = rs.getMetaData();
			List<T> list = new LinkedList<T>();

			BeanInfo bi = Introspector.getBeanInfo(clazz, Object.class);
			PropertyDescriptor[] pd = bi.getPropertyDescriptors();

			while (rs.next()) {
				T bean = clazz.newInstance();
				for (int i = 0; i < rsm.getColumnCount(); i++) {
					String name = rsm.getColumnLabel(i+1);
					System.out.println(name);
					// String name = rsm.getColumnName(i+1);

					for (int j = 0; j < pd.length; j++) {
						if (pd[j].getName().equals(name)) {
							if (pd[j].getPropertyType() == byte.class) {
								Field f = clazz.getDeclaredField(name);
								f.setAccessible(true);
								Integer it = (Integer) rs.getObject(name);
								f.setByte(bean, it.byteValue());
							} else
								pd[j].getWriteMethod().invoke(bean,
										rs.getObject(name));
						}
					}
				}
				list.add(bean);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
