package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.Reply;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	/*
	@RequestMapping("list.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int nowPage, Model model) {
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 5);
		ArrayList<Board> list = bService.selecList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/boardListView";
	}
	*/
	
	@RequestMapping("list.bo")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int nowPage, ModelAndView mv) {
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 5);
		ArrayList<Board> list = bService.selecList(pi);
		/*
		mv.addObject("pi",pi);
		mv.addObject("list",list);
		mv.setViewName("board/boardListView");
		*/
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("board/boardListView");
		return mv;
	}
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		int result = bService.increaseCount(bno);
		if(result > 0) {
			Board b = bService.selectBoard(bno);
			mv.addObject("b", b)
			  .setViewName("board/boardDetailView");
		}else {
			mv.addObject("errorMsg","?????? ?????? ??????")
			  .setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = changeFilename(upfile, session);
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/"+ changeName);
			
		}
		//????????? ????????? ????????? : ??????, ?????????, ??????, ???????????????, ???????????????????????? ?????? ????????????
		//????????? ????????? ????????? : ??????, ?????????, ??????
		int result = bService.insertBoard(b);
		if(result > 0 ) {
			session.setAttribute("alertMsg", "??????????????? ???????????? ?????????????????????");
			return "redirect:list.bo";
		} else {
			model.addAttribute("errorMsg","????????? ?????? ??????");
			return "common/errorPage";
		}
	}
	@RequestMapping("update.bo")
	public String updateBoard(Board b, MultipartFile reupfile, HttpSession session ,Model model) {
		if( !reupfile.getOriginalFilename().equals("")) {
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			String changeName = changeFilename(reupfile, session);
			
			b.setOriginName(reupfile.getOriginalFilename());
			b.setChangeName("resources/uploadfiles" + changeName);
		}
		int result = bService.updateBoard(b);
		if(result > 0) {
			session.setAttribute("alert", "??????????????? ???????????? ?????????????????????");
			return "redirect:detail.bo?bno=" + b.getBoardNo();
		} else {
			model.addAttribute("errorMsg","????????? ?????? ??????");
			return "common/errorPage";
		}
	}
	@RequestMapping("updateForm.bo")
	public String updateForm(int bno, Model model) {
		model.addAttribute("b",bService.selectBoard(bno));
		return "board/boardUpdateForm";
	}
	public String changeFilename(MultipartFile upfile, HttpSession session) {
			String originName = upfile.getOriginalFilename();
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000 );
			String ext = originName.substring(originName.lastIndexOf("."));
			String changeName = currentTime + ranNum + ext;
			
			//????????? ???????????? ?????? ????????? ???????????? ?????? ????????????
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			
				try {
					upfile.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				} 
			return changeName;
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, String filePath, HttpSession session,Model model) {
		int result = bService.deleteBoard(bno);
		if(result > 0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "??????????????? ???????????? ?????????????????????");
			return "redirect:list.bo";
		} else {
			model.addAttribute("errorMsg","????????? ?????? ??????");
			return "common/errorPage";
		}
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int bno) {
		ArrayList<Reply> list = bService.selectReplyList(bno);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="rinsert.bo")
	public String ajaxInsertReply(Reply r) {
		int result= bService.insertReply(r);
		return result > 0 ? "success" : "fail";
	}
	@ResponseBody
	@RequestMapping(value="topList.bo", produces="application/json; charset=utf-8")
	public String ajaxTopBoardList() {
		ArrayList<Board> list = bService.selectTopBoardList();
		return new Gson().toJson(list);
	}
}
