package cn.domain;

import java.util.LinkedList;
import java.util.List;

public class Teacher {

	private String id;
	private String name;
	private boolean male;
	private String position;
	private String password;
	private int people;
	
	public Teacher() {
		super();
	}

	public Teacher(String id) {
		super();
		this.id = id;
	}

	public Teacher(String id, String name, boolean male, String password) {
		super();
		this.id = id;
		this.name = name;
		this.male = male;
		this.password = password;
	}

	private List<Student> students = new LinkedList<Student>();
	private List<Course> courses = new LinkedList<Course>();

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

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public boolean isMale() {
		return male;
	}

	public void setMale(boolean male) {
		this.male = male;
	}

	@Override
	public String toString() {
		return "Teacher [id=" + id + ", name=" + name + ", male=" + male
				+ ", position=" + position + ", password=" + password
				+ ", students=" + students + ", courses=" + courses + "]";
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}
}
