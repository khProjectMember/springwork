package com.kh.spring.common.template;

import com.kh.spring.common.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo(int listCount, int nowPage, int pageLimit, int boardLimit) {
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (nowPage-1)/pageLimit*pageLimit+1;
		int endPage = startPage+pageLimit-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		return new PageInfo(listCount, nowPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}
}
