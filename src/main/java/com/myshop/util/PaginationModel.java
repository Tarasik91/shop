package com.myshop.util;

import java.util.List;

public class PaginationModel<T> {

	private List<T> list;
	private int count;
	private int page;
	private int minPageNumber;
	private int maxPageNumber;
	private int lastPageNumber;
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getMinPageNumber() {
		return minPageNumber;
	}
	public void setMinPageNumber(int minPageNumber) {
		this.minPageNumber = minPageNumber;
	}
	public int getMaxPageNumber() {
		return maxPageNumber;
	}
	public void setMaxPageNumber(int maxPageNumber) {
		this.maxPageNumber = maxPageNumber;
	}
	public int getLastPageNumber() {
		return lastPageNumber;
	}
	public void setLastPageNumber(int lastPageNumber) {
		this.lastPageNumber = lastPageNumber;
	}

}
