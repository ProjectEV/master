package kr.co.dong;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dong.project.FileVO;
import kr.co.dong.project.ProductVO;
import kr.co.dong.project.ProjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	ProjectService projectService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Map<String, Object> codeMap = new HashMap<>();
		 
	    codeMap.put("code", 1);
		List<ProductVO> newList = projectService.homeList(codeMap);
		model.addAttribute("newList", newList);
		model.addAttribute("newList_image", listSelectHome(newList));

		codeMap.put("code", 2);
		List<ProductVO> bestList = projectService.homeList(codeMap); 
		model.addAttribute("bestList", bestList);
		model.addAttribute("bestList_image", listSelectHome(bestList));

		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}
	
	//조회된 제품의 이미지 조회
	public List<FileVO> listSelectHome(List<ProductVO> list) {

		//리스트에 뜬 제품 아이디 모두 조회
		String[] productno = new String[100];
		for(int i=0; i<list.size(); i++) {
			ProductVO productVO = list.get(i);
			productno[i] = productVO.getProduct_id();
		}
		
		//제품 이미지중 첫번째 이미지 조회
		List<FileVO> imageList = projectService.listFileSelect(productno);
		
		return imageList;
	}

	@RequestMapping(value="/main")
	public String testmain(Model model) {
		String name = "Hello Word~~~";
		model.addAttribute("name", name);//모델에 저장
		return "main";
	}

}