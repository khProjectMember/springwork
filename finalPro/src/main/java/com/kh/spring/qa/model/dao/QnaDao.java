package com.kh.spring.qa.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.qa.model.vo.Qna;


@Repository
public class QnaDao {

	@Autowired
	private SqlSession sqlSession;
	
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("qnaMapper.insertQna", q);
	}

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("qnaMapper.selectListCount");
	}

	public ArrayList<Qna> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList) sqlSession.selectList("qnaMapper.selectQnaList", null, rowBounds);
	}
	
	public ArrayList<Qna> qnaList(SqlSessionTemplate sqlSession, Qna q){
		return (ArrayList)sqlSession.selectList("qnaMapper.qnaList",q);
	}
	//새로추가한 reply
	public Qna QnaDetail(SqlSessionTemplate sqlSession, int qnaNo) {
		return sqlSession.selectOne("qnaMapper.QnaDetail", qnaNo);
	}
	//Reply에대한 
	
	/*
	public int updateQna(SqlSessionTemplate sqlSession, Qna q) {
		 return sqlSession.update("qnaMapper.updateQna", q);
	}*/
	public void updateQna(Qna q) {
		sqlSession.update("qnaMapper.updateQna", q);
	}
	

	public int deleteQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.delete("qnaMapper.deleteQna", q);
	}

	public int updatePost(SqlSessionTemplate sqlSession, Integer qnaNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("qnaMapper.updateQna", qnaNo);
	}
	
	public ArrayList<Qna> qnalistfir(SqlSessionTemplate sqlSession) {
		return (ArrayList) sqlSession.selectList("qnaMapper.qnalistfir");
	}

}
