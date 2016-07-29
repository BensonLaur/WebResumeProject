package com.neusoft.basis.manager.mapper;

import java.util.List;

import com.neusoft.basis.manager.entity.ManagerEntity;

/**
 * Comments:客户管理
 * Created:2015-03-02
 * Author: zhouqiang
 * CopyRight:neusoft
 * 
 */

public interface ManagerMapper {
	
	public List<ManagerEntity> getAllManagerList(ManagerEntity managerEntity);
	
	public void insertManager(ManagerEntity managerEntity);
	
	public ManagerEntity getManager(Integer managerId);
	
	public void updateManager(ManagerEntity managerEntity);
	
}
