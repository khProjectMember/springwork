package com.kh.spring.apply.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.apply.model.service.ApplyService;
import com.kh.spring.apply.model.vo.Apply;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.member.model.vo.Member;

@Controller
public class ApplyController {
	@Autowired
	private ApplyService aService;
	@Autowired
	Apply apply;
	
		
	@RequestMapping(value="myApplyList.ap")
		public ModelAndView myApplyMain(HttpServletRequest request,
				HttpServletResponse response){
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			int memNo = member.getMemNo();
			apply.setMemNo(memNo);
			Map<String, List> applyMap = aService.myApplyList(apply);
			session.setAttribute("applyMap", applyMap);
			return mav;
		}
		

		@RequestMapping(value="/addLecsInApply.ap" , produces = "application/text; charset=utf8")
		public  @ResponseBody String addLecsInApply(@RequestParam("lecNo") int lecNo,@RequestParam("memNo") int memNo,
				                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
			HttpSession session=request.getSession();
			apply.setMemNo(memNo);
			apply.setLecNo(lecNo);
			boolean isAreadyExisted=aService.findApplyLecs(apply);
			System.out.println("isAreadyExisted:"+isAreadyExisted);
			if(isAreadyExisted==true){
				return "already_existed";
			}else{
				aService.addLecsInApply(apply);
				return "add_success";
			}
		}
		
		@RequestMapping(value="/removeApplyLecs.ap" ,method = RequestMethod.POST)
		public ModelAndView removeApplyLecs(@RequestParam("applyNo") int applyNo,
				                          HttpServletRequest request, HttpServletResponse response){
			ModelAndView mav=new ModelAndView();
			aService.removeApplyLecs(applyNo);
			mav.setViewName("redirect:/myApplyList.ap");
			return mav;
		}
		
														
		
}