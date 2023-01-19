package com.kh.spring.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.QNA;
import com.kh.spring.board.model.vo.Reply;
import com.kh.spring.common.model.vo.PageInfo;

@Repository
public class BoardDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit(); 
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList",null,rowBounds);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.increaseCount", boardNo);
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("noticeMapper.selectBoard",boardNo);
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("noticeMapper.insertBoard",b);
	}
	public int deleteBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.deleteBoard", boardNo);
	}
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("noticeMapper.updateBoard", b);
	}
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", boardNo);
	}
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("noticeMapper.insertReply", r);
	}
	public ArrayList<Board> selectTopBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectTopBoardList");
	}

	public ArrayList<QNA> selectQNAList(SqlSessionTemplate sqlSession, QNA q) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectQNAList", q);
	}
}
