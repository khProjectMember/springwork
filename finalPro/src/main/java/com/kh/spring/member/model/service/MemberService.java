package com.kh.spring.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.spring.member.model.vo.Email;
import com.kh.spring.member.model.vo.Member;

public interface MemberService {
	// 로그인 서비스
	Member loginMember(Member m);
	
	// 회원가입 서비스
	int insertMember(Member m);
	
	// 정보수정 서비스
	int updateMember(Member m);
	
	// 회원탈퇴 서비스
	int deleteMember(String memId); //userId만 넘겨주기
	
	// 아이디 중복 서비스(ajax) - 나중
	int idCheck(String checkId);
	
	// 닉네임 중복 서비스(ajax)
	int nicknameCheck(String checkNickname);
	
	// 아이디 찾기 서비스
	int checkMember(Email email);
	
	// 이메일 얻어오기
	String getMemId(Email email);
	
	// 임시 비밀번호
	int updateTempPwd(HashMap<String, String> param);
	
	// 비밀번호 변경 업데이트
	int updatePwd(HashMap<String, String> map);
	
	// 차량 번호 등록
	int updateCarNumber(Member m);
}
