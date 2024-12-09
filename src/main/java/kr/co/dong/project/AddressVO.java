package kr.co.dong.project;

public class AddressVO {
	private int address_no;
	private String address_userid;
	private int address_main;
	private String address_name;
	private String address_content;
	
	
	public int getAddress_no() {
		return address_no;
	}
	public void setAddress_no(int address_no) {
		this.address_no = address_no;
	}
	public String getAddress_userid() {
		return address_userid;
	}
	public void setAddress_userid(String address_userid) {
		this.address_userid = address_userid;
	}
	public int getAddress_main() {
		return address_main;
	}
	public void setAddress_main(int address_main) {
		this.address_main = address_main;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public String getAddress_content() {
		return address_content;
	}
	public void setAddress_content(String address_content) {
		this.address_content = address_content;
	}
	@Override
	public String toString() {
		return "AddressVO [address_no=" + address_no + ", address_userid=" + address_userid + ", address_main="
				+ address_main + ", address_name=" + address_name + ", address_content=" + address_content + "]";
	}
	
	
	
	
}
