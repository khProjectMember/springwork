package com.kh.spring.qa.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.qa.model.dao.QnaDao;

import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;

import com.kh.spring.qa.model.vo.Qna;


import oracle.net.aso.q;

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
	public void updateQna(Qna q) {
		 qDao.updateQna(q);
	}
	
	

	@Override
	public ArrayList<Qna> QnaList(Qna q) {
		return null;
	}


	public int selectListCount() {
		return qDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Qna> qnaList(Qna q) {
		return qDao.qnaList(sqlSession, q);
	}
	

	@Override
	public Qna QnaDetail(Integer qnaNo) {
		// TODO Auto-generated method stub
		return qDao.QnaDetail(sqlSession, qnaNo);
	}

	@Override
	public ArrayList<Qna> qnalistfir() {
		// TODO Auto-generated method stub
		return qDao.qnalistfir(sqlSession);
	}

	

	

	

	

	

	
}
