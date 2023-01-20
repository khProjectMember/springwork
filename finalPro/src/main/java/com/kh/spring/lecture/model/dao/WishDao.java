package com.kh.spring.lecture.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.lecture.model.vo.Teacher;

@Repository("WishDao")
public class WishDao {
	@Autowired
	private SqlSession sqlSession;
	
	public boolean selectCountInWish(Wish wish) throws DataAccessException{
		String result=sqlSession.selectOne("catMapper.selectCountInWish", wish);
		return Boolean.parseBoolean(result);
	}
	public ovid insertLecsInWish(Wish wish) throws Exception{
		int wish_no=selectMaxWishNo();
		Wish.setWish_no(wish_no);
		sqlSession.insert("cartMapper.insertLecsInWish", Wish);
	}
}
