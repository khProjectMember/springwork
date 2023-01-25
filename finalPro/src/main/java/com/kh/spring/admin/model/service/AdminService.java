package com.kh.spring.admin.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Meeting;
import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.LectureLocation;
import com.kh.spring.lecture.model.vo.Teacher;
import com.kh.spring.member.model.vo.Member;

public interface AdminService {
	// 리스트 페이지
	int selectListCount_Lecture();
	int selectListCount_Teacher();
	int selectListCount_Member();
	int selectListCount_Hangout();
	int selectListCount_Review();
	int selectListCount_Notice();
	ArrayList<Lecture> selectLectureList(PageInfo pi);
	ArrayList<Teacher> selectTeacherList(PageInfo pi);
	ArrayList<Member> selectMemberList(PageInfo pi);
	ArrayList<Meeting> selectHangoutList(PageInfo pi);
	ArrayList<Review> selectReviewList(PageInfo pi);
	ArrayList<Notice> selectNoticeList(PageInfo pi);
				
	//2. 정보 등록 부분
	int insertLecture(Lecture l);
	int updateLecture(Lecture l);
	int insertTeacher(Teacher t);
	
	
	
	int deleteReview_ad(String revNo);
	int deleteNotice_ad(String noticeNo);
	int deleteMember_ad(String memNo);
	int deleteHangout_ad(String hangoutNo);
	int deleteTeacher_ad(String teaNo);
	int deleteLecture_ad(String lecNo);
	
	
	int selectNewMemberCount();
	int selectNewReviewCount();
	ArrayList<Member> selectNewMember();
	ArrayList<Review> selectNewReview();
	
	ArrayList<Teacher> selectTeachers(Teacher t);
	ArrayList<LectureLocation> selectLocations(LectureLocation l);
	Lecture selectLecture(Integer lecNo);
	
	
	
	
	
	
	
	
	

	
	
	
}