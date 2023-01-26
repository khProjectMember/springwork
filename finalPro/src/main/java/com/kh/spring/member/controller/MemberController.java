package com.kh.spring.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.exception.MemberException;
import com.kh.spring.member.model.service.EmailAuthService;
import com.kh.spring.member.model.vo.Email;
import com.kh.spring.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private EmailAuthService emailAuthService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	// 로그인 페이지로 이동
	@RequestMapping("loginEnroll.me")
	public String loginEnroll() {
		return "member/login";
	}
	
	
	 /*
	 * 	2.2 스프링에서 제공 ModelAndView 객체를 사용하는 방법
	 * 		Model객체 포워딩할 뷰로 전달하고자 하는 데이터를 맵형태(key-value)로 담을 수 있는 영역
	 * 		View는 응답뷰에 대한 정보를 담을 수 있는공간
	
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	*/
	
	/*
	// 로그인
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
	*/
	
	//로그인 페이지
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		Member loginUser = mService.loginMember(m);
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPw(), loginUser.getMemPw())) {
			session.setAttribute("loginUser", loginUser); 
			session.setAttribute("alertMsg", "성공적으로 로그인 되었습니다.");
			mv.setViewName("redirect:/"); 		
		} else {	
			mv.addObject("errorMsg","비밀번호가 일치하지 않거나 탈퇴한 회원입니다. 다시 한번 확인해 주세요.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/*
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPw(), loginUser.getMemPw())) {//m.getUserPwd(): 사용자가 입력한 비번, loginUser.getUserPwd(): DB에 저장된 값
			session.setAttribute("loginUser", loginUser); //로그인 성공 sessionScope에 담고 메인페이지로 url요청
			session.setAttribute("alertMsg", "성공적으로 로그인 되었습니다.");
			mv.setViewName("redirect:/"); //redirect: mainPage로 간다는 의미			
		} else {	
			mv.addObject("errorMsg","비밀번호가 일치하지 않거나 탈퇴한 회원입니다. 다시 한번 확인해 주세요.");
			mv.setViewName("common/errorPage"); //servlet-context에서 자동으로 설정해줬기에 나머지 안써도됨
		}
		return mv;
	}
	*/
	
	
	
	//로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	//회원가입페이지로 이동
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
		System.out.println("평문 : " + m.getMemPw());
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPw());
		m.setMemPw(encPwd);
		//m.setUserPwd(encPwd);
		
		System.out.println("암호문 : "+encPwd);
		
		int result = mService.insertMember(m);
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입이 되었습니다.");
			return "redirect:/loginEnroll.me";
		} else {
			model.addAttribute("errorMsg","회원가입 실패");
			return "common/errorPage";
		}
		}
	//아이디 찾기 페이지로
	@RequestMapping("findId.me")
	public String findId() {
		
		return "member/findId";
	}
	
	//아이디 찾기
	@RequestMapping("findMyId.me")
	public String findMyId(Email email, Model model){
		int check = mService.checkMember(email); //유효한 멤버인지 확인
		if(check == 1) {
			Map<String, Object> map = emailAuthService.getEmailAuth(email.getMemEmail());
			String memId = mService.getMemId(email); //아이디 얻어옴
			
			model.addAttribute("memId", memId);
			model.addAttribute("authCode", map.get("emailAuthCode"));
			return "member/findId";
		} else {
			model.addAttribute("errorMsg","회원정보가 일치하지 않습니다.");
			return "common/errorPage";
		}
	}
	
	//비밀번호 찾기 페이지로
	@RequestMapping("findPwd.me")
	public String findPwd() {
		return "member/findPwd";
	}
	
	
	//비밀번호 찾기
	@RequestMapping("updateTempPwd.me")
	public String findPwd(Email email, Model model, Member m) {
		int check = mService.checkMember(email); //유효한 멤버인지 확인
		int result = 0;
		String tempPwd = "";
		Map<String, Object> map = new HashMap<String, Object>();
		if(check == 1) {
			map = emailAuthService.getEmailAuth(email.getMemEmail());
			tempPwd = makeTempPwd();
			
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("encTempPwd", bcryptPasswordEncoder.encode(tempPwd));
			param.put("memEmail", email.getMemEmail());
			
			result = mService.updateTempPwd(param);
			} else {
				throw new MemberException("회원 정보가 일치하지 않습니다.");
		}
		if(result > 0) {
			model.addAttribute("authCode", map.get("emailAuthCode"));
			model.addAttribute("tempPwd", tempPwd);
			System.out.println("평문 : " + m.getMemPw());
			return "member/findPwd";
		} else {
			throw new MemberException("비밀번호 발급에 실패하였습니다.");
		}
	}
	
	//임시 비밀번호 생성
	private String makeTempPwd() {
		int leftLimit = 48;
		int rightLimit = 122;
		int targetStringLength = 10;
		Random random = new Random();
		String generatedString = random.ints(leftLimit, rightLimit + 1)
	            .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	            .limit(targetStringLength)
	            .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	            .toString();
		return generatedString;
	}
	
	// 비밀변호 변경 수정 페이지로
	@RequestMapping("updateMyPwd.me")
	public String updateMyPwd() {
		return "member/updateMyPwd";
	}
	
	/*
		//비밀번호 찾기
	@RequestMapping("updateTempPwd.me")
	public String findPwd(Email email, Model model, Member m) {
		int check = mService.checkMember(email); //유효한 멤버인지 확인
		int result = 0;
		String tempPwd = "";
		Map<String, Object> map = new HashMap<String, Object>();
		if(check == 1) {
			map = emailAuthService.getEmailAuth(email.getMemEmail());
			tempPwd = makeTempPwd();
			
			HashMap<String, String> param = new HashMap<String, String>();
			param.put("encTempPwd", bcryptPasswordEncoder.encode(tempPwd));
			param.put("memEmail", email.getMemEmail());
			
			result = mService.updateTempPwd(param);
			} else {
				throw new MemberException("회원 정보가 일치하지 않습니다.");
		}
		if(result > 0) {
			model.addAttribute("authCode", map.get("emailAuthCode"));
			model.addAttribute("tempPwd", tempPwd);
			System.out.println("평문 : " + m.getMemPw());
			return "member/findPwd";
		} else {
			throw new MemberException("비밀번호 발급에 실패하였습니다.");
		}
	}
	
	
	// 비밀변호 변경 수정
	@RequestMapping("updateMyPwdInfo.me")
	public String updateMyPwdInfo(Member m, Model model, HttpSession session, @RequestParam("currentPwd") String pwd, @RequestParam("newPwd") String newPwd) {
		int result=0;
		//m = (Member)model.getAttribute("loginUser");
		m =(Member)session.getAttribute("loginUser");
		
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPw();
		if(bcryptPasswordEncoder.matches(pwd, encPwd)) { //pwd: 랜덤비밀번호, encPwd: DB에 저장된 암호화된 랜덤비밀번호
		
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("mem_id", m.getMemId());
			map.put("newPwd", bcryptPasswordEncoder.encode(newPwd));
			result = mService.updatePwd(map);
		}
			else {
			System.out.println("비번변경실패");	
			model.addAttribute("errorMsg","비번변경실패");
			return "common/errorPage";
			
		}	if(result ==1) {
				model.addAttribute("loginUser", mService.loginMember(m));
				System.out.println("비밀번호가 성공적으로 수정되었습니다.");
				return "redirect:myPage.me";
		}	else {
			System.out.println("333");
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다. 다시 한번 확인해 주세요.");
			return "redirect:myPage.me";
		}
}
	*/
		// 비밀변호 변경 수정
		@RequestMapping("updateMyPwdInfo.me")
		public String updateMyPwdInfo(Member m, HttpSession session, Model model,@RequestParam("currentPwd") String currentPwd, @RequestParam("newPwd") String newPwd ) {
			m =((Member)session.getAttribute("loginUser"));
			String encPwd = ((Member)session.getAttribute("loginUser")).getMemPw();
			
			if(bcryptPasswordEncoder.matches(currentPwd, encPwd)) { //currentPwd: 랜덤비밀번호, encPwd: DB에 저장된 암호화된 랜덤비밀번호
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("memId", ((Member)session.getAttribute("loginUser")).getMemId());
				map.put("newPwd", bcryptPasswordEncoder.encode(newPwd));
				
				int result = mService.updatePwd(map);
				//System.out.println(currentPwd);
				//System.out.println(loginUser.getMemPw());
				//System.out.println(encPwd);
				//System.out.println(newPwd);
				
				if(result>0) {
					model.addAttribute("loginUser", mService.loginMember(m));
					System.out.println("비밀번호가 성공적으로 수정되었습니다.");
					return "redirect:/";
				}  else {
					System.out.println("비번변경실패");
					return "redirect:/";
				}
				
			} else {
				System.out.println("비번변경실패22");
				return "redirect:/";
			}
			
		}
	
	/*
	m.getMemPw(), loginUser.getMemPw())) {//m.getUserPwd(): 사용자가 입력한 비번, loginUser.getUserPwd(): DB에 저장된 값
	
	public String update(@ModelAttribute Member m, Model model, @RequestParam("year") int year, @RequestParam("month") int month, @RequestParam("day") int day, @RequestParam("currentPwd") String pwd, @RequestParam("newPwd") String newPwd) {
		
		int result = mService.updateMember(m); //여기서 result값 1 됨
		//update 처리
		m = (Member)model.getAttribute("loginUser");
		if(bcrypt.matches(pwd, m.getPwd())) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("id", m.getId());
			map.put("newPwd", bcrypt.encode(newPwd));
			
			result += mService.updatePwd(map);
		}
		
		if(result == 2) {
			model.addAttribute("loginUser", mService.login(m));
			return "redirect:/";
		} else {
			throw new MemberException("회원수정에 실패하였습니다.");
		}
	}	
	
	
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model) { //Member의 객체로 데이터 받아오기
		int result = mService.updateMember(m);
		if(result > 0) {
			Member updateM = mService.loginMember(m);
			session.setAttribute("loginUser", updateM);
			System.out.println("성공적으로 수정되었습니다.");
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			return "redirect:myPage.me"; //myPage.me로 가면 jsp가도록 위에 설정해놓음
		} else {
			model.addAttribute("errorMsg","회원정보 변경 실패");
			return "common/errorPage";			
		}
	}
	*/

	
	// 마이페이지로 이동
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	// 최근작성목록으로 이동
	@RequestMapping("recentPage.me")
	public String recentPage() {
		return "member/recentPage";
	}
	
	// 마이페이지-회원정보수정
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model) { //Member의 객체로 데이터 받아오기
		int result = mService.updateMember(m);
		if(result > 0) {
			Member updateM = mService.loginMember(m);
			session.setAttribute("loginUser", updateM);
			System.out.println("회원정보가 성공적으로 수정되었습니다.");
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			return "redirect:myPage.me"; //myPage.me로 가면 jsp가도록 위에 설정해놓음
		} else {
			model.addAttribute("errorMsg","회원정보 변경에 실패하였습니다. 다시한번 확인해주세요.");
			return "redirect:myPage.me";			
		}
	}
	
	// 배려주차장 차량번호 등록
	@RequestMapping("updateCar.me")
	public String updateCarNumber(Member m, HttpSession session, Model model) {
		int result = mService.updateCarNumber(m);
		if(result > 0) {
			Member updateC = mService.loginMember(m);
			session.setAttribute("loginUser", updateC);
			System.out.println("차량번호 등록이 완료되었습니다.");
			System.out.println(updateC.getMemCarno());
			session.setAttribute("alertMsg", "차량번호 등록이 완료되었습니다.");
			return "redirect:myPage.me"; 
		} else {
			model.addAttribute("errorMsg","차량번호 등록에 실패하였습니다. 다시한번 확인해주세요.");
			return "redirect:myPage.me";
		}
	}
	
	// 마이페이지 탈퇴
	@RequestMapping("delete.me")
	public String deleteMember(String memId, String memPw, HttpSession session, Model model) {
		String encPwd = ((Member)session.getAttribute("loginUser")).getMemPw(); //DB에 저장된 password(암호화된)
		if(bcryptPasswordEncoder.matches(memPw, encPwd)) {
			int result = mService.deleteMember(memId);
			if(result > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.<br> 그동안 이용해 주셔서 감사합니다.");
				return "redirect:/";
			} else {
				model.addAttribute("errorMsg","회원 탈퇴 실패입니다.");
				return "common/errorPage";
			}
		} else {
			session.setAttribute("errorMsg", "비밀번호가 일치하지 않거나 탈퇴한 회원입니다. 다시 한번 확인해 주세요.");
			return "redirect:myPage.me";
		}
	}
	
	// 아이디 중복체크 ajax
	@ResponseBody // ajax로 되돌려주는 어노테이션
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = mService.idCheck(checkId);
		return count > 0 ? "NNN" : "YYY";
	}
	
	// 닉네임 중복체크 ajax
	@ResponseBody
	@RequestMapping("nicknameCheck.me")
	public String nicknameCheck(String checkNickname) {
		int count = mService.nicknameCheck(checkNickname);
		
		return count > 0 ? "NNN" : "YYY";
	}
}
