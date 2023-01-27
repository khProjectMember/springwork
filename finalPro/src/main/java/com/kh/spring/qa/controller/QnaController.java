package com.kh.spring.qa.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.qa.model.service.QnaService;

import com.google.gson.Gson;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.lecture.model.vo.Lecture;

import com.kh.spring.qa.model.vo.Qna;



@Controller
public class QnaController {
	@Autowired
	private QnaService qService;
	
	//�옄二쇳븯�뒗 吏덈Ц �럹�씠
	@RequestMapping("board.qa")
	public String boardqa() {
		return "qa/QAboard";
	}
	
	//1:1臾몄쓽�븯湲� �옉�꽦�븯�뒗 �럹�씠吏�
	@RequestMapping("sendQa.qa")
	public String sendQa() {
		return "qa/QaWriteView";
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
	
	@RequestMapping("qa.bo")
	public String QNAlist(Model model) throws NullPointerException{
		ArrayList<Qna> list = qService.qnalistfir();
		model.addAttribute("list", list);
		return "qa/QaView";
	}	
	
	@RequestMapping("QAboard.bo")
	public String QAboard() {
		return "qa/QAboard";
	}
	
	@RequestMapping("QAReply.bo")
	public String QAReply() {
		return "qa/QAReply";
	}


	@RequestMapping("list.qa")
	public String qnaList(Qna q, Model model) {
		ArrayList<Qna> list = qService.qnaList(q);
		model.addAttribute("list", list);
		return "qa/QaView";
	}
	
	@RequestMapping("qnaDetail.bo")
	public String qnaDetail(Integer qnaNo, Model model) {
		Qna qna = qService.QnaDetail(qnaNo);
				
		model.addAttribute("qna", qna);
				
		return "qa/QAViewDetail";
	}

	
	
	
	
	
	//�닔�젙�럹�씠吏�
		@RequestMapping(value="updateQna.bo") public String updateQa(Qna q,
		    	  HttpSession session, HttpServletRequest request, HttpServletResponse
				  response){ 
			  	  session.setAttribute("alertMsg", "�꽦怨듭쟻�쑝濡� �닔�젙�릺�뿀�뒿�땲�떎."); 
		    	  qService.updateQna(q);
		    	  return "redirect:/list.qa"; 
		  }			
		
		
		
		
			/*
			 * @RequestMapping(value="updatePost.bo") public String updatePost(Integer
			 * qnaNo, Model model) { Qna qna = qService.QnaDetail(qnaNo);
			 * 
			 * model.addAttribute("qna", qna);
			 * 
			 * return "redirect:/list.qa";
			 * 
			 * }
			 */
		
		
}

