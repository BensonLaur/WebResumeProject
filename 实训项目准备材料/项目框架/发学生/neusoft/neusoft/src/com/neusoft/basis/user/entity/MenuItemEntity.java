package com.neusoft.basis.user.entity;

import java.io.Serializable;

/**
 * Comments:
 * Created:2012-12-16
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class MenuItemEntity implements Serializable{
	private static final long serialVersionUID = 138981998523436334L;
	
	private String menuId;
	private String menuName;
	private String itemId;
	private String itemName;
	private String itemUrl;
	private String bean;
	
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemUrl() {
		return itemUrl;
	}
	public void setItemUrl(String itemUrl) {
		this.itemUrl = itemUrl;
	}
	public String getBean() {
		return bean;
	}
	public void setBean(String bean) {
		this.bean = bean;
	}

	
}
