package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.MeetingDao;
import com.kh.spring.board.model.vo.Meeting;

@Service
public class finalMeetingServiceImpl implements finalMeetingService {

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
	public int insertjoin(int hangoutNo) {
		// TODO Auto-generated method stub
		return mDao.insertjoin(sqlSession, hangoutNo);
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
	public int insertJoinMeeting(int hangoutNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteJoinOutMeeting(int hangoutNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
