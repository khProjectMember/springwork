package com.kh.spring.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Review;
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
	
	public int insertRecommend(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.insert("reviewMapper.insertRecommend", revNo);
	}
	
	public int updateRecommendCount(SqlSessionTemplate sqlSession, int revNo) {
		return sqlSession.update("reviewMapper.updateRecommendCount", revNo);
	}
}
