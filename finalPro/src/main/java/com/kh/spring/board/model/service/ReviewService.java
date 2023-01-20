package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;

public interface ReviewService {
	// 리뷰 첫 화면 리스트
	
	int reviewListCount();
	ArrayList<Review> selectReviewList(PageInfo pi);
	
	// 리뷰 작성

	int insertReview(Review r);
	
	// 리뷰 조회
	
	int incCount(int revNo);
	Review selectReviewDetail(int revNo);
	
	// 리뷰 수정
	
	int updateReview(Review r);
	
	// 리뷰 삭제
	
	int deleteReview(int revNo);
	
	// 리뷰 글 추천
	
	int insertRecommend(int revNo);
	int updateRecommendCount(int revNo);
}
