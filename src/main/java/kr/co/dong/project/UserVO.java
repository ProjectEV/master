package kr.co.dong.project;

public class UserVO {
	public String user_id;
	public String user_name;
	public String user_password;
	public String user_email;
	public String user_birth;
	public int user_admin;
	public String user_phone;
	public String user_joindate;
	
	public UserVO() {}
	
	public UserVO(String user_name, String user_id, String user_phone, String user_password) {
	      this.user_name = user_name;
	      this.user_id = user_id;
	      this.user_phone = user_phone;
	      this.user_password = user_password;
	   }

	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public int getUser_admin() {
		return user_admin;
	}
	public void setUser_admin(int user_admin) {
		this.user_admin = user_admin;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_joindate() {
		return user_joindate;
	}
	public void setUser_joindate(String user_joindate) {
		this.user_joindate = user_joindate;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_name=" + user_name + ", user_password=" + user_password
				+ ", user_email=" + user_email + ", user_birth=" + user_birth + ", user_admin=" + user_admin
				+ ", user_phone=" + user_phone + ", user_joindate=" + user_joindate + "]";
	}
	
	
	
}
