package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.board.model.vo.Join;
import com.kh.spring.board.model.vo.Meeting;

public interface MeetingService {
	// 모임 리스트 페이지
	
	int selectMeetingCount();
	ArrayList<Meeting> selectMeetingList(Meeting m);
	
	// 모임 만들기
	
	int insertMeeting(Meeting m);
	int insertjoin(int hangoutNo, int memNo);
	
	// 모임 조회
	int incCount(int hangoutNo);
	Meeting selectMeetingDetail(int hangoutNo);
	
	// 모임 수정
	
	int updateMeeting(Meeting m);
	
	// 모임 삭제
	
	int deleteMeeting(int hangoutNo);
	
	// 모임 참여
	
	int insertJoinMeeting(int hangoutNo, int memNo);
	int updateMeetingCount(int hangoutNo);
	
	// 모임 탈퇴
	
	int deleteJoinMeeting(int hangoutNo, int memNo);
	int updateDownMeetingCount(int hangoutNo);
	
	// 모임 참여 리스트
	
	ArrayList<Join> joinvalue(int hangoutNo);
	
	// 조회순
	
	ArrayList<Meeting> selectViewCountMeetingList(Meeting m);
	
	// 최신순
	
	ArrayList<Meeting> selectViewMeetingList(Meeting m);
	
	// 검색맨
	
	int searchMeetingCount(String key_local, String key_gender, String key_age, String key_catg, int key_count);
	ArrayList<Meeting> searchMeetingList(String key_local, String key_gender, String key_age, String key_catg, int key_count);
	
}
