package com.jardin.shop.Dto;

public class PagingDto {
	
	private int page; // 1페이지
	private int perPageNum; //한 페이지당 5개의 게시물
	private int rowStart;
	private int rowEnd;
	
	//생성자
	public PagingDto() {
		this.page = 1;
		this.perPageNum = 5;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 5;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) +1;
		return rowStart;
	}
	
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
	
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}
	
}
