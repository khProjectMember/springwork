package com.kh.spring.common.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.lecture.model.vo.Lecture;

@Controller
public class CommonController {
	
	// 홈으로 이동 LectureController에 있음
	/*
	@RequestMapping("goHome.le")
	public String goHome() {
		return "list";
	}
	*/
	
	// 장바구니로 이동 LectureController에 있음
	/*
	@RequestMapping("wishList.le")
	public String wishList() {
		return "lecture/wishList";
	}
	*/
	
	// 신청목록- 에러페이지로 이동
	
	
	// 시설안내로 이동
	@RequestMapping("facility.fa")
	public String facility() {
		return "etc/facility";
	}
	
	// 오시는길로 이동
	@RequestMapping("contact.co")
	public String contact() {
		return "etc/contact";
	}
	
	// 1:1문의로 이동 QnaController에 있음
	/*
	@RequestMapping("qa.bo")
	public String qa() {
		return "/qa/QaView";
	}
	*/
	
	// 수강신청으로 이동 LectureController에 있음
	/*
	@RequestMapping("applyList.le")
	public String applyList() {
		return "lecture/applyList";
	}
	*/
	
	// 강좌목록으로 이동 LectureController에 있음
	/*
	@RequestMapping("list.le")
	public String lectureList(Lecture l, Model model) {
		ArrayList<Lecture> list = lService.lectureList(l);
		model.addAttribute("list", list);
		return "lecture/lect_list";
	}
	*/
	
	// 강좌스케줄로 이동
	@RequestMapping("lectureDetail.le")
	public String lectureDetail() {
		return "lecture/lectureDetail";
	}
}
