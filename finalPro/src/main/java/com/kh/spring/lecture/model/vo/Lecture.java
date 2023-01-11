package com.kh.spring.lecture.model.vo;

import java.util.Date;

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
public class Lecture {
	private int lec_no;
	private String lec_name;
	private Date lec_sdate;
	private Date lec_edate;
	private String lec_info;
	private String lec_stime;
	private String lec_etime;
	private int lec_count;
	private String lec_file;
	private String lec_bcatg;
	private String lec_scatg;
	private int lec_price;
	private int lec_grade;
	private int lec_jnum;	//접수인원
	private int lec_cnum;	//수강인원
	private int member_no;
	private int tea_no;
	private int loc_no;
}
