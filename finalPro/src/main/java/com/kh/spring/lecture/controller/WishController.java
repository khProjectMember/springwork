package com.kh.spring.lecture.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.lecture.model.service.WishService;
import com.kh.spring.lecture.model.vo.Wish;
import com.kh.spring.member.model.vo.Member;

@Controller("WishController")
	@RequestMapping(value="/cart")
public class WishController {
		@Autowired
		WishService wService;
		@Autowired
		Wish wish;
		@Autowired
		Member member;
		
		@RequestMapping(value="myWishList.wi", method=RequestMethod.GET)
		public ModelAndView myWishMain(HttpServletRequest request,
				HttpServletResponse response){
			String viewName = (String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			HttpSession session = request.getSession();
			Member member = (Member)session.getAttribute("memberInfo");
			int memNo = member.getMemNo();
			wish.setMemNo(memNo);
			Map<String, List> wishMap = wService.myWishList(wish);
			session.setAttribute("wishMap", wishMap);
			return mav;
		}
		
		@RequestMapping(value="/addLecsInWish.wi", method=RequestMethod.POST, produces = "application/text;charset=utf8")
		public @ResponseBody String addLecsInWish(@RequestParam("lec_no") int lec_no,
													HttpServletRequest request, HttpServletResponse response){
			HttpSession session = request.getSession();
			member =(Member)session.getAttribute("memberInfo");
			int mem_no=member.getMemNo();
			wish.setMemNo(mem_no);
			wish.setLecNo(lec_no);
			boolean isAlreadyExisted = wService.findWishLecs(wish);
			if(isAlreadyExisted==true) {
				return "already_existed";
			}else {
				wService.addLecsInWish(wish);
				return 	"add_success";
			}
			
		}
		
		@RequestMapping(value="modifyWishQty.wi", method=RequestMethod.POST)
		public @ResponseBody String modifyWishQty(@RequestParam("lec_no") int lec_no,
					HttpServletRequest request, HttpServletResponse response){
			HttpSession session = request.getSession();
			member=(Member)session.getAttribute("memberInfo");
			int memNo=member.getMemNo();
			wish.setMemNo(memNo);
			wish.setWish_lecs_qty(wish_lecs_qty);
		}
														
		
}