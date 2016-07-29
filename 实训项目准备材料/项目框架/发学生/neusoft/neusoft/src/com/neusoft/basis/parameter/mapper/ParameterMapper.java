package com.neusoft.basis.parameter.mapper;

import java.util.List;

import com.neusoft.basis.parameter.entity.ParameterEntity;
/**
 * Comments:参数管理
 * Created:2012-12-21
 * Author: zhouq
 * CopyRight:yboffice
 */

public interface ParameterMapper {
	/**
	 * 查询所有参数
	 * @return
	 */
	public List<ParameterEntity> getAllParameter();
	/**
	 * 根据key获取参数信息
	 * @param paramKey
	 * @return
	 */
	public ParameterEntity getParameter(String paramKey);
	/**
	 * 更新参数信息
	 * @param parameterEntity
	 */
	public void updateParameter(ParameterEntity parameterEntity);

}