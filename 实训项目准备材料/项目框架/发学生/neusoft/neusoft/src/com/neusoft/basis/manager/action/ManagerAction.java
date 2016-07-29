package com.neusoft.basis.manager.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.manager.entity.ManagerEntity;
import com.neusoft.basis.manager.mapper.ManagerMapper;

/**
 * Comments:
 * Created:2014-11-10
 * Author: yan shangwen
 * CopyRight:yboffice
 */

public class ManagerAction extends EbAction{
	private static final long serialVersionUID = -5357845688254359512L;
	@Autowired
	private ManagerMapper managerMapper;
	private List<ManagerEntity> managerList;
	private ManagerEntity managerEntity;
	private Integer managerId;
	/**
	 * 新增客户信息
	 * @return
	 * @throws Exception
	 */
	public String insertManager() throws Exception{
		if(null!=managerEntity)
		{
			managerMapper.insertManager(managerEntity);
		}else{
			setMessage("客户信息为空！");
			return ERROR;
		}
		
		setMessage("新增成功！");
		return SUCCESS;
	}
	/**
	 * 新增客户信息
	 * @return
	 * @throws Exception
	 */
	public String insertManagerInit() throws Exception{
		return SUCCESS;
	}
	
	/**
	 * 查询客户信息
	 * @return
	 * @throws Exception
	 */
	public String getAllManagerList() throws Exception{
		if (null==managerEntity) {
			managerEntity=new ManagerEntity();
		}
		managerList = managerMapper.getAllManagerList(managerEntity);
		return SUCCESS;
	}
	
	
	/**
	 * 更新客户信息页面初始化
	 * @return
	 * @throws Exception
	 */
	public String getManager() throws Exception{
		managerEntity = managerMapper.getManager(managerId);
		return SUCCESS;
	}
	
	/**
	 * 更新客户信息
	 * @return
	 * @throws Exception
	 */
	public String updateManager() throws Exception{
		managerMapper.updateManager(managerEntity);
		
		if(!"".equals(managerEntity.getManagerId()) && managerEntity.getManagerId() != null)
		{
			managerMapper.updateManager(managerEntity);
		}
		
		setMessage("更新成功！");
		return SUCCESS;
	}

	public List<ManagerEntity> getManagerList() {
		return managerList;
	}

	public void setManagerList(List<ManagerEntity> managerList) {
		this.managerList = managerList;
	}

	public ManagerEntity getManagerEntity() {
		return managerEntity;
	}

	public void setManagerEntity(ManagerEntity managerEntity) {
		this.managerEntity = managerEntity;
	}

	public Integer getManagerId() {
		return managerId;
	}

	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}


}