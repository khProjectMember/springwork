package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

public interface LectureService {
	public ArrayList<Lecture> lectureList(Lecture l);
	public Lecture lectureDetail(Integer lecNo);
	//1.게시판 리스트 페이지
		int selectListCount_Lecture();
		int selectListCount_Teacher();
		ArrayList<Lecture> selectLectureList(PageInfo pi);
		ArrayList<Teacher> selectTeacherList(PageInfo pi);
			
		//2.게시글 작성
		int insertLecture(Lecture l);
		int insertTeacher(Teacher t);
}
