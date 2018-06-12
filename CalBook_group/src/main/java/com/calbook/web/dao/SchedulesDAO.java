package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Schedules;

public interface SchedulesDAO {
	
	// ���� ���� ���� �ҷ�����.
	public List<Schedules> getGroupSchedules(int g_num);
	
	//���� ���� ����ϱ�
	public int addGroupSchedules(Schedules s);
	
	// ���� ���� �ϳ��� �ҷ�����
	public Schedules getGroupSchedule(int seq);
	
	//���� ���� ����
	public int updateGroupSchedule(Schedules s);
	
	//���� ���� ����
	public int deleteGroupSchedule(int seq);
}
