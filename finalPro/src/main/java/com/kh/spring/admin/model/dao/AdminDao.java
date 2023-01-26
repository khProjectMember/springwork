package com.kh.spring.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Meeting;
import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.LectureLocation;
import com.kh.spring.lecture.model.vo.Teacher;
import com.kh.spring.member.model.vo.Member;

@Repository
public class AdminDao {
	public int insertLecture(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.insert("adminMapper.insertLecture",l);
	}
	public int updateLecture(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.update("adminMapper.updateLecture",l);
	}
	public int insertTeacher(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.insert("adminMapper.insertTeacher",t);
	}
	/*
	 * public int selectLecture(SqlSessionTemplate sqlSession, Lecture l) { return
	 * sqlSession.selectOne("adminMapper.selectLecture",l); }
	 */
	
	
	public int selectListCount_Lecture(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount_Lecture");
	}
	public int selectListCount_Teacher(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount_Teacher");
	}
	public int selectListCount_Member(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount_Member");
	}
	public int selectListCount_Hangout(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount_Hangout");
	}
	public int selectListCount_Review(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount_Review");
	}
	public int selectListCount_Notice(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount_Notice");
	}
	
	public ArrayList<Lecture> selectLectureList(SqlSessionTemplate sqlSession, PageInfo pi){
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectLectureList",null,rowBounds);
	}
	public ArrayList<Teacher> selectTeacherList(SqlSessionTemplate sqlSession, PageInfo pi){
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectTeacherList",null,rowBounds);
	}
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi){
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList",null,rowBounds);
	}
	public ArrayList<Meeting> selectHangoutList(SqlSessionTemplate sqlSession, PageInfo pi){
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectHangoutList",null,rowBounds);
	}
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi){
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectReviewList",null,rowBounds);
	}
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi){
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList",null,rowBounds);
	}
	
	
	
	//새 회원
	public ArrayList<Member> selectNewMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNewMember");
	}

	public int selectNewMemberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectNewMemberCount");
	}
	//새 리뷰
	public ArrayList<Review> selectNewReview(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectNewReview");
	}

	public int selectNewReviewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectNewReviewCount");
	}
	
//	삭제
	public int deleteReview_ad(SqlSessionTemplate sqlSession, String revNo) {
		return sqlSession.delete("adminMapper.deleteReview_ad", revNo);
	}
	public int deleteNotice_ad(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.delete("adminMapper.deleteNotice_ad", noticeNo);
	}
	public int deleteMember_ad(SqlSessionTemplate sqlSession, String memNo) {
		return sqlSession.update("adminMapper.deleteMember_ad", memNo);
	}
	public int deleteHangout_ad(SqlSessionTemplate sqlSession, String hangoutNo) {
		return sqlSession.update("adminMapper.deleteHangout_ad", hangoutNo);
	}
	public int deleteTeacher_ad(SqlSessionTemplate sqlSession, String teaNo) {
		return sqlSession.update("adminMapper.deleteTeacher_ad", teaNo);
	}
	public int deleteLecture_ad(SqlSessionTemplate sqlSession, String lecNo) {
		return sqlSession.delete("adminMapper.deleteLecture_ad", lecNo);
	}
	
	
//강의정보 내용 추가
	public ArrayList<Teacher> selectTeachers(SqlSessionTemplate sqlSession, Teacher t) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectTeachers", t);
	}
	public ArrayList<LectureLocation> selectLocations(SqlSessionTemplate sqlSession, LectureLocation l) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectLocations", l);
	}
	public ArrayList<Lecture> selectLecture(SqlSessionTemplate sqlSession, Lecture l) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectLecture", l);
	}
	public Lecture selectLecture(SqlSessionTemplate sqlSession, Integer lecNo) {
		return sqlSession.selectOne("adminMapper.selectLecture",lecNo);
	}
	
	
	
}