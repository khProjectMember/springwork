package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

public interface LectureService {
	public ArrayList<Lecture> lectureList(Lecture l);
	public Lecture lectureDetail(int lecNo);
	
}
