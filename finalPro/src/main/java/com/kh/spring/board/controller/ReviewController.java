package com.kh.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spring.board.model.service.ReviewService;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.board.model.vo.ReviewReply;
import com.kh.spring.board.model.vo.Reviewrecommend;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService rService;
	
	@RequestMapping("review.bo")
	public String ReviewList(@RequestParam(value="rpage", defaultValue="1") int nowPage, HttpServletRequest request, Review r, Model model) {
		int listCount = rService.reviewListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Review> list = rService.selectReviewList(pi);
		
		String url = request.getServletPath();
		url = url.substring(1);
		

		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("url", url);
		
		return "board/ReviewView";
	}
	
	@RequestMapping("reviewEnrollFrm.bo")
	public String enroll() {
		return "board/ReviewWriteView";
	}
	
	@RequestMapping("insertReview.bo")
	public String insertReview(Review r) {
		int result = rService.insertReview(r);
		
		if(result > 0) {
			return "redirect:review.bo";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("reviewDetail.bo")
	public String reviewDetail(int revNo, Model model) {
		int inc = rService.incCount(revNo);
		Review review = rService.selectReviewDetail(revNo);
		
		
		model.addAttribute("review", review);
		
		
		return "board/ReviewDetailView";
	}
	
	@RequestMapping("reviewModify.bo")
	public String reiviewModifyFrm(@RequestParam(value="revNo") int revNo, Model model) {
		model.addAttribute("review", rService.selectReviewDetail(revNo));
		
		return "board/ReviewModifyView";
	}
	
	@RequestMapping("updateReview.bo")
	public String updateReview(Review r) {
		int result = rService.updateReview(r);
		
		if(result > 0) {
			return "redirect:review.bo";
		} else {
			return "board/errorPage";
		}
	}
	
	@RequestMapping("reviewDelete.bo")
	public String deleteReview(@RequestParam(value="revNo") int revNo) {
		int result = rService.deleteReview(revNo);
		
		if(result > 0) {
			return "redirect:review.bo";
		} else {
			return "board/errorPage";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="reviewRecommend.bo", produces="application/json; charset=utf-8")
	public String reviewRecommend(@RequestParam(value="revNo") int revNo, @RequestParam(value="memNo") int memNo, Model model) {
		System.out.println(revNo);
		int insertRecommend = rService.insertRecommend(revNo, memNo);
		int updateRecommend = rService.updateRecommendCount(revNo);
		ArrayList<Reviewrecommend> selectRecommend = rService.selectRecommend(revNo);
		
		System.out.println(insertRecommend);
		System.out.println(updateRecommend);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("insertRecommend", insertRecommend);
		map.put("updateRecommend", updateRecommend);
		
		model.addAttribute("selectRecommend", selectRecommend);		
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="selectReviewList.bo", produces="application/json; charset=utf-8")
	public String selectReviewList(@RequestParam(value="cpage", defaultValue="1") int nowPage, HttpServletRequest request, Review r, Model model) {
		int listCount = rService.reviewListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Review> list = rService.selectReviewList(pi);
		String url = request.getServletPath();
		url = url.substring(1);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("url", url);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="selectReviewManyList.bo", produces="application/json; charset=utf-8")
	public String selectViewManyDate(@RequestParam(value="cpage", defaultValue="1") int nowPage, HttpServletRequest request, Review r, Model model) {
		int listCount = rService.reviewListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Review> list = rService.selectViewManyDate(pi);
		String url = request.getServletPath();
		url = url.substring(1);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("url", url);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="selectReviewCountList.bo", produces="application/json; charset=utf-8")
	public String selectReviewCountList(@RequestParam(value="cpage", defaultValue="1") int nowPage, HttpServletRequest request, Review r, Model model) {
		int listCount = rService.reviewListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Review> list = rService.selectViewCountDate(pi);
		String url = request.getServletPath();
		url = url.substring(1);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("url", url);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("reviewSearch.bo")
	public String searchReview(@RequestParam(value="keyvalue") String keyvalue,
								@RequestParam(value="keyword") String keyword,
								@RequestParam(value="rpage", defaultValue="1") int nowPage,
								Review r, HttpServletRequest request, Model model) {
		int listCount = rService.searchCount(keyvalue, keyword);
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Review> list = rService.selectSearchReview(pi, keyvalue, keyword);
		
		String url = request.getServletPath();
		url = url.substring(1);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);		
		model.addAttribute("url", url);
		model.addAttribute("keyvalue", keyvalue);
		model.addAttribute("keyword", keyword);
		
		return "board/ReviewView";
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	public String reviewReplyList(@RequestParam(value="revNo") int revNo) {
		ArrayList<ReviewReply> list = rService.reviewReplyList(revNo);
		
		return new Gson().toJson(list);
	}
	
			
	
	
}
