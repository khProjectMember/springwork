package com.kh.spring.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@Controller	// 빈 스캐닝을 통해 자동으로 빈에 등록
public class MemberController {
	/* 기본 사용
	@RequestMapping(value="login.me") // HandlerMapping등록
	public void loginMember() {		  // 여러개의 매핑이 있으면 key와 value의 값으로 등록
		
	}
	
	public void insertMember() {
		
	}
	*/
	// 1. 파라이터를 받는 방법
	/*
	 * 	1.1 HttpServletRequest를 이용해서 전달받는 방법(기존의 jsp/servlet때의 방식)
	 * 		해당 메소드의 매개변수로 HttpServletRequest를 작성하고
	 * 		스프링 컨테이너가 해당 메소드 호출시 자동으로 해당 객체를 생성해서 인자로 주입해줌
	 */
	/*
	@RequestMapping("login.me") 
	public void loginMember(HttpServletRequest request) {
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		
		System.out.println("ID : " + userId);
		System.out.println("PW : " + userPwd);		
	}
	*/
	/*
	 * 	1.2 @RequestParam 어노테이션을 사용하는 방법
	 * 		request.getParameter("키") : value의 역할을 대신해주는 어노테이션 
	 */
	/*
	@RequestMapping("login.me") 
	public void loginMember(@RequestParam(value="id", defaultValue="aaa") String userId,
							@RequestParam("pwd") String userPwd) {
		
		System.out.println("ID : " + userId);
		System.out.println("PW : " + userPwd);		
	}
	*/
	/*
	 * 	1.3 @RequestParam 어노테이션을 생략하는 방법
	 * 		단, 매개변수명과 name값(요청시 전달되는 키값)과 동일하게  
	 */
	/*
	@RequestMapping("login.me") 
	public void loginMember(String id, String pwd) {
		
		System.out.println("ID : " + id);
		System.out.println("PW : " + pwd);
		
		Member m = new Member();
		m.setUserId(id);
		m.setUserPwd(pwd);
	}
	*/
	
	// 어노테이션을 달아서 스프링이 알아서 객체를 생성하고 이를 재활용하여 관리
	/*
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login.me") 
	public void loginMember(Member m) {
		
		System.out.println("ID : " + m.getUserId());
		System.out.println("PW : " + m.getUserPwd());
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { //로그인 실패 에러페이지로 포워딩
			System.out.println("로그인 실패");
		} else {	//로그인 성공 sessionScope에 담고 메인페이로 url요청
			System.out.println("로그인 성공");
		}	
	}
	*/
	
	// 2. 응답페이지로 포워딩 또는 url재요청 보내는 응답데이터를 담는 방법
	/*
	 * 	2.1 스프링에서 제공 Model 객체를 사용하는 방법
	 * 		포워딩할 뷰로 전달하고자 하는 데이터를 맵형태(key-value)로 담을 수 있는 영역
	 * 		Model객체는 requestScope이다.
	 * 		값을 넣을때는 setAttribute가 아닌 addAttribute메소드를 사용
	 * 
	 *
	*/
	@Autowired
	private MemberService mService;
	
	@RequestMapping("login.me") 
	public String loginMember(Member m, Model model, HttpSession session) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser == null) { //로그인 실패 에러페이지로 포워딩
			model.addAttribute("errorMsg","로그인 실패");
			return "common/errorPage"; //servlet-context에서 자동으로 설정해줬기에 나머지 안써도됨
		} else {	//로그인 성공 sessionScope에 담고 메인페이지로 url요청
			session.setAttribute("loginUser", loginUser);
			return "redirect:/"; //redirect: mainPage로 간다는 의미
		}	
	}
	
	 /*
	 * 	2.2 스프링에서 제공 ModelAndView 객체를 사용하는 방법
	 * 		Model객체 포워딩할 뷰로 전달하고자 하는 데이터를 맵형태(key-value)로 담을 수 있는 영역
	 * 		View는 응답뷰에 대한 정보를 담을 수 있는공간
	
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemId(), loginUser.getMemPw())) {//m.getUserPwd(): 사용자가 입력한 비번, loginUser.getUserPwd(): DB에 저장된 값
			session.setAttribute("loginUser", loginUser); //로그인 성공 sessionScope에 담고 메인페이지로 url요청
			mv.setViewName("redirect:/"); //redirect: mainPage로 간다는 의미			
		} else {	
			mv.addObject("errorMsg","로그인 실패");
			mv.setViewName("common/errorPage"); //servlet-context에서 자동으로 설정해줬기에 나머지 안써도됨
		}
		return mv;
	}
	*/
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		//System.out.print(m);
		//1. 한글 깨짐 : 스프링에서 제공하는 인코딩필터 등록하기
		//2. 회원가입시 나이를 안넣을때 에러가 뜬다. 이유는 null을 int로 형변환 할 수 없기 때문임
		//		String age로 고침
		//3. 비밀번호 입력시 암호화하여 DB에 저장

		/*
		 * 양방향
		 * 		암호화
		 평문 <-------------> 암호문
		 		복호화
		 	단방향(SHA-256, SHA-512)
		 평문 --------------> 암호문
		 
		 Bcrypt방식(양방향)
		 평문 + 랜덤값 = 암호화 
		 */
		
		/*
		 * 1. pom.xml에 라이브러리 추가
		 * 2. BcryptPasswordEncoder클래스를 빈을 등록
		 * 3. web.xml에 
		 * 
		 */
		//System.out.println("평문 : " + m.getUserPwd());
		//String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		//m.setUserPwd(encPwd);
		
		//System.out.println("암호문 : "+encPwd);
		
		int result = mService.insertMember(m);
		if(result >0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg","회원가입 실패");
			return "common/errorPage";
		}
		}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model) { //Member의 객체로 데이터 받아오기
		int result = mService.updateMember(m);
		if(result > 0) {
			Member updateM = mService.loginMember(m);
			session.setAttribute("loginUser", updateM);
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			return "redirect:myPage.me"; //myPage.me로 가면 jsp가도록 위에 설정해놓음
		} else {
			model.addAttribute("errorMsg","회원정보 변경 실패");
			return "common/errorPage";			
		}
	}
	/*
	@RequestMapping("delete.me")
	public String deleteMember(String userId, String userPwd, HttpSession session, Model model) {
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPw(); //DB에 저장된 password(암호화된)
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
			int result = mService.deleteMember(userId);
			if(result > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.<br> 그동안 이용해 주셔서 감사합니다.");
				return "redirect:/";
			} else {
				model.addAttribute("errorMsg","회원 탈퇴 실패입니다.");
				return "common/errorPage";
			}
		} else {
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다. 다시 한번 확인해 주세요.");
			return "redirect:myPage.me";
		}
	}
	*/
	@ResponseBody // ajax로 되돌려주는 어노테이션
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = mService.idCheck(checkId);
		/*
		if(count > 0) {
			return "NNN";
		} else {
			return "YYY";
		}
		*/
		return count > 0 ? "NNN" : "YYY";
	}
	
	// 닉네임 중복 ajax
	@ResponseBody
	@RequestMapping("nicknameCheck.me")
	public String nicknameCheck(String checkNickname) {
		int count = mService.nicknameCheck(checkNickname);
		
		return count > 0 ? "NNN" : "YYY";
	}
}