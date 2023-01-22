package com.kh.spring.board.model.service;

import java.util.ArrayList;

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
	public int insertRecommend(int revNo) {
		// TODO Auto-generated method stub
		return rDao.insertRecommend(sqlSession, revNo);
	}

	@Override
	public int updateRecommendCount(int revNo) {
		// TODO Auto-generated method stub
		return rDao.updateRecommendCount(sqlSession, revNo);
	}

}

/*
 * @Service public class ReviewServiceImpl implements ReviewService {
 * 
 * @Autowired ReviewDao rDao;
 * 
 * @Autowired SqlSessionTemplate sqlSession;
 * 
 * @Override public int reviewListCount() { // TODO Auto-generated method stub
 * return rDao.reviewListCount(sqlSession); }
 * 
 * @Override public ArrayList<Review> selectReviewList(PageInfo pi) { // TODO
 * Auto-generated method stub return rDao.selectReviewList(sqlSession, pi); }
 * 
 * }
 */