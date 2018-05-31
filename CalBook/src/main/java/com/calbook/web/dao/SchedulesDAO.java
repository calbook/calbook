package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Schedules;

public interface SchedulesDAO {
	
	public List<Schedules> getSchedulesDates(String m_email, String start_date, String end_date);
	
	public List<Schedules> getSchedulesMonth(String m_email, String month);
	
}
