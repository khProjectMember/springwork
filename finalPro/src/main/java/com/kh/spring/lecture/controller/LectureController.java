package com.kh.spring.lecture.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.proxy.Dispatcher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.lecture.model.service.LectureService;
import com.kh.spring.lecture.model.vo.Lecture;

@Controller
public class LectureController {
	@Autowired
	private LectureService lService;

	@RequestMapping("detail.le")
	public String detailView() {
		return "lecture/lectureDetailView";
	}
	/*public ModelAndView selectBoard(int lno, ModelAndView mv) {
		int result = lService.increaseCount(lno);
		if(result > 0) {
			Lecture l = lService.selectBoard(lno);
			mv.addObject("l", l)
			  .setViewName("lecture/lectureDetailView");
		}else {
			mv.addObject("errorMsg","상세 조회 실패")
			  .setViewName("common/errorPage");
		}
		return mv;
	}*/
}
