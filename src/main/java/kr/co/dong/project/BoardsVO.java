package kr.co.dong.project;

public class BoardsVO {
	private int boards_no;
	private String boards_title;
	private String boards_content;
	private String boards_userid;
	private String boards_regdate;
	private int boards_readcnt;
	private int boards_category;
	private int del;
	private String boards_productid;
	private float boards_review_score;
	private int boards_inquiry_conn;
	
	public int getBoards_inquiry_conn() {
		return boards_inquiry_conn;
	}
	public void setBoards_inquiry_conn(int boards_inquiry_conn) {
		this.boards_inquiry_conn = boards_inquiry_conn;
	}
	public int getBoards_no() {
		return boards_no;
	}
	public void setBoards_no(int boards_no) {
		this.boards_no = boards_no;
	}
	public String getBoards_title() {
		return boards_title;
	}
	public void setBoards_title(String boards_title) {
		this.boards_title = boards_title;
	}
	public String getBoards_content() {
		return boards_content;
	}
	public void setBoards_content(String boards_content) {
		this.boards_content = boards_content;
	}
	public String getBoards_userid() {
		return boards_userid;
	}
	public void setBoards_userid(String boards_userid) {
		this.boards_userid = boards_userid;
	}
	public String getBoards_regdate() {
		return boards_regdate;
	}
	public void setBoards_regdate(String boards_regdate) {
		this.boards_regdate = boards_regdate;
	}
	public int getBoards_readcnt() {
		return boards_readcnt;
	}
	public void setBoards_readcnt(int boards_readcnt) {
		this.boards_readcnt = boards_readcnt;
	}
	public int getBoards_category() {
		return boards_category;
	}
	public void setBoards_category(int boards_category) {
		this.boards_category = boards_category;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getBoards_productid() {
		return boards_productid;
	}
	public void setBoards_productid(String boards_productid) {
		this.boards_productid = boards_productid;
	}
	public float getBoards_review_score() {
		return boards_review_score;
	}
	public void setBoards_review_score(float boards_review_score) {
		this.boards_review_score = boards_review_score;
	}
	@Override
	public String toString() {
		return "BoardsVO [boards_no=" + boards_no + ", boards_title=" + boards_title + ", boards_content="
				+ boards_content + ", boards_userid=" + boards_userid + ", boards_regdate=" + boards_regdate
				+ ", boards_readcnt=" + boards_readcnt + ", boards_category=" + boards_category + ", del=" + del
				+ ", boards_productid=" + boards_productid + ", boards_review_score=" + boards_review_score + "]";
	}
	
	
	
	}
