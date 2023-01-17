package com.vam.mapper;

import java.util.List;

import com.vam.model.LecWishDTO;

public interface LecWishMapper {

	/* 카트 추가 */
	public int addLecWish(LecWishDTO LecWish) throws Exception;
	
	/* 카트 삭제 */
	public int deleteLecWish(int LecWishId);
	
	/* 카트 수량 수정 */
	public int modifyCount(LecWishDTO LecWish);
	
	/* 카트 목록 */
	public List<LecWishDTO> getLecWish(String memberId);	
	
	/* 카트 확인 */
	public LecWishDTO checkLecWish(LecWishDTO LecWish);		
	
	/* 카트 제거(주문) */
	public int deleteOrderLecWish(LecWishDTO dto);	
	
}
