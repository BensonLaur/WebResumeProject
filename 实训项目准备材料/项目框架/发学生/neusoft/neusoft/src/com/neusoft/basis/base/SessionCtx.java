package com.neusoft.basis.base;

import java.util.HashMap;

/**
 * Comments:
 * Created:2012-12-17
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class SessionCtx {
	
	private static HashMap<String, SessionObject> sessionCtx = new HashMap<String, SessionObject>();
	
	public static SessionObject getSessionObject(String sessionId){
		return sessionCtx.get(sessionId);
	}
	
	public static void setSessionObject(String sessionId,SessionObject object){
		sessionCtx.put(sessionId, object);
	}
	
	public static void moveSessionObject(String sessionId){
		sessionCtx.remove(sessionId);
	}
	
	public static int getSessionCount(){
		return sessionCtx.size();
	}
	
	public static void clearSessionCtx(){
		sessionCtx.clear();
	}
	

}
