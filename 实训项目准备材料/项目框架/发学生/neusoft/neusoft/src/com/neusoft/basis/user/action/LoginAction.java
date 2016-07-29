package com.neusoft.basis.user.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.user.entity.UserEntity;
import com.neusoft.basis.user.mapper.UserMapper;

public class LoginAction extends EbAction {
	private static final long serialVersionUID = -2643859073117718850L;

	
	private UserEntity userEntity;
	@Autowired
	private UserMapper userMapper;
	private String checkKey;
	private String checkCode;

	public String execute() throws Exception {
		//UserEntity userEntity = new UserEntity();
		/*if (checkCode == null
				|| !checkCode.equals(ActionContext.getContext().getSession()
						.get(checkKey))) {
			addActionError("验证码错误");
			return INPUT;
		}*/
		try {
			userEntity = userMapper.getUser(userEntity);
			setSession("user", userEntity);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (userEntity == null) {
			addActionError("用户名或密码不正确");
			return INPUT;
		} else {
			return SUCCESS;
		}
	}

	public String input() throws Exception {
		return INPUT;
	}

	public String getCheckKey() {
		return checkKey;
	}

	public void setCheckKey(String checkKey) {
		this.checkKey = checkKey;
	}

	public String getCheckCode() {
		return checkCode;
	}

	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}

	public UserEntity getUserEntity() {
		return userEntity;
	}

	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}

}
