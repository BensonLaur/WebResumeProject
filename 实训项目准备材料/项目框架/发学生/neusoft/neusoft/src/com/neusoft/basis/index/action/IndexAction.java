package com.neusoft.basis.index.action;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.base.SessionCtx;

/**
 * Comments:
 * Created:2012-12-17
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class IndexAction extends EbAction {

	private static final long serialVersionUID = -7922737970715581645L;

	private Integer clientVisitCount;
	private Integer notClientVisitCount;
	private Integer userVisitCount;
	private Integer curUserCount;
	
	public String execute() throws Exception {
		clientVisitCount = 0;
		notClientVisitCount = 0;
		userVisitCount = 0;
		curUserCount = SessionCtx.getSessionCount();
		return SUCCESS;
	}

	public String input() throws Exception {
		return INPUT;
	}
	
	public Integer getClientVisitCount() {
		return clientVisitCount;
	}
	public void setClientVisitCount(Integer clientVisitCount) {
		this.clientVisitCount = clientVisitCount;
	}
	public Integer getNotClientVisitCount() {
		return notClientVisitCount;
	}
	public void setNotClientVisitCount(Integer notClientVisitCount) {
		this.notClientVisitCount = notClientVisitCount;
	}
	public Integer getUserVisitCount() {
		return userVisitCount;
	}
	public void setUserVisitCount(Integer userVisitCount) {
		this.userVisitCount = userVisitCount;
	}

	public Integer getCurUserCount() {
		return curUserCount;
	}

	public void setCurUserCount(Integer curUserCount) {
		this.curUserCount = curUserCount;
	}
	
}
