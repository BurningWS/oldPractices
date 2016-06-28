package cn.domain;

public class StudentM {

	private Student s;
	private String department;
	private String clazz;
	private String politics;
	private String origin;
	private String nation;
	private String layer;
	private String postcode;
	private String homephone;
	private String contact;
	private String daytoschool;
	private String ruxuekaohao;

	public StudentM() {
		super();
	}

	public StudentM(Student s) {
		this.s = s;
	}

	public StudentM(Student s, String clazz, String contact,
			String daytoschool, String department, String homephone,
			String layer, boolean married, String nation, String origin,
			String politics, String postcode, String ruxuekaohao, int years) {
		this(s);
		this.department = department;
		this.clazz = clazz;
		this.politics = politics;
		this.origin = origin;
		this.nation = nation;
		this.layer = layer;
		this.postcode = postcode;
		this.homephone = homephone;
		this.contact = contact;
		this.daytoschool = daytoschool;
		this.ruxuekaohao = ruxuekaohao;
		this.years = years;
		this.married = married;
	}

	private int years;
	private boolean married;

	public Student getS() {
		return s;
	}

	public void setS(Student s) {
		this.s = s;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getClazz() {
		return clazz;
	}

	public void setClazz(String clazz) {
		this.clazz = clazz;
	}

	public String getPolitics() {
		return politics;
	}

	public void setPolitics(String politics) {
		this.politics = politics;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getLayer() {
		return layer;
	}

	public void setLayer(String layer) {
		this.layer = layer;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getHomephone() {
		return homephone;
	}

	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getDaytoschool() {
		return daytoschool;
	}

	public void setDaytoschool(String daytoschool) {
		this.daytoschool = daytoschool;
	}

	public String getRuxuekaohao() {
		return ruxuekaohao;
	}

	public void setRuxuekaohao(String ruxuekaohao) {
		this.ruxuekaohao = ruxuekaohao;
	}

	public int getYears() {
		return years;
	}

	public void setYears(int years) {
		this.years = years;
	}

	public boolean isMarried() {
		return married;
	}

	public void setMarried(boolean married) {
		this.married = married;
	}

	@Override
	public String toString() {
		return "StudentM [s=" + s + ", department=" + department + ", clazz="
				+ clazz + ", politics=" + politics + ", origin=" + origin
				+ ", nation=" + nation + ", layer=" + layer + ", postcode="
				+ postcode + ", homephone=" + homephone + ", contact="
				+ contact + ", daytoschool=" + daytoschool + ", ruxuekaohao="
				+ ruxuekaohao + ", years=" + years + ", married=" + married
				+ "]";
	}
}
