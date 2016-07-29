package com.neusoft.basis.branch.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Comments:
 * Created:2012-12-17
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class BranchEntity implements Serializable{

	private static final long serialVersionUID = 8664388909420491417L;
	
    private String id;
    private String address;
    private String name;
    private String isDel;
	private String insertUserId;
	private Date insertDate; 
	private String lastModifyUserId;
	private Date lastModifyDate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public String getInsertUserId() {
		return insertUserId;
	}
	public void setInsertUserId(String insertUserId) {
		this.insertUserId = insertUserId;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getLastModifyUserId() {
		return lastModifyUserId;
	}
	public void setLastModifyUserId(String lastModifyUserId) {
		this.lastModifyUserId = lastModifyUserId;
	}
	public Date getLastModifyDate() {
		return lastModifyDate;
	}
	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}
}
