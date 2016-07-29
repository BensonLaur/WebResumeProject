package com.neusoft.basis.user.action;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.base.SessionCtx;
import com.opensymphony.xwork2.ActionContext;

/**
 * Comments:
 * Created:2012-12-17
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class LoginOffAction extends EbAction {

	private static final long serialVersionUID = 2134788842538136539L;

	public String execute() throws Exception{
		ActionContext.getContext().getSession().clear();
		SessionCtx.moveSessionObject(sessionId);
	    return SUCCESS;
	}
}
