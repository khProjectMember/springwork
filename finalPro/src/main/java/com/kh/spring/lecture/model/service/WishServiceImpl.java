package com.kh.spring.lecture.model.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.lecture.model.dao.WishDao;
import com.kh.spring.lecture.model.vo.Wish;
import com.kh.spring.member.model.dao.MemberDao;

@Service("wishService")
@Transactional(propagation=Propagation.REQUIRED)
public class WishServiceImpl implements WishService{
	@Autowired
	Wish wish;
	@Autowired
	WishDao wDao;
	@Autowired
	MemberDao mDao;
	
	public Map<String, List> myWishList(Wish wish){
		Map<String,List> wishMap=new HashMap<String, List>();
		List<Wish> myWishList=wDao.selectWishList(wish);
		if(myWishList.size()==0) {
			return null;
		}
		List<Wish> myLecsList=wDao.selectLecsList(myWishList);
		wishMap.put("myWishList", myWishList);
		wishMap.put("myLecsList", myLecsList);
		return wishMap;
	}
	
	public boolean findWishLecs(Wish wish){
		return wDao.selectCountInWish(wish);
	}	
	public void addLecsInWish(Wish wish){
		wDao.insertLecsInWish(wish);
	}
	public boolean modifyWishQty(Wish wish) {
		boolean result=true;
		wDao.updateWishLecsQty(wish);
		return result;
	}
	public void removeWishLecs(int wishNo) {
		wDao.deleteWishLecs(wishNo);
	}
	

}
