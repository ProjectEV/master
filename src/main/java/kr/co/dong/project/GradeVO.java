package kr.co.dong.project;

public class GradeVO {
	private int grade_no;
	private String grade_userid;
	private int grade_totalPurchase;
	private int grade;
	private int grade_discount;
	private String grade_name;
	public int getGrade_no() {
		return grade_no;
	}
	public void setGrade_no(int grade_no) {
		this.grade_no = grade_no;
	}
	public String getGrade_userid() {
		return grade_userid;
	}
	public void setGrade_userid(String grade_userid) {
		this.grade_userid = grade_userid;
	}
	public int getGrade_totalPurchase() {
		return grade_totalPurchase;
	}
	public void setGrade_totalPurchase(int grade_totalPurchase) {
		this.grade_totalPurchase = grade_totalPurchase;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getGrade_discount() {
		return grade_discount;
	}
	public void setGrade_discount(int grade_discount) {
		this.grade_discount = grade_discount;
	}
	public String getGrade_name() {
		return grade_name;
	}
	public void setGrade_name(String grade_name) {
		this.grade_name = grade_name;
	}
	@Override
	public String toString() {
		return "GradeVO [grade_no=" + grade_no + ", grade_userid=" + grade_userid + ", grade_totalPurchase="
				+ grade_totalPurchase + ", grade=" + grade + ", grade_discount=" + grade_discount + ", grade_name="
				+ grade_name + "]";
	}
	
	
	
	
}
