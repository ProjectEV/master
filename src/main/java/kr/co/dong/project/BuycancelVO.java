package kr.co.dong.project;

public class BuycancelVO {
	private int buycancel_buydetailno;
	private String buycancel_regdate;
	
	
	public int getBuycancel_buydetailno() {
		return buycancel_buydetailno;
	}
	public void setBuycancel_buydetailno(int buycancel_buydetailno) {
		this.buycancel_buydetailno = buycancel_buydetailno;
	}
	public String getBuycancel_regdate() {
		return buycancel_regdate;
	}
	public void setBuycancel_regdate(String buycancel_regdate) {
		this.buycancel_regdate = buycancel_regdate;
	}
	@Override
	public String toString() {
		return "BuycancelVO [buycancel_buydetailno=" + buycancel_buydetailno + ", buycancel_regdate="
				+ buycancel_regdate + "]";
	}
	
	
}
