package com.calbook.web.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.calbook.web.dao.SchedulesDAO;
import com.calbook.web.vo.CalSchedules;
import com.calbook.web.vo.Schedules;
import com.google.gson.Gson;

@Controller
@RequestMapping("/scheduleBook/*")
public class ScheduleBookController {
	
	@Autowired
	private SqlSession ss;
	
	
	@RequestMapping(value= {"scheduleBook.do"}, method=RequestMethod.GET)
	public String scheduleBook() {
		return "scheduleBook.jsp";
	}
	
	@RequestMapping(value= {"getScheduleDate.do"}, method=RequestMethod.GET, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String getScheduleDate(String startDate, String endDate, HttpServletRequest request) {
		System.out.println("getScheduleDate");
		
		HttpSession session = request.getSession();	
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		List<Schedules> slist = sdao.getSchedulesDates(session.getAttribute("email").toString(), startDate, endDate);
		
		for(Schedules s : slist) {
			System.out.println(s.toString());
		}
		
		Gson gson = new Gson();
		String slistJson = gson.toJson(slist);
		System.out.println(slistJson);
		return slistJson;
	}
	
	@RequestMapping(value= {"getScheduleMonth.do"}, method=RequestMethod.GET, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String getScheduleMonth(String month, HttpServletRequest request) {
		System.out.println("getScheduleMonth");
		System.out.println(month);
		
		HttpSession session = request.getSession();	
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		List<Schedules> slist = sdao.getSchedulesMonth(session.getAttribute("email").toString(), month);
		
//		for(Schedules s : slist) {
//			System.out.println(s.toString());
//		}
		
		Gson gson = new Gson();
		String slistJson = gson.toJson(slist);
		System.out.println(slistJson);
		return slistJson;
	}
	
	@RequestMapping(value= {"getcalSchedules.do"}, method=RequestMethod.GET, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String getcalSchedules(HttpServletRequest request, String start, String end) {
		System.out.println("getcalSchedules");
//		System.out.println(start);
//		System.out.println(end);
		
		HttpSession session = request.getSession();	
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		List<Schedules> slist = sdao.getSchedulesDates(session.getAttribute("email").toString(), start, end);
		List<CalSchedules> clist = new ArrayList<CalSchedules>();
		
		
		for(Schedules s : slist) {
//			System.out.println(s.toString());
			CalSchedules cs = new CalSchedules();
			cs.setTitle(s.getTitle());
			cs.setStart(s.getStart_date());
			cs.setEnd(s.getFinish_date());
			if(s.getImportant() == 1) {
				cs.setColor("#add8e6"); //1(ÇÏ)
			}else if(s.getImportant() == 2) {
				cs.setColor("#FFB52B"); //2(Áß)
			}else {
				cs.setColor("#ffb6c1"); //3(»ó)
			}
			clist.add(cs);
//			System.out.println(cs.toString());
		}
		
//		for(CalSchedules c : clist) {
//			System.out.println(c.toString());
//		}
		
		Gson gson = new Gson();
		String clistJson = gson.toJson(clist);
		System.out.println(clistJson);
		return clistJson;
	}
	
}
