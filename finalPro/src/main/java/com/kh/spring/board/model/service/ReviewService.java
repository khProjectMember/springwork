package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.ReplyRecommend;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.board.model.vo.ReviewReply;
import com.kh.spring.board.model.vo.ReviewReplyRe;
import com.kh.spring.board.model.vo.Reviewrecommend;
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
	ArrayList<Reviewrecommend> reviewRecommendRenum(int revNo);
	
	// 리뷰 수정
	
	int updateReview(Review r);
	
	// 리뷰 삭제
	
	int deleteReview(int revNo);
	
	// 리뷰 글 추천
	
	int insertRecommend(int revNo, int memNo);
	int updateRecommendCount(int revNo);

	ArrayList<Reviewrecommend> selectRecommend(int revNo);
	
	
	// 리뷰 글 추천 삭제
	
	int deleteRecommend(int revNo, int memNo);
	int updateRecommendCountDelete(int revNo);
	
	// 최신, 조회, 추천
	
	ArrayList<Review> selectViewNewDate(PageInfo pi);
	ArrayList<Review> selectViewManyDate(PageInfo pi);
	ArrayList<Review> selectViewCountDate(PageInfo pi);
	
	// 검색
	
	int searchCount(String keyvalue, String keyword);
	ArrayList<Review> selectSearchReview(PageInfo pi, String keyvalue, String keyword);
	
	
	// 리플
	
	ArrayList<ReviewReply> reviewReplyList(int revNo);
	ArrayList<ReviewReply> newReivewReplyList(int revNo);
	ArrayList<ReviewReply> GoodReivewReplyList(int revNo);
	ArrayList<ReviewReplyRe> replyReList(int reviewReplyNo);
	ReviewReply selectRevReply(int revReplyNo);
	
	int insertReviewReply(ReviewReply rr);
	
	int deleteReviewReply(int revReplyNo);
	
	int reviewTotalCount(int revNo);
	
	
	// 리플 좋아요
	
	int insertReplyRecommend(int revReplyNo, int memNo);
	int updateReplyRecommend(int revReplyNo);
	
	int deleteReplyRecommend(int revReplyNo, int memNo);
	int updateReplyRecommendDelete(int revReplyNo);
	
	ArrayList<ReplyRecommend> replyrecommendList(int revReplyNo);
	
	
	int goodTotalCount(int revReplyNo);
	

}

