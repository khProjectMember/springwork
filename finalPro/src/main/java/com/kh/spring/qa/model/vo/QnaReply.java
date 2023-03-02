package com.kh.spring.qa.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class QnaReply {
	private int qnaReplyNo;
	private String qnaCatg;
	private String qnaWriter;
	private String qnaContent;
	private int qnaDate;
	private int qnaNo;
}
