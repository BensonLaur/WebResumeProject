package com.neusoft.basis.branch.mapper;

import java.util.List;

import com.neusoft.basis.branch.entity.BranchEntity;
import com.neusoft.basis.user.entity.UserEntity;

/**
 * Comments:
 * Created:2012-12-17
 * Author: zhang shengbo
 * CopyRight:yboffice
 */

public interface BranchMapper {
	public void insertBranch(BranchEntity branchEntity);
	
	public List<BranchEntity> getAllBranch();
	
	public BranchEntity getBranch(String id);
	
	public void updateBranch(BranchEntity branchEntity);
	
	public  List<BranchEntity> getUserBranchList(UserEntity userEntity);

}
