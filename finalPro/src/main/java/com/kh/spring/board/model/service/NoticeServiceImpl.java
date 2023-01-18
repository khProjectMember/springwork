package com.kh.spring.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.board.model.dao.NoticeDao;
import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;


@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {

		return nDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		
		return nDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {

		return nDao.insertNotice(sqlSession, n);
	}

	@Override
	public Notice selectNotice(int noticeNo) {		
		return nDao.selectNotice(sqlSession, noticeNo);
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return nDao.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return nDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	public ArrayList<Notice> selectListVersion(Notice n) {
		// TODO Auto-generated method stub
		return nDao.selectListVersion(sqlSession, n);
	}
	
	@Override
	public int searchCount(String keyvalue, String keyword) {
		
		return  nDao.searchCount(sqlSession, keyvalue, keyword);
	}

	@Override
	public ArrayList<Notice> selectSearchList(PageInfo pi, String keyvalue, String keyword) {
		
		return nDao.selectSearchList(sqlSession, pi, keyvalue, keyword);
	}

	@Override
	public ArrayList<Notice> selectSearchListVersion(String keyvalue, String keyword) {
		// TODO Auto-generated method stub
		return nDao.selectSearchListVersion(sqlSession, keyvalue, keyword);
	}
}
