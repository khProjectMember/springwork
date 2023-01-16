package com.kh.spring.member.model.dao;

import javax.servlet.http.HttpServlet;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class MemberDao{
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
		
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember",m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("memberMapper.deleteMember",userId); //찐 삭제가 아닌, status를 'N'으로 바꿔준 후 1년뒤 삭제
	}
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	public int nicknameCheck(SqlSessionTemplate sqlSession, String nicknameCheck) {
		return sqlSession.selectOne("memberMapper.idCheck", nicknameCheck);
	}
	
}
