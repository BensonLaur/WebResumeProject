package com.neusoft.basis.base;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class SessionObject implements Serializable {

	private static final long serialVersionUID = -1758251003156519279L;
	private Date lastVisitDate;
	private Map<String,Object>  sessionData;
	
	public SessionObject(){
		lastVisitDate = new Date();
		sessionData = new HashMap<String, Object>();
	}
	
	public Date getLastVisitDate() {
		return lastVisitDate;
	}
	public void setLastVisitDate(Date lastVisitDate) {
		this.lastVisitDate = lastVisitDate;
	}
	public Map<String,Object> getSessionData() {
		return sessionData;
	}
	public void setSessionData(Map<String,Object> sessionData) {
		this.sessionData = sessionData;
	}
}
