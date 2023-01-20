package com.kh.spring.lecture.model.service;

import java.awt.List;
import java.util.Map;

import com.kh.spring.lecture.model.vo.Wish;

public interface WishService {
	
	public Map<String, java.util.List> myWishList(Wish wish);
	public boolean findWishLecs(Wish wish);
	public void addLecsInWish(Wish wish);
	public boolean modifyWishQty(Wish wish);
	public void removeWishLecs(int wishNo);
}
