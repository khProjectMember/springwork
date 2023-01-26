package com.kh.spring.board.model.vo;

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
public class ReplyRecommend {
	private int revReplyNo;
	private int memNo;
}
