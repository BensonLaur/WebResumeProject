package com.neusoft.basis.group.entity;

import java.io.Serializable;

/**
 * Comments:
 * Created:2012-12-20
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class GroupItemRelEntity implements Serializable{
	
	private static final long serialVersionUID = 4960412710528336027L;
	
	private Integer groupId;
	private String itemId;
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
}
