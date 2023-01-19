package com.kh.spring.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor  // 기본 생성자 생성
@AllArgsConstructor // 매개변수가 있는 생성자
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
	private String memBirthday;
	private String memPhone;
	private String memEmail;
	private String memZipcode;
	private String memAddress;
	private String memDetailAddress;
	private String memCdate;
	private String memDdate;
	private String memPaper;
	private String isAdmin;
	private String memCarno;
	private String memStatus;
}

