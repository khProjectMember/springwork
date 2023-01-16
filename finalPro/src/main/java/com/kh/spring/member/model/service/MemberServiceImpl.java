package com.kh.spring.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDao;
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
	public int deleteMember(String userId) {
		return mDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int idCheck(String checkId) {
		return mDao.idCheck(sqlSession, checkId);
	}

	@Override
	public int nicknameCheck(String checkNickname) {
		return mDao.nicknameCheck(sqlSession, checkNickname);
	}
	
}
