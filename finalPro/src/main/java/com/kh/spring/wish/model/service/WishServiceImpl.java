package com.kh.spring.wish.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.wish.model.dao.WishDao;
import com.kh.spring.wish.model.vo.Wish;

@Service
public class WishServiceImpl implements WishService{
	@Autowired
	Wish wish;
	@Autowired
	WishDao wDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Map<String, List> myWishList(Wish wish) {
		Map<String,List> wishMap=new HashMap<String,List>();
		List<Wish> myWishList=wDao.selectWishList(wish);
		if(myWishList.size()==0){ //카트에 저장된 상품이없는 경우
			return null;
		}
		List<Lecture> myLecsList=wDao.selectLecsList(myWishList);
		wishMap.put("myWishList", myWishList);
		wishMap.put("myLecsList",myLecsList);
		return wishMap;
	}
	
	public boolean findWishLecs(Wish wish){
		return wDao.selectCountInWish(wish);
	}	
	public void addLecsInWish(Wish wish){
		wDao.insertLecsInWish(wish);
	}

	@Override
	public void removeWishLecs(int wishNo) {
		wDao.deleteWishLecs(wishNo);
	}

}
