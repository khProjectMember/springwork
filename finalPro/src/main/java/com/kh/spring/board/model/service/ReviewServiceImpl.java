package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.ReviewDao;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.board.model.vo.ReviewReply;
import com.kh.spring.board.model.vo.ReviewReplyRe;
import com.kh.spring.board.model.vo.Reviewrecommend;
import com.kh.spring.common.model.vo.PageInfo;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.ReviewDao;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao rDao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int reviewListCount() {
		// TODO Auto-generated method stub
		return rDao.reviewListCount(sqlSession);
	}

	@Override
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		// TODO Auto-generated method stub
		return rDao.selectReviewList(sqlSession, pi);
	}

	@Override
	public int insertReview(Review r) {
		// TODO Auto-generated method stub
		return rDao.insertReview(sqlSession, r);
	}

	@Override
	public int incCount(int revNo) {
		// TODO Auto-generated method stub
		return rDao.incCouont(sqlSession, revNo);
	}

	@Override
	public Review selectReviewDetail(int revNo) {
		// TODO Auto-generated method stub
		return rDao.selectReviewDetail(sqlSession, revNo);
	}
	
	@Override
	public int updateReview(Review r) {
		// TODO Auto-generated method stub
		return rDao.updateReview(sqlSession, r);
	}

	@Override
	public int deleteReview(int revNo) {
		// TODO Auto-generated method stub
		return rDao.deleteReview(sqlSession, revNo);
	}

	@Override
	public int insertRecommend(int revNo, int memNo) {
		// TODO Auto-generated method stub
		return rDao.insertRecommend(sqlSession, revNo, memNo);
	}

	@Override
	public int updateRecommendCount(int revNo) {
		// TODO Auto-generated method stub
		return rDao.updateRecommendCount(sqlSession, revNo);
	}

	@Override
	public ArrayList<Reviewrecommend> selectRecommend(int revNo) {
		// TODO Auto-generated method stub
		return rDao.selectRecommend(sqlSession, revNo);
	}

	@Override
	public ArrayList<Review> selectViewNewDate(PageInfo pi) {
		// TODO Auto-generated method stub
		return rDao.selectViewNewDate(sqlSession, pi);
	}

	@Override
	public ArrayList<Review> selectViewManyDate(PageInfo pi) {
		// TODO Auto-generated method stub
		return rDao.selectViewManyDate(sqlSession, pi);
	}

	@Override
	public ArrayList<Review> selectViewCountDate(PageInfo pi) {
		// TODO Auto-generated method stub
		return rDao.selectViewCountDate(sqlSession, pi);
	}

	@Override
	public int searchCount(String keyvalue, String keyword) {
		// TODO Auto-generated method stub
		return rDao.searchCount(sqlSession, keyvalue, keyword);
	}

	@Override
	public ArrayList<Review> selectSearchReview(PageInfo pi, String keyvalue, String keyword) {
		// TODO Auto-generated method stub
		return rDao.selectSearchReview(sqlSession, pi, keyvalue, keyword);
	}

	@Override
	public ArrayList<ReviewReply> reviewReplyList(int revNo) {
		// TODO Auto-generated method stub
		return rDao.reviewReplyList(sqlSession, revNo);
	}

	@Override
	public ArrayList<ReviewReplyRe> replyReList(int reviewReplyNo) {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}