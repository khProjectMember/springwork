package com.kh.spring.wish.controller;

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

import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.wish.model.service.WishService;
import com.kh.spring.wish.model.vo.Wish;

@Controller
public class WishController {
	@Autowired
	private WishService wService;
	@Autowired
	Wish wish;
	
		
	@RequestMapping(value="myWishList.wi")
		public ModelAndView myWishMain(HttpServletRequest request,
				HttpServletResponse response){
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("loginUser");
			int memNo = member.getMemNo();
			wish.setMemNo(memNo);
			Map<String, List> wishMap = wService.myWishList(wish);
			session.setAttribute("wishMap", wishMap);
			return mav;
		}
		

		@RequestMapping(value="/addLecsInWish.wi" , produces = "application/text; charset=utf8")
		public  @ResponseBody String addLecsInWish(@RequestParam("lecNo") int lecNo,@RequestParam("memNo") int memNo,
				                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
			HttpSession session=request.getSession();
			wish.setMemNo(memNo);
			wish.setLecNo(lecNo);
			boolean isAreadyExisted=wService.findWishLecs(wish);
			System.out.println("isAreadyExisted:"+isAreadyExisted);
			if(isAreadyExisted==true){
				return "already_existed";
			}else{
				wService.addLecsInWish(wish);
				return "add_success";
			}
		}
		
		@RequestMapping(value="/removeWishLecs.wi" ,method = RequestMethod.POST)
		public ModelAndView removeWishLecs(@RequestParam("wishNo") int wishNo,
				                          HttpServletRequest request, HttpServletResponse response){
			ModelAndView mav=new ModelAndView();
			wService.removeWishLecs(wishNo);
			mav.setViewName("redirect:/myWishList.wi");
			return mav;
		}
		
														
		
}