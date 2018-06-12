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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
//		System.out.println(slistJson);
		return slistJson;
	}
	
	@RequestMapping(value= {"getScheduleMonth.do"}, method=RequestMethod.GET, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String getScheduleMonth(String startDate, String endDate, HttpServletRequest request) {
		System.out.println("getScheduleMonth");
//		System.out.println(month);
		
		HttpSession session = request.getSession();	
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		List<Schedules> slist = sdao.getSchedulesMonth(session.getAttribute("email").toString(), startDate, endDate);
		
//		System.out.println();
		
		for(Schedules s : slist) {
			System.out.println(s.toString());
		}
		
		Gson gson = new Gson();
		String slistJson = gson.toJson(slist);
//		System.out.println(slistJson);
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
		List<Schedules> slist = sdao.getSchedulesCal(session.getAttribute("email").toString(), start, end);
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
		
		for(CalSchedules c : clist) {
			System.out.println(c.toString());
		}
		
		Gson gson = new Gson();
		String clistJson = gson.toJson(clist);
//		System.out.println(clistJson);
		return clistJson;
	}
	
	@RequestMapping(value= {"delSchedule.do"}, method=RequestMethod.GET, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String delSchedule(HttpServletRequest request, String seq) {
		System.out.println("delSchedule");
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		Integer af = sdao.delSchedule(seq);
		
		return af.toString();
	}
	
	@RequestMapping(value= {"addSchedule.do"}, method=RequestMethod.POST, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String addSchedule(HttpServletRequest request) {
		System.out.println("addSchedule");
		
		String title = request.getParameter("title");
		String importantS = request.getParameter("important");
		String content = request.getParameter("content");
		String start_date = request.getParameter("startDate");
		String end_date = request.getParameter("endDate");
		
		int important = Integer.parseInt(importantS);
//		System.out.println(start_date);
//		System.out.println(end_date);
		
		HttpSession session = request.getSession();
		String m_email = session.getAttribute("email").toString();
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
//		System.out.println(content);
		
		Schedules s = new Schedules();
		s.setM_email(m_email);
		s.setTitle(title);
		s.setImportant(important);
		s.setContent(content);
		s.setStart_date(start_date);
		s.setFinish_date(end_date);
		s.setLocation(null);
		
		Integer af = sdao.addSchedule(s);
		
		return af.toString();
	}
	
	@RequestMapping(value= {"getSchedule.do"}, method=RequestMethod.GET, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String getSchedule(String seq) {
		System.out.println("getSchedule");
//		System.out.println(seq);
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		Schedules s = sdao.getSchedule(seq);
		
//		System.out.println(s.toString());
		
		Gson gson = new Gson();
		String sJson = gson.toJson(s);
//		System.out.println(sJson);
		return sJson;
	}
	
	@RequestMapping(value= {"updateSchedule.do"}, method=RequestMethod.POST, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String updateSchedule(HttpServletRequest request) {
		System.out.println("updateSchedule");
		
		String title = request.getParameter("srmtitle");
		String importantS = request.getParameter("srmimportant");
		String content = request.getParameter("srmcontent");
		String location = request.getParameter("location");
		String seqS = request.getParameter("seq");
		
		int important = Integer.parseInt(importantS);
		int seq = Integer.parseInt(seqS);
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		
		Schedules s = new Schedules();
		s.setSeq(seq);
		s.setTitle(title);
		s.setImportant(important);
		s.setContent(content);
		s.setLocation(null);
		
//		System.out.println(s.toString());
		
		Integer af = sdao.updateSchedule(s);
		
		return af.toString();
	}
}
