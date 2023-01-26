package com.kh.spring.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.ReplyRecommend;
import com.kh.spring.board.model.vo.Review;
import com.kh.spring.board.model.vo.ReviewReply;
import com.kh.spring.board.model.vo.Reviewrecommend;
import com.kh.spring.common.model.vo.PageInfo;

@Repository
public class ReviewDao {
	public int reviewListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.reviewListCount");
	}
	
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList) sqlSession.selectList("reviewMapper.selectReviewList", null, rowBounds);
	}
	
	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("reviewMapper.insertReview", r);
	}
	
	public int incCouont(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.update("reviewMapper.incCount", revNo);
	}
	
	public Review selectReviewDetail(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.selectOne("reviewMapper.selectReviewDetail", revNo);
	}
	
	
	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("reviewMapper.updateReview", r);
	}
	
	public int deleteReview(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.delete("reviewMapper.deleteReview", revNo);
	}
	
	public int insertRecommend(SqlSessionTemplate sqlSession, int revNo, int memNo) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		map.put("revNo", revNo);
		map.put("memNo", memNo);
		return sqlSession.insert("reviewMapper.insertRecommend", map);
	}
	
	public int updateRecommendCount(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.update("reviewMapper.updateRecommendCount", revNo);
	}
	
	public ArrayList<Reviewrecommend> selectRecommend(SqlSessionTemplate sqlSession, int revNo) {
		return (ArrayList) sqlSession.selectList("reviewMapper.Reviewrecommend", revNo);
	}
	
	public ArrayList<Review> selectViewNewDate(SqlSessionTemplate sqlSession, PageInfo pi) {
		return (ArrayList) sqlSession.selectList("reviewMapper.selectViewNewDate", pi);
	}
	
	public ArrayList<Review> selectViewManyDate(SqlSessionTemplate sqlSession, PageInfo pi) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList) sqlSession.selectList("reviewMapper.selectViewManyDate", null, rowBounds);
	}
	
	public ArrayList<Review> selectViewCountDate(SqlSessionTemplate sqlSession, PageInfo pi) {
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		return (ArrayList) sqlSession.selectList("reviewMapper.selectViewCountDate", null, rowBounds);
	}
	
	public int searchCount(SqlSessionTemplate sqlSession, String keyvalue, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("keyvalue", keyvalue);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("reviewMapper.searchCount", map);
	}
	
	public ArrayList<Review> selectSearchReview(SqlSessionTemplate sqlSession, PageInfo pi, String keyvalue, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyvalue", keyvalue);
		map.put("keyword", keyword);
		
		int startNo = (pi.getNowPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(startNo, limit);
		
		return (ArrayList) sqlSession.selectList("reviewMapper.selectSearchReview", map, rowBounds);
	}
	
	public ArrayList<ReviewReply> reviewReplyList(SqlSessionTemplate sqlSession, int revNo) {
		return (ArrayList) sqlSession.selectList("reviewMapper.reviewReplyList", revNo);
	}
	
	public int insertReviewReply(SqlSessionTemplate sqlSession, ReviewReply rr) {
		return sqlSession.insert("reviewMapper.insertReviewReply", rr);
	}
	
	public ArrayList<Reviewrecommend> reviewRecommendRenum(SqlSessionTemplate sqlSession, int revNo) {
		return (ArrayList) sqlSession.selectList("reviewMapper.reviewRecommendRenum", revNo);
	}
	
	public int deleteRecommend (SqlSessionTemplate sqlSession, int revNo, int memNo) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("revNo", revNo);
		map.put("memNo", memNo);
		
		return sqlSession.delete("reviewMapper.deleteRecommend", map);
	}
	
	public int updateRecommendCountDelete(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.update("reviewMapper.updateRecommendCountDelete", revNo);
	}
	
	public int deleteReviewReply(SqlSessionTemplate sqlSession, int revReplyNo) {
		return sqlSession.delete("reviewMapper.deleteReviewReply", revReplyNo);
	}
	
	public int reviewTotalCount(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.selectOne("reviewMapper.reviewTotalCount", revNo);
	}
	
	public ReviewReply selectRevReply(SqlSessionTemplate sqlSession, int revReplyNo) {
		return sqlSession.selectOne("reviewMapper.selectRevReply", revReplyNo);
	}
	
	public ArrayList<ReviewReply> newReviewReplyList(SqlSessionTemplate sqlSession, int revNo) {
		return (ArrayList) sqlSession.selectList("reviewMapper.newReviewReplyList", revNo);
	}
	
	public int insertReplyRecommend(SqlSessionTemplate sqlSession, int revReplyNo, int memNo) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("revReplyNo", revReplyNo);
		map.put("memNo", memNo);
		
		return sqlSession.insert("reviewMapper.insertReplyRecommend", map);
	}
	
	public int updateReplyRecommend(SqlSessionTemplate sqlSession, int revReplyNo) {
		return sqlSession.update("reviewMapper.updateReplyRecommend", revReplyNo);
	}
	
	public ArrayList<ReplyRecommend> replyrecommendList(SqlSessionTemplate sqlSession, int revReplyNo) {
		return (ArrayList) sqlSession.selectList("reviewMapper.replyrecommendList", revReplyNo);
	}
	
	public int deleteReplyRecommend(SqlSessionTemplate sqlSession, int revReplyNo, int memNo) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("revReplyNo", revReplyNo);
		map.put("memNo", memNo);
		
		return sqlSession.delete("reviewMapper.deleteReplyRecommend", map);
	}
	 
	public int updateReplyRecommendDelete(SqlSessionTemplate sqlSession, int revReplyNo) {
		return sqlSession.update("reviewMapper.updateReplyRecommendDelete", revReplyNo);
	}
	
	public int goodTotalCount(SqlSessionTemplate sqlSession, int revReplyNo) {
		return sqlSession.selectOne("reviewMapper.goodTotalCount", revReplyNo);
	}
}

