package com.kh.spring.lecture.controller;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.lecture.model.service.LectureService;
import com.kh.spring.lecture.model.vo.Lecture;

@Controller
public class LectureController {
	@Autowired
	private LectureService lService;

	@RequestMapping("detail.le")
	public String lectureDetail(Integer lecNo, Model model) {
		Lecture l = lService.lectureDetail(lecNo);
		model.addAttribute("lecture", l);
		return "lecture/lectureDetail";
	}
	
	@RequestMapping("wishList.le")
	public String wishList() {
		return "lecture/wishList";
	}
	
	@RequestMapping("goHome.le")
	public String goHome() {
		return "list";
	}
	
	@RequestMapping("applyList.le")
	public String applyList() {
		return "lecture/applyList";
	}
	@RequestMapping("applyForm.le")
	public String applyForm() {
		return "lecture/applyForm";
	}
	
	@RequestMapping("list.le")
	public String lectureList(Lecture l, Model model) {
		ArrayList<Lecture> list = lService.lectureList(l);
		model.addAttribute("list", list);
		return "lecture/lect_list";
	}
	
	
}