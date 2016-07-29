package com.neusoft.basis.branch.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.branch.entity.BranchEntity;
import com.neusoft.basis.branch.mapper.BranchMapper;
import com.neusoft.basis.user.entity.UserEntity;

/**
 * Comments:
 * Created:2012-12-17
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class BranchAction extends EbAction{

	private static final long serialVersionUID = -974752907912214500L;
	@Autowired
	private BranchMapper branchMapper;
	private List<BranchEntity> branchList;
	private BranchEntity branchEntity;
	private String id;
	
	public String insertBranch() throws Exception{
		branchEntity.setInsertDate(new Date());
		branchEntity.setInsertUserId(((UserEntity)(getSession().get("user"))).getId());
		branchMapper.insertBranch(branchEntity);
		setMessage("新增成功！");
		return SUCCESS;
	}
	
	public String getAllBranch() throws Exception{
		branchList = branchMapper.getAllBranch();
		return SUCCESS;
	}
	
	public String getBranch() throws Exception{
		branchEntity = branchMapper.getBranch(id);
		return SUCCESS;
	}
	
	public String updateBranch() throws Exception{
		branchEntity.setLastModifyDate(new Date());
		branchEntity.setLastModifyUserId(((UserEntity)(getSession().get("user"))).getId());
		branchMapper.updateBranch(branchEntity);
		setMessage("更新成功！");
		return SUCCESS;
	}
	
	public BranchEntity getBranchEntity() {
		return branchEntity;
	}
	public void setBranchEntity(BranchEntity branchEntity) {
		this.branchEntity = branchEntity;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<BranchEntity> getBranchList() {
		return branchList;
	}
	public void setBranchList(List<BranchEntity> branchList) {
		this.branchList = branchList;
	}
	
}
