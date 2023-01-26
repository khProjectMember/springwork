package com.kh.spring.board.model.vo;

import com.kh.spring.lecture.model.vo.Lecture;
import com.kh.spring.member.model.vo.Member;

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
public class ReviewReply {
	private int revReplyNo;
	private String revReplyWriter;
	private String revReplyContent;
	private String revReplyDate;
	private int revNo;
	private int revReplyGcount;
}
