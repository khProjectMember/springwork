package com.kh.spring.lecture.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.proxy.Dispatcher;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.lecture.model.service.LectureService;
import com.kh.spring.lecture.model.vo.Lecture;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping("list.le")
	public String lectureList(Lecture l, Model model) {
		ArrayList<Lecture> list = lService.lectureList(l);
		model.addAttribute("list", list);
		return "lect_list";
	}
	/*
	 * @RequestMapping("list.bo") public String
	 * selectList(@RequestParam(value="cpage", defaultValue="1") int nowPage, Model
	 * model) { int listCount = bService.selectListCount();
	 * 
	 * PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 5);
	 * ArrayList<Board> list = bService.selecList(pi);
	 * 
	 * model.addAttribute("pi", pi); model.addAttribute("list", list);
	 * 
	 * return "board/boardListView"; }
	 */

	/*
	 * @RequestMapping("list.bo") public ModelAndView
	 * selectList(@RequestParam(value="cpage", defaultValue="1") int nowPage,
	 * ModelAndView mv) { int listCount = lService.selectListCount();
	 * 
	 * PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 5);
	 * ArrayList<Lecture> list = lService.selecList(pi);
	 * 
	 * mv.addObject("pi",pi); mv.addObject("list",list);
	 * mv.setViewName("board/boardListView");
	 * 
	 * mv.addObject("pi",pi) .addObject("list",list)
	 * .setViewName("lec/lectureListView"); return mv; }
	 */

	/*
	 * @RequestMapping("detail.bo") public ModelAndView selectBoard(int bno,
	 * ModelAndView mv) { int result = bService.increaseCount(bno); if(result > 0) {
	 * Board b = bService.selectBoard(bno); mv.addObject("b", b)
	 * .setViewName("board/boardDetailView"); }else {
	 * mv.addObject("errorMsg","상세 조회 실패") .setViewName("common/errorPage"); }
	 * return mv; }
	 */
	/*
	 * @RequestMapping("enrollForm.bo") public String enrollForm() { return
	 * "board/boardEnrollForm"; }
	 */

	/*
	 * @RequestMapping("insert.le") public String insertLecture(Lecture l,
	 * MultipartFile upfile, HttpSession session, Model model) { //
	 * System.out.println(b); // System.out.println(upfile); // MultipartFile은 파일을
	 * 등록하지 않아도 객체가 생성이 됨. 다만 filename= 비어서 들어온다
	 * 
	 * if (!upfile.getOriginalFilename().equals("")) {
	 * 
	 * String originName = upfile.getOriginalFilename(); String currentTime = new
	 * SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); int ranNum =
	 * (int)(Math.random() * 90000 + 10000 ); String ext =
	 * originName.substring(originName.lastIndexOf(".")); String changeName =
	 * currentTime + ranNum + ext;
	 * 
	 * //업로드 시키고자 하는 폴더의 물리적인 경로 알아오기 String savePath =
	 * session.getServletContext().getRealPath("/resources/uploadFiles/");
	 * 
	 * 
	 * try { upfile.transferTo(new File(savePath + changeName)); } catch
	 * (IllegalStateException | IOException e) { e.printStackTrace(); }
	 * 
	 * String changeName = changeFilename(upfile, session);
	 * l.setOriginName(upfile.getOriginalFilename());
	 * l.setChangeName("resources/uploadFiles/" + changeName);
	 * 
	 * } // 넘어온 파일이 있으면 : 제목, 작성자, 내용, 파일원본명, 파일저장경로까지 있는 바뀐이름 // 넘어온 파일이 없으면 : 제목,
	 * 작성자, 내용 int result = lService.insertBoard(b); if (result > 0) {
	 * session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다"); return
	 * "redirect:list.bo"; } else { model.addAttribute("errorMsg", "게시글 등록 실패");
	 * return "common/errorPage"; } }
	 */

	/*
	 * public String changeFilename(MultipartFile upfile, HttpSession session) {
	 * String originName = upfile.getOriginalFilename(); String currentTime = new
	 * SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); int ranNum = (int)
	 * (Math.random() * 90000 + 10000); String ext =
	 * originName.substring(originName.lastIndexOf(".")); String changeName =
	 * currentTime + ranNum + ext;
	 * 
	 * // 업로드 시키고자 하는 폴더의 물리적인 경로 알아오기 String savePath =
	 * session.getServletContext().getRealPath("/resources/uploadFiles/");
	 * 
	 * try { upfile.transferTo(new File(savePath + changeName)); } catch
	 * (IllegalStateException | IOException e) { e.printStackTrace(); } return
	 * changeName; }
	 * 
	 * @RequestMapping("delete.bo") public String deleteBoard(int bno, String
	 * filePath, HttpSession session, Model model) { int result =
	 * lService.deleteBoard(bno); if (result > 0) { if (!filePath.equals("")) { new
	 * File(session.getServletContext().getRealPath(filePath)).delete(); }
	 * session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다"); return
	 * "redirect:list.bo"; } else { model.addAttribute("errorMsg", "게시글 삭제 실패");
	 * return "common/errorPage"; } }
	 * 
	 * @RequestMapping("updateForm.bo") public String updateForm(int bno, Model
	 * model) { model.addAttribute("b", lService.selectBoard(bno)); return
	 * "board/boardUpdateForm"; }
	 * 
	 * @RequestMapping("update.le") public String updateBoard(Lecture l,
	 * MultipartFile reupfile, HttpSession session, Model model) { if
	 * (!reupfile.getOriginalFilename().equals("")) { if (l.getOriginName() != null)
	 * { new
	 * File(session.getServletContext().getRealPath(l.getChangeName())).delete(); }
	 * String changeName = changeFilename(reupfile, session);
	 * 
	 * b.setOriginName(reupfile.getOriginalFilename());
	 * b.setChangeName("resources/uploadfiles" + changeName); } int result =
	 * lService.updateBoard(l); if (result > 0) { session.setAttribute("alert",
	 * "성공적으로 게시글이 수정되었습니다"); return "redirect:detail.bo?bno=" + b.getBoardNo(); }
	 * else { model.addAttribute("errorMsg", "게시글 수정 실패"); return
	 * "common/errorPage"; } }
	 */
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	 * public String ajaxSelectReplyList(int bno) { ArrayList<Reply> list =
	 * bService.selectReplyList(bno); return new Gson().toJson(list); }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="rinsert.bo") public String ajaxInsertReply(Reply r) {
	 * int result= bService.insertReply(r); return result > 0 ? "success" : "fail";
	 * }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="topList.bo",
	 * produces="application/json; charset=utf-8") public String ajaxTopBoardList()
	 * { ArrayList<Board> list = bService.selectTopBoardList(); return new
	 * Gson().toJson(list); }
	 */
}
