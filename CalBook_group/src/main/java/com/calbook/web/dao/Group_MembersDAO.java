package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Members;
import com.calbook.web.vo.TmpMember;

public interface Group_MembersDAO {
	
	// �׷������ ��� �߰�
	public int addGroupMember(int g_num, String m_email);
	
	// �׷������ ����߰��� ģ������Ʈ �ҷ�����  ajax 
	public List<TmpMember> getGroupFriendsList(String email);
	
}
