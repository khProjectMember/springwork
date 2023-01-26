package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.spring.board.model.service.MeetingService;
import com.kh.spring.board.model.vo.Join;
import com.kh.spring.board.model.vo.Meeting;

@Controller
public class MeetingController {
	@Autowired
	private MeetingService mService;
	
	@RequestMapping("meeting.bo")
	public String selectMeeting(Meeting m, Model model) {
		int listCount = mService.selectMeetingCount();
		ArrayList<Meeting> list = mService.selectMeetingList(m);
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "board/MeetingView";	
	}
	
	@RequestMapping("meetingEnroll.bo")
	public String meetingEnroll() {
		return "board/MeetingWriteView";
	}
	
	@RequestMapping("meetingInsert.bo")
	public String insertMeeting(Meeting m) {
		int result = mService.insertMeeting(m);
		
		int meetingNumber = mService.insertjoin(m.getHangoutNo(), m.getMemNo());
		
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
		ArrayList<Join> list = mService.joinvalue(hangoutNo);
		
	
		model.addAttribute("meeting", meeting);
		model.addAttribute("list", list);
		
		return "board/MeetingDetailView";
	}
	
	@RequestMapping("meetingmodifyfrm.bo")
	public String modifyfrm(@RequestParam(value="hangoutNo") int hangoutNo, Model model) {
		model.addAttribute("meeting", mService.selectMeetingDetail(hangoutNo));
		
		return "board/MeetingModifyView";
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
	
	@RequestMapping("meetingjoin.bo")
	public String insertJoinMeeting(@RequestParam(value="hangoutNo") int hangoutNo, @RequestParam(value="memNo") int memNo, HttpSession session) {
		int result = mService.insertJoinMeeting(hangoutNo, memNo);
		int updateNowCount = mService.updateMeetingCount(hangoutNo);
		
		if((result+updateNowCount) > 1) {
			session.setAttribute("alertMsg", "모임에 참여 되었습니다!");
			return "redirect:meeting.bo";
		} else {
			return "board/errorPage";
		}
	}
	
	@RequestMapping("meetingjoinOut.bo")
	public String deleteJoinOutMeeting(@RequestParam(value="hangoutNo") int hangoutNo, @RequestParam(value="memNo") int memNo,  HttpSession session) {
		int result = mService.deleteJoinMeeting(hangoutNo, memNo);
		int updateDownMeetingCount = mService.updateDownMeetingCount(hangoutNo);
		
		if((result+updateDownMeetingCount) > 1) {
			session.setAttribute("alertMsg", "모임에 탈퇴 하셨습니다!");
			return "redirect:meeting.bo";
		} else {
			return "board/errorPage";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value="viewCountAlign.bo", produces="application/json; charset=utf-8")
	public String selectViewCountMeetingList(Meeting m) {
		ArrayList<Meeting> list = mService.selectViewCountMeetingList(m);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="viewAlign.bo", produces="application/json; charset=utf-8")
	public String selectViewMeetingList(Meeting m) {
		ArrayList<Meeting> list = mService.selectViewMeetingList(m);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="meetingsearch.bo", produces="application/json; charset=utf-8")
	public String searchMeeting(
			@RequestParam(value="key_local") String key_local,
			@RequestParam(value="key_gender") String key_gender,
			@RequestParam(value="key_age") String key_age,
			@RequestParam(value="key_catg") String key_catg,
			@RequestParam(value="key_count") int key_count) {
		int listCount = mService.searchMeetingCount(key_local, key_gender, key_age, key_catg, key_count);
		System.out.println(listCount);
		ArrayList<Meeting> list = mService.searchMeetingList(key_local, key_gender, key_age, key_catg, key_count);
		
		return new Gson().toJson(list);
	}
}
