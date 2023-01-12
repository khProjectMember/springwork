package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import com.kh.spring.lecture.model.vo.Lecture;

public interface LectureService {
	public ArrayList<Lecture> lectureList(Lecture l);
}
