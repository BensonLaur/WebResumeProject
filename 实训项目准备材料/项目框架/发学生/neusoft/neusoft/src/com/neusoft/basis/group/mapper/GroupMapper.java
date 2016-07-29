package com.neusoft.basis.group.mapper;

import java.util.List;

import com.neusoft.basis.group.entity.GroupEntity;
import com.neusoft.basis.group.entity.GroupItemRelEntity;

import com.neusoft.basis.user.entity.MenuItemEntity;


/**
 * Comments: Created:2012-12-20 Author: zhang shengbo CopyRight:yboffice
 */

public interface GroupMapper {
	public void insertGroup(GroupEntity groupEntity);

	public List<GroupEntity> getAllGroup();

	public GroupEntity getGroup(Integer id);

	public void updateGroup(GroupEntity groupEntity);
	
	public List<MenuItemEntity> getAllMenuItem();
	
	public List<GroupItemRelEntity> getAllGroupItem(Integer id);
	
	public void deleteGroupItem(Integer id);
	
	public void insertGroupItem(GroupItemRelEntity groupItemRelEntity);
}
