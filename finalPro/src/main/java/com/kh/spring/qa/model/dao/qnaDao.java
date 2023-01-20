package com.kh.spring.qa.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.qa.model.vo.Qna;

@Repository
public class qnaDao {
	
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


}
