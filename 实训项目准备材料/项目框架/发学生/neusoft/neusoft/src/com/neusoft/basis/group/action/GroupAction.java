package com.neusoft.basis.group.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.neusoft.basis.base.EbAction;
import com.neusoft.basis.group.entity.GroupEntity;
import com.neusoft.basis.group.entity.GroupItemRelEntity;
import com.neusoft.basis.group.mapper.GroupMapper;
import com.neusoft.basis.user.entity.MenuItemEntity;
import com.neusoft.basis.user.entity.UserEntity;

/**
 * Comments:
 * Created:2012-12-20
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public class GroupAction extends EbAction{

	private static final long serialVersionUID = -974752907912214500L;
	@Autowired
	private GroupMapper groupMapper;
	private List<GroupEntity> groupList;
	private List<MenuItemEntity> menuItemList;
	private List<GroupItemRelEntity> groupItemList;
	private GroupEntity groupEntity;
	private Integer id;
	private String selItems;
	
	public String insertGroup() throws Exception{
		groupEntity.setInsertDate(new Date());
		groupEntity.setInsertUserId(((UserEntity)(getSession().get("user"))).getId());
		groupMapper.insertGroup(groupEntity);
		setMessage("新增成功！");
		return SUCCESS;
	}
	
	public String getAllGroup() throws Exception{
		groupList = groupMapper.getAllGroup();
		return SUCCESS;
	}
	
	public String getGroup() throws Exception{
		groupEntity = groupMapper.getGroup(id);
		return SUCCESS;
	}
	
	public String updateGroup() throws Exception{
		groupEntity.setLastModifyDate(new Date());
		groupEntity.setLastModifyUserId(((UserEntity)(getSession().get("user"))).getId());
		groupMapper.updateGroup(groupEntity);
		setMessage("更新成功！");
		return SUCCESS;
	}
	
	public String getAllMenuItem() throws Exception{
		groupEntity = groupMapper.getGroup(id);
		menuItemList = groupMapper.getAllMenuItem();
		groupItemList = groupMapper.getAllGroupItem(id);
		return SUCCESS;
	}
	
	public String updateGroupItem() throws Exception{
		groupMapper.deleteGroupItem(id);
		String[] items = selItems.split(",");
		for (String item : items) {
			GroupItemRelEntity groupItemRelEntity = new GroupItemRelEntity();
			groupItemRelEntity.setGroupId(id);
			groupItemRelEntity.setItemId(item);
			groupMapper.insertGroupItem(groupItemRelEntity);
		}
		setMessage("权限更新成功！");
		return SUCCESS;
	}
	
	public GroupEntity getGroupEntity() {
		return groupEntity;
	}
	public void setGroupEntity(GroupEntity groupEntity) {
		this.groupEntity = groupEntity;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public List<GroupEntity> getGroupList() {
		return groupList;
	}
	public void setGroupList(List<GroupEntity> groupList) {
		this.groupList = groupList;
	}

	public List<MenuItemEntity> getMenuItemList() {
		return menuItemList;
	}

	public void setMenuItemList(List<MenuItemEntity> menuItemList) {
		this.menuItemList = menuItemList;
	}

	public List<GroupItemRelEntity> getGroupItemList() {
		return groupItemList;
	}

	public void setGroupItemList(List<GroupItemRelEntity> groupItemList) {
		this.groupItemList = groupItemList;
	}

	public String getSelItems() {
		return selItems;
	}

	public void setSelItems(String selItems) {
		this.selItems = selItems;
	}
}
