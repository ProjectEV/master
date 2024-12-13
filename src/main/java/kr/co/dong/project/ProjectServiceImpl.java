package kr.co.dong.project;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Inject
	private ProjectDAO projectDAO;
	
	@Override
	public List<ProductVO> homeList(Map<String, Object> codeMap) {
		// TODO Auto-generated method stub
		return projectDAO.homeList(codeMap);
	}	
	
	@Override
    public int findReview(int buydetail_no) {
       // TODO Auto-generated method stub
       return projectDAO.findReview(buydetail_no);
    }
    @Override
    public int updateBuydetailReview(int buydetail_no) {
       // TODO Auto-generated method stub
       return projectDAO.updateBuydetailReview(buydetail_no);
    }

	@Override
	public int product_totalRecord() {
		// TODO Auto-generated method stub
		return projectDAO.product_totalRecord();
	}
	
	@Override
	public int mypage_totalRecord(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.mypage_totalRecord(user_id);
	}
	@Override
	public int address_totalRecord(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.address_totalRecord(user_id);
	}
	
	@Override
	public int cart_totalRecord(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.cart_totalRecord(user_id);
	}
	
	@Override
	public int totalReview(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.totalReview(product_id);
	}

	@Override
	public int boardsReadCnt(int boards_no) {
		// TODO Auto-generated method stub
		return projectDAO.boardsReadCnt(boards_no);
	}
	
	@Override
	public List<BoardsVO> reviewlist(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.reviewlist(product_id);
	}
	
	@Override
	public ProductVO productDetail(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.productDetail(product_id);
	}
	
	@Override
	public GradeVO gradeDetail(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.gradeDetail(user_id);
	}

	@Override
	public List<ProductVO> listProduct(int start, int productPageSIZE) {
		// TODO Auto-generated method stub
		return projectDAO.listProduct(start, productPageSIZE);
	}
	
	@Override
	public List<ProductVO> listMypage(int start, int pageSIZE, String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.listMypage(start, pageSIZE, user_id);
	}
	
	@Override
	public List<ProductVO> listProduct() {
		// TODO Auto-generated method stub
		return projectDAO.listProduct();
	}
	
	@Override
	public List<AddressVO> listAddress(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.listAddress(user_id);
	}
	
	@Override
	public List<CartVO> listCart(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.listCart(user_id);
	}
	
	@Override
	public List<BuydetailVO> listSales() {
		// TODO Auto-generated method stub
		return projectDAO.listSales();
	}	
	
	@Override
	public List<BuydetailVO> listSales(int start, int salPageSIZE) {
		// TODO Auto-generated method stub
		return projectDAO.listSales(start, salPageSIZE);
	}	
	
	@Override
	public List<BuydetailVO> listCancel() {
		// TODO Auto-generated method stub
		return projectDAO.listCancel();
	}
	
	@Override
	public List<BuydetailVO> listCancel(int start, int c1PageSIZE) {
		// TODO Auto-generated method stub
		return projectDAO.listCancel(start, c1PageSIZE);
	}	
	
	@Override
	public List<BuydetailVO> listCancel(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.listCancel(user_id);
	}
	
	@Override
	public List<BuydetailVO> listCancel(String user_id, int start, int c2PageSIZE) {
		// TODO Auto-generated method stub
		return projectDAO.listCancel(user_id, start, c2PageSIZE);
	}

	@Override
    public List<BuyVO> listBuy(String userid, int start, int mypagePageSIZE) {
       // TODO Auto-generated method stub
       return projectDAO.listBuy(userid, start, mypagePageSIZE);
    }

	@Override
	public List<BuydetailVO> listBuydetail(int[] buyno) {
		// TODO Auto-generated method stub
		return projectDAO.listBuydetail(buyno);
	}
	
	@Override
	public List<ProductVO> mypageDetailProduct(String[] productno) {
		// TODO Auto-generated method stub
		return projectDAO.mypageDetailProduct(productno);
	}

	@Override
	public Map<String, Object> projectLogin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return projectDAO.projectLogin(map);
	}

	@Override
	public int join(UserVO userVO) {
		// TODO Auto-generated method stub
		return projectDAO.join(userVO);
	}

	@Override
	public int pay(BuyVO buyVO) {
		// TODO Auto-generated method stub
		return projectDAO.pay(buyVO);
	}
	
	@Override
	public int review(BoardsVO boardsVO) {
		// TODO Auto-generated method stub
		return projectDAO.review(boardsVO);
	}
	
	@Override
	public int grade(UserVO userVO) {
		// TODO Auto-generated method stub
		return projectDAO.grade(userVO);
	}
	
	@Override
	public int grade(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.grade(user_id);
	}
	
	@Override
	public int findGradeUser(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.findGradeUser(user_id);
	}
	
	@Override
	public int findGradeTotalPrice(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.findGradeTotalPrice(user_id);
	}
	
	@Override
	public int updateGrade(String user_id, int totalPrice, int grade, int discount, String gradename) {
		// TODO Auto-generated method stub
		return projectDAO.updateGrade(user_id, totalPrice, grade, discount, gradename);
	}
	
	@Override
	public int productRegister(ProductVO productVO) {
		// TODO Auto-generated method stub
		return projectDAO.productRegister(productVO);
	}
	
	@Override
	public int productDelete(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.productDelete(product_id);
	}
	
	@Override
	public int productRemainPlus(int product_plus, String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.productRemainPlus(product_plus, product_id);
	}

	@Override
	public int productUpdate(ProductVO productVO) {
		// TODO Auto-generated method stub
		return projectDAO.productUpdate(productVO);
	}
	
	@Override
	public int productAdd(String product_id, int product_add) {
		// TODO Auto-generated method stub
		return projectDAO.productAdd(product_id, product_add);
	}
	
	@Override
	public int cartRegister(String user_id, String product_id, String product_name, int amount) {
		// TODO Auto-generated method stub
		return projectDAO.cartRegister(user_id, product_id, product_name, amount);
	}

	@Override
	public int cartUpdate(String user_id, String product_id, int cart_amount) {
		// TODO Auto-generated method stub
		return projectDAO.cartUpdate(user_id, product_id, cart_amount);
	}
	
	@Override
	public int findCart(String product_id, String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.findCart(product_id, user_id);
	}
	
	@Override
	public int findProductPrice(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.findProductPrice(product_id);
	}

	@Override
	public int remainCheck(List<CartVO> list) {
		// TODO Auto-generated method stub
		return projectDAO.remainCheck(list);
	}
	
	@Override
	public int buyRegister(String buy_address, String buy_receive, int totalRecord, String user_id, int totalPrice) {
			// TODO Auto-generated method stub
			return projectDAO.buyRegister(buy_address, buy_receive, totalRecord, user_id, totalPrice);
	}
	
	@Override
	public int buyDetailRegister(List<CartVO> list, int u, int discount) {
			// TODO Auto-generated method stub
			return projectDAO.buyDetailRegister(list, u, discount);
		}
	
	@Override
	public int cartDelete(String user_id) {
			// TODO Auto-generated method stub
			return projectDAO.cartDelete(user_id);
		}
	
	@Override
	public int cartDelete(String user_id, String product_id) {
			// TODO Auto-generated method stub
			return projectDAO.cartDelete(user_id, product_id);
		}
	
	@Override
	public int findBuyno() {
			// TODO Auto-generated method stub
			return projectDAO.findBuyno();
		}
	
	@Override
	public int salesUpdate(List<CartVO> list) {
		// TODO Auto-generated method stub
		return projectDAO.salesUpdate(list);
	}

	@Override
	public AddressVO findMainAddress(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.findMainAddress(user_id);
	}
	
	@Override
	public int findProductNo(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.findProductNo(product_id);
	}
	
	@Override
	public List<ProductVO> findSameCategory(int category, String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.findSameCategory(category, product_id);
	}

	@Override
	public BuydetailVO buydetailDetail(int buydetail_no) {
		// TODO Auto-generated method stub
		return projectDAO.buydetailDetail(buydetail_no);
	}
	
	@Override
	public BuyVO buyDetail(int buy_no) {
		// TODO Auto-generated method stub
		return projectDAO.buyDetail(buy_no);
	}
	
	@Override
	public int cancelUpdateBuy(int buy_no, int buydetailPrice) {
		// TODO Auto-generated method stub
		return projectDAO.cancelUpdateBuy(buy_no, buydetailPrice);
	}
	
	@Override
	public int cancelUpdateProduct(String product_id, int amount) {
		// TODO Auto-generated method stub
		return projectDAO.cancelUpdateProduct(product_id, amount);
	}
	
	@Override
	public int deleteBuydetail(int buydetail_no) {
		// TODO Auto-generated method stub
		return projectDAO.deleteBuydetail(buydetail_no);
	}
	@Override
	public int deleteBuy(int buy_no) {
		// TODO Auto-generated method stub
		return projectDAO.deleteBuy(buy_no);
	}
	@Override
	public int cancelDate(int buydetail_no) {
		// TODO Auto-generated method stub
		return projectDAO.cancelDate(buydetail_no);
	}	
	
	@Override
	public int fileUpload(FileVO fileVO) {
		// TODO Auto-generated method stub
		return projectDAO.fileUpload(fileVO);
	}

	@Override
	public List<String> fileSelect(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.fileSelect(product_id);
	}

	@Override
	public List<FileVO> listFileSelect(String[] productno) {
		// TODO Auto-generated method stub
		return projectDAO.listFileSelect(productno);
	}
	
	@Override
	public int boardsNoLast() {
		// TODO Auto-generated method stub
		return projectDAO.boardsNoLast();
	}

	@Override
	public int id_check(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.id_check(user_id);
	}
	
	@Override
	public 	String id_search(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return projectDAO.id_search(map);
	}
	
	@Override
	public String pwd_search(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.pwd_search(user_id);
	}
	
	@Override
	public int pwd_change(String user_id, String user_password) {
		// TODO Auto-generated method stub
		return projectDAO.pwd_change(user_id, user_password);
	}

	@Override
	public List<AddressVO> addressManageSelect1(String userid) {
		// TODO Auto-generated method stub
		return projectDAO.addressManageSelect1(userid);
	}

	@Override
	public AddressVO addressManageUpdate1(int address_no) {
		// TODO Auto-generated method stub
		return projectDAO.addressManageUpdate1(address_no);
	}

	@Override
	public int addressManageUpdate2(AddressVO addressVO) {
		// TODO Auto-generated method stub
		return projectDAO.addressManageUpdate2(addressVO);
	}

	@Override
	public int addressManageAdd2(AddressVO addressVO) {
		// TODO Auto-generated method stub
		return projectDAO.addressManageAdd2(addressVO);
	}

	@Override
	public int addressManageDelete1(int address_no) {
		// TODO Auto-generated method stub
		return projectDAO.addressManageDelete1(address_no);
	}

	@Override
	public int addressManageMainReset() {
		// TODO Auto-generated method stub
		return projectDAO.addressManageMainReset();
	}	

	@Override
	public List<ProductVO> productSearch(String keyword) {
		// TODO Auto-generated method stub
		return projectDAO.productSearch(keyword);
	}	
	@Override
	public List<ProductVO> productSearch(String keyword, int start, int plPageSIZE) {
		// TODO Auto-generated method stub
		return projectDAO.productSearch(keyword, start, plPageSIZE);
	}		

	@Override
	public List<ProductVO> categorySearch(Map<String, Object> categoryMap) {
		// TODO Auto-generated method stub
		return projectDAO.categorySearch(categoryMap);
	}
	@Override
	public List<ProductVO> categorySearch(Map<String, Object> categoryMap, int start, int lcPageSIZE) {
		// TODO Auto-generated method stub
		return projectDAO.categorySearch(categoryMap, start, lcPageSIZE);
	}

	@Override
	public List<ProductVO> orderSearch(Map<String, Object> codeMap) {
		// TODO Auto-generated method stub
		return projectDAO.orderSearch(codeMap);
	}
	@Override
	public List<ProductVO> orderSearch(Map<String, Object> codeMap, int start, int ocPageSIZE) {
		// TODO Auto-generated method stub
		return projectDAO.orderSearch(codeMap, start, ocPageSIZE);
	}

	@Override
	public float findAvgScore(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.findAvgScore(product_id);
	}
	@Override
	public int updateAvgScore(String product_id, float productAvgScore) {
		// TODO Auto-generated method stub
		return projectDAO.updateAvgScore(product_id, productAvgScore);
	}

	@Override
	public List<ProductVO> listUserCartProduct(String user_id) {
		// TODO Auto-generated method stub
		return projectDAO.listUserCartProduct(user_id);
	}

	@Override
	public int updateBuydetailCode(int buydetail_no, String code) {
		// TODO Auto-generated method stub
		return projectDAO.updateBuydetailCode(buydetail_no, code);
	}

	@Override
	public List<BoardsVO> inquirylist(String product_id) {
		// TODO Auto-generated method stub
		return projectDAO.inquirylist(product_id);
	}

	@Override
	public List<BoardsVO> adminInquirylist() {
		// TODO Auto-generated method stub
		return projectDAO.adminInquirylist();
	}
	
	@Override
	public List<BoardsVO> detailAdminInquiryList(String product_id) {
	// TODO Auto-generated method stub
	return projectDAO.detailAdminInquiryList(product_id);
	}
	
	@Override
	public int adminInquiryForm(BoardsVO boardsVO) {
		// TODO Auto-generated method stub
		return projectDAO.adminInquiryForm(boardsVO);
	}
	
	@Override
	public int inquiry(BoardsVO boardsVO) {
		// TODO Auto-generated method stub
		return projectDAO.inquiry(boardsVO);
	}
	
	@Override
	public List<ProductVO> wishlist(List<String> list) {
		// TODO Auto-generated method stub
		return projectDAO.wishlist(list);
	}
	
	@Override
	public String selectCategory(Map<String, Object> codeMap) {
		// TODO Auto-generated method stub
		return projectDAO.selectCategory(codeMap);
	}

	@Override
	public List<FileVO> listSelectReview(int[] fileReviewId) {
		// TODO Auto-generated method stub
		return projectDAO.listSelectReview(fileReviewId);
	}

	@Override
    public int naver_login(UserVO userDTO) {
      // TODO Auto-generated method stub
      if(projectDAO.isEmailExists(userDTO.getUser_id()) == 0) {
         return projectDAO.naver_login(userDTO);   
      } else {
         return 0;
      }
    }

}
