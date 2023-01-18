package com.kh.spring.admin.model.service;

import java.util.ArrayList;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

public interface AdminService {
	// 리스트 페이지
	int selectListCount_Lecture();
	int selectListCount_Teacher();
	ArrayList<Lecture> selectLectureList(PageInfo pi);
	ArrayList<Teacher> selectTeacherList(PageInfo pi);
				
	//2. 정보 등록 부분
	int insertLecture(Lecture l);
	int insertTeacher(Teacher t);
}
