package com.kh.spring.board.model.vo;

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
public class QNA {
	private int qnaNo;
	private String qnaTitle;
	private String qnaContent;
	private int qnaReplyStatus;
	private int qnaStatus;
	private int memNo;
	private String qnaEmail;
	
	private String qnaReply;
}
