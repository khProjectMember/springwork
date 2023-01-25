package com.kh.spring.wish.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.spring.wish.model.vo.Wish;

public interface WishService {
	public boolean findWishLecs(Wish wish);
	public void addLecsInWish(Wish wish);
	public Map<String, List> myWishList(Wish wish);
	public void removeWishLecs(int wishNo);
}
