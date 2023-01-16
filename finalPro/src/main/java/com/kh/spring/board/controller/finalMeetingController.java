package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.spring.board.model.service.finalMeetingService;
import com.kh.spring.board.model.vo.Meeting;

@Controller
public class finalMeetingController {
	@Autowired
	private finalMeetingService mService;
	
	@RequestMapping("meeting.bo")
	public String selectMeeting(Meeting m, Model model) {
		int listCount = mService.selectMeetingCount();
		ArrayList<Meeting> list = mService.selectMeetingList(m);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "board/finalBoardMeetingView";	
	}
	
	@RequestMapping("meetingEnroll.bo")
	public String meetingEnroll() {
		return "board/finalBoardMeetingWriteView";
	}
	
	@RequestMapping("meetingInsert.bo")
	public String insertMeeting(Meeting m) {
		int result = mService.insertMeeting(m);
		
		int meetingNumber = mService.insertjoin(m.getHangoutNo());
		
		if(result > 0) {
			return "redirect:meeting.bo";
		} else {
			return "common/errorPage";					
		}
	}
	
	@RequestMapping("meetingDetail.bo")
	public String MeetingDetail(int hangoutNo, Model model) {
		int viewCount = mService.incCount(hangoutNo);
		Meeting meeting = mService.selectMeetingDetail(hangoutNo);
		
	
		model.addAttribute("meeting", meeting);
		
		return "board/finalBoardMeetingDetailView";
	}
	
	@RequestMapping("meetingmodifyfrm.bo")
	public String modifyfrm(@RequestParam(value="hangoutNo") int hangoutNo, Model model) {
		model.addAttribute("meeting", mService.selectMeetingDetail(hangoutNo));
		
		return "board/finalBoardMeetingModifyView";
	}
	
	@RequestMapping("meetingmodify.wr")
	public String updateMeeting(Meeting m) {
		int result1 = mService.updateMeeting(m);
		System.out.println(m.getHangoutNo());
		
		if(result1 > 0) {
			return "redirect:meeting.bo";
		} else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("meetingdelete.bo")
	public String deleteMeeting(@RequestParam(value="hangoutNo") int hangoutNo, Model m) {
		int result = mService.deleteMeeting(hangoutNo);
		
		if(result > 0) {
			return "redirect:meeting.bo";
		} else {
			return "board/errorPage";
		}
	}
	/*
	@RequestMapping("meetingjoin.bo")
	public String insertJoinMeeting(@RequestParam(value="hangoutNo") int hangoutNo, Model m) {
		int result = mService.insertJoinMeeting(hangoutNo);
	}
	*/
}
