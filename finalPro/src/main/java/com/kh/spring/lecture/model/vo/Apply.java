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
	private int applyNo;
	private int memNo;
	private int lecNo;
	private int applyCount;
}