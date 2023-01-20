package com.kh.spring.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.dao.AdminDao;
import com.kh.spring.board.model.vo.Meeting;
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;
import com.kh.spring.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount_Lecture() {
		return aDao.selectListCount_Lecture(sqlSession);
	}
	@Override
	public int selectListCount_Teacher() {
		return aDao.selectListCount_Teacher(sqlSession);
	}
	@Override
	public int selectListCount_Member() {
		return aDao.selectListCount_Member(sqlSession);
	}
	@Override
	public int selectListCount_Hangout() {
		return aDao.selectListCount_Hangout(sqlSession);
	}
	
	

	@Override
	public ArrayList<Lecture> selectLectureList(PageInfo pi) {
		return aDao.selectLectureList(sqlSession, pi);
	}
	@Override
	public ArrayList<Teacher> selectTeacherList(PageInfo pi) {
		return aDao.selectTeacherList(sqlSession, pi);
	}
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return aDao.selectMemberList(sqlSession, pi);
	}
	@Override
	public ArrayList<Meeting> selectHangoutList(PageInfo pi) {
		return aDao.selectHangoutList(sqlSession, pi);
	}
	

	@Override
	public int insertLecture(Lecture l) {
		return aDao.insertLecture(sqlSession, l);
	}
	@Override
	public int insertTeacher(Teacher t) {
		return aDao.insertTeacher(sqlSession, t);
	}
	
	//새로운 멤버조회
	public ArrayList<Member> selectNewMember() {
		return aDao.selectNewMember(sqlSession);
	}

	public int selectNewMemberCount() {
		return aDao.selectNewMemberCount(sqlSession);
	}

}