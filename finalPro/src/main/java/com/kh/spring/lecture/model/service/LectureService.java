package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

public interface LectureService {
	public ArrayList<Lecture> lectureList(Lecture l);
	public Lecture lectureDetail(Integer lecNo);
	public ArrayList<Lecture> mainOrdNew(Lecture l);
	public ArrayList<Lecture> mainOrdGrade(Lecture l);
	public ArrayList<Notice> mainOrdNotice(Notice n);
	public ArrayList<Notice> mainOrdEvent(Notice n);
	
	
}
