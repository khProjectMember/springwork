package com.kh.spring.member.model.service;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {
	// 로그인서비스
	Member loginMember(Member m);
	
	// 회원가입 서비스
	int insertMember(Member m);
	
	// 정보수정 서비스
	int updateMember(Member m);
	
	// 회원탈퇴 서비스
	int deleteMember(String userId);
	
	// 아이디 중복체크 서비스(ajax) - 나중
	int idCheck(String checkId);
}
