package com.kh.spring.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.board.model.service.finalNoticeService;
import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;

@Controller
public class finalBoardController {
	@Autowired
	private finalNoticeService nService;
	
	@RequestMapping("notice.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int nowPage, Model model) {
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Notice> list = nService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/finalBoardNoticeView";
		
	}
	
	@RequestMapping("detail.bo")
	public String selectNotice(int noticeNo, Model model) {
		Notice notice = nService.selectNotice(noticeNo);
		
		model.addAttribute("notice", notice);
		
		return "board/finalBoardNoticeDetailView";
	}
	
}
