package cn.dao.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import cn.domain.Admin;
import cn.domain.Broadcast;

public class AdminDaoImplTest {

	AdminDaoImpl adi = new AdminDaoImpl();

	@Test
	public void testAddTeacherPosition() {
		adi.addTeacherPosition("teacher");
		adi.addTeacherPosition("headmaster");
	}

	@Test
	public void testFind() {
		Admin a = adi.find("1313270236", "123456");
		System.out.println(a);
	}

	@Test
	public void testDelTeaPosition() {
		adi.delTeacherPosition(1);
		adi.delTeacherPosition("headmaster");
	}

	@Test
	public void testAddMajor() {
		adi.addMajor("cs");
		adi.addMajor("se");
		adi.addMajor("ee");
	}

	@Test
	public void addSemester() {
		adi.addSemester("2015-2016-3");
		adi.addSemester("2015-2016-4");
	}
	
	@Test
	public void getXKandDF() {
		adi.operateDF(false);
		adi.operateXK(false);
		System.out.println(adi.getXK()+"----"+adi.getDF());
	}
	
	@Test
	public void addBroadcast() {
		adi.addBroadcast("Hello~3Q1...");
		adi.addBroadcast("Hello~3Q2...");
		adi.addBroadcast("Hello~3Q3...");
		adi.addBroadcast("Hello~3Q4...");
		adi.addBroadcast("Hello~3Q5...");
	}
	
	@Test
	public void getAllBroadcast() {
		System.out.println(adi.getAllBroadcast()); 
	}
	
	@Test
	public void delBroadcast() {
		adi.delBroadcast(4);
	}
}







