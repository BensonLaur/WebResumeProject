package com.neusoft.basis.user.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.branch.entity.BranchEntity;
import com.neusoft.basis.branch.mapper.BranchMapper;
import com.neusoft.basis.group.entity.GroupEntity;
import com.neusoft.basis.group.mapper.GroupMapper;
import com.neusoft.basis.user.entity.UserEntity;
import com.neusoft.basis.user.mapper.UserMapper;

/**
 * Comments:
 * Created:2012-12-20
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class UserAction extends EbAction{

	private static final long serialVersionUID = -5965885617410849125L;
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private GroupMapper groupMapper;
	@Autowired
	private BranchMapper branchMapper;
	
	private List<UserEntity> userList;
	private UserEntity userEntity;
	private String id;
	private List<GroupEntity> groupList;
	private List<BranchEntity> branchList;
	private String sign;
	private String userPassword;
	
	public UserEntity getUser(UserEntity userEntity){
		UserEntity entity = userMapper.getUser(userEntity);
		System.out.println(entity);
		return entity;
	}
	
	public String insertUser() throws Exception{
		userEntity.setInsertDate(new Date());
		userEntity.setInsertUserId(((UserEntity)(getSession().get("user"))).getId());
		userMapper.insertUser(userEntity);
		setMessage("新增成功！");
		return SUCCESS;
	}
	
	public String getAllUser() throws Exception{
		groupList = groupMapper.getAllGroup();
		branchList = branchMapper.getAllBranch();
		userList = userMapper.getAllUser();
		return SUCCESS;
	}
	
	public String getUser() throws Exception{
		userEntity = userMapper.getUserBuId(id);
		groupList = groupMapper.getAllGroup();
		branchList = branchMapper.getAllBranch();
		return SUCCESS;
	}
	
	public String updateUser() throws Exception{
		userEntity.setLastModifyDate(new Date());
		userEntity.setLastModifyUserId(((UserEntity)(getSession().get("user"))).getId());
		userMapper.updateUser(userEntity);
		setMessage("更新成功！");
		return SUCCESS;
	}
	
	public String updateUserPassword() throws Exception{
		userEntity.setPassword(userPassword);
		userMapper.updateUserPassword(userEntity);
		setMessage("密码修改成功！");
		if("admin".equals(sign)){
			return SUCCESS;
		}else{
			return "self";
		}
	}
	
	public UserMapper getUserMapper() {
		return userMapper;
	}
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	public UserEntity getUserEntity() {
		return userEntity;
	}
	public void setUserEntity(UserEntity userEntity) {
		this.userEntity = userEntity;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<UserEntity> getUserList() {
		return userList;
	}
	public void setUserList(List<UserEntity> userList) {
		this.userList = userList;
	}

	public List<GroupEntity> getGroupList() {
		return groupList;
	}

	public void setGroupList(List<GroupEntity> groupList) {
		this.groupList = groupList;
	}

	public List<BranchEntity> getBranchList() {
		return branchList;
	}

	public void setBranchList(List<BranchEntity> branchList) {
		this.branchList = branchList;
	}

	public GroupMapper getGroupMapper() {
		return groupMapper;
	}

	public void setGroupMapper(GroupMapper groupMapper) {
		this.groupMapper = groupMapper;
	}

	public BranchMapper getBranchMapper() {
		return branchMapper;
	}

	public void setBranchMapper(BranchMapper branchMapper) {
		this.branchMapper = branchMapper;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
}
