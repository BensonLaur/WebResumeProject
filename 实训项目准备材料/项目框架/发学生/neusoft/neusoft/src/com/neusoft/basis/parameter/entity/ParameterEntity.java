package com.neusoft.basis.parameter.entity;

import java.io.Serializable;

/**
 * Comments:参数管理
 * Created:2012-12-21
 * Author: zhouq
 * CopyRight:yboffice
 */

public class ParameterEntity implements Serializable{
	private static final long serialVersionUID = 3141474307515183421L;
	private String paramKey;
    private String paramValue;
    private String description;
	public String getParamKey() {
		return paramKey;
	}
	public void setParamKey(String paramKey) {
		this.paramKey = paramKey;
	}
	public String getParamValue() {
		return paramValue;
	}
	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
