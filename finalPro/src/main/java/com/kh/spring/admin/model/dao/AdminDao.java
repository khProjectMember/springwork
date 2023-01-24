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
import com.kh.spring.lecture.model.vo.Teacher;
import com.kh.spring.member.model.vo.Member;

@Repository
public class AdminDao {
	public int insertLecture(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.insert("adminMapper.insertLecture",l);
	}
	public int insertTeacher(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.insert("adminMapper.insertTeacher",t);
	}
	
	
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
	
//	리뷰삭제
	public int deleteReview_ad(SqlSessionTemplate sqlSession, String RevNo) {
		return sqlSession.update("adminMapper.deleteReview_ad", RevNo);
	}
	public int deleteNotice_ad(SqlSessionTemplate sqlSession, String noticeNo) {
		return sqlSession.update("adminMapper.deleteNotice_ad", noticeNo);
	}
}