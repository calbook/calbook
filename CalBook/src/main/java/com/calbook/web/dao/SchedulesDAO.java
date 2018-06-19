package com.calbook.web.dao;

import java.util.List;

import com.calbook.web.vo.Schedules;

public interface SchedulesDAO {
	
	public List<Schedules> getSchedulesCal(String m_email, String start_date, String end_date);
	
	public List<Schedules> getSchedulesDates(String m_email, String start_date, String end_date);
	
	public List<Schedules> getSchedulesMonth(String m_email, String start_date, String end_date);
	
	public int delSchedule(String seq);
	
	public int addSchedule(Schedules s);
	
	public Schedules getSchedule(String seq);
	
	public int updateSchedule(Schedules s);
	
	// 모임 일정 전부 불러오기.
	public List<Schedules> getGroupSchedules(int g_num);
	
	//모임 일정 등록하기
	public int addGroupSchedules(Schedules s);
	
	// 모임 일정 하나만 불러오기
	public Schedules getGroupSchedule(int seq);
	
	//모임 일정 수정
	public int updateGroupSchedule(Schedules s);
	
	//모임 일정 삭제
	public int deleteGroupSchedule(int seq);
}
