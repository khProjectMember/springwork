package com.kh.spring.lecture.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

@Repository
public class LectureDao {
	public ArrayList<Lecture> lectureList(SqlSessionTemplate sqlSession, Lecture l){
		return (ArrayList)sqlSession.selectList("lectureMapper.lectureList",l);
	}

	public Lecture lectureDetail(SqlSessionTemplate sqlSession, Integer LecNo) {
		return (Lecture)sqlSession.selectOne("lectureMapper.lectureDetail", LecNo);
	}
	
	
	
	
	
	/*
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.selectListCount");
	}
	
	public ArrayList<Lecture> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int startNo = (pi.getNowPage()-1) * pi.getLectureLimit();
		int limit = pi.getLectureLimit(); 
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("lectureMapper.selectList",null,rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int lecNo) {
		return sqlSession.update("lectureMapper.increaseCount", lecNo);
	}
	
	public Lecture selectLecture(SqlSessionTemplate sqlSession, int lecNo) {
		return sqlSession.selectOne("lectureMapper.selectLecture",lecNo);
	}
	
	public int insertLecture(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.insert("lectureMapper.insertLecture",l);
	}
	public int deleteLecture(SqlSessionTemplate sqlSession, int lecNo) {
		return sqlSession.update("lectureMapper.deleteLecture", lecNo);
	}
	public int updateLecture(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.update("lectureMapper.updateLecture", l);
	}
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int lecNo) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectReplyList", lecNo);
	}
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("lectureMapper.insertReply", r);
	}
	public ArrayList<Lecture> selectTopLectureList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("lectureMapper.selectTopLectureList");
	}
	
	*/
}
