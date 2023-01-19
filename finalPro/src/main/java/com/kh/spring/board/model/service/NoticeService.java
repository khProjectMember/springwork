package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Notice;
import com.kh.spring.common.model.vo.PageInfo;

public interface NoticeService {
	// 게시판 리스트 페이지
	
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 게시글 작성 (관리자만)
	
	int insertNotice(Notice n);
	
	// 게시글 상세보기
	
	Notice selectNotice(int noticeNo);
	
	// 공지사항 수정
	
	int updateNotice(Notice n);
	
	// 공지사항 삭제
	
	int deleteNotice(int noticeNo);
	
	// 게시판 조회 리스트 가져오기
	
	ArrayList<Notice> selectListVersion(Notice n);
	
	// 검색 한 것 조회하는거
	
	int searchCount(String keyvalue, String keyword);
	ArrayList<Notice> selectSearchList(PageInfo pi, String keyvalue, String keyword);
	
	// 게시판 조회 리스트 검색한 것 가져오기
	
	ArrayList<Notice> selectSearchListVersion(String keyvalue, String keyword);	
}
