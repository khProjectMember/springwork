package com.kh.spring.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Meeting;
import com.kh.spring.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Repository
public class MeetingDao {
	
	public int selectMeetingCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meetingMapper.selectMeetingCount");
	}
	
	public ArrayList<Meeting> selectMeetingList(SqlSessionTemplate sqlSession, Meeting m) {
		return (ArrayList) sqlSession.selectList("meetingMapper.selectMeetingList", m);
	}
	
	public int insertMeeting(SqlSessionTemplate sqlSession, Meeting m) {
		return sqlSession.insert("meetingMapper.insertMeeting", m);
	}
	
	public int insertjoin(SqlSessionTemplate sqlSession, int hangoutNo) {
		return sqlSession.insert("meetingMapper.insertjoin", hangoutNo);
	}
	
	public int incCount(SqlSessionTemplate sqlSession, int hangoutNo) {
		return sqlSession.insert("meetingMapper.incCount", hangoutNo);
	}
	
	public Meeting selectMeetingDetail(SqlSessionTemplate sqlSession, int hangoutNo) {
		return sqlSession.selectOne("meetingMapper.selectMeetingDetail", hangoutNo);
	}
	
	public int updateMeeting(SqlSessionTemplate sqlSession, Meeting m) {
		return sqlSession.update("meetingMapper.updateMeeting", m);
	}
	
	public int deleteMeeting(SqlSessionTemplate sqlSession, int hangoutNo) {
		return sqlSession.delete("meetingMapper.deleteMeeting", hangoutNo);
	}
	
	public int insertJoinMeeting(SqlSessionTemplate sqlSession, int hangoutNo) {
		return sqlSession.insert("meetingMapper.insertJoinMeeting", hangoutNo);
	}
	
	public int updateMeetingCount(SqlSessionTemplate sqlSession, int hangoutNo) {
		return sqlSession.update("meetingMapper.updateMeetingCount", hangoutNo);
	}
	
	public ArrayList<Meeting> selectViewCountMeetingList(SqlSessionTemplate sqlSession, Meeting m) {
		return (ArrayList) sqlSession.selectList("meetingMapper.selectViewCountMeetingList", m);
	}
	
	public ArrayList<Meeting> selectViewMeetingList(SqlSessionTemplate sqlSession, Meeting m) {
		return (ArrayList) sqlSession.selectList("meetingMapper.selectViewMeetingList", m);
	}
	
	public int searchMeetingCount(SqlSessionTemplate sqlSession, String key_local, String key_gender, String key_age, String key_catg, int key_count) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("key_local", key_local);
		map.put("key_gender", key_gender);
		map.put("key_age", key_age);
		map.put("key_catg", key_catg);
		map.put("key_count", key_count);
		
		return sqlSession.selectOne("meetingMapper.searchMeetingCount", map);
	}
	
	public ArrayList<Meeting> searchMeetingList(SqlSessionTemplate sqlSession, String key_local, String key_gender, String key_age, String key_catg, int key_count) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("key_local", key_local);
		map.put("key_gender", key_gender);
		map.put("key_age", key_age);
		map.put("key_catg", key_catg);
		map.put("key_count", key_count);
		
		return (ArrayList) sqlSession.selectList("meetingMapper.searchMeetingList", map);
	}
}