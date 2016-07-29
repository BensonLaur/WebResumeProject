package com.neusoft.basis.user.mapper;

import java.util.List;

import com.neusoft.basis.user.entity.MenuItemEntity;
import com.neusoft.basis.user.entity.UserEntity;

public interface UserMapper {

	public UserEntity getUser(UserEntity userEntity); 
	
	/**
	 * 获得用户菜单
	 * @param groupId
	 * @return
	 */
	public List<MenuItemEntity> getUserMenuItem(Integer groupId); 
	
	public List<MenuItemEntity> getUserScoreMenuItem(Integer groupId); 

	public void insertUser(UserEntity userEntity);
	
	public List<UserEntity> getAllUser();
	
	public UserEntity getUserBuId(String id);
	
	public void updateUser(UserEntity userEntity);
	
	public void updateUserPassword(UserEntity userEntity);
	
}
