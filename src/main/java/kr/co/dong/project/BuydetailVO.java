package kr.co.dong.project;

public class BuydetailVO {
   private int buydetail_no;
   private int buydetail_buyno;
   private String buydetail_productid;
   private int buydetail_amount;
   private String buydetail_code;
   private int buydetail_discounted;
   private int buydetail_del;
   private int buydetail_review;

   private String buy_userid;
   private String buy_regdate;
   private String buy_address;
   private String buy_receive;
   
   private int product_price;
   private String product_name;
   
   private String user_name;
   private String user_phone;
   private String user_email;
   
   private int grade_discount;
   
   private int buycancel_buydetailno;
   private String buycancel_regdate;
   
   
   
   @Override
   public String toString() {
      return "BuydetailVO [buydetail_no=" + buydetail_no + ", buydetail_buyno=" + buydetail_buyno
            + ", buydetail_productid=" + buydetail_productid + ", buydetail_amount=" + buydetail_amount
            + ", buydetail_code=" + buydetail_code + ", buydetail_discounted=" + buydetail_discounted
            + ", buydetail_del=" + buydetail_del + ", buydetail_review=" + buydetail_review + ", buy_userid="
            + buy_userid + ", buy_regdate=" + buy_regdate + ", buy_address=" + buy_address + ", buy_receive="
            + buy_receive + ", product_price=" + product_price + ", product_name=" + product_name + ", user_name="
            + user_name + ", user_phone=" + user_phone + ", user_email=" + user_email + ", grade_discount="
            + grade_discount + ", buycancel_buydetailno=" + buycancel_buydetailno + ", buycancel_regdate="
            + buycancel_regdate + "]";
   }
   public int getBuydetail_review() {
      return buydetail_review;
   }
   public void setBuydetail_review(int buydetail_review) {
      this.buydetail_review = buydetail_review;
   }
   public int getBuydetail_del() {
      return buydetail_del;
   }
   public void setBuydetail_del(int buydetail_del) {
      this.buydetail_del = buydetail_del;
   }
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
   public int getBuydetail_discounted() {
      return buydetail_discounted;
   }
   public void setBuydetail_discounted(int buydetail_discounted) {
      this.buydetail_discounted = buydetail_discounted;
   }
   public int getGrade_discount() {
      return grade_discount;
   }
   public void setGrade_discount(int grade_discount) {
      this.grade_discount = grade_discount;
   }
   public String getBuy_address() {
      return buy_address;
   }
   public void setBuy_address(String buy_address) {
      this.buy_address = buy_address;
   }
   public String getBuy_receive() {
      return buy_receive;
   }
   public void setBuy_receive(String buy_receive) {
      this.buy_receive = buy_receive;
   }
   public String getUser_name() {
      return user_name;
   }
   public void setUser_name(String user_name) {
      this.user_name = user_name;
   }
   public String getUser_phone() {
      return user_phone;
   }
   public void setUser_phone(String user_phone) {
      this.user_phone = user_phone;
   }
   public String getUser_email() {
      return user_email;
   }
   public void setUser_email(String user_email) {
      this.user_email = user_email;
   }
   public String getProduct_name() {
      return product_name;
   }
   public void setProduct_name(String product_name) {
      this.product_name = product_name;
   }
   public String getBuydetail_code() {
      return buydetail_code;
   }
   public void setBuydetail_code(String buydetail_code) {
      this.buydetail_code = buydetail_code;
   }
   public String getBuy_userid() {
      return buy_userid;
   }
   public void setBuy_userid(String buy_userid) {
      this.buy_userid = buy_userid;
   }
   public int getProduct_price() {
      return product_price;
   }
   public void setProduct_price(int product_price) {
      this.product_price = product_price;
   }
   public String getBuy_regdate() {
      return buy_regdate;
   }
   public void setBuy_regdate(String buy_regdate) {
      this.buy_regdate = buy_regdate;
   }
   public int getBuydetail_no() {
      return buydetail_no;
   }
   public void setBuydetail_no(int buydetail_no) {
      this.buydetail_no = buydetail_no;
   }
   public int getBuydetail_buyno() {
      return buydetail_buyno;
   }
   public void setBuydetail_buyno(int buydetail_buyno) {
      this.buydetail_buyno = buydetail_buyno;
   }
   public String getBuydetail_productid() {
      return buydetail_productid;
   }
   public void setBuydetail_productid(String buydetail_productid) {
      this.buydetail_productid = buydetail_productid;
   }
   public int getBuydetail_amount() {
      return buydetail_amount;
   }
   public void setBuydetail_amount(int buydetail_amount) {
      this.buydetail_amount = buydetail_amount;
   }

   
   
   
}
