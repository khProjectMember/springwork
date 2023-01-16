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
public class LectureLocation {
	private int locNo;
	private String locManager;
	private String locLoc;
	private String locName;
	private int locNumber;
	private String locInfo;
}
