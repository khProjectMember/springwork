package com.kh.spring.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.dao.AdminDao;
import com.kh.spring.board.model.vo.Meeting;
import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.LectureLocation;
import com.kh.spring.lecture.model.vo.Teacher;
import com.kh.spring.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount_Lecture() {
		return aDao.selectListCount_Lecture(sqlSession);
	}
	@Override
	public int selectListCount_Teacher() {
		return aDao.selectListCount_Teacher(sqlSession);
	}
	@Override
	public int selectListCount_Member() {
		return aDao.selectListCount_Member(sqlSession);
	}
	@Override
	public int selectListCount_Hangout() {
		return aDao.selectListCount_Hangout(sqlSession);
	}
	@Override
	public int selectListCount_Review() {
		return aDao.selectListCount_Review(sqlSession);
	}
	@Override
	public int selectListCount_Notice() {
		return aDao.selectListCount_Notice(sqlSession);
	}
	
	@Override
	public ArrayList<Lecture> selectLectureList(PageInfo pi) {
		return aDao.selectLectureList(sqlSession, pi);
	}
	@Override
	public ArrayList<Teacher> selectTeacherList(PageInfo pi) {
		return aDao.selectTeacherList(sqlSession, pi);
	}
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return aDao.selectMemberList(sqlSession, pi);
	}
	@Override
	public ArrayList<Meeting> selectHangoutList(PageInfo pi) {
		return aDao.selectHangoutList(sqlSession, pi);
	}
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		return aDao.selectReviewList(sqlSession, pi);
	}
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return aDao.selectNoticeList(sqlSession, pi);
	}


	@Override
	public int insertLecture(Lecture l) {
		return aDao.insertLecture(sqlSession, l);
	}
	@Override
	public int updateLecture(Lecture l) {
		return aDao.updateLecture(sqlSession, l);
	}
	@Override
	public int insertTeacher(Teacher t) {
		return aDao.insertTeacher(sqlSession, t);
	}
	
	
	 
	
	
	//새로운 멤버조회
	@Override
	public ArrayList<Member> selectNewMember() {
		return aDao.selectNewMember(sqlSession);
	}
	@Override
	public int selectNewMemberCount() {
		return aDao.selectNewMemberCount(sqlSession);
	}
	
	//새로운 리뷰 조회
	@Override
	public ArrayList<Review> selectNewReview() {
		return aDao.selectNewReview(sqlSession);
	}
	@Override
	public int selectNewReviewCount() {
		return aDao.selectNewReviewCount(sqlSession);
	}
	
	//리뷰 삭제
	@Override
	public int deleteReview_ad(String revNo) {
		return aDao.deleteReview_ad(sqlSession, revNo);
	}
	//공지 삭제
	@Override
	public int deleteNotice_ad(String noticeNo) {
		return aDao.deleteNotice_ad(sqlSession, noticeNo);
	}
	@Override
	public int deleteMember_ad(String memNo) {
		return aDao.deleteMember_ad(sqlSession, memNo);
	}
	@Override
	public int deleteHangout_ad(String hangoutNo) {
		return aDao.deleteHangout_ad(sqlSession, hangoutNo);
	}
	@Override
	public int deleteTeacher_ad(String teaNo) {
		return aDao.deleteTeacher_ad(sqlSession, teaNo);
	}
	@Override
	public int deleteLecture_ad(String lecNo) {
		return aDao.deleteLecture_ad(sqlSession, lecNo);
	}
	
	
	
	
	
	
	//
	@Override
	public ArrayList<Teacher> selectTeachers(Teacher t) {
		return aDao.selectTeachers(sqlSession, t);
	}
	@Override
	public ArrayList<LectureLocation> selectLocations(LectureLocation l) {
		return aDao.selectLocations(sqlSession, l);
	}
	@Override
	public Lecture selectLecture(Integer lecNo) {
		return aDao.selectLecture(sqlSession, lecNo);
	}
	
	
}