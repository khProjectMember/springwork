package com.kh.spring.lecture.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.lecture.model.vo.LecWishDTO;

@Service
public class LecWishServiceImpl implements LecWishService {

	@Override
	public int addLecWish(LecWishDTO LecWish) {

		// 장바구니 데이터 체크
		LecWishDTO checkLecWish = LecWishMapper.checkLecWish(LecWish);
		
		if(checkLecWish != null) {
			return 2;
		}
		
		// 장바구니 등록 & 에러 시 0반환
		try {
			return LecWishMapper.addLecWish(LecWish);
		} catch (Exception e) {
			return 0;
		}		
		
	}

	@Override
	public List<LecWishDTO> getLecWishList(String memberId) {
		
		List<LecWishDTO> LecWish = LecWishMapper.getLecWish(memberId);
		
		for(LecWishDTO dto : LecWish) {
			
			/* 종합 정보 초기화 */
			dto.initSaleTotal();
			
			/* 이미지 정보 얻기 */
			int bookId = dto.getBookId();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(bookId);
			
			dto.setImageList(imageList);
		}
		
		return LecWish;
		
	}
	
	@Override
	public int modifyCount(LecWishDTO LecWish) {
		
		return LecWishMapper.modifyCount(LecWish);
	}	
	
	@Override
	public int deleteLecWish(int LecWishId) {

		return LecWishMapper.deleteLecWish(LecWishId);
	}	
	
	
}
