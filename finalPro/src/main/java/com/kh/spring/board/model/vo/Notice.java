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
public class Notice {
	private int noticeNo;
	private String noticeCatg;
	private String noticeTitle;
	private String noticeContent;
	private String edate;
	private String filename;
	private String changename;
	private String memNo;
	private Member m;
	
}
