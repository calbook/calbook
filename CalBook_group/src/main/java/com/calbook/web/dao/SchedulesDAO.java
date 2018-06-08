package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Schedules;

public interface SchedulesDAO {
	
	// 모임 일정 전부 불러오기.
	public List<Schedules> getGroupSchedules(int g_num);
	
	
}
