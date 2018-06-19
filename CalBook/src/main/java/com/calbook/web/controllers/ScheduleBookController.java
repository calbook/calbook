package com.calbook.web.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.calbook.web.dao.AccountBookDAO;
import com.calbook.web.dao.SchedulesDAO;
import com.calbook.web.vo.AccountBook;
import com.calbook.web.vo.CalSchedules;
import com.calbook.web.vo.Schedules;
import com.calbook.web.vo.SumAccountBook;
import com.calbook.web.vo.TotalAccountBook;
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
		
		/*for(Schedules s : slist) {
			System.out.println(s.toString());
		}*/
		
		Gson gson = new Gson();
		String slistJson = gson.toJson(slist);
		System.out.println(slistJson);
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
		
	/*	for(Schedules s : slist) {
			System.out.println(s.toString());
		}*/
		
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
		List<Schedules> slist = sdao.getSchedulesCal(session.getAttribute("email").toString(), start, end);
		List<CalSchedules> clist = new ArrayList<CalSchedules>();
		
		
		for(Schedules s : slist) {
//			System.out.println(s.toString());
			CalSchedules cs = new CalSchedules();
			cs.setTitle(s.getTitle());
			cs.setStart(s.getStart_date());
			cs.setEnd(s.getFinish_date());
			if(s.getImportant() == 1) {
				cs.setColor("#add8e6"); //1(하)
			}else if(s.getImportant() == 2) {
				cs.setColor("#FFB52B"); //2(중)
			}else {
				cs.setColor("#ffb6c1"); //3(상)
			}
			clist.add(cs);
//			System.out.println(cs.toString());
		}
		
	/*	for(CalSchedules c : clist) {
			System.out.println(c.toString());
		}*/
		
		Gson gson = new Gson();
		String clistJson = gson.toJson(clist);
		System.out.println(clistJson);
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
		String location = request.getParameter("place");
		
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
		s.setLocation(location);
		
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
		System.out.println(sJson);
		return sJson;
	}
	
	@RequestMapping(value= {"updateSchedule.do"}, method=RequestMethod.POST, produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String updateSchedule(HttpServletRequest request) {
		System.out.println("updateSchedule");
		
		String title = request.getParameter("srmtitle");
		String importantS = request.getParameter("srmimportant");
		String content = request.getParameter("srmcontent");
		String location = request.getParameter("place");
		String seqS = request.getParameter("seq");
		
		int important = Integer.parseInt(importantS);
		int seq = Integer.parseInt(seqS);
		
		SchedulesDAO sdao = ss.getMapper(SchedulesDAO.class);
		
		Schedules s = new Schedules();
		s.setSeq(seq);
		s.setTitle(title);
		s.setImportant(important);
		s.setContent(content);
		s.setLocation(location);
		
//		System.out.println(s.toString());
		
		Integer af = sdao.updateSchedule(s);
		
		return af.toString();
	}
	
	/* 가계부 저장하기 */
	   @RequestMapping(value= {"saveAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String saveIncome(String kind, String sub_kind, String content, String amount, String adate, HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      String email = (String) session.getAttribute("email");
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      AccountBook ab = new AccountBook();
	      ab.setKind(kind);
	      ab.setAdate(adate);
	      ab.setM_email(email);
	      ab.setAmount(Integer.parseInt(amount));
	      ab.setSub_kind(sub_kind);
	      ab.setContent(content);
	      int af = abdao.saveAccountBook(ab);
	      return Integer.toString(af);
	   }
	   
	   
	   /* 가계부 삭제하기 */
	   @RequestMapping(value={"rmAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String rmAccountBook(String num) {
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      int af = abdao.rmAccountBook(Integer.parseInt(num));
	      return Integer.toString(af);
	   }
	   
	   
	   /* 가계부 수정하기 */
	   @RequestMapping(value={"modiAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String modiAccountBook(String num, String content, String amount) {
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      int af = abdao.modiAccountBook(Integer.parseInt(num), content, Integer.parseInt(amount));
	      return Integer.toString(af);
	   }
	   
	   
	   /* 가계부 리스트 불러오기(Daily) */
	   @RequestMapping(value={"getDailyAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String getDailyAccountBook(String date, HttpServletRequest request) {
	      Gson gson = new Gson();
	      HttpSession session = request.getSession();
	      String email = (String) session.getAttribute("email");
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      List<AccountBook> abList = abdao.getDailyAccountBook(email, date);
	      String jsonAbList = gson.toJson(abList);
	      return jsonAbList;
	   }
	   
	   
	   /* 가계부 리스트 불러오기(Monthly) */
	   @RequestMapping(value={"getMonthlyAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String getMonthlyAccountBook(String date, HttpServletRequest request) {
	      Gson gson = new Gson();
	      HttpSession session = request.getSession();
	      String email = (String) session.getAttribute("email");
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      List<AccountBook> abList = abdao.getMonthlyAccountBook(email, date);
	      String jsonAbList = gson.toJson(abList);
	      return jsonAbList;
	   }
	   
	   
	   /* 가계부 리스트 불러오기(Period) */
	   @RequestMapping(value={"getPeriodAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String getPeriodAccountBook(String startD, String endD, HttpServletRequest request) {
	      Gson gson = new Gson();
	      HttpSession session = request.getSession();
	      String email = (String) session.getAttribute("email");
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      List<AccountBook> abList = abdao.getPeriodAccountBook(email, startD, endD);
	      String jsonAbList = gson.toJson(abList);
	      System.out.println("getPeriod: " + jsonAbList);
	      return jsonAbList;
	   }
	   
	   
	   /* 총수입,총지출 가져오기(Daily) */
	   @RequestMapping(value={"getDailySumAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String getDailtSumAccountBook(String date, HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      String email = (String) session.getAttribute("email");
	      Gson gson = new Gson();
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      List<SumAccountBook> sumList = abdao.getDailySumAccountBook(email, date);
	      TotalAccountBook tAccount = new TotalAccountBook();
	      
	      String jsonTAccount;
	      int income = 0;
	      int expense = 0;
	      int sum = 0;
	      
	      if(sumList.size() == 0) {
	         System.out.println("등록된 가계부가 없습니다.");
	      }else {
	         for(SumAccountBook sab : sumList) {
	            if(sab.getKind().equals("수입")) {
	               income = sab.getSum();
	               tAccount.setIncome(income);
	            }else{
	               expense = sab.getSum();
	               tAccount.setExpense(expense);
	            }
	         }
	         sum = income - expense;
	         tAccount.setSum(sum);
	      }
	      
	      jsonTAccount = gson.toJson(tAccount);
	      return jsonTAccount;
	   }
	   
	   
	   /* 총수입,총지출 가져오기(Monthly) */
	   @RequestMapping(value={"getMonthlySumAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String getMonthlySumAccountBook(String date, HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      String email = (String) session.getAttribute("email");
	      Gson gson = new Gson();
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      List<SumAccountBook> sumList = abdao.getMonthlySumAccountBook(email, date);
	      TotalAccountBook tAccount = new TotalAccountBook();
	      
	      String jsonTAccount;
	      int income = 0;
	      int expense = 0;
	      int sum = 0;
	      
	      if(sumList.size() == 0) {
	         System.out.println("등록된 가계부가 없습니다.");
	      }else {
	         for(SumAccountBook sab : sumList) {
	            if(sab.getKind().equals("수입")) {
	               income = sab.getSum();
	               tAccount.setIncome(income);
	            }else{
	               expense = sab.getSum();
	               tAccount.setExpense(expense);
	            }
	         }
	         sum = income - expense;
	         tAccount.setSum(sum);
	      }
	      
	      jsonTAccount = gson.toJson(tAccount);
	      return jsonTAccount;
	   }
	   
	   
	   /* 총수입,총지출 가져오기(Period) */
	   @RequestMapping(value={"getPeriodSumAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String getPeriodSumAccountBook(String startD, String endD, HttpServletRequest request) {
	      Gson gson = new Gson();
	      HttpSession session = request.getSession();
	      String email = (String) session.getAttribute("email");
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      List<SumAccountBook> sumList = abdao.getPeriodSumAccountBook(email, startD, endD);      
	      TotalAccountBook tAccount = new TotalAccountBook();
	      
	      String jsonTAccount;
	      int income = 0;
	      int expense = 0;
	      int sum = 0;
	      
	      if(sumList.size() == 0) {
	         System.out.println("등록된 가계부가 없습니다.");
	      }else {
	         for(SumAccountBook sab : sumList) {
	            if(sab.getKind().equals("수입")) {
	               income = sab.getSum();
	               tAccount.setIncome(income);
	            }else{
	               expense = sab.getSum();
	               tAccount.setExpense(expense);
	            }
	         }
	         sum = income - expense;
	         tAccount.setSum(sum);
	      }
	      
	      jsonTAccount = gson.toJson(tAccount);
	      return jsonTAccount;
	   }
	   
	   
	   /* sub_kind별 모달 데이터 가져오기 */
	   @RequestMapping(value={"getModalSumAccountBook.do"}, method=RequestMethod.POST)
	   @ResponseBody
	   public String getModalSumAccountBook(String date, HttpServletRequest request) {
	      HttpSession session = request.getSession();
	      String email = (String) session.getAttribute("email");
	      AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
	      List<SumAccountBook> sumList = abdao.getModalSumAccountBook(email, date);
	      String jsonSumList = "[";
	      for(int i = 0; i < sumList.size(); i++) {
	         if(i == sumList.size()-1) {
	            jsonSumList += "{\"y\":" + sumList.get(i).getSum() + ",\"name\":\"" + sumList.get(i).getKind() + "\"}";            
	         }else {
	            jsonSumList += "{\"y\":" + sumList.get(i).getSum() + ",\"name\":\"" + sumList.get(i).getKind() + "\"},";
	         }
	      }
	      jsonSumList += "]";
	      return jsonSumList;
	   } 
}
