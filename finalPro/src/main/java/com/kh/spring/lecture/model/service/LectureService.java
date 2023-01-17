package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;

public interface LectureService {
	public ArrayList<Lecture> lectureList(Lecture l);
	public Lecture lectureDetail(int lecNo);
	//1.게시판 리스트 페이지
		int selectListCount();
		ArrayList<Lecture> selecList(PageInfo pi);
			
		//2.게시글 작성
		int insertLecture(Lecture l);
}
