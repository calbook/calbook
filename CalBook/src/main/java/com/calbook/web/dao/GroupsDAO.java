package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Groups;

public interface GroupsDAO {
	// get groups
	public List<Groups> getGroupList(String email);
	
	// get group
	public Groups getGroup(int num);
	
	//get max group num
	public int getMaxGroupNum();
	
	// create a group
	public int addGroup(Groups g);
	
	// delete a group
	public int deleteGroup(int num);
	
	// update a group
	public int updateGroup(String name, String content, int num);
	
	// get accepted groups
	public List<Groups> getAcceptedGroups(String email);
	
	// remove a group
	public int removeGroup(int num);
}
