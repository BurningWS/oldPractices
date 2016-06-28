package cn.domain;

import java.util.LinkedList;
import java.util.List;

public class Course {
	private String id;
	private String name;
	private List<Teacher> teachers = new LinkedList<Teacher>();

	private String semester;
	private int semid;

	private int weeks;
	private int people;
	private float grades;
	
	public Course(String name) {
		super();
		this.name = name;
	}

	public Course(String name, int weeks) {
		super();
		this.name = name;
		this.weeks = weeks;
	}

	public Course() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public int getWeeks() {
		return weeks;
	}

	public void setWeeks(int weeks) {
		this.weeks = weeks;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public float getGrades() {
		return grades;
	}

	public void setGrades(float grades) {
		this.grades = grades;
	}


	public int getSemid() {
		return semid;
	}

	public void setSemid(int semid) {
		this.semid = semid;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", name=" + name + ", teachers=" + teachers
				+ ", semester=" + semester + ", semid=" + semid + ", weeks="
				+ weeks + ", people=" + people + ", grades=" + grades + "]";
	}

}
