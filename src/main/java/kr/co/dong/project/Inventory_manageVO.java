package kr.co.dong.project;

public class Inventory_manageVO {
	private int im_no;
	private String im_product_id;
	private int im_inout;
	private int im_amount;
	private int im_class;
	private String im_regdate;
	public int getIm_no() {
		return im_no;
	}
	public void setIm_no(int im_no) {
		this.im_no = im_no;
	}
	public String getIm_product_id() {
		return im_product_id;
	}
	public void setIm_product_id(String im_product_id) {
		this.im_product_id = im_product_id;
	}
	public int getIm_inout() {
		return im_inout;
	}
	public void setIm_inout(int im_inout) {
		this.im_inout = im_inout;
	}
	public int getIm_amount() {
		return im_amount;
	}
	public void setIm_amount(int im_amount) {
		this.im_amount = im_amount;
	}
	public int getIm_class() {
		return im_class;
	}
	public void setIm_class(int im_class) {
		this.im_class = im_class;
	}
	public String getIm_regdate() {
		return im_regdate;
	}
	public void setIm_regdate(String im_regdate) {
		this.im_regdate = im_regdate;
	}
	@Override
	public String toString() {
		return "Inventory_manageVO [im_no=" + im_no + ", im_product_id=" + im_product_id + ", im_inout=" + im_inout
				+ ", im_amount=" + im_amount + ", im_class=" + im_class + ", im_regdate=" + im_regdate + "]";
	}
	
	
	
}
