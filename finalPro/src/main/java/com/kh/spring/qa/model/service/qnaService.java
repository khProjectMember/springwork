package com.kh.spring.qa.model.service;

import java.util.ArrayList;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.qa.model.vo.Qna;

public interface qnaService {
	int insertQna(Qna q);
	
	//게시판 리스트 페이지
	int selectListCount();

	public ArrayList<Qna> qnaList(Qna q);
}
