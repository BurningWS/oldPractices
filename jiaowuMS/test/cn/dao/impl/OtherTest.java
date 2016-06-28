package cn.dao.impl;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;

import com.mysql.fabric.xmlrpc.base.Data;

import cn.domain.StudentM;

public class OtherTest {
	
	
	public static void main(String[] args) throws IntrospectionException, UnsupportedEncodingException {
//				test2("%E6%88%90%E7%BB%A9");
		System.out.println(1+2+""+3+2);
	}
	
	static private void test2(String s) throws UnsupportedEncodingException {
		System.out.println(URLDecoder.decode(s, "utf-8"));
	}
	
	private static void test1() throws IntrospectionException {
		BeanInfo bi = Introspector.getBeanInfo(StudentM.class, Object.class);
		PropertyDescriptor[] pds = bi.getPropertyDescriptors();
		int k = 0;
		for (PropertyDescriptor pd : pds) {
			System.out.print(pd.getName()+"=?,");
//			System.out.print("sm."+pd.getReadMethod().getName()+"(),");
//			System.out.print(pd.getPropertyType().getSimpleName()+" "+ pd.getName()+",");
			k++;
		}
		System.out.println();
		for (int i = 0; i < k; i++) {
			System.out.print("?,");
		}
	}
}
