package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.MeetingDao;
import com.kh.spring.board.model.vo.Join;
import com.kh.spring.board.model.vo.Meeting;

@Service
public class MeetingServiceImpl implements MeetingService {

	@Autowired
	private MeetingDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectMeetingCount() {		
		return mDao.selectMeetingCount(sqlSession);
	}

	@Override
	public ArrayList<Meeting> selectMeetingList(Meeting m) {
		
		return mDao.selectMeetingList(sqlSession, m);
	}

	@Override
	public int insertMeeting(Meeting m) {
		return mDao.insertMeeting(sqlSession, m);
	}
	
	@Override
	public int insertjoin(int hangoutNo, int memNo) {
		// TODO Auto-generated method stub
		return mDao.insertjoin(sqlSession, hangoutNo, memNo);
	}

	@Override
	public int incCount(int hangoutNo) {
		// TODO Auto-generated method stub
		return mDao.incCount(sqlSession, hangoutNo);
	}

	@Override
	public Meeting selectMeetingDetail(int hangoutNo) {
		// TODO Auto-generated method stub
		return mDao.selectMeetingDetail(sqlSession, hangoutNo);
	}

	@Override
	public int updateMeeting(Meeting m) {
		// TODO Auto-generated method stub
		return mDao.updateMeeting(sqlSession, m);
	}

	@Override
	public int deleteMeeting(int hangoutNo) {
		// TODO Auto-generated method stub
		return mDao.deleteMeeting(sqlSession, hangoutNo);
	}

	@Override
	public int insertJoinMeeting(int hangoutNo, int memNo) {
		// TODO Auto-generated method stub
		return mDao.insertJoinMeeting(sqlSession, hangoutNo, memNo);
	}
	
	@Override
	public int updateMeetingCount(int hangoutNo) {
		// TODO Auto-generated method stub
		return mDao.updateMeetingCount(sqlSession, hangoutNo);
	}

	@Override
	public ArrayList<Meeting> selectViewCountMeetingList(Meeting m) {
		// TODO Auto-generated method stub
		return mDao.selectViewCountMeetingList(sqlSession, m);
	}
	
	@Override
	public ArrayList<Meeting> selectViewMeetingList(Meeting m) {
		// TODO Auto-generated method stub
		return mDao.selectViewMeetingList(sqlSession, m);
	}

	@Override
	public int searchMeetingCount(String key_local, String key_gender, String key_age, String key_catg, int key_count) {
		// TODO Auto-generated method stub
		return mDao.searchMeetingCount(sqlSession, key_local, key_gender, key_age, key_catg, key_count);
	}

	@Override
	public ArrayList<Meeting> searchMeetingList(String key_local, String key_gender, String key_age, String key_catg, int key_count) {
		// TODO Auto-generated method stub
		return mDao.searchMeetingList(sqlSession, key_local, key_gender, key_age, key_catg, key_count);
	}

	@Override
	public ArrayList<Join> joinvalue(int hangoutNo) {
		// TODO Auto-generated method stub
		return mDao.joinvalue(sqlSession, hangoutNo);
	}

	@Override
	public int deleteJoinMeeting(int hangoutNo, int memNo) {
		// TODO Auto-generated method stub
		return mDao.deleteJoinMeeting(sqlSession, hangoutNo, memNo);
	}

	@Override
	public int updateDownMeetingCount(int hangoutNo) {
		// TODO Auto-generated method stub
		return mDao.updateDownMeetingCount(sqlSession, hangoutNo);
	}

	

	

	

}
