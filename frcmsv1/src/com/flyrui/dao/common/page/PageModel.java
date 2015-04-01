package com.flyrui.dao.common.page;

import java.util.ArrayList;
import java.util.List;

public class PageModel {
	private int total = 0;
	private List rows = new ArrayList();
	private int pageSize = 20;
	private int pageIndex = 1;
	private int startIndex = 0;
	private int endIndex = 0;
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
		startIndex = (pageIndex-1)*pageSize+1;
		endIndex = (pageIndex)*pageSize+1;
		if(endIndex>total){
			endIndex = total+1;
		}
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
}
