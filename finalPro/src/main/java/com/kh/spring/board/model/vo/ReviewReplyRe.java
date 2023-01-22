package com.kh.spring.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class ReviewReplyRe {
	private int replyReNo;
	private String replyReWriter;
	private String replyReContent;
	private String replyReDate;
	private int revReplyNo;
}
