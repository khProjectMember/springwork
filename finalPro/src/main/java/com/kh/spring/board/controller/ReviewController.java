package com.kh.spring.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spring.board.model.service.ReviewService;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rService;
	
	@RequestMapping("review.bo")
	public String ReviewList(@RequestParam(value="rpage", defaultValue="1") int nowPage, Review r, Model model) {
		int listCount = rService.reviewListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Review> list = rService.selectReviewList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		return "board/ReviewView";
	}
	
	@ResponseBody
	@RequestMapping(value="selectReviewList.bo", produces="application/json; charset=utf-8")
	public String selectReviewList(@RequestParam(value="cpage", defaultValue="1") int nowPage, Review r, Model model) {
		int listCount = rService.reviewListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Review> list = rService.selectReviewList(pi);
		
		model.addAttribute("pi", pi);
		
		return new Gson().toJson(list);
	}
}