package com.kh.spring.qa.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.qa.model.vo.Qna;

@Repository
public class qnaDao {
	
	public int insertQna(SqlSessionTemplate sqlSession, Qna q) {
		return sqlSession.insert("qnaMapper.insertQna", q);
	}
}
