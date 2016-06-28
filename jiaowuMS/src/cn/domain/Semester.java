package cn.domain;

public class Semester {
	private int id;
	private String date;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Semester [id=" + id + ", date=" + date + "]";
	}
}
