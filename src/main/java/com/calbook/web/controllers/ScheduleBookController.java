package com.calbook.web.controllers;

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
import com.calbook.web.vo.AccountBook;
import com.calbook.web.vo.SumAccountBook;
import com.calbook.web.vo.TotalAccountBook;
import com.google.gson.Gson;

@Controller
@RequestMapping("/scheduleBook/*")
public class ScheduleBookController {
	
	@Autowired
	private SqlSession ss;
	
	/* 일정&가계부 화면 로딩시 */
	@RequestMapping(value= {"scheduleBook.do"}, method=RequestMethod.GET)
	public String scheduleBook(String email) {
		return "scheduleBook.jsp";
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
