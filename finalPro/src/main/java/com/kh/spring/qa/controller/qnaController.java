package com.kh.spring.qa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.qa.model.service.qnaService;
import com.kh.spring.qa.model.vo.Qna;

@Controller
public class qnaController {
	@Autowired
	private qnaService qService;
	
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
}
