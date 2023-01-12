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
public class Lecture {
	private int lecNo;
	private String lecName;
	private String lecSdate;
	private String lecEdate;
	private String lecInfo;
	private String lecStime;
	private String lecEtime;
	private int lecCount;
	private String lecFilename;
	private String lecBcatg;
	private String lecScatg;
	private int lecPrice;
	private int lecGrade;
	private int lecJnum;
	private int lecCnum;
	private int memNo;
	private int teaNo;
	private int locNo;

	private Teacher teacher;
}
