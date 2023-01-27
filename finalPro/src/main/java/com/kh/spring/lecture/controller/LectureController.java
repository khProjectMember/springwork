package com.kh.spring.lecture.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.board.model.vo.Review;
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
	
	/*
	 * @RequestMapping("goHome.le") public String goHome() { return "list"; }
	 */
	
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
	
	
	@RequestMapping("main_ord.le")
	public String mainPage(Lecture l, Notice n, Model model) {
		ArrayList<Lecture> list1 = lService.mainOrdNew(l);
		ArrayList<Lecture> list2 = lService.mainOrdGrade(l);
		ArrayList<Notice> list3 = lService.mainOrdNotice(n);
		ArrayList<Notice> list4 = lService.mainOrdEvent(n);
		model.addAttribute("list1", list1);
		model.addAttribute("list2", list2);
		model.addAttribute("list3", list3);
		model.addAttribute("list4", list4);
		return "list";
	}
	
	
}