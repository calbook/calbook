package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Schedules;

public interface SchedulesDAO {
	
	// ���� ���� ���� �ҷ�����.
	public List<Schedules> getGroupSchedules(int g_num);
	
	
}
