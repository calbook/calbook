package com.calbook.web.dao;

import com.calbook.web.vo.Groups;

public interface GroupsDAO {
	
	//get max group num
	public int getMaxGroupNum();
	
	// create a group
	public int addGroup(Groups g);
	
	
}
