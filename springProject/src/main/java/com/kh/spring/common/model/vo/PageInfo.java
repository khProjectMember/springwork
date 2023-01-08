package com.kh.spring.common.model.vo;

public class PageInfo {
	private int listCount; 	// 총 게시글의 수
	private int nowPage;	// 현재페이지(요청한 페이지)
	private int pageLimit;	// 하단에 보여질 페이징바의 페이지 목록 최대 개수
	private int boardLimit;	// 1페이지에 보여줄 게시글의 수
	
	private int maxPage;	// 가장 마지막 페이지수
	private int startPage;	// 해당 페이지에 보여질 페이징바의 시작값
	private int endpage;	// 해당 페이지에 보여질 페이징바의 마지막값
	
	public PageInfo() {
	}

	public PageInfo(int listCount, int nowPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endpage) {
		super();
		this.listCount = listCount;
		this.nowPage = nowPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endpage = endpage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndpage() {
		return endpage;
	}

	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}

	@Override
	public String toString() {
		return "Pageinfo [listCount=" + listCount + ", nowPage=" + nowPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endpage="
				+ endpage + "]";
	}
	
	
}
