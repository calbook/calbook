package com.calbook.web.controllers;

import java.io.IOException;
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
//		String dataJson ="[{\"title\":"+slist.get(0).getTitle()+"}";
		String sdataJson = "[{title: '어린이날',start: '2018-05-05',end: '2018-05-06',color: 'lightblue'}," +
		 		"{title: '제주도 여행',start: '2018-05-11',end: '2018-05-14',color: 'lightpink'}," +
		 		"{title: '맛집탐방',start: '2018-05-25',end: '2018-05-26',color: 'lightpink'}]";
//		try {
//			response.getWriter().write(slistJson);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		return sdataJson;
	}
	
	@RequestMapping(value= {"getScheduleMonth.do"}, method=RequestMethod.GET, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String getScheduleMonth(String month, HttpServletRequest request) {
		System.out.println("getScheduleMonth");
		System.out.println(month);
		
		HttpSession session = request.getSession();	
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		List<Schedules> slist = sdao.getSchedulesMonth(session.getAttribute("email").toString(), month);
		
		for(Schedules s : slist) {
			System.out.println(s.toString());
		}
		
		Gson gson = new Gson();
		String slistJson = gson.toJson(slist);
		return slistJson;
	}
	
}
