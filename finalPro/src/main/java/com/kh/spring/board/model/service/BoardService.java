package com.kh.spring.board.model.service;

import java.util.ArrayList;

import com.kh.spring.board.model.vo.Board;
import com.kh.spring.board.model.vo.Reply;
import com.kh.spring.common.model.vo.PageInfo;

public interface BoardService {
	//1.게시판 리스트 페이지
	int selectListCount();
	ArrayList<Board> selecList(PageInfo	pi);
	
	//2.게시글 작성
	int insertBoard(Board b);
	
	//3.게시글 상세보기
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	
	//4.게시글 삭제
	int deleteBoard(int boardNo);
	
	//5. 게시글 수정
	int updateBoard(Board b);
	
	//6.댓글리스트(Ajax)
	ArrayList<Reply> selectReplyList(int boardNo);
	
	//7.댓글작성(Ajax)
	int insertReply(Reply r);
	
	//8. Top5 조회수 리스트(ajax)
	ArrayList<Board> selectTopBoardList();
	
}
