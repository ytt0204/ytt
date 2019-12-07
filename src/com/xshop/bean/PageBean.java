package com.xshop.bean;

import java.io.Serializable;

public class PageBean implements Serializable{
	private int currentpage;
	private int pagesize;
	private int pagecount;
	private int rowcount;
	
	public PageBean() {
		super();
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getRowcount() {
		return rowcount;
	}

	public void setRowcount(int rowcount) {
		this.rowcount = rowcount;
	}

	public int getPagecount() {
		pagecount=rowcount%pagesize==0?rowcount/pagesize:rowcount/pagesize+1;
		return pagecount;
	}

/*	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}*/
	
	

}
