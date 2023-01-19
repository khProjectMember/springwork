package com.kh.spring.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;

@Repository
public class NoticeDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
		
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList) sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.delete("noticeMapper.deleteNotice", noticeNo);
	}
	
	public ArrayList<Notice> selectListVersion(SqlSessionTemplate sqlSession, Notice n) {
		return (ArrayList) sqlSession.selectList("noticeMapper.selectListVersion", n);
	}
	
	public int searchCount(SqlSessionTemplate sqlSession, String keyvalue, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyvalue", keyvalue);
		map.put("keyword", keyword);
		int a = sqlSession.selectOne("noticeMapper.searchCount", map);
		System.out.println(a);
		return a;
	}
	
	public ArrayList<Notice> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String keyvalue, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyvalue", keyvalue);
		map.put("keyword", keyword);
		
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		
		return (ArrayList) sqlSession.selectList("noticeMapper.selectSearchList", map, rowBounds);
	}
	
	public ArrayList<Notice> selectSearchListVersion(SqlSessionTemplate sqlSession, String keyvalue, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyvalue", keyvalue);
		map.put("keyword", keyword);
		
		return (ArrayList) sqlSession.selectList("noticeMapper.selectSearchListVersion", map);
	}
	
}
