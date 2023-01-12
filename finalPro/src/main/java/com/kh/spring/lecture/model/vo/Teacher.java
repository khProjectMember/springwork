package com.kh.spring.lecture.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Data
public class Teacher {
	private int teaNo;
	private String teaName;
	private int teaAge;
	private String teaInfo;
	private Date teaEdate;
	private String teaStatus;
	private int lecNo;
}
