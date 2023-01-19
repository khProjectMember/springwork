package com.kh.spring.qa.model.service;

import java.util.ArrayList;

import com.kh.spring.qa.model.vo.Qna;

public interface QnaService {
	int insertQna(Qna q);

	ArrayList<Qna> QnaList(Qna q);
}
