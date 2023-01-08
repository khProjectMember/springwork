package com.kh.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor {
	/*
	 	Interceptor(HandlerInterceptor)
	 	해당 Controller가 실행되기전, 실행된 후에 낚아채서 실행할 내용 작성
	 	로그인 유무판단, 회원권한 체크
	 	preHandle(전처리) : DispatcherServlet이 컨트롤러를 호출하기 전에 낚아채는 영역
	 	postHandle(후처리) : 컨트롤러에서 요청처리 후 DispatcherServlet으로 뷰정보가 리턴되는 순간 낚아채는 영역
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
//		true 리턴이 되면 : 기존 요청의 흐름대로 실행
//		false 리턴이 되면 : Controller
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!= null) {
			return true;
		} else {
			session.setAttribute("alertMsg", "로그인 후 이용가능합니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
}
