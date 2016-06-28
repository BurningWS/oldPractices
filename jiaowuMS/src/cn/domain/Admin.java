package cn.domain;

public class Admin {
	private String id;
	private String password;
	private byte state;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public byte getState() {
		return state;
	}

	public void setState(int state) {
		this.state = (byte) state;
	}

	@Override
	public String toString() {
		return "Admin [id=" + id + ", password=" + password + ", state="
				+ state + "]";
	}
}
