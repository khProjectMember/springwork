package com.kh.spring.member.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Email;
import com.kh.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{ //memberDao로 감
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		/*
		 * Member loginUser = mDao.loginMember(sqlSession,m);
		 *  return loginUser;
		 */
		
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession,m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m); //sqlSession업데이트, 사용자로부터받은 m 넘겨주기
	}

	@Override
	public int deleteMember(String memId) {
		return mDao.deleteMember(sqlSession, memId);
	}

	@Override
	public int idCheck(String checkId) {
		return mDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int nicknameCheck(String checkNickname) {
		return mDao.nicknameCheck(sqlSession, checkNickname);
	}

	@Override
	public int checkMember(Email email) {
		return mDao.checkMember(sqlSession, email);
	}

	@Override
	public String getMemId(Email email) {
		return mDao.getMemId(sqlSession, email);
	}

	@Override
	public int updateTempPwd(HashMap<String, String> param) {
		return mDao.updateTempPwd(sqlSession, param);
	}

	@Override
	public int updatePwd(HashMap<String, String> map) {
		return mDao.updatePwd(sqlSession, map);
	}

	@Override
	public int updateCarNumber(Member m) {
		return mDao.updateCarNumber(sqlSession,m);
	}
	
	
	
}
