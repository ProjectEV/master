package kr.co.dong.common;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import kr.co.dong.project.ScriptUtils;

public class AdminInterceptor implements HandlerInterceptor{
//  Controller가 요청을 처리하기전에 호출하는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//클라이언트에 부여한 세션을 가져온다.
		HttpSession session = request.getSession();
		
		Map<String, Object> user = (Map) session.getAttribute("user");
		int admin = Integer.parseInt(String.valueOf(user.get("user_admin")));
		
		if(admin == 0) {//관리자가 아니라면 메인 화면으로 이동시킴
			ScriptUtils.alertAndMovePage(response, "접근 권한이 없습니다.", "/");
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		return true; //관리자라면 그냥 통과
	}
	
//  예외가 발생하지 않은 경우에만 Controller가 작업이 끝나면 호출되는 메소드  
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
//  예외 발생여부에 상관없이 Controller가 작업이 끝나면 호출되는 메소드
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	
}
