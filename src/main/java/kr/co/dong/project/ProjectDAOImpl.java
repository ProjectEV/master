package kr.co.dong.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectDAOImpl implements ProjectDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String nameSpace="kr.co.dong.projectMapper";
	
	

	@Override
	public List<ProductVO> homeList(Map<String, Object> codeMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".homeList", codeMap);
	}	
	
	@Override
	   public int findReview(int buydetail_no) {
	      // TODO Auto-generated method stub
	      return sqlSession.selectOne(nameSpace + ".findReview", buydetail_no);
	   }
	   @Override
	   public int updateBuydetailReview(int buydetail_no) {
	      // TODO Auto-generated method stub
	      return sqlSession.update(nameSpace + ".updateBuydetailReview", buydetail_no);
	   }

	
	
	
	@Override
	public int product_totalRecord() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".product_totalRecord");
	}
	@Override
	public int mypage_totalRecord(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".mypage_totalRecord", user_id);
	}
	@Override
	public int address_totalRecord(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".address_totalRecord", user_id);
	}
	@Override
	public int cart_totalRecord(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".cart_totalRecord", user_id);
	}
	@Override
	public int totalReview(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".totalReview", product_id);
	}
	
	
	

	@Override
	public int boardsReadCnt(int boards_no) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace+".boardsReadCnt", boards_no);
	}
	
	@Override
	public List<BoardsVO> reviewlist(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".reviewlist", product_id);
	}
	
	
	
	
	@Override
	public ProductVO productDetail(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".productDetail", product_id);
	}
	@Override
	public GradeVO gradeDetail(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".gradeDetail", user_id);
	}
	
	
	
	
	
	@Override
	public List<ProductVO> listProduct(int start, int productPageSIZE) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("pageSIZE", productPageSIZE);
		return sqlSession.selectList(nameSpace + ".listProduct", map);
	}
	@Override
	public List<ProductVO> listMypage(int start, int pageSIZE, String user_id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("pageSIZE", pageSIZE);
		map.put("user_id", user_id);
		return sqlSession.selectList(nameSpace + ".listMypage", map);
	}
	@Override
	public List<ProductVO> listProduct() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listProductVoid");
	}
	@Override
	public List<AddressVO> listAddress(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".listAddress", user_id);
	}
	@Override
	public List<CartVO> listCart(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".listCart", user_id);
	}
	@Override
	public List<BuydetailVO> listSales() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace+".listSales");
	}	
	@Override
	public List<BuydetailVO> listSales(int start, int salPageSIZE) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("pageSIZE", salPageSIZE);
		return sqlSession.selectList(nameSpace + ".listSalesPaging", map);
	}	
	@Override
	public List<BuydetailVO> listCancel() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listCancel");
	}
	@Override
	public List<BuydetailVO> listCancel(int start, int c1PageSIZE) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("pageSIZE", c1PageSIZE);
		return sqlSession.selectList(nameSpace + ".listCancelPaging", map);
	}	
	@Override
	public List<BuydetailVO> listCancel(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listCancel2", user_id);
	}
	@Override
	public List<BuydetailVO> listCancel(String user_id, int start, int c2PageSIZE) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("start", start);
		map.put("pageSIZE", c2PageSIZE);
		return sqlSession.selectList(nameSpace + ".listCancelPaging2", map);
	}		
	
	
	
	
	@Override
	   public List<BuyVO> listBuy(String userid, int start, int mypagePageSIZE) {
	      // TODO Auto-generated method stub
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("userid", userid);
	      map.put("start", start);
	      map.put("pageSIZE", mypagePageSIZE);
	      return sqlSession.selectList(nameSpace + ".listBuy", map);
	   }

	@Override
	public List<BuydetailVO> listBuydetail(int[] buyno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listBuydetail", buyno);
	}
	
	@Override
	public List<ProductVO> mypageDetailProduct(String[] productno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".mypageDetailProduct", productno);
	}
	
	

	@Override
	public Map<String, Object> projectLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace +".projectLogin",map);
	}

	@Override
	public int join(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".join", userVO);
	}
	@Override
	public int pay(BuyVO buyVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".pay", buyVO);
	}
	@Override
	public int review(BoardsVO boardsVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".review", boardsVO);
	}
	@Override
	public int grade(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".grade", userVO);
	}
	@Override
	public int grade(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".grade2", user_id);
	}
	@Override
	public int findGradeUser(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".findGradeUser", user_id);
	}
	@Override
	public int findGradeTotalPrice(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".findGradeTotalPrice", user_id);
	}
	@Override
	public int updateGrade(String user_id, int totalPrice, int grade, int discount, String gradename) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("totalPrice", totalPrice);
		map.put("grade", grade);
		map.put("discount", discount);
		map.put("gradename", gradename);
		return sqlSession.update(nameSpace + ".updateGrade", map);
	}
	
	
	
	
	
	
	
	
	
	@Override
	public int productRegister(ProductVO productVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".productRegister", productVO);
	}
	@Override
	public int productDelete(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".productDelete", product_id);
	}
	@Override
	public int productRemainPlus(int product_plus, String product_id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_plus", product_plus);
		map.put("product_id", product_id);
		return sqlSession.update(nameSpace+".productRemainPlus", map);
	}
	
	
	
	
	@Override
	public int productUpdate(ProductVO productVO) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".productUpdate", productVO);
	}
	
	@Override
	public int productAdd(String product_id, int product_add) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("product_add", product_add);
		return sqlSession.update(nameSpace+".productAdd", map);
	}
	
	
	
	@Override
	public int cartRegister(String user_id, String product_id, String product_name, int amount) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("product_id", product_id);
		map.put("product_name", product_name);
		map.put("amount", amount);
		return sqlSession.insert(nameSpace + ".cartRegister", map);
	}
	
	
	@Override
	public int cartUpdate(String user_id, String product_id, int cart_amount) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("product_id", product_id);
		map.put("cart_amount", cart_amount);
		return sqlSession.update(nameSpace + ".cartUpdate", map);
	}
	@Override
	public int findCart(String product_id, String user_id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("user_id", user_id);
		return sqlSession.selectOne(nameSpace + ".findCart", map);
	}
	@Override
	public int findProductPrice(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".findProductPrice", product_id);
	}
	
	
	
	
	@Override
	public int remainCheck(List<CartVO> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".remainCheck", list);
	}
	@Override
	public int buyRegister(String buy_address, String buy_receive, int totalRecord, String user_id, int totalPrice) {
			// TODO Auto-generated method stub
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("buy_address", buy_address);
			map.put("buy_receive", buy_receive);
			map.put("totalRecord", totalRecord);
			map.put("totalPrice", totalPrice);
			map.put("user_id", user_id);
			return sqlSession.insert(nameSpace + ".buyRegister", map);
		}
	@Override
	public int buyDetailRegister(List<CartVO> list, int u, int discount) {
			// TODO Auto-generated method stub
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("discount", discount);
			map.put("list", list);
			map.put("u", u);
			return sqlSession.insert(nameSpace + ".buyDetailRegister", map);
		}
	@Override
	public int cartDelete(String user_id) {
			// TODO Auto-generated method stub
			return sqlSession.delete(nameSpace + ".cartDelete", user_id);
		}
	@Override
	public int cartDelete(String user_id, String product_id) {
			// TODO Auto-generated method stub
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("user_id", user_id);
			map.put("product_id", product_id);
			return sqlSession.delete(nameSpace + ".cartDeleteOne", map);
		}
	@Override
	public int findBuyno() {
			// TODO Auto-generated method stub
			return sqlSession.selectOne(nameSpace + ".findBuyno");
		}
	@Override
	public int salesUpdate(List<CartVO> list) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".salesUpdate", list);
	}
	
	
	
	
	@Override
	public AddressVO findMainAddress(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".findMainAddress", user_id);
	}
	@Override
	public int findProductNo(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".findProductNo", product_id);
	}
	@Override
	public List<ProductVO> findSameCategory(int category, String product_id) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("product_id", product_id);
		return sqlSession.selectList(nameSpace + ".findSameCategory", map);
	}
	
	
	
	
	@Override
	public BuydetailVO buydetailDetail(int buydetail_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".buydetailDetail", buydetail_no);
	}
	@Override
	public BuyVO buyDetail(int buy_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".buyDetail", buy_no);
	}
	@Override
	public int cancelUpdateBuy(int buy_no, int buydetailPrice) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("buy_no", buy_no);
		map.put("buydetailPrice", buydetailPrice);
		return sqlSession.update(nameSpace + ".cancelUpdateBuy", map);
	}
	@Override
	public int cancelUpdateProduct(String product_id, int amount) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("amount", amount);
		return sqlSession.update(nameSpace + ".cancelUpdateProduct", map);
	}
	@Override
	public int deleteBuydetail(int buydetail_no) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".deleteBuydetail", buydetail_no);
	}
	@Override
	public int deleteBuy(int buy_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(nameSpace + ".deleteBuy", buy_no);
	}
	@Override
	public int cancelDate(int buydetail_no) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".cancelDate", buydetail_no);
	}	
	
	
	
	@Override
	public int fileUpload(FileVO fileVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".fileUpload", fileVO);
	}

	@Override
	public List<String> fileSelect(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".fileSelect", product_id);
	}

	@Override
	public List<FileVO> listFileSelect(String[] productno) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listFileSelect", productno);
	}
	
	@Override
	public int boardsNoLast() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".boardsNoLast");
	}
	
	
	

	
	//아이디 중복체크 처리
	@Override
	public int id_check(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".id_check",user_id);
	}
	
	@Override
	public String id_search(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".id_search", map);
	}
	
	@Override
	public String pwd_search(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace+".pwd_search", user_id);
	}
	
	@Override
	public int pwd_change(String user_id, String user_password) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_password", user_password);
		return sqlSession.update(nameSpace+".pwd_change", map);
	}
	

	
	@Override
	public List<AddressVO> addressManageSelect1(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".addressManageSelect1", userid);
	}

	@Override
	public AddressVO addressManageUpdate1(int address_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".addressManageUpdate1", address_no);
	}

	@Override
	public int addressManageUpdate2(AddressVO addressVO) {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".addressManageUpdate2", addressVO);
	}

	@Override
	public int addressManageAdd2(AddressVO addressVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace + ".addressManageAdd2", addressVO);
	}

	@Override
	public int addressManageDelete1(int address_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(nameSpace + ".addressManageDelete1", address_no);
	}

	@Override
	public int addressManageMainReset() {
		// TODO Auto-generated method stub
		return sqlSession.update(nameSpace + ".addressManageMainReset");	
	
	}
	
	
	
	
	@Override
	public List<ProductVO> productSearch(String keyword) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".productSearch", keyword);
	}
	@Override
	public List<ProductVO> productSearch(String keyword, int start, int plPageSIZE) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("plPageSIZE", plPageSIZE);
		return sqlSession.selectList(nameSpace + ".productSearchKeyword", map);
	}	
	
	@Override
	public List<ProductVO> categorySearch(Map<String, Object> categoryMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".categorySearch", categoryMap);
	}
	@Override
	public List<ProductVO> categorySearch(Map<String, Object> categoryMap, int start, int lcPageSIZE) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		int category = Integer.parseInt(String.valueOf(categoryMap.get("category")));
		map.put("category", category);
		map.put("start", start);
		map.put("lcPageSIZE", lcPageSIZE);
		return sqlSession.selectList(nameSpace + ".categorySearchCategory", map);
	}
	@Override
	public List<ProductVO> orderSearch(Map<String, Object> codeMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".orderSearch", codeMap);
	}
	@Override
	public List<ProductVO> orderSearch(Map<String, Object> codeMap, int start, int ocPageSIZE) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		int code = Integer.parseInt(String.valueOf(codeMap.get("code")));
		map.put("code", code);
		map.put("start", start);
		map.put("ocPageSIZE", ocPageSIZE);
		return sqlSession.selectList(nameSpace + ".orderSearchCode", map);
	}

	
	
	
	
	
	
	@Override
	public float findAvgScore(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".findAvgScore", product_id);
	}
	@Override
	public int updateAvgScore(String product_id, float productAvgScore) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product_id", product_id);
		map.put("productAvgScore", productAvgScore);
		return sqlSession.update(nameSpace + ".updateAvgScore", map);
	}




	@Override
	public List<ProductVO> listUserCartProduct(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listUserCartProduct", user_id);
	}




	@Override
	public int updateBuydetailCode(int buydetail_no, String code) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("buydetail_no", buydetail_no);
		map.put("code", code);
		return sqlSession.update(nameSpace + ".updateBuydetailCode", map);
	}


	@Override
	public List<BoardsVO> detailAdminInquiryList(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".detailAdminInquiryList", product_id);
	}
	
	@Override
	public List<BoardsVO> inquirylist(String product_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".inquirylist", product_id);
	}
	
	@Override
	public List<BoardsVO> adminInquirylist() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".adminInquirylist");
	}
	
	@Override
	public int adminInquiryForm(BoardsVO boardsVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".adminInquiryForm",boardsVO);
	}
	
	@Override
	public int inquiry(BoardsVO boardsVO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(nameSpace+".inquiry", boardsVO);
	}
	
	@Override
	public List<ProductVO> wishlist(List<String> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".wishlist", list);
	}
	
	@Override
	public String selectCategory(Map<String, Object> codeMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(nameSpace + ".selectCategory", codeMap);
	}

	@Override
	public List<FileVO> listSelectReview(int[] fileReviewId) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(nameSpace + ".listSelectReview", fileReviewId);
	}
	
   @Override
   public int naver_login(UserVO userDTO) {
      // TODO Auto-generated method stub
      return sqlSession.insert(nameSpace+".naver_login",userDTO);
   }
   
   @Override
   public int isEmailExists(String user_id) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne(nameSpace+".isEmailExists", user_id);
   }





	
	

}
