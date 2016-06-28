package cn.utils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

public class BeanHandler<T> implements ResultSetHandler {

	private Class<T> clazz;

	public BeanHandler(Class<T> clazz) {
		this.clazz = clazz;
	}

	@Override
	public Object handler(ResultSet rs) {
		try {
			Object bean = clazz.newInstance();
			if (!rs.next()) {
				return null;
			}
			ResultSetMetaData rsm = rs.getMetaData();

			BeanInfo bi = Introspector.getBeanInfo(clazz, Object.class);
			PropertyDescriptor[] pd = bi.getPropertyDescriptors();

			for (int i = 0; i < rsm.getColumnCount(); i++) {
				String name = rsm.getColumnLabel(i + 1);  // get metadata's name
				System.out.println(name);
				for (int j = 0; j < pd.length; j++) {  // match clazz's corresponding property
					// System.out.println(pd[j].getName()+"---"+name);
					if (pd[j].getName().equals(name)) {
						if (pd[j].getPropertyType() == byte.class) {
							Object prop = rs.getObject(name);
							if (prop != null) {
								Field f = clazz.getDeclaredField(name);
								f.setAccessible(true);
								Integer it = (Integer) rs.getObject(name);
								f.setByte(bean, it.byteValue());
							}
						} else {
							pd[j].getWriteMethod().invoke(bean,
									rs.getObject(name));
						}
					}
				}

				/*
				 * Field f = clazz.getDeclaredField(name);
				 * f.setAccessible(true); if (f.getType() == byte.class) {
				 * Integer it = (Integer) rs.getObject(name); f.setByte(bean,
				 * it.byteValue()); } else f.set(bean, rs.getObject(name));
				 */
			}
			return bean;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
