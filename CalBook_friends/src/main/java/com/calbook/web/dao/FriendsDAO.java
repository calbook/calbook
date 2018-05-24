package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Members;

public interface FriendsDAO {
	
	//ģ�� �ҷ�����
	public List<Members> getFriends(String email);
	
	//��ģ�� �˻��ϱ�(ģ�� �� �˻�)
	public List<Members> getSearchMyFriends(String email, String searchSelect, String search);
	
	//��ģ�� �˻��ϱ�(��ü ģ�� �� �˻�)
	public Members getSearchNewFriends(String searchSelect, String search);
	
	//��ģ�� �����ϱ�
	public int delFriend(String email, String f_email);
		
	//�˻�ģ�� �ҷ�����
	public List<Members> getSearchFriends(String searchSelect, String search);

}
