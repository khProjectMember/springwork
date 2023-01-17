package com.kh.spring.lecture.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.dao.LectureDao;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

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
	
	public Lecture lectureDetail(int lecNo) {
		return lDao.lectureDetail(sqlSession, lecNo);
	}
	
	
	@Override
	public int selectListCount_Lecture() {
		return lDao.selectListCount_Lecture(sqlSession);
	}
	@Override
	public int selectListCount_Teacher() {
		return lDao.selectListCount_Teacher(sqlSession);
	}
	
	

	@Override
	public ArrayList<Lecture> selectLectureList(PageInfo pi) {
		return lDao.selectLectureList(sqlSession, pi);
	}
	@Override
	public ArrayList<Teacher> selectTeacherList(PageInfo pi) {
		return lDao.selectTeacherList(sqlSession, pi);
	}

	@Override
	public int insertLecture(Lecture l) {
		return lDao.insertLecture(sqlSession, l);
	}
	@Override
	public int insertTeacher(Teacher t) {
		return lDao.insertTeacher(sqlSession, t);
	}


}
