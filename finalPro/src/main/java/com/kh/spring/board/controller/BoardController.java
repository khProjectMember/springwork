package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import com.kh.spring.board.model.service.NoticeService;
import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;

@Controller
public class BoardController {
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("notice.bo")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int nowPage, HttpServletRequest request, Notice n, Model model) {
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Notice> list = nService.selectList(pi);
		ArrayList<Notice> nlist = nService.selectListVersion(n);
		
		String url = request.getServletPath();
		url = url.substring(1);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("nlist", nlist);
		model.addAttribute("url", url);
		return "board/NoticeView";
		
	}
	
	@RequestMapping("detail.bo")
	public String selectNotice(int noticeNo, Model model) {
		Notice notice = nService.selectNotice(noticeNo);
		
		model.addAttribute("notice", notice);		
		return "board/NoticeDetailView";
	}
	
	@RequestMapping("enroll.bo")
	public String enroll() {
		return "board/NoticeWriteView";
	}
	
	@ResponseBody
	@RequestMapping(value="SummerNoteImageFile", produces="application/json; charset=utf-8")
	
	public JsonObject SummerNoteImageFile(@RequestParam("file") MultipartFile file) {
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "C:\\FinalSpring\\finalPro\\src\\main\\webapp\\WEB-INF\\summernote_Image\\";
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
		return "board/NoticeModifyView";
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
			HttpServletRequest request,
			Model model) {
		int listCount = nService.searchCount(keyvalue, keyword);

		PageInfo pi = Pagination.getPageInfo(listCount, nowPage, 5, 10);
		ArrayList<Notice> list = nService.selectSearchList(pi, keyvalue, keyword);
		ArrayList<Notice> nlist = nService.selectSearchListVersion(keyvalue, keyword);
		
		String url = request.getServletPath();
		url = url.substring(1);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("nlist", nlist);
		model.addAttribute("url", url);
		model.addAttribute("keyvalue", keyvalue);
		model.addAttribute("keyword", keyword);
		
		
		
		return "board/NoticeView";
		
	}
}
