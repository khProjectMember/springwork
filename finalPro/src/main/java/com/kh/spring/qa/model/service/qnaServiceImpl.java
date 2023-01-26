package com.kh.spring.qa.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.vo.Review;
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
	public void updateQna(Qna qna) {
		 qDao.updateQna(sqlSession, qna);
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
	public void updatePost(Qna q) {
		 qDao.updateQna(sqlSession, q);
	}

	@Override
	public int deleteQna(Qna q) {
		// TODO Auto-generated method stub
		return qDao.deleteQna(sqlSession, q);
	}	
}
