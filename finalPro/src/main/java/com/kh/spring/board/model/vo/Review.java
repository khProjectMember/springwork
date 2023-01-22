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
public class Review {
	private int revNo;
	private String revTitle;
	private String revCatg;
	private String revLecture;
	private String revContent;
	private String revDate;
	private int revStar;
	private int revCount;
	private int revRec;
	private int memNo;
	private int lecNo;
	private Member m;
	private Lecture l;
}
