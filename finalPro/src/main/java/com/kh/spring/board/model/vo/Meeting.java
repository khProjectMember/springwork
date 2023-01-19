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
public class Meeting {
	private int hangoutNo;
	private String hangoutTitle;
	private String hangoutContent;
	private String hangoutLocal;
	private String hangoutGender;
	private String hangoutAge;
	private String hangoutCatg;
	private String hangoutEdate;
	private String hangoutStatus;
	private int hangoutJoinCount;
	private int hangoutNowCount;
	private int hangoutViewCount;
	private int memNo;
	private Member m;
}
