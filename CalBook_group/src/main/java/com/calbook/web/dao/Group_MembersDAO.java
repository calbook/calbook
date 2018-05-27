package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Members;
import com.calbook.web.vo.TmpMember;

public interface Group_MembersDAO {
	
	// 그룹생성중 멤버 추가 ajax
	public int addGroupMember(int g_num, String m_email);
	
	// 그룹생성중 멤버 추가 취소 ajax
	public int cancelGroupMember(int g_num, String m_email);
	
	// 그룹생성중 멤버추가중 친구리스트 불러오기  ajax 
	public List<TmpMember> getGroupFriendsList(String email, int g_num);
	
	// 그룹생성중 멤버추가중 검색 친구리스트 불러오기  ajax 
	public List<TmpMember> getSearchGroupFriendsList(String email, int g_num, String searchSelect, String search);
	
	// 그룹생성 완료를 위한 그룹멤버 상태변경
	public int updateMembersStatusAccept(int g_num);
	
	//그룹 친구추가 취소
	public int addFriendsCancel(int g_num);
}
