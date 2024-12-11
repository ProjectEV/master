package kr.co.dong.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.project.AddressVO;
import kr.co.dong.project.AuthService;
import kr.co.dong.project.BoardsVO;
import kr.co.dong.project.BuyVO;
import kr.co.dong.project.BuydetailVO;
import kr.co.dong.project.CartVO;
import kr.co.dong.project.FileVO;
import kr.co.dong.project.GradeVO;
import kr.co.dong.project.NaverUserInfo;
import kr.co.dong.project.ProductVO;
import kr.co.dong.project.ProjectService;
import kr.co.dong.project.ScriptUtils;
import kr.co.dong.project.UserVO;

@Controller
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@Inject
	ProjectService projectService;

	@Inject
	AuthService authService;
	
	@Autowired
    public void SocialLoginController(AuthService authService) {
        this.authService = authService;
    }

	public static int ipageSIZE = 10; // 한 페이지에 담을 게시글의 개수
	public static int itotalRecord = 0;
	public static int itotalPage = 1;

	public static int istartPage = 1;
	public static int iendPage = 10;
	public static int ipageListSIZE = 10;
	
	//관리자 화면 - 재고관리
	@RequestMapping(value = "project/inventory", method = RequestMethod.GET)
	public ModelAndView inventory(@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
			@RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM) {

		itotalRecord = projectService.product_totalRecord(); // del=0인 게시글의 총 개수
		itotalPage = itotalRecord / ipageSIZE;
		if (itotalRecord % ipageSIZE != 0) {
			itotalPage++;
		} // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

		int start = (pageNUM - 1) * ipageSIZE;

		istartPage = (pageListNUM - 1) * ipageListSIZE + 1;
		iendPage = istartPage + ipageListSIZE - 1;
		if (iendPage > itotalPage) {
			iendPage = itotalPage;
		}

		// int end = start + pageSIZE - 1;
		// 해당 pageNUM 을 가진 페이지에는 bno가 start 부터 end 까지인 게시글들이 보여짐

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", projectService.listProduct(start, ipageSIZE));
		mav.addObject("imageList", listSelect(projectService.listProduct(start, ipageSIZE)));
		mav.addObject("totalPage", itotalPage);
		mav.addObject("startPage", istartPage);
		mav.addObject("pageListNUM", pageListNUM);
		mav.addObject("endPage", iendPage);
		mav.setViewName("inventory");
		return mav;

	}

	// 프로젝트 로그인 화면으로 단순 이동시키는 컨트롤러
	@RequestMapping(value = "project/login", method = RequestMethod.GET)
	public String projectLogin() {
		logger.info("project login view 이동");
		return "login";
	}

	// 로그인 처리
	@RequestMapping(value = "project/login", method = RequestMethod.POST)
	public String projectLogin(@RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		request.setCharacterEncoding("utf-8");
		logger.info("요청정보 받아서 보내기");

		Map<String, Object> user = projectService.projectLogin(map);

		if (user == null) { // 로그인 실패
			logger.info("로그인 안됨");

			ScriptUtils.alertAndMovePage(response, "아이디 또는 비밀번호를 다시 확인해주세요.", "login");
			return "redirect:login";
		} else { // 로그인 성공
			// 세션부여

			String user_id = (String) user.get("user_id");
			int r = projectService.findGradeUser(user_id);

			if (r == 0) {
				int s = projectService.grade(user_id);
				updateUserGrade(user_id);
			}

			session.setAttribute("user", user);
			return "redirect:/";
		}
	}

	public void updateUserGrade(String user_id) {
		int s = projectService.mypage_totalRecord(user_id);
		
		if (s != 0) {
			int totalPrice = projectService.findGradeTotalPrice(user_id);
			int grade = 0;
			String gradename = "Family";
			int discount = 0;
			if (totalPrice < 200000) {
				discount = 1;
			} else if (totalPrice < 500000) {
				grade = 1;
				gradename = "Silver";
				discount = 2;
			} else if (totalPrice < 1500000) {
				grade = 2;
				gradename = "Gold";
				discount = 4;
			} else {
				grade = 3;
				gradename = "VIP";
				discount = 6;
			}
			int r = projectService.updateGrade(user_id, totalPrice, grade, discount, gradename);
		}
	}

	//로그아웃
	@RequestMapping(value = "project/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("msg", "로그아웃되었습니다");
		return "redirect:/";
	}

	// 네이버 로그인 콜백
	   @RequestMapping(value ="product/naver_login", method = RequestMethod.GET)
	    public String naverCallback(@RequestParam("code") String code, @RequestParam("state") String state,
	          @RequestParam Map<String,Object> map,
	          HttpSession session) {
	        try {
	            // 1. 액세스 토큰 발급
	            String accessToken = authService.getAccessToken(code);
	            session.setAttribute("accessToken",accessToken);

	            // 2. 사용자 정보 가져오기
	            UserVO userInfo = authService.getUserInfo(accessToken);
	            
	            int result = projectService.naver_login(userInfo);
	               if (result > 0) {
	                  logger.info("정보 저장 성공");
	               } else {
	                  logger.info("정보 저장 실패");
	               }
	            
	    		HashMap<String, Object> naverLogin = new HashMap<String, Object>();
	    		naverLogin.put("user_id", userInfo.getUser_id());
	    		naverLogin.put("user_password", userInfo.getUser_password());
	       		Map<String, Object> user = projectService.projectLogin(naverLogin);
	    		session.setAttribute("user", user);

	            // 3. 세션에 사용자 정보 저장
	            //session.setAttribute("user", userInfo);
//	            String user_id = userInfo.getUser_id();
//	            System.out.print(user_id);
//	            Map<String, Object> user = projectService.login(map);
//	            map.put("user_id", user_id);
	            
	            // 4. 메인 페이지로 리다이렉트
	            return "redirect:/";
	        } catch (Exception e) {
	            e.printStackTrace();
	            return "redirect:/login?error=true";
	        }
	    }
	
	// 제품 목록 화면에서 제품을 클릭했을 때 출력될 상세페이지 (product_detail.jsp)
	@RequestMapping(value = "project/product_detail", method = RequestMethod.GET)
	public String productDetail(@RequestParam("product_id") String product_id, Model model) {

		updateProductAvgScore(product_id);
		
		//제품조회
		ProductVO productVO = projectService.productDetail(product_id);
		int totalReview = projectService.totalReview(product_id);
		model.addAttribute("totalReview", totalReview);
		model.addAttribute("product", productVO);

		  int category = productVO.getProduct_category();
	      List<ProductVO> sameCategoryList = projectService.findSameCategory(category, product_id);

	      int size = sameCategoryList.size();
	      model.addAttribute("size", size);

	      if (size > 0) {
	         int t = 0;
	         String[] productArray = new String[size];

	         for (ProductVO list : sameCategoryList) {
	            productArray[t] = list.getProduct_id();
	            t++;
	         }

	         int[] original = new int[size];
	         for (int i = 0; i < size; i++) {
	            original[i] = i;
	         }
	         int cup = 0;
	         for (int i = 0; i < size; i++) {
	            cup = original[size - i - 1];
	            int random = (int) ((size - i) * (Math.random()));
	            original[size - i - 1] = original[random];
	            original[random] = cup;
	         }

	         String[] productno = new String[size];
	         if (size > 4) {
	            size = 4;
	         }
	         for (int i = 0; i < size; i++) {
	            productno[i] = productArray[original[i]];
	         }
	         List<ProductVO> list = projectService.mypageDetailProduct(productno);
	         model.addAttribute("randomProductList", list);
	         model.addAttribute("imageList", listSelect(list));
	      }

		// 해당 제품에 대한 리뷰 조회
		List<BoardsVO> reviewlist = projectService.reviewlist(product_id);
		model.addAttribute("review_list", reviewlist);
		
		// 모든 리뷰 객체에서 리뷰 id 뽑기
		int[] reviewno = new int[100];
		for (int i = 0; i < reviewlist.size(); i++) {
			BoardsVO vo = reviewlist.get(i);
			reviewno[i] = vo.getBoards_no();
		}

		// 리뷰 사진 모두 조회
		List<FileVO> review_file = projectService.listSelectReview(reviewno);
		model.addAttribute("review_file", review_file);

		//해당 제품 이미지 조회
		List<String> file_name = projectService.fileSelect(product_id);
		model.addAttribute("file_name", file_name);
		
		//카테고리 조회
		Map<String, Object> codeMap = new HashMap<>();
		codeMap.put("category", Integer.toString(productVO.getProduct_category()));
		String category_main = projectService.selectCategory(codeMap);
		model.addAttribute("category", category_main);
		
		// 해당 제품에 대한 문의 조회
		List<BoardsVO> inquirylist = projectService.inquirylist(product_id);
		model.addAttribute("inquiry_list",inquirylist);
		
		// 해당 제품 관리자 답변 조회
		List<BoardsVO> adminInquiryList = projectService.detailAdminInquiryList(product_id);
		model.addAttribute("adminInquiryList",adminInquiryList);
		
		return "product_detail";
	}

	//관리자 화면 - 재고관리 상세 페이지
	@RequestMapping(value = "project/inventory_detail", method = RequestMethod.GET)
	public String inventoryDetail(@RequestParam("product_id") String product_id, Model model) {
		
		updateProductAvgScore(product_id);
		
		ProductVO productVO = projectService.productDetail(product_id);
		int totalReview = projectService.totalReview(product_id);
		List<String> file_name = projectService.fileSelect(product_id);
		model.addAttribute("file_name", file_name);
		model.addAttribute("totalReview", totalReview);
		model.addAttribute("product", productVO);

		// 해당 제품에 대한 리뷰 조회
		List<BoardsVO> reviewlist = projectService.reviewlist(product_id);
		model.addAttribute("review_list", reviewlist);
		
		//카테고리 조회
		Map<String, Object> codeMap = new HashMap<>();
		codeMap.put("category", Integer.toString(productVO.getProduct_category()));
		String category_main = projectService.selectCategory(codeMap);
		model.addAttribute("category", category_main);
		
		// 해당 제품에 대한 문의 조회
		List<BoardsVO> inquirylist = projectService.inquirylist(product_id);
		model.addAttribute("inquiry_list",inquirylist);
		
		// 해당 제품 관리자 답변 조회
		List<BoardsVO> adminInquiryList = projectService.detailAdminInquiryList(product_id);
		model.addAttribute("adminInquiryList",adminInquiryList);

		return "inventory_detail";
	}

	//관리자 화면 - 상품등록 (get)
	@RequestMapping(value = "project/product_register", method = RequestMethod.GET)
	public String productRegister() {
		logger.info("관리자 글 작성 이동");
		return "admin_post";
	}

	//관리자 화면 - 상품등록 (post)
	@RequestMapping(value = "project/product_register", method = RequestMethod.POST)
	public String productRegister(@RequestParam("files") List<MultipartFile> files, ProductVO productVO,
			HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("내용" + productVO);

		String imagePath = "/C:\\uploads/";

		for (MultipartFile file : files) {
			String uuid = UUID.randomUUID().toString();
			String filename = uuid + "_" + file.getOriginalFilename();

			File dest = new File(imagePath + filename);

			file.transferTo(dest);

			FileVO fileVO = new FileVO();
			fileVO.setFile_name(filename);
			fileVO.setFile_path("/C:\\uploads/" + filename);
			fileVO.setFile_connection_id(productVO.getProduct_id());

			projectService.fileUpload(fileVO);
		}

		int r = projectService.productRegister(productVO);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "추가에 성공하였습니다."); // 세션저장
		}
		return "redirect:inventory";
	}

	// 기존에 있던 product 수량만 추가
	@RequestMapping(value = "project/productRemainPlus", method = RequestMethod.POST)
	public String productRemainPlus(@RequestParam("product_add") int product_add,
			@RequestParam("product_id") String product_id) {
		int r = projectService.productRemainPlus(product_add, product_id);

		return "redirect:inventory";
	}

	// 재고관리 - 제품 수량 추가
	@RequestMapping(value = "project/product_add", method = RequestMethod.POST)
	public String productAdd(@RequestParam("product_add") int product_add,
			@RequestParam("product_id") String product_id) {
		int r = projectService.productAdd(product_id, product_add);

		return "redirect:inventory_detail?product_id=" + product_id;
	}

	// 재고관리 - 제품수정 (get)
	@RequestMapping(value = "project/product_update", method = RequestMethod.GET)
	public String productUpdate(@RequestParam("product_id") String product_id, Model model) {
		ProductVO productVO = projectService.productDetail(product_id);
		model.addAttribute("product", productVO);
		return "admin_update";
	}

	// 재고관리 - 제품수정 (post)
	@RequestMapping(value = "project/product_update", method = RequestMethod.POST)
	public String productUpdate(ProductVO productVO, RedirectAttributes attr, HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		int r = projectService.productUpdate(productVO);
		// 수정에 성공하면 목록보기로 이동
		if (r > 0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:inventory";
		}
		// 수정에 실패하면 수정보기 화면으로 이동
		return "redirect:inventory";
	}

	// 재고관리 - 제품삭제
	@RequestMapping(value = "project/product_delete", method = RequestMethod.GET)
	public String productDelete(@RequestParam("product_id") String product_id, RedirectAttributes rttr) {
		int r = projectService.productDelete(product_id);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "글삭제에 성공하였습니다.");
			return "redirect:inventory";
		}
		return "redirect:inventory_detail?product_id=" + product_id;
	}

	// 재고관리 상세페이지에서 뒤로가기(원래 있던 페이지로)
	@RequestMapping(value = "project/backToList", method = RequestMethod.GET)
	public String backToList(@RequestParam("product_id") String product_id, Model model) {

		int no = projectService.findProductNo(product_id);

		int pageSize = 10; // 해당 게시판을 호출할 때 사용한 pageSize
		int pageListSize = 10; // 해당 게시판을 호출할 때 사용한 pageListSize

		int pageNUM = no / pageSize;
		if (no % pageSize != 0) {
			pageNUM++;
		}
		int pageListNUM = no / (pageSize * pageListSize);
		if (no % (pageSize * pageListSize) != 0) {
			pageListNUM++;
		}

		return "redirect:inventory?pageListNUM=" + pageListNUM + "&pageNUM=" + pageNUM;
	}

	// 주문/결제 페이지로 이동 (get)
	@RequestMapping(value = "project/pay", method = RequestMethod.GET)
	public ModelAndView pay(@RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request,
			HttpServletResponse response, Model model) throws Exception {
		logger.info("pay 이동");

		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");
		
		ModelAndView mav = new ModelAndView();
		
		List<CartVO> firstList = projectService.listCart(user_id);
		for (CartVO cart : firstList) {
			if (cart.getProduct_remain() == 0) {
				ScriptUtils.alertAndMovePage(response, "매진된 상품은 구매할 수 없습니다.", "cart");
				mav.setViewName("cart");
				return mav;
			}
		}		
		
		int totalRecord = projectService.cart_totalRecord(user_id);

		if (totalRecord == 0) {
			ScriptUtils.alertAndMovePage(response, "장바구니에 상품이 없습니다.", "cart");
			mav.setViewName("cart");
			return mav;
		}

		for (int i = 0; i < totalRecord; i++) {
			String a = "update[" + i + "].cart_productid";
			String b = "update[" + i + "].cart_amount";
			String product_id = (String) (map.get(a));
			int cart_amount = Integer.parseInt((String) map.get(b));
			int r = projectService.cartUpdate(user_id, product_id, cart_amount);
		}

		List<CartVO> list = projectService.listCart(user_id);
		GradeVO grade = projectService.gradeDetail(user_id);

		AddressVO address = projectService.findMainAddress(user_id);

		mav.addObject("address", address);
		mav.addObject("list", list);
		mav.addObject("grade", grade);
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("pay");
		return mav;
	}

	// 주문/결제 페이지로 이동 (post)
	@RequestMapping(value = "project/pay", method = RequestMethod.POST)
	public String pay(@RequestParam("buy_address") String buy_address, @RequestParam("buy_receive") String buy_receive,
			HttpSession session, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("내용");

		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");

		List<CartVO> list = projectService.listCart(user_id);
		int totalRecord = projectService.cart_totalRecord(user_id);

//		int w = projectService.remainCheck(list);

		int totalPrice = 0;

		for (CartVO cart : list) {
			if (cart.getCart_amount() > cart.getProduct_remain()) {
				return "redirect:cart";
			}
			int price = projectService.findProductPrice(cart.getCart_productid());
			int amount = cart.getCart_amount();
			totalPrice += price * amount;
		}

		int r = projectService.buyRegister(buy_address, buy_receive, totalRecord, user_id, totalPrice);
		int v = projectService.salesUpdate(list);
		int u = projectService.findBuyno();
		
		int discount = projectService.gradeDetail(user_id).getGrade_discount();
		int s = projectService.buyDetailRegister(list, u, discount);
		
		updateBuydetailCode();
		
		int t = projectService.cartDelete(user_id);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "추가에 성공하였습니다."); // 세션저장
		}

		updateUserGrade(user_id);

		ScriptUtils.alertAndMovePage(response, "구매에 성공했습니다. 마이페이지로 이동합니다.", "mypage");

		return "redirect:mypage";
	}

	// --------------------------------------------------------------------------------------------------------------------------
	// --------------------------------------------------------------------------------------------------------------------------
	// --------------------------------------------------------------------------------------------------------------------------

	// 회원가입 화면으로 이동
	@RequestMapping(value = "project/join", method = RequestMethod.GET)
	public String join() {
		logger.info("글쓰기 이동");
		return "join";
	}

	// 회원가입 정보 제출 + 등록
	@RequestMapping(value = "project/join", method = RequestMethod.POST)
	public String join(UserVO userVO, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("내용" + userVO);
		int r = projectService.join(userVO);
		int s = projectService.grade(userVO);

		if (r > 0) {
			rttr.addFlashAttribute("msg", "OK"); // 세션저장
		}
		return "login";
	}

	// 아이디 중복체크 (get)
	@RequestMapping(value = "project/id_check", method = RequestMethod.GET)
	public String id_check(@RequestParam("user_id") String user_id, HttpServletRequest request, Model model)
			throws Exception {
		model.addAttribute("user_id", user_id);

		logger.info("중복체크 화면");
		return "id_check";
	}

	// 아이디 중복체크 (post)
	@RequestMapping(value = "project/id_check", method = RequestMethod.POST)
	public String id_check(@RequestParam("user_id") String user_id, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr, Model model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("중복체크");
		int r = projectService.id_check(user_id);

		model.addAttribute("r", r);
		model.addAttribute("user_id", user_id);

		return "id_check";
	}

	// 아이디 찾기 (get)
	@RequestMapping(value = "project/id_search", method = RequestMethod.GET)
	public String id_search() {
		logger.info("아이디 찾기 화면");
		return "id_search";
	}

	// 아이디 찾기 (post)
	@RequestMapping(value = "project/id_search", method = RequestMethod.POST)
	public String id_Search(@RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr, Model model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("아이디 찾기");

		String id = projectService.id_search(map);

		model.addAttribute("id", id);

		if (id == null) {
			rttr.addFlashAttribute("msg", "회원정보가 존재하지 않습니다.");
		} else {
			rttr.addFlashAttribute("msg", "당신의 아이디는 " + id + "입니다.");
		}
		// get으로 감
		return "redirect:/project/id_search";

	}

	// 비밀번호 찾기 (get)
	@RequestMapping(value = "project/pwd_search", method = RequestMethod.GET)
	public String pwd_search() {
		logger.info("비밀번호 찾기 화면");
		return "pwd_search";
	}

	// 비밀번호 찾기 (post)
	@RequestMapping(value = "project/pwd_search", method = RequestMethod.POST)
	public String pwd_search(@RequestParam("user_id") String user_id, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr, Model model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("비밀번호 찾기");

		String id = projectService.pwd_search(user_id);

		if (id == null) { // ID가 없는 경우
			rttr.addFlashAttribute("msg", "회원정보가 존재하지 않습니다."); // 메시지 전달
			return "redirect:/project/pwd_search"; // 비밀번호 찾기 화면으로 이동
		}

		model.addAttribute("id", id); // ID를 JSP로 전달
		return "pwd_search"; // 성공 시 JSP로 전달
	}

	// 비밀번호 변경 처리
	@RequestMapping(value = "project/pwd_change", method = RequestMethod.POST)
	public String pwd_change(@RequestParam("user_id") String user_id,
			@RequestParam("user_password") String user_password, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr, Model model) throws Exception {
		request.setCharacterEncoding("UTF-8");
		logger.info("비밀번호 변경");

		int result = projectService.pwd_change(user_id, user_password);

		// model.addAttribute("r",r);

		if (result > 0) { // 변경 성공
			rttr.addFlashAttribute("msg", "비밀번호가 성공적으로 변경되었습니다!");
		} else { // 변경 실패
			rttr.addFlashAttribute("msg", "비밀번호 변경에 실패했습니다. 다시 시도해 주세요.");
		}

		return "redirect:/project/pwd_search"; // 완료 후 비밀번호 찾기 화면으로 이동
	}

	// --------------------------------------------------------------------------------------------------------------------------
	// --------------------------------------------------------------------------------------------------------------------------
	// --------------------------------------------------------------------------------------------------------------------------

	// 주소지 관리 - 조회(get)
	@RequestMapping(value = "project/address_manage", method = RequestMethod.GET)
	public String address_manage(HttpSession session, Model model) {

		// 아이디 가져오기
		Map<String, Object> user = (Map) session.getAttribute("user");
		String userid = (String) user.get("user_id");

		// 주소지 리스트 조회
		List<AddressVO> addressList = projectService.addressManageSelect1(userid);
		model.addAttribute("list", addressList);

		return "address_manage";
	}

	// 주소지 관리 - 조회(post, 저장버튼)
	@RequestMapping(value = "project/address_manage", method = RequestMethod.POST)
	public String address_manage() {
		return "mypage";
	}

	// 주소지 관리 - 수정(get)
	@RequestMapping(value = "project/address_manage/update", method = RequestMethod.GET)
	public String address_manage_update(@RequestParam("address_no") int address_no, HttpSession session, Model model) {
		// 수정을 위한 주소지 조회
		AddressVO addressVO = projectService.addressManageUpdate1(address_no);
		model.addAttribute("address", addressVO);

		return "address_update";
	}

	// 주소지 관리 - 수정(post)
	@RequestMapping(value = "project/address_manage/update", method = RequestMethod.POST)
	public String address_manage_update(AddressVO addressVO, Model model) {
		// 메인주소 리셋
		int address_main = addressVO.getAddress_main();
		if (address_main == 1) { // 들어오는 데이터가 메인 주소라면
			int result = projectService.addressManageMainReset();
		}

		// 주소지 리스트 수정 update
		int result = projectService.addressManageUpdate2(addressVO);
		return "redirect:/project/address_manage";
	}

	// 주소지 관리 - 추가(get)
	@RequestMapping(value = "project/address_manage/add", method = RequestMethod.GET)
	public String address_manage_update() {
		return "address_add";
	}

	// 주소지 관리 - 추가(post)
	@RequestMapping(value = "project/address_manage/add", method = RequestMethod.POST)
	public String address_manage_update(HttpSession session, AddressVO addressVO) {
		// 아이디 가져오기
		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");

		addressVO.setAddress_userid(user_id);

		// 메인주소 리셋
		int address_main = addressVO.getAddress_main();
		if (address_main == 1) { // 들어오는 데이터가 메인 주소라면
			int result = projectService.addressManageMainReset();
		}

		// 주소지 리스트 추가
		int result = projectService.addressManageAdd2(addressVO);

		return "redirect:/project/address_manage";
	}

	// 주소지 관리 - 삭제(get)
	@RequestMapping(value = "project/address_manage/delete", method = RequestMethod.GET)
	public String address_manage_delete(@RequestParam("address_no") int address_no) {
		// 주소지 리스트 삭제
		int result = projectService.addressManageDelete1(address_no);

		return "redirect:/project/address_manage";
	}

	   public static int mypagePageSIZE = 5; // 한 페이지에 담을 게시글의 개수
	   public static int mypageTotalRecord = 0;
	   public static int mypageTotalPage = 1;

	   public static int mypageStartPage = 1;
	   public static int mypageEndPage = 10;
	   public static int mypagePageListSIZE = 10;
	   
	   // 마이페이지
	   @RequestMapping(value = "project/mypage", method = RequestMethod.GET)
	   public String ProductMypage(Model model, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
	         @RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM, HttpSession session,
	         HttpServletRequest request, HttpServletResponse response) {
	      // 아이디 가져오기
//	         String userid = session.getId();
//	         String userid = "yoonho";

	      Map<String, Object> user = (Map) session.getAttribute("user");
	      String userid = (String) user.get("user_id");
	      
	      mypageTotalRecord = projectService.mypage_totalRecord(userid); // del=0인 게시글의 총 개수
	      mypageTotalPage = mypageTotalRecord / mypagePageSIZE;
	      if (mypageTotalRecord % mypagePageSIZE != 0) {
	         mypageTotalPage++;
	      } // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

	      int start = (pageNUM - 1) * mypagePageSIZE;

	      mypageStartPage = (pageListNUM - 1) * mypagePageListSIZE + 1;
	      mypageEndPage = mypageStartPage + mypagePageListSIZE - 1;
	      if (mypageEndPage > mypageTotalPage) {
	         mypageEndPage = mypageTotalPage;
	      }
	      
	      model.addAttribute("totalPage", mypageTotalPage);
	      model.addAttribute("startPage", mypageStartPage);
	      model.addAttribute("pageListNUM", pageListNUM);
	      model.addAttribute("endPage", mypageEndPage);
	      
	      // 결제건 데이터 가져오기
	      List<BuyVO> VO = projectService.listBuy(userid, start, mypagePageSIZE);
	      model.addAttribute("buy_list", VO);

	      int[] buyno = new int[100];

	      // 결제건 데이터에서 buy_no 뽑기
	      for (int i = 0; i < VO.size(); i++) {
	         BuyVO buyVO = VO.get(i);
	         buyno[i] = buyVO.getBuy_no();
	      }

	      // 결제상세건 데이터 가져오기
	      List<BuydetailVO> detailVO = projectService.listBuydetail(buyno);
	      model.addAttribute("buy_detail_list", detailVO);

	      String[] productno = new String[100];

	      // 결제상세건 데이터에서 buydetail_productid 뽑기
	      for (int i = 0; i < detailVO.size(); i++) {
	         BuydetailVO buyDetailVO = detailVO.get(i);
	         productno[i] = buyDetailVO.getBuydetail_productid();
	      }

	      // 결제상세건 데이터에서 제품 데이터 가져오기
	      List<ProductVO> productVO = projectService.mypageDetailProduct(productno);
	      model.addAttribute("buy_detail_product_list", productVO);
	      model.addAttribute("imageList", listSelect(productVO));            

	      return "mypage";
	   }

	public void updateProductAvgScore(String product_id) {
		int totalRecordTemp = projectService.totalReview(product_id);
		
		float productAvgScore = 0;
		
		if (totalRecordTemp != 0) {
			productAvgScore = projectService.findAvgScore(product_id);
		}
		int r = projectService.updateAvgScore(product_id, productAvgScore);
	}
	
	public void updateBuydetailCode() {
		List<BuydetailVO> salesList = projectService.listSales();
		
		for (BuydetailVO buydetail : salesList) {
				
				int buydetail_no = buydetail.getBuydetail_no();
				int buydetail_buyno = buydetail.getBuydetail_buyno();
				
				String code1 = buydetail.getBuy_regdate().substring(0,10).replaceAll("-", "");
				String code2 = String.format("%04d", buydetail_no % 10000);
				String code3 = String.format("%04d", buydetail_buyno % 10000);
				String code = code1 + code2 + code3;
				
				int r = projectService.updateBuydetailCode(buydetail_no, code);
		}
	}
	
	   // 리뷰작성 처리 (get)
	   @RequestMapping(value = "project/review", method = RequestMethod.GET)
	   public String review(@RequestParam("product_id") String product_id, @RequestParam("buydetail_no") int buydetail_no,
	          Model model, HttpSession session, 
	         HttpServletResponse response) throws Exception {
	      logger.info("리뷰작성 화면");
	      // session에 담겨있는 아이디 값 리뷰 데이터로 넘겨주기 위한 처리
	      Map<String, Object> user = (Map) session.getAttribute("user");
	      String userid = (String) user.get("user_id");

//	      String user_id = "yoonho";
	      model.addAttribute("user_id", userid);
	      
	      int r = projectService.findReview(buydetail_no);
	      if (r>0) {
	         ScriptUtils.alertAndMovePage(response, "이미 리뷰를 작성하셨습니다.", "mypage");
	         return "mypage";
	      }
	      
	      
	      ProductVO vo = projectService.productDetail(product_id);
	      model.addAttribute("product", vo);

	      List<String> file_name = projectService.fileSelect(product_id);

	      // 첫번째 사진만 가져옴
	      model.addAttribute("file_name", file_name.get(0));

	      return "review";
	   }
	   
	   // 리뷰작성 처리 (post)
	   @RequestMapping(value = "project/review", method = RequestMethod.POST)
	   public String review(BoardsVO boardsVO, @RequestParam("files") List<MultipartFile> files,
	         @RequestParam("buydetail_no") int buydetail_no, HttpServletRequest request, RedirectAttributes rttr, 
	         HttpSession session, HttpServletResponse response) throws Exception {
	      request.setCharacterEncoding("UTF-8");
	      logger.info("리뷰내용" + boardsVO);

	      // 보드 테이블의 마지막 튜플 번호 조회
	      int boards_no_last = projectService.boardsNoLast();

	      int r = projectService.review(boardsVO);

	      // 다중 파일 저장
	      String imagePath = "/C:\\uploads/";

	      for (MultipartFile file : files) {
	         String uuid = UUID.randomUUID().toString();
	         String filename = uuid + "_" + file.getOriginalFilename();

	         File dest = new File(imagePath + filename);
	         file.transferTo(dest);

	         FileVO fileVO = new FileVO();
	         fileVO.setFile_name(filename);
	         fileVO.setFile_path("/C:\\uploads/" + filename);
	         fileVO.setFile_connection_id(Integer.toString(boards_no_last + 1));

	         projectService.fileUpload(fileVO);
	      }

	      if (r > 0) {
	         rttr.addFlashAttribute("msg", "완료");
	      }
	      
	      int s = projectService.updateBuydetailReview(buydetail_no);
	      
	      return "home";

	   }

	// 주소 선택
	@RequestMapping(value = "project/address_select", method = RequestMethod.GET)
	public ModelAndView address_select(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");

		ModelAndView mav = new ModelAndView();

		int totalRecord = projectService.address_totalRecord(user_id);
		List<AddressVO> list = projectService.listAddress(user_id);
		mav.addObject("list", list);
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("address_select");
		return mav;
	}

	//장바구니
	@RequestMapping(value = "project/cart", method = RequestMethod.GET)
	public ModelAndView cart(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView mav = new ModelAndView();

		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");

		int totalRecord = projectService.cart_totalRecord(user_id);
		List<CartVO> list = projectService.listCart(user_id);

		updateUserGrade(user_id);
		GradeVO grade = projectService.gradeDetail(user_id);

		mav.addObject("grade", grade);
		mav.addObject("list", list);
		mav.addObject("imageList", listSelect(projectService.listUserCartProduct(user_id)));
		mav.addObject("totalRecord", totalRecord);
		mav.setViewName("cart");

		return mav;
	}

	//장바구니 등록
	@RequestMapping(value = "project/cart_register", method = RequestMethod.GET)
	public String cartRegister(@RequestParam("product_id") String product_id, @RequestParam("amount") int amount,
			HttpServletRequest request, RedirectAttributes rttr, HttpSession session, HttpServletResponse response,
			Model model) throws Exception {
		request.setCharacterEncoding("UTF-8");

		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");

		ProductVO productVO = projectService.productDetail(product_id);
		String product_name = (String) productVO.getProduct_name();

		int s = projectService.findCart(product_id, user_id);
		if (s == 0) {
			int r = projectService.cartRegister(user_id, product_id, product_name, amount);
			ScriptUtils.alertAndMovePage(response, "제품을 장바구니에 담았습니다.", "cart");
		} else {
			ScriptUtils.alertAndMovePage(response, "장바구니에 이미 동일한 제품이 있습니다.", "product");
		}

		return "redirect:product";

	}

