package com.kh.spring.lecture.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.lecture.model.dao.LectureDao;
import com.kh.spring.lecture.model.vo.Lecture;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Autowired
	private LectureDao lDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Lecture> lectureList(Lecture l){
		return lDao.lectureList(sqlSession, l);
	}
	/*
	@Override
	public int selectListCount() {
		return lDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Lecture> selecList(PageInfo pi) {
		return lDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertLecture(Lecture l) {
		return lDao.insertBoard(sqlSession, l);
	}

	@Override
	public int increaseCount(int LecNo) {
		return lDao.increaseCount(sqlSession,LecNo);
	}

	@Override
	public Lecture selectLecture(int LecNo) {
		return lDao.selectLecture(sqlSession, LecNo);
	}

	@Override
	public int deleteLecture(int lecNo) {
		return lDao.deleteLecture(sqlSession, lecNo);
	}

	@Override
	public int updateLecture(lec b) {
		return lDao.updateLecture(sqlSession, l);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int lecNo) {
		return lDao.selectReplyList(sqlSession, lecNo);
	}

	@Override
	public int insertReply(Reply r) {
		return lDao.insertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Board> selectTopLectureList() {
		return lDao.selectTopLectureList(sqlSession);
	}
	*/
}
