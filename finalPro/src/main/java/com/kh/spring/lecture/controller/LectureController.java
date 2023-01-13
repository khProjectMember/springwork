package com.kh.spring.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.lecture.model.service.LectureService;
import com.kh.spring.lecture.model.vo.Lecture;


@Controller
public class LectureController {
	@Autowired
	private LectureService lService;

	@RequestMapping("detail.le")
	public String lectureDetail(int lecNo, Model model) {
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
		return "lect_list";
	}
}