//	@ResponseBody
//	@RequestMapping(value = "/project/cart_update", method = RequestMethod.POST)
//	public String cartUpdate(CartVO cartVO, HttpServletRequest request, RedirectAttributes rttr, HttpSession session,
//			HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("UTF-8");
//
//		Map<String, Object> user = (Map) session.getAttribute("user");
//		String user_id = (String) user.get("user_id");
//
//		int r = projectService.cartUpdate(user_id, cartVO);
//
//		return "redirect:cart2";
//	}

	@RequestMapping(value = "project/cartRecord", method = RequestMethod.GET)
	public ResponseEntity<Integer> getCartRecord(HttpSession session) {
		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");

		if (user_id == null) {
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build(); // 로그인되지 않은 경우
		}

		int itemCount = projectService.cart_totalRecord(user_id);

		return ResponseEntity.ok(itemCount);
	}

	//장바구니 삭제
	@RequestMapping(value = "project/cart_delete", method = RequestMethod.GET)
	public String cartDelete(@RequestParam("product_id") String product_id, RedirectAttributes rttr,
			HttpSession session, HttpServletResponse response) throws Exception {

		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");

		int r = projectService.cartDelete(user_id, product_id);

		ScriptUtils.alertAndMovePage(response, "제품을 장바구니에서 삭제했습니다.", "cart");

		return "redirect:cart";
	}
	
	   @RequestMapping(value = "project/buyCancel", method = RequestMethod.GET)
	   public String buyCancel(@RequestParam("buydetail_no") int buydetail_no, RedirectAttributes rttr,
	         HttpSession session, HttpServletResponse response) throws Exception {

	      Map<String, Object> user = (Map) session.getAttribute("user");
	      String user_id = (String) user.get("user_id");

	      // 취소하려는 구매 상세정보 가져오기 (buydetail)
	      BuydetailVO buydetailVO = projectService.buydetailDetail(buydetail_no);
	      
	      int reviewExistence = buydetailVO.getBuydetail_review();
	      if (reviewExistence > 0) {
	         ScriptUtils.alertAndMovePage(response, "리뷰를 작성한 후에는 구매를 취소할 수 없습니다.", "mypage");
	         return "mypage";
	      }
	      
	      int buy_no = 0;
	      buy_no = buydetailVO.getBuydetail_buyno();

	      // 가져온 구매 상세정보 (buydetail) 에서 외래키인 buy_no 값을 통해 구매정보 (buy) 가져오기
	      BuyVO buyVO = projectService.buyDetail(buy_no);

	      int amount = buydetailVO.getBuydetail_amount();
	      String product_id = buydetailVO.getBuydetail_productid();

	      // buydetail 에서 product_id 를 통해 제품 가격 (product_price) 을 가져오고 이를 amount 와 곱해서 지불했던 가격 계산
	      int price = projectService.findProductPrice(product_id);
	      int buydetailPrice = amount * price;

	      int s = projectService.cancelUpdateProduct(product_id, amount);
	      int v = projectService.deleteBuydetail(buydetail_no);
	      int r = projectService.cancelUpdateBuy(buy_no, buydetailPrice);

	      int u = projectService.cancelDate(buydetail_no);
	      
//	      BuyVO buyVO2 = projectService.buyDetail(buy_no);
//	      int buy_amount = buyVO2.getBuy_amount();
	//
//	      if (buy_amount == 0) {
//	         int t = projectService.deleteBuy(buy_no);
//	      }

	      ScriptUtils.alertAndMovePage(response, "구매를 취소했습니다.", "mypage");

	      return "redirect:mypage";
	   }

	// 조회된 제품의 첫번째 이미지 조회
	public List<FileVO> listSelect(List<ProductVO> list) {

		// 리스트에 뜬 제품 아이디 모두 조회
		String[] productno = new String[100];
		for (int i = 0; i < list.size(); i++) {
			ProductVO productVO = list.get(i);
			productno[i] = productVO.getProduct_id();
		}

		// 제품 이미지중 첫번째 이미지 조회
		List<FileVO> imageList = projectService.listFileSelect(productno);

		return imageList;
	}

	public static int productPageSIZE = 9; // 한 페이지에 담을 게시글의 개수
	public static int productTotalRecord = 0;
	public static int productTotalPage = 1;

	public static int productStartPage = 1;
	public static int productEndPage = 10;
	public static int productPageListSIZE = 10;
	// public static int pageListNUM = 1;

	// 제품 목록 화면 + 페이징처리
	@RequestMapping(value = "project/product", method = RequestMethod.GET)
	public ModelAndView product(@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
			@RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM) {

		productTotalRecord = projectService.product_totalRecord(); // del=0인 게시글의 총 개수
		productTotalPage = productTotalRecord / productPageSIZE;
		if (productTotalRecord % productPageSIZE != 0) {
			productTotalPage++;
		} // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

		int start = (pageNUM - 1) * productPageSIZE;

		productStartPage = (pageListNUM - 1) * productPageListSIZE + 1;
		productEndPage = productStartPage + productPageListSIZE - 1;
		if (productEndPage > productTotalPage) {
			productEndPage = productTotalPage;
		}

		// int end = start + pageSIZE - 1;
		// 해당 pageNUM 을 가진 페이지에는 bno가 start 부터 end 까지인 게시글들이 보여짐

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", projectService.listProduct(start, productPageSIZE));
		mav.addObject("imageList", listSelect(projectService.listProduct(start, productPageSIZE)));
		mav.addObject("totalPage", productTotalPage);
		mav.addObject("startPage", productStartPage);
		mav.addObject("pageListNUM", pageListNUM);
		mav.addObject("endPage", productEndPage);		
		mav.setViewName("product_list");
		return mav;
	}	

	public static int plPageSIZE = 9; // 한 페이지에 담을 게시글의 개수
	public static int plTotalRecord = 0;
	public static int plTotalPage = 1;

	public static int plStartPage = 1;
	public static int plEndPage = 10;
	public static int plPageListSIZE = 10;
	
	// 키워드 검색
	@RequestMapping(value = "project/list/search", method = RequestMethod.GET)
	public ModelAndView ProductSearch(@RequestParam("keyword") String keyword, HttpServletRequest request, Model model,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
			@RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		List<ProductVO> templist = projectService.productSearch(keyword);
		plTotalRecord = templist.size();
		
		plTotalPage = plTotalRecord / plPageSIZE;
		if (plTotalRecord % plPageSIZE != 0) {
			plTotalPage++;
		} // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

		int start = (pageNUM - 1) * plPageSIZE;

		plStartPage = (pageListNUM - 1) * plPageListSIZE + 1;
		plEndPage = plStartPage + plPageListSIZE - 1;
		if (plEndPage > plTotalPage) {
			plEndPage = plTotalPage;
		}
		
		String method = "search?keyword=" + keyword;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", projectService.productSearch(keyword, start, plPageSIZE));
		mav.addObject("imageList", listSelect(projectService.productSearch(keyword, start, plPageSIZE)));
		
		mav.addObject("method", method);
		mav.addObject("totalPage", plTotalPage);
		mav.addObject("startPage", plStartPage);
		mav.addObject("pageListNUM", pageListNUM);
		mav.addObject("endPage", plEndPage);
		mav.setViewName("product_list");
		return mav;
		// 검색어 가지고 리스트 검색

	}	
	
	public static int lcPageSIZE = 9; // 한 페이지에 담을 게시글의 개수
	public static int lcTotalRecord = 0;
	public static int lcTotalPage = 1;

	public static int lcStartPage = 1;
	public static int lcEndPage = 10;
	public static int lcPageListSIZE = 10;
	
	//카테고리 검색
	@RequestMapping(value = "project/list/category", method = RequestMethod.GET)
	public ModelAndView categorySearch(@RequestParam("category") int category, HttpServletRequest request, Model model,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
			@RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		
		Map<String, Object> categoryMap = new HashMap<>();
		categoryMap.put("category", category);
		
		List<ProductVO> templist = projectService.categorySearch(categoryMap);
		lcTotalRecord = templist.size();
		
		lcTotalPage = lcTotalRecord / lcPageSIZE;
		if (lcTotalRecord % lcPageSIZE != 0) {
			lcTotalPage++;
		} // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

		int start = (pageNUM - 1) * lcPageSIZE;

		lcStartPage = (pageListNUM - 1) * lcPageListSIZE + 1;
		lcEndPage = lcStartPage + lcPageListSIZE - 1;
		if (lcEndPage > lcTotalPage) {
			lcEndPage = lcTotalPage;
		}
		
		String method = "category?category=" + category;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", projectService.categorySearch(categoryMap, start, lcPageSIZE));
		mav.addObject("imageList", listSelect(projectService.categorySearch(categoryMap, start, lcPageSIZE)));
		
		mav.addObject("method", method);
		mav.addObject("totalPage", lcTotalPage);
		mav.addObject("startPage", lcStartPage);
		mav.addObject("pageListNUM", pageListNUM);
		mav.addObject("endPage", lcEndPage);
		mav.setViewName("product_list");
		return mav;
		// 검색어 가지고 리스트 검색

	}		
	
	public static int ocPageSIZE = 9; // 한 페이지에 담을 게시글의 개수
	public static int ocTotalRecord = 0;
	public static int ocTotalPage = 1;

	public static int ocStartPage = 1;
	public static int ocEndPage = 10;
	public static int ocPageListSIZE = 10;
	
	//정렬 검색
	@RequestMapping(value = "project/list/order", method = RequestMethod.GET)
	public ModelAndView orderSearch(@RequestParam("code") int code, HttpServletRequest request, Model model,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
			@RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		
		Map<String, Object> codeMap = new HashMap<>();
		codeMap.put("code", code);
		
		List<ProductVO> templist = projectService.orderSearch(codeMap);
		ocTotalRecord = templist.size();
		
		ocTotalPage = ocTotalRecord / ocPageSIZE;
		if (ocTotalRecord % ocPageSIZE != 0) {
			ocTotalPage++;
		} // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

		int start = (pageNUM - 1) * ocPageSIZE;

		ocStartPage = (pageListNUM - 1) * ocPageListSIZE + 1;
		ocEndPage = ocStartPage + ocPageListSIZE - 1;
		if (ocEndPage > ocTotalPage) {
			ocEndPage = ocTotalPage;
		}
		
		String method = "order?code=" + code;
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", projectService.orderSearch(codeMap, start, ocPageSIZE));
		mav.addObject("imageList", listSelect(projectService.orderSearch(codeMap, start, ocPageSIZE)));
		
		mav.addObject("method", method);
		mav.addObject("totalPage", ocTotalPage);
		mav.addObject("startPage", ocStartPage);
		mav.addObject("pageListNUM", pageListNUM);
		mav.addObject("endPage", ocEndPage);
		mav.setViewName("product_list");
		return mav;
		// 검색어 가지고 리스트 검색

	}		

	//관리자 - 사용자 구매 목록
	public static int salPageSIZE = 20; // 한 페이지에 담을 게시글의 개수
	public static int salTotalRecord = 0;
	public static int salTotalPage = 1;
	public static int salStartPage = 1;
	public static int salEndPage = 10;
	public static int salPageListSIZE = 10;
	
	@RequestMapping(value = "project/sales", method = RequestMethod.GET)
	public ModelAndView sales(Model model, HttpServletRequest request,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
			@RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		updateBuydetailCode();
		
		List<BuydetailVO> listSales = projectService.listSales();
		salTotalRecord = listSales.size();
		
		salTotalPage = salTotalRecord / salPageSIZE;
		if (salTotalRecord % salPageSIZE != 0) {
			salTotalPage++;
		} // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

		int start = (pageNUM - 1) * salPageSIZE;

		salStartPage = (pageListNUM - 1) * salPageListSIZE + 1;
		salEndPage = salStartPage + salPageListSIZE - 1;
		if (salEndPage > salTotalPage) {
			salEndPage = salTotalPage;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("salesList", projectService.listSales(start, salPageSIZE));
		
		mav.addObject("totalPage", salTotalPage);
		mav.addObject("startPage", salStartPage);
		mav.addObject("pageListNUM", pageListNUM);
		mav.addObject("endPage", salEndPage);
		mav.setViewName("sales");
		
		return mav;
	}
	
	//c1 (cancel1) : 관리자 전용 취소목록
	public static int c1PageSIZE = 20; // 한 페이지에 담을 게시글의 개수
	public static int c1TotalRecord = 0;
	public static int c1TotalPage = 1;

	public static int c1StartPage = 1;
	public static int c1EndPage = 10;
	public static int c1PageListSIZE = 10;
	
	//관리자 - 사용자 취소 목록
	@RequestMapping(value = "project/cancel", method = RequestMethod.GET)
	public ModelAndView cancel(Model model, HttpServletRequest request,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
			@RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		List<BuydetailVO> listCancel = projectService.listCancel();
		c1TotalRecord = listCancel.size();
		
		c1TotalPage = c1TotalRecord / c1PageSIZE;
		if (c1TotalRecord % c1PageSIZE != 0) {
			c1TotalPage++;
		} // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

		int start = (pageNUM - 1) * c1PageSIZE;

		c1StartPage = (pageListNUM - 1) * c1PageListSIZE + 1;
		c1EndPage = c1StartPage + c1PageListSIZE - 1;
		if (c1EndPage > c1TotalPage) {
			c1EndPage = c1TotalPage;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listCancel", projectService.listCancel(start, c1PageSIZE));
		
		mav.addObject("totalPage", c1TotalPage);
		mav.addObject("startPage", c1TotalPage);
		mav.addObject("pageListNUM", pageListNUM);
		mav.addObject("endPage", c1EndPage);
		mav.setViewName("cancel");
		
		return mav;
	}	
	
	public static int c2PageSIZE = 20; // 한 페이지에 담을 게시글의 개수
	public static int c2TotalRecord = 0;
	public static int c2TotalPage = 1;

	public static int c2StartPage = 1;
	public static int c2EndPage = 10;
	public static int c2PageListSIZE = 10;
	
	//마이페이지 - 취소목록
	@RequestMapping(value = "project/cancel_forUser", method = RequestMethod.GET)
	public ModelAndView cancel(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM,
			@RequestParam(value = "pageListNUM", defaultValue = "1") int pageListNUM) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		Map<String, Object> user = (Map) session.getAttribute("user");
		String user_id = (String) user.get("user_id");
		String user_name = (String) user.get("user_name");
		
		List<BuydetailVO> listCancel = projectService.listCancel(user_id);
		c2TotalRecord = listCancel.size();
		
		c2TotalPage = c2TotalRecord / c2PageSIZE;
		if (c2TotalRecord % c2PageSIZE != 0) {
			c2TotalPage++;
		} // 결국 totalRecord ÷ pageSIZE 를 올림처리한 것과 동일함

		int start = (pageNUM - 1) * c2PageSIZE;

		c2StartPage = (pageListNUM - 1) * c2PageListSIZE + 1;
		c2EndPage = c2StartPage + c2PageListSIZE - 1;
		if (c2EndPage > c2TotalPage) {
			c2EndPage = c2TotalPage;
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("listCancel", projectService.listCancel(user_id, start, c2PageSIZE));
		
		mav.addObject("totalPage", c2TotalPage);
		mav.addObject("startPage", c2TotalPage);
		mav.addObject("pageListNUM", pageListNUM);
		mav.addObject("endPage", c2EndPage);
		mav.addObject("user_name", user_name);
		mav.setViewName("cancel_forUser");
		
		return mav;
	}	
	
	// =======================================================================================================================
	
		//상품문의 작성 (get)
		@RequestMapping(value = "project/inquiry", method = RequestMethod.GET)
		public String inquiry(HttpSession session, Model model, @RequestParam("product_id") String product_id) {
			logger.info("삼푼문의 작성 페이지이동");
			
			Map<String,Object> user = (Map) session.getAttribute("user");
			String user_id = (String) user.get("user_id");
			
			model.addAttribute("user_id", user_id);
			
			ProductVO vo = projectService.productDetail(product_id);
			model.addAttribute("product", vo);

			List<String> file_name = projectService.fileSelect(product_id);

			// 첫번째 사진만 가져옴
			model.addAttribute("file_name", file_name.get(0));
			
			return "inquiry";
		}
		
		//상품문의 작성 (post)
		@RequestMapping(value = "project/inquiry", method = RequestMethod.POST)
		public String inquiry(Model model, BoardsVO boardsVO, HttpServletRequest request) throws Exception{
			request.setCharacterEncoding("UTF-8");
			int r = projectService.inquiry(boardsVO);
			
			return "redirect:/project/mypage";
		}
		
		//관리자 - 상품문의 조회 (get)
		@RequestMapping(value = "project/admin_inquiry", method = RequestMethod.GET)
		public String admin_inquiry(Model model,HttpSession session	) {
			Map<String,Object> user = (Map) session.getAttribute("user");
			String user_id = (String) user.get("user_id");
			model.addAttribute("user_id", user_id);
			
			// 해당 제품에 대한 문의 조회
			List<BoardsVO> inquirylist = projectService.adminInquirylist();
			model.addAttribute("inquiry_list",inquirylist);

			return "admin_inquiry";
		}
		
		//관리자 문의 답변 (get)
		@RequestMapping(value = "project/admin_inquiry_form", method = RequestMethod.GET)
		public String admin_inquiry_form(@RequestParam("boards_no") int boards_no,
				@RequestParam("proudct_id") String product_id,
				HttpSession session,Model model) {
			Map<String, Object> user = (Map) session.getAttribute("user");
			String user_id = (String) user.get("user_id");
			model.addAttribute("user_id", user_id);
			model.addAttribute("boards_no", boards_no);	
			
	       ProductVO vo = projectService.productDetail(product_id);
	       model.addAttribute("product", vo);

	       List<String> file_name = projectService.fileSelect(product_id);
	       // 첫번째 사진만 가져옴
	       model.addAttribute("file_name", file_name.get(0));
			
			return "admin_inquiry_form";	
		}
		
		//관리자 문의 답변 (post)
		@RequestMapping(value = "project/admin_inquiry_form", method = RequestMethod.POST)
		public String admin_inquiry_form(Model model, BoardsVO boardsVO, HttpServletRequest request) throws Exception{
			int r = projectService.adminInquiryForm(boardsVO);
			model.addAttribute("r",r);
			
			return "redirect:admin_inquiry";
		}
		
		//찜 목록
		@RequestMapping(value="project/wishlist", method=RequestMethod.GET)
		public String wishlist(Model model, HttpSession session, HttpServletRequest request) {
			
			Map<String, Object> user = (Map)session.getAttribute("user");
			String userid = (String)user.get("user_id");
//			String userid = "yoonho";
			
		    if (userid.isEmpty()) {
		    	//알럴트 문 추가
		        return "redirect:/login"; // 로그인 필요
		    }

		    String cookieName = "wishlist_" + userid; // 계정별 쿠키 이름 생성

		    Cookie[] cookies = request.getCookies(); // 요청에서 쿠키 가져오기
		    String wishlist = "";

		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookieName.equals(cookie.getName())) { // 사용자 쿠키 이름과 일치하는 쿠키 찾기
		                wishlist = cookie.getValue();
		                break;
		            }
		        }
		    }
			
		    try {
		        if (wishlist.isEmpty()) {
		            model.addAttribute("products", Collections.emptyList());
		        } else {
		            String decodedWishlist = URLDecoder.decode(wishlist, StandardCharsets.UTF_8.name());
		            List<String> productIds = Arrays.asList(decodedWishlist.split(","));
		            List<ProductVO> products = projectService.wishlist(productIds);
		    		model.addAttribute("imageList", listSelect(products));
		            model.addAttribute("products", products);
		        }
		        return "wishlist";
		    } catch (UnsupportedEncodingException e) {
		        model.addAttribute("products", Collections.emptyList());
		        return "wishlist";
		    }		
		}

		//찜 추가
		@RequestMapping(value="project/wishlist/add", method=RequestMethod.GET)
		 public String wishlistAdd(@RequestParam("product_id") String product_id,
	        HttpServletResponse response, HttpSession session, HttpServletRequest request) {
			
		    // 사용자 정보 가져오기
		    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		    String userid = (String) user.get("user_id");
//		    String userid = "yoonho"; // 테스트용 고정값

		    if (userid.isEmpty()) {
		        return "redirect:/login"; // 로그인 필요
		    }

		    String cookieName = "wishlist_" + userid;
		    String wishlist = "";

		    // 쿠키 가져오기
		    Cookie[] cookies = request.getCookies();
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookieName.equals(cookie.getName())) { // 사용자 쿠키 이름과 일치하는 쿠키 찾기
		                wishlist = cookie.getValue();
		                break;
		            }
		        }
		    }
			
			try {
		        // 기존 찜 목록을 URL 디코딩하여 처리
		        String decodedWishlist = URLDecoder.decode(wishlist, StandardCharsets.UTF_8.name());
		        
		        // "," 를 기준으로 나눠서 저장	
		        // HashSet은 중복을 자동으로 제거해주는 타입
		        Set<String> productIds = new HashSet<>(Arrays.asList(decodedWishlist.split(",")));
		        productIds.add(product_id); // 새로운 제품 추가

		        // 쿠키에 저장 (URL 인코딩)
		        String encodedWishlist = URLEncoder.encode(String.join(",", productIds), StandardCharsets.UTF_8.name());
		        Cookie cookie = new Cookie(cookieName, encodedWishlist);
		        cookie.setPath("/");
		        cookie.setMaxAge(30 * 24 * 60 * 60); // 30일 유지
		        response.addCookie(cookie);

//		        return ResponseEntity.ok().build();
		        return "redirect:/";
		    } catch (UnsupportedEncodingException e) {
//		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		    	return "redirect:/";
		    }
		}
			
		//찜 삭제
		@RequestMapping(value = "project/wishlist/delete", method = RequestMethod.GET)
		public String wishlistDelete(@RequestParam("product_id") String product_id,
		                              HttpServletResponse response, HttpSession session, HttpServletRequest request) {

		    // 사용자 정보 가져오기
		    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		    String userid = (String) user.get("user_id");
//		    String userid = "yoonho";

		    if (userid.isEmpty()) {
		        return "redirect:/login"; // 로그인 필요
		    }

		    String cookieName = "wishlist_" + userid;
		    String wishlist = "";

		    // 쿠키 가져오기
		    Cookie[] cookies = request.getCookies();
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookieName.equals(cookie.getName())) { // 사용자 쿠키 이름과 일치하는 쿠키 찾기
		                wishlist = cookie.getValue();
		                break;
		            }
		        }
		    }

		    try {
		        // 기존 찜 목록을 URL 디코딩하여 처리
		        String decodedWishlist = URLDecoder.decode(wishlist, StandardCharsets.UTF_8.name());

		        // "," 를 기준으로 나눠서 저장	
		        Set<String> productIds = new HashSet<>(Arrays.asList(decodedWishlist.split(",")));

		        // 특정 제품 ID 제거
		        productIds.remove(product_id); // 제거할 제품 아이디

		        // 빈 목록이면 쿠키를 삭제
		        if (productIds.isEmpty()) {
		            Cookie cookie = new Cookie(cookieName, "");
		            cookie.setPath("/");
		            cookie.setMaxAge(0); // 쿠키 삭제
		            response.addCookie(cookie);
		        } else {
		            // 쿠키에 저장 (URL 인코딩)
		            String encodedWishlist = URLEncoder.encode(String.join(",", productIds), StandardCharsets.UTF_8.name());
		            Cookie cookie = new Cookie(cookieName, encodedWishlist);
		            cookie.setPath("/");
		            cookie.setMaxAge(30 * 24 * 60 * 60); // 30일 유지
		            response.addCookie(cookie);
		        }

		        return "redirect:/project/wishlist"; // 찜 목록에서 삭제 후 홈으로 리디렉션
		    } catch (UnsupportedEncodingException e) {
		        return "redirect:/project/wishlist"; // 에러 처리
		    }
		}
		
		//찜 유무 조회
		@RequestMapping(value = "project/wishlist/state", method = RequestMethod.GET)
		@ResponseBody
		public boolean isProductInWishlist(@RequestParam("product_id") String productId,
		                                   HttpSession session, HttpServletRequest request) {
		    // 사용자 정보 가져오기
		    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		    String userId = "yoonho";

		    if (userId.isEmpty()) {
		        return false;
		    }

		    String cookieName = "wishlist_" + userId;
		    String wishlist = "";

		    // 쿠키에서 사용자 쿠키 값 가져오기
		    Cookie[] cookies = request.getCookies();
		    if (cookies != null) {
		        for (Cookie cookie : cookies) {
		            if (cookieName.equals(cookie.getName())) {
		                wishlist = cookie.getValue();
		                break;
		            }
		        }
		    }

		    try {
		        // 쿠키 값이 비어 있으면 false
		        if (wishlist.isEmpty()) {
		            return false;
		        }

		        // URL 디코딩 후 제품 ID 목록 생성
		        String decodedWishlist = URLDecoder.decode(wishlist, StandardCharsets.UTF_8.name());
		        Set<String> productIds = new HashSet<>(Arrays.asList(decodedWishlist.split(",")));

		        // 특정 product_id가 포함되어 있는지 확인
		        return productIds.contains(productId);

		    } catch (UnsupportedEncodingException e) {
		        e.printStackTrace();
		        return false; // 에러가 발생한 경우 false 반환
		    }
		}

	
	
}
