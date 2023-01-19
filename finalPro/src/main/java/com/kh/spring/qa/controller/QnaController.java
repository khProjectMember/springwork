package com.kh.spring.qa.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.qa.model.service.QnaService;
import com.kh.spring.qa.model.vo.Qna;

@Controller
public class QnaController {
	@Autowired
	private QnaService qService;
	
	@RequestMapping("qa.bo")
	public String qa() {
		return "/qa/QaView";
	}
	
	@RequestMapping("sendQa")
	public String sendQa() {
		return "/qa/QaWriteView";
	}
	
	@RequestMapping("insertQA.bo")
	public String insertQa(Qna q) {
		int result = qService.insertQna(q);
		
		if(result > 0) {
			return "redirect:qa.bo";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("QA.bo")
	public String QNAlist(Qna q, Model model) throws NullPointerException{
		ArrayList<Qna> list = qService.QnaList(q);
		model.addAttribute("list", list);
		return "QA";
	}	
	
	@RequestMapping("QAboard.bo")
	public String QAboard() {
		return "QAboard";
	}
	
	@RequestMapping("QAReply.bo")
	public String QAReply() {
		return "QAReply";
	}
}

