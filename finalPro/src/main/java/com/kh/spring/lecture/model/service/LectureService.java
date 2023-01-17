package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import com.kh.spring.lecture.model.vo.Lecture;

public interface LectureService {
	public ArrayList<Lecture> lectureList(Lecture l);
	public Lecture lectureDetail(int lecNo);
	public ArrayList<Lecture> wishList(int memNo);
}
