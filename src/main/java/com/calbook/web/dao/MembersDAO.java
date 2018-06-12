package com.calbook.web.dao;

import com.calbook.web.vo.Members;

public interface MembersDAO {
	
	// ȸ������(�������� ����)
	public int addMembers(Members m);
	
	// �������� �ҷ�����(�г���)
	public Members getMembersNick(String nick);
	
	// �������� �ҷ�����(�̸���)
	public Members getMembersEmail(String email);
	
	
	
}