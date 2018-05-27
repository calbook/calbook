package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Groups;

public interface GroupsDAO {
	
	// get groups
	public List<Groups> getGroupList(String email);
	
	//get max group num
	public int getMaxGroupNum();
	
	// create a group
	public int addGroup(Groups g);
	
	// delete a group
	public int deleteGroup(int num);
}
