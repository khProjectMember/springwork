package com.kh.spring.member.model.vo;

import java.sql.Date;

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
public class Email {
	private String memName;
	private String memEmail;
	
}
