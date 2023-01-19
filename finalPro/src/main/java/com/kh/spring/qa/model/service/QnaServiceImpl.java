package com.kh.spring.qa.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.qa.model.dao.QnaDao;
import com.kh.spring.qa.model.vo.Qna;

@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaDao qDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertQna(Qna q) {
		// TODO Auto-generated method stub
		return qDao.insertQna(sqlSession, q);
	}

	@Override
	public ArrayList<Qna> QnaList(Qna q) {
		return null;
	}

}
