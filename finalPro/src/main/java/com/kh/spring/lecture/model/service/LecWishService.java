package com.kh.spring.lecture.model.service;

import java.util.List;

import com.kh.spring.lecture.model.vo.LecWishDTO;
import com.vam.model.LecWishDTO;

public interface LecWishService {
	
	/* 장바구니 추가 */
	public int addLecWish(LecWishDTO LecWish);	
	
	/* 장바구니 정보 리스트 */
	public List<LecWishDTO> getLecWishList(String memberId);	
	
	/* 카트 수량 수정 */
	public int modifyCount(LecWishDTO LecWish);		
	
	/* 카트 삭제 */
	public int deleteLecWish(int LecWishId);	

}
