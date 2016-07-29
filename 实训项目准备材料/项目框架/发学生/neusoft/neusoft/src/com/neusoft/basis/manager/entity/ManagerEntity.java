package com.neusoft.basis.manager.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.neusoft.basis.base.EntityPager;

/**
 * Comments:客户实体
 * Created:2015-03-02
 * Author: zhouqiang
 * CopyRight:neusoft
 * @version 1.0
 */

public class ManagerEntity extends EntityPager implements Serializable{
	private static final long serialVersionUID = -966004631895141447L;
	private Integer managerId;
	private String managerName;
	private String managerSex;
	private Integer managerAge;
	private String managerPwd;
	private String createUser;
	private String isDel;
	private Date createTime;
	private String createTimeStr;
	private String lstModifyUser;
	private Date lstModifyTime;
	public Integer getManagerId() {
		return managerId;
	}
	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerSex() {
		return managerSex;
	}
	public void setManagerSex(String managerSex) {
		this.managerSex = managerSex;
	}
	public Integer getManagerAge() {
		return managerAge;
	}
	public void setManagerAge(Integer managerAge) {
		this.managerAge = managerAge;
	}
	public String getManagerPwd() {
		return managerPwd;
	}
	public void setManagerPwd(String managerPwd) {
		this.managerPwd = managerPwd;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getLstModifyUser() {
		return lstModifyUser;
	}
	public void setLstModifyUser(String lstModifyUser) {
		this.lstModifyUser = lstModifyUser;
	}
	public Date getLstModifyTime() {
		return lstModifyTime;
	}
	public void setLstModifyTime(Date lstModifyTime) {
		this.lstModifyTime = lstModifyTime;
	}
	public String getCreateTimeStr() {
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(createTime);
	}
	public void setCreateTimeStr(String createTimeStr) {
		this.createTimeStr = createTimeStr;
	}
}