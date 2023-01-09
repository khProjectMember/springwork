package com.kh.spring.lecture.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Apply {
	private int signup_no;
	private int mem_no;
	private int lec_no;
	private String signup_status;
}