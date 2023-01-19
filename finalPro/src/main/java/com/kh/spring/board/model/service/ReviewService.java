package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;

public interface ReviewService {
	// 리뷰 첫 화면 리스트
	int reviewListCount();
	ArrayList<Review> selectReviewList(PageInfo pi);
}