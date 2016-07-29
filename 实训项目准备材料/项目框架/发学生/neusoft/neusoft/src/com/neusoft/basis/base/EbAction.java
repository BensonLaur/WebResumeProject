package com.neusoft.basis.base;

import java.util.Date;
import java.util.Map;
import java.util.UUID;

import com.opensymphony.xwork2.ActionSupport;

public class EbAction extends ActionSupport{
	
	private static final long serialVersionUID = 6235664472182854238L;
	protected String sessionId;
	protected String message;
	protected Integer pageSize;
	protected Integer pageNum;
	protected Integer totalCount;
	
	public Map<String,Object> getSession() {
	    SessionObject sessionObject = SessionCtx.getSessionObject(getSessionId());
		return sessionObject.getSessionData();
	}
	public void setSession(String key,Object value) {
		 SessionObject sessionObject = SessionCtx.getSessionObject(getSessionId());
		 if(sessionObject == null){
			 sessionObject = new SessionObject();
		 }
		 sessionObject.getSessionData().put(key, value);
		 sessionObject.setLastVisitDate(new Date());
		 SessionCtx.setSessionObject(getSessionId(), sessionObject);
	}
	public String getSessionId() {
		if(sessionId == null){
	         UUID uuid = UUID.randomUUID();
             String guid = uuid.toString().replace("-", "").toUpperCase();
             sessionId = guid;
		}
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getMessage(){
		//return URLDecoder.decode(message, "UTF-8");
	   String tempMessage = (String)(getSession().get("MESSAGE"));
	   setMessage("");
	   return tempMessage;
	}
	public void setMessage(String message){
		setSession("MESSAGE", message);
	}
	public Integer getPageSize() {
		if(pageSize == null){
			pageSize = 20;
		}
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageNum() {
		if(pageNum == null){
			pageNum = 1;
		}
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public Integer getTotalCount() {
		if(totalCount == null){
			totalCount = 0;
		}
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	} 
	
	
	
	
}
