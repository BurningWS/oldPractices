package cn.domain;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class Student {

	private String id;
	private String name;
	private boolean male;
	private Date birthday;
	private String phone;
	private String major;
	private String idcard;
	private String password;
	private boolean submit;
	
	private float grades;
	
	private String year;
	
	public Student(String id) {
		super();
		this.id = id;
	}

	private List<Teacher> teachers = new LinkedList<Teacher>();

	public Student(String id, String name, boolean male,
			String idcard, String password, boolean submit) {
		super();
		this.id = id;
		this.name = name;
		this.male = male;
		this.idcard = idcard;
		this.password = password;
		this.submit = submit;
	}

	public Student() {
		super();
	}

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

	public boolean isMale() {
		return male;
	}

	public void setMale(boolean male) {
		this.male = male;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isSubmit() {
		return submit;
	}

	public void setSubmit(boolean submit) {
		this.submit = submit;
	}

	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}


	public float getGrades() {
		return grades;
	}

	public void setGrades(float grades) {
		this.grades = grades;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", male=" + male
				+ ", birthday=" + birthday + ", phone=" + phone + ", major="
				+ major + ", idcard=" + idcard + ", password=" + password
				+ ", submit=" + submit + ", grades=" + grades + ", teachers="
				+ teachers + ", courses=" + courses + "]";
	}

	public String getYear() {
		if (id != null) {
			year = id.substring(0,4);
		}
		return year;
	}

}
