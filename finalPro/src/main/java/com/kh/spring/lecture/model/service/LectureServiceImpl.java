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
	
	public Lecture lectureDetail(int lecNo) {
		return lDao.lectureDetail(sqlSession, lecNo);
	}

	@Override
	public ArrayList<Lecture> wishList(int memNo) {
		return lDao.wishList(sqlSession, memNo);
	}
}
