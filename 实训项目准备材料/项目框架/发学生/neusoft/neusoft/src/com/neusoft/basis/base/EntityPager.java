package com.neusoft.basis.base;

/**
 * Comments:
 * Created:2013-1-2
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class EntityPager{
	
	protected Integer pageNo;
	protected Integer pageSize;
	protected Integer pageStart;
	
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageStart() {
		return (pageNo - 1)*pageSize;
	}
	public void setPageStart(Integer pageStart) {
		this.pageStart = pageStart;
	}
	
	
	
	

}
