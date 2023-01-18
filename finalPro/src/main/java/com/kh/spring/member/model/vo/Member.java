package com.kh.spring.member.model.vo;

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
public class Member {
	private int memNo;
	private String memName;
	private String memId;
	private String memPw;
	private String memNickname;
	private String memGender;
	private int memBirthday;
	private String memPhone;
	private String memEmail;
	private String memAddress;
	private String memCdate;
	private String memPaper;
	private String isAdmin;
	
}
