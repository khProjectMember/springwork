package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Meeting;

public interface finalMeetingService {
	// 모임 리스트 페이지
	
	int selectMeetingCount();
	ArrayList<Meeting> selectMeetingList(Meeting m);
	
	// 모임 만들기
	
	int insertMeeting(Meeting m);
	int insertjoin(int hangoutNo);
	
	// 모임 조회
	int incCount(int hangoutNo);
	Meeting selectMeetingDetail(int hangoutNo);
	
	// 모임 수정
	
	int updateMeeting(Meeting m);
	
	// 모임 삭제
	
	int deleteMeeting(int hangoutNo);
	
	// 모임 참여
	
	int insertJoinMeeting(int hangoutNo);
	int updateMeetingCount(int hangoutNo);
	
	// 모임 참여 취소
	
	int deleteJoinOutMeeting(int hangoutNo);
	
	// 조회순
	
	ArrayList<Meeting> selectViewCountMeetingList(Meeting m);
}
