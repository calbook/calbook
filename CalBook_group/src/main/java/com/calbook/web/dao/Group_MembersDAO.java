package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Members;
import com.calbook.web.vo.TmpMember;

public interface Group_MembersDAO {
	
	// �׷������ ��� �߰� ajax
	public int addGroupMember(int g_num, String m_email);
	
	// �׷������ ��� �߰� ��� ajax
	public int cancelGroupMember(int g_num, String m_email);
	
	// �׷������ ����߰��� ģ������Ʈ �ҷ�����  ajax 
	public List<TmpMember> getGroupFriendsList(String email, int g_num);
	
	// �׷������ ����߰��� �˻� ģ������Ʈ �ҷ�����  ajax 
	public List<TmpMember> getSearchGroupFriendsList(String email, int g_num, String searchSelect, String search);
	
	// �׷���� �ϷḦ ���� �׷��� ���º���
	public int updateMembersStatusAccept(int g_num);
	
	//�׷� ģ���߰� ���
	public int addFriendsCancel(int g_num);
}
