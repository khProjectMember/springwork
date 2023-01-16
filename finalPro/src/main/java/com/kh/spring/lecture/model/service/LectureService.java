package com.kh.spring.lecture.model.service;

import java.util.ArrayList;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

public interface LectureService {
	public ArrayList<Lecture> lectureList(Lecture l);
	
	//1.게시판 리스트 페이지
	int selectListCount();
	ArrayList<Lecture> selecList(PageInfo pi);
		
	//2.게시글 작성
	int insertLecture(Lecture l);
		
	public ArrayList<Teacher> teacherList(Teacher t);
	/*
	//3.게시글 상세보기
	int increaseCount(int lecNo);
	Lecture selectLecture(int lecNo);
	
	
	//4.게시글 삭제
	int deleteBoard(int lecNo);
	
	//5. 게시글 수정
	int updateBoard(Lecture b);
	
	//6.댓글리스트(Ajax)
	ArrayList<Reply> selectReplyList(int lecNo);
	
	//7.댓글작성(Ajax)
	int insertReply(Reply r);
	
	//8. Top5 조회수 리스트(ajax)
	ArrayList<Lecture> selectTopLectureList();
	*/
}
