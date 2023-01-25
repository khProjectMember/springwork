package com.kh.spring.qa.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.qa.model.dao.qnaDao;
import com.kh.spring.qa.model.vo.Qna;
import com.kh.spring.qa.model.vo.QnaReply;

import oracle.net.aso.q;

@Service
public class qnaServiceImpl implements qnaService {
	@Autowired
	private qnaDao qDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertQna(Qna q) {
		// TODO Auto-generated method stub
		return qDao.insertQna(sqlSession, q);
	}

	@Override
	public int selectListCount() {
		return qDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Qna> qnaList(Qna q) {
		return qDao.qnaList(sqlSession, q);
	}
	

	@Override
	public Qna QnaDetail(int qnaNo) {
		// TODO Auto-generated method stub
		return qDao.QnaDetail(sqlSession, qnaNo);
	}

	@Override
	public ArrayList<QnaReply> qnaReplyList(int qnaNo) {
		// TODO Auto-generated method stub
		return (ArrayList<QnaReply>) qDao.qnaReplyList(sqlSession, qnaNo);
	}

	@Override
	public Qna selectqnaDetail(int qnaNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<QnaReply> QnaReplyList(int qnaNo) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
