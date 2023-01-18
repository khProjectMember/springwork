package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.spring.board.model.service.finalNoticeService;
import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;

@Controller
public class finalBoardController {
	@Autowired
	private finalNoticeService nService;
	
	@RequestMapping("notice.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int nowPage, Notice n, Model model) {
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Notice> list = nService.selectList(pi);
		ArrayList<Notice> nlist = nService.selectListVersion(n);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("nlist", nlist);
		return "board/finalBoardNoticeView";
		
	}
	
	@RequestMapping("detail.bo")
	public String selectNotice(int noticeNo, Model model) {
		Notice notice = nService.selectNotice(noticeNo);
		
		model.addAttribute("notice", notice);		
		return "board/finalBoardNoticeDetailView";
	}
	
	@RequestMapping("enroll.bo")
	public String enroll() {
		return "board/finalBoardNoticeWriteView";
	}
	/*
	@RequestMapping("insert.bo")
	public String insertNotice(Notice n, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = changeFilename(upfile, session);
			n.setFilename(upfile.getOriginalFilename());
			n.setChangename("resources/uploadFiles/"+ changeName);
		}
		int result = nService.insertNotice(n);
		if(result > 0 ) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다");
			return "redirect:list.bo";
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
	*/
	
	@ResponseBody
	@RequestMapping(value="SummerNoteImageFile", produces="application/json; charset=utf-8")
	
	public JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\summernoteImg\\";
		String originalFileName = file.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String saveFileName = UUID.randomUUID() + extension;
		
		File targetFile = new File(fileRoot + saveFileName);
		
		try {
			InputStream inputstream = file.getInputStream();
			FileUtils.copyInputStreamToFile(inputstream, targetFile); //파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+saveFileName);
			jsonObject.addProperty("responseCode", "success");
			
		} catch(IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		} 
		
		return jsonObject;
	}
	
	@RequestMapping("insert.bo")
	public String insertNotice(Notice n) {
		int result = nService.insertNotice(n);
		if(result > 0) {
			return "redirect:notice.bo";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("update.bo")
	public String updateNotice(Notice n) {
		int result = nService.updateNotice(n);
		if(result > 0) {
			return "redirect:notice.bo";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateFrm.bo")
	public String updateFrm(@RequestParam(value="nNo") int nNo, Model model) {
		model.addAttribute("notice", nService.selectNotice(nNo));
		return "board/finalBoardNoticeModifyView";
	}
	
	@RequestMapping("deleteFrm.bo")
	public String deleteNotice(@RequestParam(value="nNo") int nNo) {
		
		int result = nService.deleteNotice(nNo);
		
		
		if(result > 0 ) {
			return "redirect:notice.bo";
		} else {
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("search.bo")
	public String searchNotice(@RequestParam(value="keyvalue") String keyvalue,
			@RequestParam(value="keyword") String keyword,
			@RequestParam(value="cpage", defaultValue="1") int nowPage, 
			Notice n,
			Model model) {
		int listCount = nService.searchCount(keyvalue, keyword);
		

		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Notice> list = nService.selectSearchList(pi, keyvalue, keyword);
		ArrayList<Notice> nlist = nService.selectSearchListVersion(keyvalue, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("nlist", nlist);
		
		
		
		return "board/finalBoardNoticeView";
		
	}
}
