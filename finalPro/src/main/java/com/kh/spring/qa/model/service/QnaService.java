package com.kh.spring.qa.model.service;

import java.util.ArrayList;


import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.qa.model.vo.Qna;

public interface QnaService {
	int insertQna(Qna q);

	ArrayList<Qna> QnaList(Qna q);

	
	//寃뚯떆�뙋 由ъ뒪�듃 �럹�씠吏�
	int selectListCount();

	public ArrayList<Qna> qnaList(Qna q);

	/*
	 * Qna selectqnaDetail(int qnaNo);
	 */
	public Qna QnaDetail(Integer qnaNo);

	

	/*
	 * ArrayList<com.kh.spring.qa.model.vo.QnaReply> QnaReplyList(int qnaNo);
	 */
	void updateQna(Qna q);
	/*
	 * int deleteQna(int qnaNo);
	 */


	public ArrayList<Qna> qnalistfir();
	

	




	

	

	
	
	// 由ы뵆
	

}
