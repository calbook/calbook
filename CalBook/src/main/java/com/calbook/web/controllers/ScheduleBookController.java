package com.calbook.web.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String scheduleBook(String email, Model model) {
		Date today = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	    String date = sdf.format(today);
	    
		AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
		List<SumAccountBook> sumList = abdao.getDailySumAccountBook(email, date);
		List<AccountBook> abList = abdao.getDailyAccountBook(email, date);
		TotalAccountBook tAccount = new TotalAccountBook();
		
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
		model.addAttribute("today", date);
		model.addAttribute("tAccount", tAccount);
		model.addAttribute("abList", abList);
		
		return "scheduleBook.jsp";
	}
	
	
	/* 총수입,총지출 가져오기(Monthly) */
	@RequestMapping(value={"getMonthlySumAccountBook.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String getMonthlySumAccountBook(String email, String date) {
		
		return null;
	}
	
	
	/* 예산 수정(DB에 업데이트, 가계부 총금액 다시 불러오기) */
	@RequestMapping(value={"saveBudget.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String saveBudget(String email, String kind, String amount) {
		
		return null;
	}
	
	
	/* 총수입,총지출,예산 가져오기 */
	@RequestMapping(value={"getSumAccountBook.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String getSumAccountBook(String date, String email, Model model){
		Gson gson = new Gson();
		AccountBookDAO abdao = ss.getMapper(AccountBookDAO.class);
		List<SumAccountBook> sumList = abdao.getDailySumAccountBook(date, email);
		TotalAccountBook tAccount = new TotalAccountBook();
		
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
		
		String jsonTotalAccount = gson.toJson(tAccount);
		System.out.println("jsonTotalAccount: " + jsonTotalAccount);
		return jsonTotalAccount;
	}
	
	
}
