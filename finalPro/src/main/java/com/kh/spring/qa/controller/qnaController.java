package com.kh.spring.qa.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.qa.model.service.qnaService;
import com.kh.spring.qa.model.vo.Qna;

@Controller
public class qnaController {
	@Autowired
	private qnaService qService;
	
	//자주하는 질문 페이
	@RequestMapping("board.qa")
	public String boardqa() {
		return "/qa/QAboard";
	}
	
	//1:1문의하기 작성하는 페이지
	@RequestMapping("sendQa.qa")
	public String sendQa() {
		return "/qa/QaWriteView";
	}
	
	@RequestMapping("insertQA.bo")
	public String insertQa(Qna q) {
		int result = qService.insertQna(q);
		
		if(result > 0) {
			return "redirect:list.qa";
		} else {
			return "common/errorPage";
		}
	}
	@RequestMapping("list.qa")
	public String qnaList(Qna q, Model model) {
		ArrayList<Qna> list = qService.qnaList(q);
		model.addAttribute("list", list);
		return "qa/QaView";
	}
}
