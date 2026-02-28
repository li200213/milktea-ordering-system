package model;

public class User {
	private int id;
	private String username;
	private String password;
	private boolean isadmin;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isAdmin() {
		return isadmin;
	}
	public void setAdmin(boolean isadmin) {
		this.isadmin = isadmin;
	}
}
