package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Members;
import com.calbook.web.vo.TmpMember;

public interface FriendsDAO {
	
	//ģ������Ʈ �ҷ�����(ģ�� ������ ����ȭ��)
	public List<Members> getFriends(String email);
	
	//��ģ�� �˻� ����Ʈ �ҷ�����(�� ģ�� �� �˻� ajax)
	public List<Members> getSearchMyFriends(String email, String searchSelect, String search);
	
	//��üģ�� �˻� �ҷ�����(��ü ģ�� �� �˻� ajax �� �˻�ȸ�� �ҷ�����)
	public TmpMember getSearchNewFriends(String searchSelect, String search);
	
	//��üģ�� �˻� �ҷ�����(��ü ģ�� �� �˻� ajax �� ģ������Ʈ+���� �ҷ�����)
	public List<TmpMember> getSearchNewFriendsR(String email);
	
	//ģ�� �����ϱ�
	public int delFriend(String email, String f_email);
	
	//ģ�� ��û�ϱ�
	public int addFriend(String email, String f_email);
		
	

}