package com.neusoft.comon.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.neusoft.basis.base.SessionCtx;
import com.neusoft.basis.base.SessionObject;
import com.neusoft.comon.init.PropertiesUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 用户登录拦截器
 * 
 * @author 张生波
 * 
 * 
 */
public class AuthenticationInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -245046643667963973L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request =  ServletActionContext.getRequest();
		String sessionId = request.getParameter("sessionId");
		if(sessionId == null){
			sessionId = (String) (ActionContext.getContext().getParameters()).get("sessionId");
		}
		if (sessionId == null) {
			ActionSupport action = (ActionSupport) invocation.getAction();
			action.addActionError("您还没有登录，请先登录!");
			return Action.LOGIN;
		} else {
			// 如果用户已经登录,则继续执行其他拦截器
			SessionObject sessionObject = (SessionObject) SessionCtx.getSessionObject(sessionId);
			if (sessionObject != null) {
				if (new Date().getTime()
						- sessionObject.getLastVisitDate().getTime() > Integer
						.parseInt(PropertiesUtil
								.get("session.timeout.millisecond"))) {
					SessionCtx.moveSessionObject(sessionId);
					ActionSupport action = (ActionSupport) invocation.getAction();
					action.addActionError("您的会话已超时，请先登录!");
					return Action.LOGIN;
				}else{
					sessionObject.setLastVisitDate(new Date());
					SessionCtx.setSessionObject(sessionId, sessionObject);
				}
			}else{
				ActionSupport action = (ActionSupport) invocation.getAction();
				action.addActionError("您还没有登录，请先登录!");
				return Action.LOGIN;
			}
			return invocation.invoke();
		}
	}

}
