package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;

public interface finalNoticeService {
	// 게시판 리스트 페이지
	
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 게시글 작성 (관리자만)
	
	int insertNotice(Notice n);
	
	// 게시글 상세보기
	
	Notice selectNotice(int noticeNo);
	
	// 공지사항 수정
	
	int updateNotice(Notice n);
	
	
	
}
