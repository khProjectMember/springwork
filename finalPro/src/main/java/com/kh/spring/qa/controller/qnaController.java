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

import com.google.gson.Gson;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.qa.model.service.qnaService;
import com.kh.spring.qa.model.service.qnaServiceImpl;
import com.kh.spring.qa.model.vo.Qna;
import com.kh.spring.qa.model.vo.QnaReply;


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
	
	@RequestMapping("qnaDetail.bo")
	public String qnaDetail(int qnaNo, Model model) {
		Qna qna = qService.QnaDetail(qnaNo);
				
		model.addAttribute("qna", qna);
				
		return "qa/QAViewDetail";
	}

	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="qlist.bo", produces="application/json; charset=utf-8")
	 * public String qnaReplyList(@RequestParam(value="qnaNo") int qnaNo) {
	 * ArrayList<QnaReply> list = qService.QnaReplyList(qnaNo);
	 * 
	 * return new Gson().toJson(list); }
	 */
	
	//수정페이지
		@RequestMapping("updateQna.bo")
		public String updateQa(Qna q) {
			//session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			qService.updateQna(q);
			return "/qa/QAModifyView";
		}
		//수정페이지	
		
		@RequestMapping(value = "updatePost.bo", method = RequestMethod.POST)
		public String updatePost(HttpSession session, Qna q) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			qService.updatePost(q);
			return "/qa/QAViewDetail";
		}
		
		/*
		//삭제페이지
		@RequestMapping(value = "delete.bo", method = RequestMethod.GET)
		public String deleteQna(HttpSession session, Qna q) {
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			qService.deleteQna(q);
			String url="";
			
			int result = qService.deleteQna(q);
			
			if(result > 0) {
				url =  "qa/list.qa";
			} else {
				url = "common/errorPage";
			}
			return url;
		}*/
		
		@RequestMapping(value="delete.bo")
		public ModelAndView deleteQna(Qna q, HttpSession session,
				                          HttpServletRequest request, HttpServletResponse response){
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			ModelAndView mav=new ModelAndView();
			qService.deleteQna(q);
			mav.setViewName("/qa/QaView");
			return mav;
		}
		
}

