package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Members;
import com.calbook.web.vo.TmpMember;

public interface Group_MembersDAO {
	
	// 그룹생성중 멤버 추가
	public int addGroupMember(int g_num, String m_email);
	
	// 그룹생성중 멤버추가중 친구리스트 불러오기  ajax 
	public List<TmpMember> getGroupFriendsList(String email);
	
}
