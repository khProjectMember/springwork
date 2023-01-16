package com.kh.spring.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.lecture.model.service.LectureService;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

@Controller
public class LectureController {
	@Autowired
	private LectureService lService;

	@RequestMapping("detail.le")
	public String detailView() {
		return "lecture/lectureDetailView";
	}
	
	@RequestMapping("list.le" )
	public String lectureList(Lecture l, Model model) {
		ArrayList<Lecture> list = lService.lectureList(l);
		model.addAttribute("list", list);
		return "lect_list";
	}
	@RequestMapping("list.te")
	public String teacherList(Teacher t, Model model) {
		ArrayList<Teacher> list = lService.teacherList(t);
		model.addAttribute("list", list);
		return "admin/enroll_Lecture";
	}
	@RequestMapping("list2.le")
	public ModelAndView selectList(@RequestParam(value="cpage", defaultValue="1") int nowPage, ModelAndView mv) {
		int listCount = lService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 10, 5);
		ArrayList<Lecture> list = lService.selecList(pi);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .setViewName("admin/enroll_LectureList");
		return mv;
	}
	@RequestMapping("enrollForm.le")
	public String enrollForm() {
		return "admin/enroll_Lecture";
	}
	
	
	@RequestMapping("lecinsert.le")
	public String insertLecture(Lecture l, Teacher t, MultipartFile upfile, HttpSession session, Model model) {
		// System.out.println(b);
		// System.out.println(upfile);
		// MultipartFile은 파일을 등록하지 않아도 객체가 생성이 됨. 다만 filename= 비어서 들어온다
		
		if(!upfile.getOriginalFilename().equals("")) { 
			  String changeName = changeFilename(upfile, session);
			  l.setLecFilename(upfile.getOriginalFilename());
			  l.setLecFilename("resources/uploadFiles/"+changeName); 
		}
		 
		//넘어온 파일이 있으면 : 제목, 작성자, 내용, 파일원본명, 파일저장경로까지 있는 바뀐이름
		//넘어온 파일이 없으면 : 제목, 작성자, 내용
		int result = lService.insertLecture(l);
		if(result > 0 ) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다");
			return "redirect:list2.le";
		} else {
			model.addAttribute("errorMsg","게시글 등록 실패");
			return "common/errorPage";
		}
	}
	
	public String changeFilename(MultipartFile upfile, HttpSession session) {
			String originName = upfile.getOriginalFilename();
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 90000 + 10000 );
			String ext = originName.substring(originName.lastIndexOf("."));
			String changeName = currentTime + ranNum + ext;
			
			//업로드 시키고자 하는 폴더의 물리적인 경로 알아오기
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
				try {
					upfile.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				} 
			return changeName;
	}
	
	/*
	 * @RequestMapping("detail2.le") public ModelAndView selectLecture(int lno,
	 * ModelAndView mv) { int result = lService.increaseCount(lno); if(result > 0) {
	 * Lecture l = lService.selectLecture(lno); mv.addObject("l", l)
	 * .setViewName("admin/enroll_LectureDetailView"); }else {
	 * mv.addObject("errorMsg","상세 조회 실패") .setViewName("common/errorPage"); }
	 * return mv; }
	 */

	
}