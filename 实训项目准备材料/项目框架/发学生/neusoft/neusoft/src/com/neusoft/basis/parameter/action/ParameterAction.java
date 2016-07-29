package com.neusoft.basis.parameter.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.parameter.entity.ParameterEntity;
import com.neusoft.basis.parameter.mapper.ParameterMapper;
/**
 * Comments:参数管理
 * Created:2012-12-21
 * Author: zhouq
 * CopyRight:yboffice
 */
public class ParameterAction extends EbAction{

	private static final long serialVersionUID = -4126608193766240081L;
	@Autowired
	private ParameterMapper parameterMapper;
	private List<ParameterEntity> parameterList;
	private ParameterEntity parameterEntity;
	private String paramKey;
	
	public String getAllParameter() throws Exception{
		parameterList = parameterMapper.getAllParameter();
		return SUCCESS;
	}
	
	public String getParameter() throws Exception{
		parameterEntity = parameterMapper.getParameter(paramKey);
		return SUCCESS;
	}
	
	public String updateParameter() throws Exception{
		parameterMapper.updateParameter(parameterEntity);
		setMessage("更新成功！");
		return SUCCESS;
	}

	public List<ParameterEntity> getParameterList() {
		return parameterList;
	}

	public void setParameterList(List<ParameterEntity> parameterList) {
		this.parameterList = parameterList;
	}

	public ParameterEntity getParameterEntity() {
		return parameterEntity;
	}

	public void setParameterEntity(ParameterEntity parameterEntity) {
		this.parameterEntity = parameterEntity;
	}

	public String getParamKey() {
		return paramKey;
	}

	public void setParamKey(String paramKey) {
		this.paramKey = paramKey;
	}
	
}
