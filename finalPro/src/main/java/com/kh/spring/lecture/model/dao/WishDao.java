package com.kh.spring.lecture.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;
import com.kh.spring.lecture.model.vo.Wish;

@Repository("WishDao")
public class WishDao {
	@Autowired
	private SqlSession sqlSession;
	
	public List<Wish> selectWishList(Wish wish) {
		List<Wish> wishList = (List)sqlSession.selectList("wishMapper.selectWishList",wish);
		return wishList;
	}
	
	public List<Wish> selectLecsList(List<Wish> wishList){
		List<Wish> myLecsList;
		myLecsList = sqlSession.selectList("wishMapper.selectLecsList", wishList);
		return myLecsList;
	}
	
	public boolean selectCountInWish(Wish wish) {
		String result=sqlSession.selectOne("wishMapper.selectCountInWish", wish);
		return Boolean.parseBoolean(result);
	}
	public void insertLecsInWish(Wish wish){
		int wishNo=selectMaxWishNo();
		wish.setWishNo(wishNo);
		sqlSession.insert("wishMapper.insertLecsInWish", wish);
	}
	

	public void updateWishLecsQty(Wish wish) {
		sqlSession.insert("wishMapper.updateWishLecsQty",wish);
	}
	
	public void deleteWishLecs(int wishNo) {
		sqlSession.delete("wishMapper.deleteWishLecs",wishNo);
	}
	
	private int selectMaxWishNo() {
		int wishNo = sqlSession.selectOne("wishMapper.selectMaxWishNo");
		return wishNo;
	}
	
}
