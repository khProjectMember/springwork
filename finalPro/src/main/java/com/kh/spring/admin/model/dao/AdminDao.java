package com.kh.spring.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Meeting;
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
}