package com.neusoft.basis.randomnum.action;

import java.io.ByteArrayInputStream;

import com.neusoft.util.RandomNumUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RandomNumAction extends ActionSupport {
	private static final long serialVersionUID = -7193209177116825032L;
	
	private ByteArrayInputStream inputStream;
	private String checkKey;


	public String validNumGenerate() throws Exception {
		RandomNumUtil rdnu = RandomNumUtil.Instance();
		this.setInputStream(rdnu.getImage());// 取得带有随机字符串的图片
		ActionContext.getContext().getSession().put(checkKey, rdnu.getString());// 取得随机字符串放入HttpSession
		return SUCCESS;
	}


	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getCheckKey() {
		return checkKey;
	}

	public void setCheckKey(String checkKey) {
		this.checkKey = checkKey;
	}

	/*public void setInputStream(ByteArrayInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public ByteArrayInputStream getInputStream() {
		return inputStream;
	}

	public String getCheckKey() {
		return checkKey;
	}

	public void setCheckKey(String checkKey) {
		this.checkKey = checkKey;
	}
	*/
	

}
