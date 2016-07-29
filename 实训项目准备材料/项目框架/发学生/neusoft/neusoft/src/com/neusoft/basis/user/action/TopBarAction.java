package com.neusoft.basis.user.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.user.entity.UserEntity;

/**
 * Comments:User Login
 * Created:2012-06-19 
 * Author: zhang shengbo
 */
public class TopBarAction extends EbAction {
	
	private static final long serialVersionUID = 6198497260013463519L;

	private String message;
	private String userId;
	public String execute() throws Exception{
		message = "欢迎您，" + ((UserEntity)(getSession().get("user"))).getName() + "&nbsp;&nbsp;&nbsp;本次登录时间：" + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		userId = ((UserEntity)(getSession().get("user"))).getId();
		return SUCCESS;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
