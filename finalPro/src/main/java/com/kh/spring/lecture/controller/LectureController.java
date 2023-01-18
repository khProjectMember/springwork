package com.kh.spring.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UrlPathHelper;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.lecture.model.service.LectureService;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;


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